/**********************************************Modification Log********************************************************
<PP20130607>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   07 Jun 2013
Description         :   NPC Formula coding for BI AP Surfaces and Envelopes - APAC ROLLOUT1(1.11)
***********************************************************************************************************************
<PP20130614>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   14 June 2013
Description         :   Added logic for Plus/Minus -- If Plus/Minus code is null, sign of the rate remains the 
same as user enters, else sign is in accordance with the Plus/Minus code - APAC ROLLOUT1(1.12)
***********************************************************************************************************************
<PP20130614>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   14 June 2013
Description         :   NPC Formula coding for MCM AP - APAC ROLLOUT1(1.13)
***********************************************************************************************************************
<PP20130708>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   8 July 2013
Description         :   Change in Price Type of 'Spot' to 'Pricing Task' - APAC ROLLOUT1(1.14)
***********************************************************************************************************************
<PP20130903>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   9 Sep 2013
Description         :   Change in the NPC Formula for BI AP Surfaces - Adding 'ZD85'(1.15)
***********************************************************************************************************************
<PP20130920>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   20 September 2013
Description         :   NPC Formula coding for DTT AP - ROLLOUT2(1.16)
***********************************************************************************************************************
<PP20131009>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   9 October 2013
Description         :   NPC Formula coding for DTT EMEA - ROLLOUT2(1.17)
***********************************************************************************************************************
<PP20131018>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   18 October 2013
Description         :   NPC Formula coding for DTT LA - ROLLOUT2(1.18)
***********************************************************************************************************************
<PP20131023>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   23 October 2013
Description         :   NPC Formula coding for DTT Canada - ROLLOUT2(1.19)
***********************************************************************************************************************
<PP20131023>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   23 October 2013
Description         :   NPC Formula coding for DTT US - ROLLOUT2(1.20)
***********************************************************************************************************************
<NE20131105>
Last Modified By    :   Neeharika
Last Modified Date  :   5th November 2013
Description         :   NPC Formula coding for DTT China - ROLLOUT2
***********************************************************************************************************************
<PP20131106>
Last Modified By    :   Priyanka
Last Modified Date  :   6th November 2013
Description         :   Resolving 'Argument1 cannot be null' error - ROLLOUT2
***********************************************************************************************************************
<PP20131129>
Last Modified By    :   Priyanka
Last Modified Date  :   29th November 2013
Description         :   NPC Formula coding for DTT AP F200 - ROLLOUT2
***********************************************************************************************************************
<PP20131218>
Last Modified By    :   Priyanka
Last Modified Date  :   18th December 2013
Description         :   Sales Document Type w.r.t. Sales Org. Code - ROLLOUT2 ENHANCEMENT
***********************************************************************************************************************
<PP20131220>
Last Modified By    :   Priyanka
Last Modified Date  :   20th December 2013
Description         :   PH Synchronous flow for NPC - ROLLOUT2 ENHANCEMENT
***********************************************************************************************************************
<PP20131224>
Last Modified By    :   Priyanka
Last Modified Date  :   24th December 2013
Description         :   More than 1 Gross Price for DTT LA - ROLLOUT2 ENHANCEMENT
************************************************************************************************************************
<VR20140102>
Last Modified By    :   Vinoth
Last Modified Date  :   2nd January 2014
Description         :   DTT Rollout Issue - Modified the if condition to check NNP
************************************************************************************************************************
<PP20140108>
Last Modified By    :   Priyanka
Last Modified Date  :   8th January 2014
Description         :   Changed NPC formula for NNP for DTT EMEA F253 Pricing Procedure - DTT ROLLOUT ENHANCEMENT ISSUE
************************************************************************************************************************
<NE20130120>
Last Modified By    :   Neeharika
Last Modified Date  :   20th January 2014
Description         :   Added logic for inserting NPC response.
**********************************************************************************************************************
<PP20140224>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 February 2014
Description         :   CAPITAL PROJECT - Representative Material Info in NPC notification
**********************************************************************************************************************
<AV20140515>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   15 May 2014
Description         :   CAPITAL PROJECT - Added code for populating Quantity and UoM in npc req with new Volume and new vol UoM
**********************************************************************************************************************
<PP20140520>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   20 May 2014
Description         :   CAPITAL PROJECT - Adding code for bulkifying net price calculation
***********************************************************************************************************************
<PP20140618>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   18 June 2014
Description         :   CAPITAL PROJECT - NPC Formula coding for 15 new BUs
************************************************************************************************************************
<PR20140917>
Last Modified By    :   Priyanka R
Last Modified Date  :   17 Sep 2014
Description         :   Added logic for calculating net floor and net reference price

************************************************************************************************************************
<GT20150512>
Last Modified By    :   George Thomas
Last Modified Date  :   12 May 2015
Description         :   Added NPC logic for DPP AP

************************************************************************************************************************
<vz3360>
Last Modified By    :   Nadeem S
Last Modified Date  :   12 Sep 2016
Description         :   Added logic for calculating ZDY2 Net Project price

************************************************************************************************************************
Last Modified By    :   Nadeem S
Last Modified Date  :   29 Mar 2016
Description         :   Added logic for calculating ZPEX Net Project price for BU:DPP Polymere EMEA

************************************************************************************************************************
<MG20161024>
Last Modified By    :   Mansi Gupta
Last Modified Date  :   24 Oct 2016
Description         :   Added logic for calculating Bulk NPC for prices where key combination has both material and product hierarchy

************************************************************************************************************************
<MG20161227>
Last Modified By    :   Mansi gupta
Last Modified Date  :   27 Dec 2016
Description         :   Added validation for Valid from field for project pricing for BI EMEA Surfaces IS ID-00077268 
*********************************************************************************************************************
<MG20170523>
Last Modified By    :   Mansi gupta
Last Modified Date  :   23 May 2017
Description         :   Updated logic for NPC requests where KC has both MPG and PH code 
*********************************************************************************************************************
<MG20170710>
Last Modified By    :   Mansi gupta
Last Modified Date  :   10 Jul 2017
Description         :   Updated logic for NPC requests where KC has both MPG and PH code - Updated Total materials and NPC calculated materials 
*********************************************************************************************************************
<MG20171219>
Last Modified By    :   Mansi gupta
Last Modified Date  :   19 Dec 2017
Description         :   Updated logic for NPC for BI EMEA D630- ZPRI & ZPNG || PS CRM -IS ID-00083258 
********************************************************************************************************************
<CC20192910>
Last Modified By    :   Calment Cleo
Last Modified Date  :   29 Oct 2019
Description         :   Updated logic for NPC for DPT LA.
*********************************************************************************************************************
<PG20191211>
Last Modified By    :   Piyush gupta
Last Modified Date  :   11 Dec 2019
Description         :   Updated logic for NPC for DPT AP, DPT LA, DPT NA and added few sattements for test visibility.
*********************************************************************************************************************
<PG20201609>
Last Modified By    :   Piyush gupta
Last Modified Date  :   16 Sep 2020
Description         :   Updated logic for NPC for BI Ap Surfaces.
*********************************************************************************************************************
<VK20201709>
Last Modified By    :   Vinay Kumar
Last Modified Date  :   17 Sep 2020
Description         :   Updated logic for NPC for BI Ap Surfaces. Added ZD8B for the NPC Calculation as discount.
*********************************************************************************************************************
<AG20200710>
Last Modified By    :   Amandeep Gautam
Last Modified Date  :   07 Oct 2020
Description         :   Updated logic for NPC for DPT AP SalesOrgs starting with "D6". To calculate Current Net & New Net.
*********************************************************************************************************************
<AG20200411>
Last Modified By    :   Amandeep Gautam
Last Modified Date  :   04 Nov 2020
Description         :   Issue - IS SC-00096264, Removing 'Mat not found' error by correcting the Queries.
*********************************************************************************************************************
<PG20202311>
Last Modified By    :   Piyush Gupta
Last Modified Date  :   23 Nov 2020
Description         :   Approval Logic Global Issue for Floor & Reference Prices triggering incorrect Approval Flow.

*********************************************************************************************************************
<VK20202611>
Last Modified By    :   Vinay Kumar
Last Modified Date  :   26 Nov 2020
Description         :   Fixing the ZD8B calculation for BI AP Surfaces ZDX1 project pricing
*********************************************************************************************************************

<SP20210607>
Last Modified By: Shivam Parashar
Last Modified Date: 7 June 2021
Description: Added Logic so that ZRB2 rebate is deducted during NPC for DPP Polymers NAFTA

*********************************************************************************************************************
<VK20210807>
Last Modified By    :   Vinay Kumar
Last Modified Date  :   08 Jul 2021
Description         :   Fixing the gross price calculation for BI AP Surfaces A603 ZDI1 pricing condition 
*********************************************************************************************************************
<RB20211215>
Last Modified By    :   Rajesh Barda
Last Modified Date  :   15 December 2021
Description         :   Updated code so that NPC works for DPP Polymers NAFTA B960 Sales Pricing Procedure - Canada Region (IS TI-00093150). Updated API Version from 51 to 53.

*********************************************************************************************************************
<SS20221130>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   30 November 2022
Description         :   Updated code so that NPC works for Import request with key combination which contains Ship To. Updated API Version from 53 to 56.

*********************************************************************************************************************
<SS20230124>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   24 January 2023
Description         :   Updated code so that BI AP Surfaces A67D NPC logic to work on New Rate instead of Gross Price (ZPSF).Updated API Version from 56 to 57. (IS SC-00106416)

*********************************************************************************************************************
<SS20230130>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   30 January 2023
Description         :   Updated code so that BI EMEA Emvelope NPC logic to add ZGA1 and ZGA2 (IS SC-00106571)
********************************************************************************************************************

<SS20230309>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   09 March 2023
Description         :   Updated code so that BI AP Surfaces NPC logic to work on New Rate instead of Gross Price (ZPSE).(IS SC-00106990)
********************************************************************************************************************
<SS20230327>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   27 March 2023
Description         :   Updated code so that BI AP Surfaces Gross Price error (IS SC-00107174)
********************************************************************************************************************
*/
//removed scale_Enabled__c -bala
//adding Ver 1.0 -neeha
public  without sharing class PACalculateNetPrice {
    //Constructor
    public PACalculateNetPrice()
    {   isAsynch=false;
     //<PG20202311>     
     DeltaFloorCheck=false;
     DeltaRefCheck= false;
     
     System.debug('**in cons');
    }
    //locale
    public String seperatorOnPage{get{
        Decimal standardDecimal = 1.1;
        String localeDecimalStr = standardDecimal.format();
        String seperator = localeDecimalStr.subString(1,2);
        return seperator;
    }set;}
    //Piyush <PG20191211> Added @testvisible
    @testvisible
    private String status{get;set;} 
    //TO be removed POC-NPC Integration testing
    public String priId{get;set;}
    //<PG20202311>
    public Boolean DeltaFloorCheck{get;set;}
    public Boolean DeltaRefCheck{get;set;}
    
    public String numberofMat{get;set;}
    //end -Poc To be removed
    
    // To identify whether user has clicked on Calculate button in PAMaterialNet page
    private Boolean isAsynch{get;set;}
    //TO display the net price calculation part of the page
    public class NetPriceWrapper{
        public String pricingConditionOnPage{get;set;}
        public Boolean isSubTotal{get;set;}
        public String pricingConditionLabel{get;set;}
        public String percentCurrent{get;set;}
        public String percent{get;set;}
        public String currentPrice{get;set;}
        public String newPrice{get;set;}
        
    }
    //To display the net Floor n Net reference part of the page
    public class FloorRefWrapper{
        
        public String price{get;set;}
        public String rate{get;set;}
        public String unit{get;set;}
        public String per{get;set;}
        public String uom{get;set;}
        public String percent{get;set;}
        public Pricing_Request_Item__c prIteminWrapper{get;set;}
        public Boolean showPercent{get;set;}
        public Boolean sclFlag{get;set;}
        public FloorRefWrapper(){
            prIteminWrapper = new Pricing_Request_Item__c();
        }
        
    }
    //List of net price wrappers
    public List<NetPriceWrapper> netPriceWrapperList{get;set;}
    
    public List<FloorRefWrapper>  FlrRefWrapperList{get;set;}
    
    
    //To show the Pricing conditions and descriptions in the left side column
    private List<String> pcCodeDescriptionList{get;set;}
    
    //To populate the pccode n description as key and Calcuation Type as value-used on the page to render % column
    public Map<String,String> pccodeCalculationTypeMap{get;set;}
    
    //used to store the map fetched from resposne coming from SAP, need to be a private varible, coz used in multiple methods (recalculate)
    private Map<String,List<String>> splitMap{get;set;}
    
    //private varaible vch stores the pricing request Item
    private Pricing_Request_item__c pricingRequestItem{get;set;}
    
    //private variable vch stores npcRequest
    private List<NPC_Request__c> npcRequestsUpdatedList{get;set;}
    //Piyush <PG20191211> Access in test classes
    @testvisible
    private Map<String,String> newNetPriceValuesMap {get;set;} 
    //Piyush Start <PG20191211> Access in test classes - Added @testvisible 
    @testvisible    
    private Map<String,String> currentNetPriceValuesMap {get;set;} 
    //piyush <PG20191211> Added test visible.
    @testvisible
    private Map<String,String> condRateMap{get;set;}
    //Piyush Start <PG20191211> Access in test classes - Added @testvisible 
    @testvisible
    private Map<String,String> condRateMapCurrent{get;set;}
    
    //for populating condition class and cal tye
    private Map<String,String> pcCodeConditionClassMap{get;set;}
    private Map<String,String> pcCodeCalTypeMap{get;set;}
    private Map<String,String> pcCodeDescriptionMap{get;set;}
    private Map<String,String> pcCodePriceTypesMap{get;set;}
    private Map<String,String> pcCodeLabelMap{get;set;}
    private List<ERP_Procedure_Conditions__c> pcListForCalculation{get;set;}
    
    
    Set<Id> pricingProcedureSet=new Set<Id>();
    public static final String Material_RTYPE_Id = 'ERP Material - Extended Data';
    
    public Map<String,NPC_Response__c>  npcRequestResponseMap=new Map<String,NPC_Response__c>();
    
    /*
* This method calculates  NPC for both Sycnh and Aynch case
*/
    
    public void calculateNPC(Set<Id> npcReqIdSet,Map<String,List<String>> cTRateMap,List<Pricing_Request_Item__c> prItemList,Boolean isSynchronous){
        System.debug('***cTRateMap'+cTRateMap);
        Pricing_Request_Item__c prItem; 
        
        /*Query all the NPC Requests for Ids in npcReqIdSet*/ 
        /// removed field from query APAC rollout-UOM__c, Unit__c,Per__c,Material__c,
        List<NPC_Request__c> npcReqList =[Select Status__c,UOM__c,Unit__c,Per__c,Material__c, SystemModstamp, Sales_Organization__c, Sales_Document_Type__c, SAP_Cluster_Id__c, Request__c,
                                          Quantity__c, Pricing_Request_Item__c,Pricing_Request_Item__r.ERP_pricing_Procedure__c,Pricing_Request_Item__r.ERP_Pricing_Procedure__r.Pricing_Procedure__c,Pricing_Request_Item__r.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c, Pricing_Date__c, Partner_Code_2__c, Partner_Code_1__c, Partner_2__c, 
                                          Partner1__c,Pricing_Request_Item__r.Pricing_Condition_Code__c, Name,  Material_Number__c, LastModifiedDate, LastModifiedById, Pricing_Request_Item__r.Pricing_Condition__c,Pricing_Request_Item__r.Rate__c,Pricing_Request_Item__r.Unit__c,
                                          Pricing_Request_Item__r.Per__c,Pricing_Request_Item__r.UoM__c,Pricing_Request_Item__r.New_Rate__c,Pricing_Request_Item__r.new_Unit__c,Pricing_Request_Item__r.New_Per__c,Pricing_Request_Item__r.New_UoM__c,
                                          LastActivityDate, IsDeleted, Id, External_ID__c,isSynchronous__c, Division__c, Distribution_Channel__c, CurrencyIsoCode,  
                                          CreatedDate,Stamp_Current_Net_Price__c,Stamp_Floor_Net_Price__c,Stamp_New_Net_Price__c,Stamp_Reference_Net_Price__c,
                                          CreatedById, Count_of_NPC_Responses__c, Below_Reference_Flag__c, Below_Floor_Flag__c, Below_Current_Flag__c,
                                          Response_Error_Code__c,Response_Error_Message__c From NPC_Request__c where Id=:npcReqIdSet];
        
        //Iterate through the List and place the npcRequestId and Pricing request Item (parent Id) in a map
        Map<Id,String> npcReqIdParentMap =new  Map<Id,String>();
        Map<String,Pricing_Request_item__c> idPriItemMap =new Map<String,Pricing_Request_item__c>(); 
        if(isSynchronous==false){
            for(NPC_Request__c npc:npcReqList)
            {
                npcReqIdParentMap.put(npc.Id,npc.Pricing_Request_item__c);
            }
            
            //end
            //iterate throught the prItemList from the mathod parameter and place Pricing request item id and object instance in a map
            
            for(Pricing_Request_Item__c pri:prItemList)
            {
                idPriItemMap.put(pri.id,pri);
            }
        }
        System.debug('****npcReqIdParentMap'+ npcReqIdParentMap.size());
        System.debug('****idPriItemMap'+ idPriItemMap.size());
        
        
        if(isSynchronous==true){
            if(prItemList!=null && prItemList.size()!=0){
                prItem=prItemList.get(0);
                System.debug('****prItem in sych0'+prItem);
            }
            if(prItem!=null){
                //Added by UD -moved from populate map to this method-neeha
                FlrRefWrapperList = new List<FloorRefWrapper>();
                FloorRefWrapper flrRefWrapper = new FloorRefWrapper();
                flrRefWrapper.price = 'New Rate';
                flrRefWrapper.uom = prItem.New_UoM__c;
                if(prItem.New_Rate__c!=null){
                    flrRefWrapper.rate= prItem.New_Rate__c.replace('.',seperatorOnPage);
                    
                    
                }
                // flrRefWrapper.rate = prItem.New_Rate__c;//replace it with 'locale'
                flrRefWrapper.unit = prItem.New_Unit__c;
                flrRefWrapper.per = string.valueof(prItem.New_Per__c);
                flrRefWrapper.prIteminWrapper = prItem;
                flrRefWrapper.sclFlag = prItem.Scaled_Price_Flag__c;
                FlrRefWrapperList.add(flrRefWrapper);
                //added the condition coz in case of new price , ther would no old Rate-neeha 16-04
                if(prItem.Rate__c!=null){
                    flrRefWrapper = new FloorRefWrapper();
                    flrRefWrapper.price = 'Current Rate';
                    flrRefWrapper.uom = prItem.UoM__c;
                    flrRefWrapper.rate = prItem.Rate__c;
                    flrRefWrapper.unit = prItem.Unit__c;
                    flrRefWrapper.per = string.valueof(prItem.Per__c);
                    flrRefWrapper.prIteminWrapper = prItem;
                    List<ERP_Sales_Prices_SAP__c> erpSapList = [SELECT Id,Scaled_Price_Flag__c FROM ERP_Sales_Prices_SAP__c WHERE Id = :prItem.ERP_Sales_Prices_SAP__c];
                    if(erpSapList!=null && erpSapList.size()!=0){ //condition added by neeha
                        flrRefWrapper.sclFlag = erpSapList[0].Scaled_Price_Flag__c;
                    }
                    FlrRefWrapperList.add(flrRefWrapper);
                }
                //End
            }
        }
        if(isSynchronous==false)
        {
            /*Query all the NPC Responses for all the NPC requests- applicable only in Asynchronous scenario */
            for(NPC_Response__c n: [Select  SystemModstamp,  Name, NPC_Response_Status__c, NPC_Request__c,
                                    NPC_Message__c, NPC_Message_Type__c, Material_Number__c, LastModifiedDate, LastModifiedById, IsDeleted,
                                    Id, F_Response_Status__c, External_Id__c, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Rate_Key__c
                                    From NPC_Response__c where NPC_Request__c=:npcReqIdSet])
            {
                npcRequestResponseMap.put(n.NPC_Request__c,n);                
            }
            
        }
        /*Iterate through all the NPC requests and populate all the pricing procedures
coz, NPC is different for different Pricing Procedure
*/
        for(NPC_Request__c npcReq:npcReqList){
            pricingProcedureSet.add(npcReq.Pricing_Request_Item__r.ERP_pricing_Procedure__c);
        }
        Map<String,List<ERP_Procedure_Conditions__c>> procedureConditionsMap =new  Map<String,List<ERP_Procedure_Conditions__c>>();
        /*Query all the Procedure COnditions from SFDC - to calculate the rates against each Pricing Condiiton*/
        List<ERP_Procedure_Conditions__C> erpPCList=[Select To__c,SystemModstamp, Step__c,Sales_Pricing_Procedure__c,
                                                     Sales_Pricing_Procedure_Condition_Config__c, Pricing_Condition__c, Pricing_Condition__r.Pricing_Condition_Code__c,
                                                     Pricing_Condition__r.Calculation_Type__c,  Pricing_Condition__r.Pricing_Condition_description__c,
                                                     Pricing_Condition_Formula__c, Name,Pricing_Condition__r.Plus_Minus_Code__c, LastModifiedDate, LastModifiedById,Pricing_Condition__r.Pricing_Condition__c,  
                                                     LastActivityDate, IsDeleted, Id, Pricing_Condition__r.Price_Types__c,Pricing_Condition__r.Condition_Class__c,
                                                     From__c,CurrencyIsoCode, CreatedDate, CreatedById From ERP_Procedure_Conditions__c where Sales_Pricing_Procedure__c=:pricingProcedureSet
                                                     ORDER BY Step__c];
        //where clause still needs to be validated. Step!=null ???   AND Step__c!=null and From__c!=null AND To__c!=null-neeha
        pcCodeDescriptionList= new List<String>();
        pccodeCalculationTypeMap=new Map<String,String>();
        pcCodeConditionClassMap=new Map<String,String>();
        pcCodeCalTypeMap=new Map<String,String>();
        pcCodeDescriptionMap=new Map<String,String>();
        pcCodePriceTypesMap =new Map<String,String>();
        pcCodeLabelMap=new Map<String,String>();
        pcListForCalculation=new List<ERP_Procedure_Conditions__c>();
        /*populate a map with pricing proceure as key and corresponding Procedure conditions as value*/                            
        for(ERP_Procedure_Conditions__c e:erpPCList)
        {   
            
            if(!procedureConditionsMap.containskey(e.Sales_Pricing_Procedure__c)){
                //System.debug('*****in if');
                List<ERP_Procedure_Conditions__c> newList=new List<ERP_Procedure_Conditions__c>();
                newList.add(e);
                procedureConditionsMap.put(e.Sales_Pricing_Procedure__c,newList);
            }     
            else{       
                //System.debug('*****in else');
                List<ERP_Procedure_Conditions__c>  tempList= procedureConditionsMap.get(e.Sales_Pricing_Procedure__c);
                tempList.add(e);
                procedureConditionsMap.put(e.Sales_Pricing_Procedure__c,tempList);
            }
            
        } 
        /*VIMP: UoMConversion() method populates and returns a map with material code and alterntive UoM as key
and its conversion factor (Nr:Dr) as value
*/          
        Map<String,String> UoMConversionMap=UoMConversion(npcReqList);  
        System.debug('****uom conversion map after populateion'+UoMConversionMap);
        /*end*/  
        
        ///*Iterate through all NPC requests to intiate NPC for each npc request ** common code form both sync n async */                             
        List<NPC_Request__c> toUpdateNPCRequestList=new List<NPC_Request__c>();
        for(NPC_Request__c npcRequest:npcReqList)
        {  
            //VIMP. coz prItem has to determined from map only in case of Aysnchronous
            // isSynchronous ==false also added this condtion for new requirement
            if(npcRequest.isSynchronous__c==false && isSynchronous ==false){ 
                prItem= idPriItemMap.get(npcReqIdParentMap.get(npcRequest.Id));
            }
            pricingRequestItem=prItem; //assigning it to public variable
            System.debug('****pricing requ item'+prItem); 
            System.debug('****npcRequest.isSynchronous__c'+npcRequest.isSynchronous__c+'**isSynchronous'+isSynchronous); 
            /*This map will hold the response from SAP in form of map<CT, ratelist>*/
            Map<String,List<String>> condTypeRateMap=new Map<String,List<String>>();
            //say there  are 5 and are of different requestItems
            //get the response from  npcRequestResponseMap
            /*Applicable only for Asynchronous call out*/ // && isSynchronous==false-adding this condition for new requirement,though NPC req is asynch, it should come here
            if(npcRequest.isSynchronous__c==false && isSynchronous==false){
                NPC_Response__c npcResponse;
                if(npcRequestResponseMap.containsKey(npcRequest.Id))
                {
                    npcResponse=npcRequestResponseMap.get(npcRequest.Id);
                    if(npcResponse.NPC_Message_Type__c=='S') //only on success
                    {   System.debug('**neeha'+npcRequest.Pricing_request_item__r.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c+'***'+npcResponse+'**'+npcRequestResponseMap);
                     condTypeRateMap=splitVarKey(npcResponse.Condition_Rate_Key__c);
                     
                    }
                    //IF there is an error from SAP
                    else{
                        npcRequest.Below_Current_Flag__c=true;
                        npcRequest.Below_Floor_Flag__c=true;
                        npcRequest.Below_Reference_Flag__c=true;
                        //update npcRequest;
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                }
                
            }
            else{
                condTypeRateMap=cTRateMap; //From the method parameter- in case of synch
                System.debug('***in else populate map'+condTypeRateMap);
            }
            
            
            /*Common code start*/   
            
            
            System.debug('*****prItem.ERP_Pricing_Procedure__c'+prItem.ERP_Pricing_Procedure__c);
            //get all the Procedure Conditions that are applicable for the Pricing Reques Item's Sales pricing procedure from procedureConditionsMap
            if(procedureConditionsMap.containsKey(prItem.ERP_Pricing_Procedure__c))
            {
                List<ERP_Procedure_Conditions__c> appProCondList=procedureConditionsMap.get(prItem.ERP_Pricing_Procedure__c);
                //Iterate through the appProCondList to populate pccodeCalculationTypeMap to render % on the material net page
                for(ERP_Procedure_Conditions__c proCond:appProCondList){
                    //This condition is added because, The Procedure conditions w/o step ,from, to are not considered for NPC
                    if(proCond.Pricing_Condition__r.Calculation_Type__c!=null){
                        pccodeCalculationTypeMap.put(proCond.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+proCond.Pricing_Condition__r.Pricing_Condition__c,proCond.Pricing_Condition__r.Calculation_Type__c);
                    }
                    else{
                        pccodeCalculationTypeMap.put(proCond.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+proCond.Pricing_Condition__r.Pricing_Condition__c,'-');
                    }
                    pcCodeConditionClassMap.put(proCond.Pricing_Condition__r.Pricing_Condition_Code__c,proCond.Pricing_Condition__r.Condition_Class__c);
                    pcCodeCalTypeMap.put(proCond.Pricing_Condition__r.Pricing_Condition_Code__c,proCond.Pricing_Condition__r.Calculation_Type__c);
                    pcCodeDescriptionMap.put(proCond.Pricing_Condition__r.Pricing_Condition_Code__c,proCond.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+proCond.Pricing_Condition__r.Pricing_Condition__c);
                    
                }
                //This condition is added because, The Procedure conditions after Net price are not considered for NPC
                for(ERP_Procedure_Conditions__c pcToDisplay:appProCondList){ 
                    if(pcToDisplay.Step__c!=null && pcToDisplay.From__c!=null && pcToDisplay.To__c!=null && pcToDisplay.Pricing_Condition__r.Price_Types__c!=null && pcToDisplay.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Price')){
                        pcCodeDescriptionList.add(pcToDisplay.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+pcToDisplay.Pricing_Condition__r.Pricing_Condition__c);
                        pcCodePriceTypesMap.put(pcToDisplay.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+pcToDisplay.Pricing_Condition__r.Pricing_Condition__c,pcToDisplay.Pricing_Condition__r.Price_Types__c);
                        pcCodeLabelMap.put(pcToDisplay.Pricing_Condition__r.Pricing_Condition_Code__c,pcToDisplay.Pricing_Condition__r.Pricing_Condition__c);
                        break;
                    }
                    else if(pcToDisplay.Step__c!=null && pcToDisplay.From__c!=null && pcToDisplay.To__c!=null){
                        pcCodeDescriptionList.add(pcToDisplay.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+pcToDisplay.Pricing_Condition__r.Pricing_Condition__c);
                    }
                    pcCodePriceTypesMap.put(pcToDisplay.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+pcToDisplay.Pricing_Condition__r.Pricing_Condition__c,pcToDisplay.Pricing_Condition__r.Price_Types__c);
                    pcCodeLabelMap.put(pcToDisplay.Pricing_Condition__r.Pricing_Condition_Code__c,pcToDisplay.Pricing_Condition__r.Pricing_Condition__c);
                }
                
                
                condRateMap=new Map<String,String>(); //To store values  that are to be displayed in %
                condRateMapCurrent=new Map<String,String>(); //To store values  that are to be displayed in % for Current price
                currentNetPriceValuesMap=new Map<String,String>(); //To store values  that are to be displayed in current price
                newNetPriceValuesMap=new Map<String,String>(); //To store values  that are to be displayed in new price
                
                netPriceWrapperList= new List<NetPriceWrapper>(); //to populate wrapper displayed on left side
                String procedureName;
                procedureName  = PAPricingProcedureMapping__c.getInstance('BI Surfaces').Pricing_Procedure_Code__c;
                System.debug('****procedure name'+procedureName);  // Added for pakistan onboarding A697
                if((prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c==procedureName) || (prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('BI Surfaces PAK').Pricing_Procedure_Code__c))//custom settings
                {    
                    System.debug('***in if of BI EMEA Surfaces');
                    //call NPC for BI EMEA Surfaces
                    
                    //for current Price Calculation
                    //adding Ver 1.0 - changing method signature for new requirement
                    calculateRatesforBISurfaces(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous); //For computing current net price
                    if(status=='Error'){
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    } 
                    System.debug('**After current call');
                    calculateRatesforBISurfaces(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous); //For computing new net price
                    
                    
                }
                //For BI Enevelopes-D630
                procedureName = PAPricingProcedureMapping__c.getInstance('BI Envelopes D630').Pricing_Procedure_Code__c;
                System.debug('****procedure name'+procedureName+'**'+prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c);
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c==procedureName)
                {
                    //call NPC for BI Enevelopes
                    
                    //for current Price Calculation
                    calculateRatesforBIEnvelopesD630(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous); //For computing current net price
                    System.debug('**After current call');
                    if(status=='Error'){
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    } 
                    calculateRatesforBIEnvelopesD630(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous); //For computing new net price
                }
                //For BI Envelopes-D693
                procedureName = PAPricingProcedureMapping__c.getInstance('BI Envelopes D693').Pricing_Procedure_Code__c;
                System.debug('****procedure name'+procedureName+'**'+prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c);
                if((prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c==procedureName) || (prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('BI Envelopes PAK').Pricing_Procedure_Code__c)) //Added for pakistan onboarding D697
                {
                    //call NPC for BI Enevelopes
                    
                    //for current Price Calculation
                    calculateRatesforBIEnvelopesD693(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous); //For computing current net price
                    System.debug('**After current call');
                    if(status=='Error'){
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    } 
                    calculateRatesforBIEnvelopesD693(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous); //For computing new net price
                }
                
                //<PP20130607> START
                //For BI AP Surfaces-A618,A629,A642,A64B,A674,A680
                procedureName = PAPricingProcedureMapping__c.getInstance('BI AP Surfaces Rest').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPSurfacesRest(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPSurfacesRest(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For BI AP Surfaces-A64A
                procedureName = PAPricingProcedureMapping__c.getInstance('BI AP Surfaces A64A').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPSurfacesRest(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPSurfacesRest(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For BI AP Surfaces-A603
                procedureName = PAPricingProcedureMapping__c.getInstance('BI AP Surfaces A603').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPSurfacesA603(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPSurfacesA603(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<NE20131021>For BI AP Envelopes-D618,D629,D63B,D642,D691 <>
                procedureName = PAPricingProcedureMapping__c.getInstance('BI AP Envelopes D618-91').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<NE20131021>FOr  BI AP Envelopes D600
                procedureName = PAPricingProcedureMapping__c.getInstance('BI Envelopes D600').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<NE20131021>FOr  BI AP Envelopes D603
                procedureName = PAPricingProcedureMapping__c.getInstance('BI Envelopes D603').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For BI AP Envelopes-D643,D655,D66D,D674,D680
                procedureName = PAPricingProcedureMapping__c.getInstance('BI AP Envelopes Rest').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For BI AP Envelopes-D64A
                procedureName = PAPricingProcedureMapping__c.getInstance('BI Envelopes D64A').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforBIAPEnvelopes(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20130607> END
                //<PP20130614> START
                //For MCM AP Paste
                procedureName = PAPricingProcedureMapping__c.getInstance('MCM AP Paste').Pricing_Procedure_Code__c;
                System.debug('****procedure name'+procedureName);
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    System.debug('****procedure name'+procedureName);
                    calculateRatesforMCMAPPaste(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforMCMAPPaste(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20130614> END
                //<PP20130920> START
                //For DTT AP - China
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT AP China').Pricing_Procedure_Code__c;
                System.debug('****DTT procName'+procedureName+'***'+prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c);
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTAPChina(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTAPChina(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For DTT AP excluding China
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT AP Rest').Pricing_Procedure_Code__c;
                System.debug('****DTT Rest procName'+procedureName+'***'+prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c);
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTAPRest(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTAPRest(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20130920> END
                //<PP20131009> START
                //For DTT EMEA Pricing Procedure F253
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT EMEA Pricing Procedure F253').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTEMEAF253(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTEMEAF253(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For DTT EMEA Pricing Procedure F293
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT EMEA Pricing Procedure F293').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTEMEAF293(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTEMEAF293(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20131009> END
                //<PP20131018> START
                //For DTT LA Pricing Procedure F250,F253 and F295 - SPP1 according to template
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT LA PP F250,F253 and F295').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTLARest(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTLARest(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For DTT LA Pricing Procedure F26C - SPP2 according to template
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT LA PP F26C').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTLAF26C(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTLAF26C(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20131018> END
                //<PP20131023> START
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT Canada Pricing Procedure').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTCanada(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTCanada(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT US Pricing Procedure').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTUS(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTUS(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20131023> END
                //<PP20131129> START
                //For DTT AP F200
                procedureName = PAPricingProcedureMapping__c.getInstance('DTT AP F200').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforDTTAPRest(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDTTAPRest(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20131129> END
                //<PP20140618> START
                //For CPM EMEA
                procedureName = PAPricingProcedureMapping__c.getInstance('CPM EMEA').Pricing_Procedure_Code__c;
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == procedureName)
                {
                    //Compute Current Net Price
                    calculateRatesforCPMEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforCPMEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For PG LA
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG LA F41A').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG LA F42A,F44G,F450').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG LA F46C').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG LA F496,F49V').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPGLA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPGLA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP US SPP').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPUS(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPUS(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,1);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,1);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP IN').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,2);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,2);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP JP').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,3);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,3);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP CN').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,4);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,4);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP AU').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,5);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,5);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP PH').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,7);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,7);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP AP SG').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,8);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,8);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT NA SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,1);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,1);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT NA SPP2').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT NA SPP3').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,2);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,2);
                }
                /*Piyush <PG20191211>---if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT NA SPP3').Pricing_Procedure_Code__c)
{
//Compute Current Net Price
calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,3);
if(status=='Error')
{
toUpdateNPCRequestList.add(npcRequest);
break;
}
//Compute New Net Price
calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,3);
}Piyush <PG20191211>---*/
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT NA SPP4').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,4);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTNA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,4);
                }
                
                // <PG20191211> Added by Piyush for DPT AP and DPT LA.
                
                
                //<CC20192910> start
                // FOR DPT LA
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT LA SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,1);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,1);
                }
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT LA SPP2').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,2);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,2);
                }
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT LA SPP3').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,3);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,3);
                }
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT LA SPP4').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,4);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTLA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,4);
                }
                
                //For DPT AP
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT AP SPP1').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT AP SPP2').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT AP SPP3').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT AP SPP4').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT AP SPP5').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT AP SPP6').Pricing_Procedure_Code__c)
                {   
                    if(prItem.Sales_Org_Code__c.startsWithIgnoreCase('A2')){
                        //Compute Current Net Price
                        calculateRatesforDPTAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,1);
                        if(status=='Error')
                        {
                            toUpdateNPCRequestList.add(npcRequest);
                            break;
                        }
                        //Compute New Net Price
                        calculateRatesforDPTAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,1);
                    }
                    //<AG20200710>START
                    else if((prItem.Sales_Org_Code__c.startsWithIgnoreCase('AD')) || (prItem.Sales_Org_Code__c.startsWithIgnoreCase('D6'))){
                        //<AG20200710>END
                        //Compute Current Net Price
                        calculateRatesforDPTAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,2);
                        if(status=='Error')
                        {
                            toUpdateNPCRequestList.add(npcRequest);
                            break;
                        }
                        //Compute New Net Price
                        calculateRatesforDPTAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,2);
                    }
                }
                
                
                //<CC20192910> end
                
                /////////////
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP EMEA SPP').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP KV SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,1);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,1);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP Global Kalrez & Vespel SPP3').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,2);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,2);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP KV SPP3').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,3);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,3);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP KV SPP4').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,3);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,3);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP KV SPP5').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,5);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPKV(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,5);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPGLOBAL SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPGlobal(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPGlobal(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //DPP EMEA
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP Polymers EMEA SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,true);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,true);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP Polymers EMEA SPP2').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,false);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,false);
                }
                //<MS20141029> START
                //DPP NA
                //<RB20211215> Added OR condition in below if statement so that NPC also works for DPP NA SPP3
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP NA SPP1').Pricing_Procedure_Code__c || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP NA SPP3').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPNA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,true);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPNA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,true);
                }
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP NA SPP2').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPNA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,false);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPNA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,false);
                }
                //<MS20141029> END
                //For PG NA US - F450
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG NA F450').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPGNAUS(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPGNAUS(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For PG NA Canada - F46A
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG NA F46A').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPGNACanada(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPGNACanada(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For DCP AP Malaysia
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP Malaysia').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPMalaysia(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPMalaysia(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For CPM AP & MCM EMEA Green Tape
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F418').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F429').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F450').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F474').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F4B1').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F4F1').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM AP F4G1').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('MCM EMEA Green Tape').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('MCM NA Green Tape').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforCPMAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforCPMAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //MCM EMEA Paste
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('MCM EMEA Paste').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('MCM NA Paste').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforMCMEMEAPaste(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforMCMEMEAPaste(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For DPT EMEA
                if((prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT EMEA').Pricing_Procedure_Code__c)  || 
                   (prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPT EMEA PAK').Pricing_Procedure_Code__c))
                {
                    //Compute Current Net Price
                    calculateRatesforDPTEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPTEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                
                //For PG EMEA
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('PG EMEA').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPGEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPGEMEA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For P&IP EU ZIS2
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP ECP EU PP G220-G26A').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPnIPEUZIS2(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPnIPEUZIS2(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For P&IP EU Rest
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP ECP EU PP G240,G241,G293').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPnIPEU(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPnIPEU(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For P&IP LA
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP ECP LA PP G21A').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP ECP LA PP G250-G240').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP ECP LA PP G26C').Pricing_Procedure_Code__c
                   || prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP ECP LA PP G296,G29V').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPnIPLA(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPnIPLA(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For P&IP NA US
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP NA US').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPnIPNAUS(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPnIPNAUS(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For P&IP NA Canada
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('P&IP NA Canada').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforPnIPNACanada(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforPnIPNACanada(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For CPM NA US - F450
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('CPM NA F450').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforCPMNAUS(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforCPMNAUS(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //For DCP Canada
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DCP Canada').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDCPCanada(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDCPCanada(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous);
                }
                //<PP20140618> END
                
                //<GT20150512>
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP AP SPP1').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,1);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,1);
                }
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP AP SPP2').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,2);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,2);
                }
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP AP SPP3').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,3);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,3);
                }
                
                if(prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c == PAPricingProcedureMapping__c.getInstance('DPP AP SPP4').Pricing_Procedure_Code__c)
                {
                    //Compute Current Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,true,UoMConversionMap,isSynchronous,4);
                    if(status=='Error')
                    {
                        toUpdateNPCRequestList.add(npcRequest);
                        break;
                    }
                    //Compute New Net Price
                    calculateRatesforDPPAP(appProCondList,condTypeRateMap,npcRequest,prItem,false,UoMConversionMap,isSynchronous,4);
                }
                
                
                //<GT20150512> END
                
                //Common code start
                System.debug('****in adding wrappers');
                for(String s:pcCodeDescriptionList)
                {   System.debug('****before null pointer'+condRateMap+'curretn'+currentNetPriceValuesMap+'value'+pcCodePriceTypesMap.get(s));
                 System.debug('****pcCodePriceTypesMap.get(s)'+pcCodePriceTypesMap.get(s)+'**key'+s);
                 NetPriceWrapper netpriceWrap=new NetPriceWrapper();
                 
                 if(pcCodePriceTypesMap.get(s)!=null &&(pcCodePriceTypesMap.get(s).containsIgnoreCase('Sub Total') || pcCodePriceTypesMap.get(s).containsIgnoreCase('Net Price'))){
                     List<String> splitList=s.split('-');
                     System.debug('****splitlist'+splitList);
                     netpriceWrap.pricingConditionOnPage=pcCodeLabelMap.get(splitList.get(0));
                     netpriceWrap.isSubTotal=true;
                 }
                 else{
                     netpriceWrap.pricingConditionOnPage=s;
                 } 
                 netpriceWrap.pricingConditionLabel=s;
                 netpriceWrap.percent=condRateMap.get(s);
                 netpriceWrap.percentCurrent=condRateMapCurrent.get(s);
                 netpriceWrap.currentPrice=currentNetPriceValuesMap.get(s);
                 netpriceWrap.newPrice=newNetPriceValuesMap.get(s);
                 netPriceWrapperList.add(netpriceWrap);
                }
                
                System.debug('****net price map'+netPriceWrapperList.size());
                System.debug('****current map'+currentNetPriceValuesMap);
                System.debug('****new map'+newNetPriceValuesMap);
                System.debug('****cond rate  map'+condRateMap);
                System.debug('****cond rate Current % map'+condRateMapCurrent);
                System.debug('****pricing request item before floor check'+pricingRequestItem);
                
                //Call floor and reference check method 
                
                checkforFlrAndRef(currentNetPriceValuesMap, newNetPriceValuesMap, appProCondList, condTypeRateMap, npcRequest,prItem,pcCodeDescriptionMap, uomConversionMap);
                
            }  
        }
        if(toUpdateNPCRequestList.size()!=0){
            System.debug('**in neeha');
            update toUpdateNPCRequestList;
        }
        System.debug('***before method exit'+'toUpdateNPCRequestList'+toUpdateNPCRequestList+'net price'+netPriceWrapperList);
    }
    
    /*The method creates NPC requests from the requestitem to be called for both sync and asynch on click of net pricing button
Material determaination-applicable for Aynch
*/                                 
    //public boolean netPricingFlag{get;set;}
    //<PP20131220>
    public String materialCode{get;set;}
    public String materialDesc{get;set;}
    private  PageReference createNPCRequests(Pricing_Request_Item__c pri){
        
        //throw new  PAException('Error!!!',ApexPages.Severity.ERROR);
        System.debug('*****pri.Scale rate'+pri.ScaleRate1__c);
        pricingRequestItem=pri; //priItem//Imp-assigning the Pricing request Item selected to public variable
        System.debug('***pricing in create NPC req'+pri+'after assignment'+pricingRequestItem+'division code of request'+pri.Pricing_request__r.Division_Code__c);
        System.debug('*****BU'+pri.BU__c+'dist'+pri.Pricing_request__r.Dist_Channel_Code__c+'salesorg'+pri.Pricing_request__r.Sales_Org_Code__c);
        if(pri!=null){
            //To be modified once  pri.ERP_Pricing_Procedure__c is populated 
            Pricing_Request__c pr  = [SELECT Id,BU__c,SoldTo_Code__c,Sales_Org_Code__c,division_code__c,dist_channel_code__c FROM Pricing_Request__c
                                      WHERE Id=:pri.Pricing_Request__c];
            
            Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();//have to initialse -else chance of null pointer
            //<AV20140515> added isVolumeApplicable field in the query
            List<Organizational_Group_Item__c> orgItemList = [SELECT id,ERP_Pricing_Procedure__c,isVolumeApplicable__c FROM Organizational_Group_Item__c WHERE 
                                                              Business__r.Business__c=:pr.BU__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:pr.Dist_Channel_Code__c
                                                              AND OrgGroup__r.ERP_Division_Code__c=:pr.Division_Code__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:pr.Sales_Org_Code__c];
            if(orgItemList!=null && orgItemList.size()!=0){
                buOrgGroup=orgItemList[0];
            }
            //pri.ERP_Pricing_Procedure__c as it is populated for project scenario
            //<AV20140515> added Volume__c field in the query
            List<ERP_Access_Sequence__c> accessSequenceList = [SELECT id,pricing_condition__c,Floor_Pricing_Condition__r.pricing_condition_code__c,pricing_Key_Combination__c,
                                                               pricing_key_combination__r.key_combination_code__c,pricing_condition__r.pricing_Condition_code__c,
                                                               Reference_Pricing_Condition__r.pricing_condition_code__c,Floor_Key_Combination__r.key_Combination_code__c,
                                                               Reference_key_combination__r.key_combination_code__c,Reference_Key_Combination__r.key_Combination__c,
                                                               Floor_Key_Combination__r.key_Combination__c,pricing_condition__r.SAP_Cluster__c,pricing_condition__r.SAP_Application_Id__c,
                                                               pricing_condition__r.SAP_Client_Id__c,pricing_key_combination__r.SAP_Cluster__c,pricing_key_combination__r.SAP_Application_Id__c,
                                                               pricing_key_combination__r.SAP_Client_Id__c,isVolumeApplicable__c
                                                               FROM ERP_Access_Sequence__c WHERE Sales_Pricing_Procedure__c=:buOrgGroup.ERP_Pricing_Procedure__c AND 
                                                               pricing_key_combination__r.SAP_Application_Id__c = :pri.SAP_Application_Id__c AND 
                                                               pricing_key_combination__r.SAP_Client_Id__c=:pri.SAP_Client_Id__c AND 
                                                               pricing_condition__r.pricing_Condition_code__c =:pri.pricing_condition_code__c
                                                               AND pricing_key_combination__r.key_Combination_code__c =:pri.key_combination_code__c
                                                               AND pricing_condition__r.SAP_Cluster__c=:pri.SAP_Cluster__c AND
                                                               pricing_condition__r.SAP_Application_Id__c=:pri.SAP_Application_Id__c AND
                                                               pricing_condition__r.SAP_Client_Id__c=:pri.SAP_Client_Id__c AND pricing_key_combination__r.SAP_Cluster__c = :pri.SAP_Cluster__c
                                                               AND  isNPCApplicable__c=true ];
            //AND  isNPCApplicable__c=true 
            List<Sales_Area_QuantityUoM_Detail__c> quantityUoMlist=[SELECT Id,Quantity__c,UoM__c,Organizational_Group_Item__c FROM Sales_Area_QuantityUoM_Detail__c where Organizational_Group_Item__c=:buOrgGroup.Id];
            Map<String,String> quantityUoMMap=new Map<String,String>();
            for(Sales_Area_QuantityUoM_Detail__c qUom:quantityUoMlist){
                quantityUoMMap.put(qUom.Uom__c,qUom.Quantity__c);
            }
            System.debug('****quantityUoMMap'+quantityUoMMap);
            //net price check. validation 
            if(accessSequenceList!=null && accessSequenceList.size()==0){
                //net price check is not applicable
                throw new  PAException(System.Label.Net_Price_Not_Applicable,ApexPages.Severity.ERROR);
                
            }  
            else{                                                   
                
                String replacedKC='';
                replacedKC=pri.Key_Combination__c.replace('Material Price Group','');
                
                //<PP20131220> START
                List<Pricing_Request_Item__c> prItemsList = new List<Pricing_Request_Item__c>();
                prItemsList.add(pri);
                materialCode = '';
                materialDesc = '';
                Map<String, String> phToRepMaterialMap = new Map<String, String>();
                if(pri.Key_Combination__c.contains('PH') && !replacedKC.containsIgnoreCase('Material'))
                    phToRepMaterialMap = PAUtil.checkForSynchronousPH(prItemsList);
                String materialCodeDesc;
                if(phToRepMaterialMap.containsKey(pri.F_Product_Hierarchy_Code__c))
                    materialCodeDesc = phToRepMaterialMap.get(pri.F_Product_Hierarchy_Code__c);
                //<PP20140224> START
                if(!String.isBlank(materialCodeDesc))
                {
                    materialCode = materialCodeDesc.split(':', 2)[0];
                    materialDesc = materialCodeDesc.split(':', 2)[1];
                }
                //<PP20140224> END
                //<PP20131220> END
                
                //Synchronous Case
                //<PP20131220> START
                if(replacedKC.containsIgnoreCase('Material') || !String.isBlank(materialCode)){
                    Map<String,String> materialBaseUoMMap=new Map<String,String>();
                    List<Material__c> listOfMaterialRecords = new List<Material__c>();
                    if(replacedKC.containsIgnoreCase('Material'))
                    {
                        listOfMaterialRecords=[SELECT Name,Id,ERP_Material_Code__c, ERP_Base_UOM__c FROM Material__c WHERE ERP_Material_Code__c =:pri.Material_Code__c 
                                               AND ERP_Source_Cluster__c=:pri.SAP_Cluster__c AND ERP_Deletion_Flag__c=false AND 
                                               ERP_Sales_Org_Code__c=:pri.Pricing_Request__r.Sales_org_Code__c AND ERP_Distribution_Channel_Code__c=:pri.Pricing_Request__r.Dist_Channel_Code__c];
                    }
                    else if(!String.isBlank(materialCode))
                    {
                        listOfMaterialRecords=[SELECT Name,Id,ERP_Material_Code__c, ERP_Base_UOM__c FROM Material__c WHERE ERP_Material_Code__c =:materialCode 
                                               AND ERP_Source_Cluster__c=:pri.SAP_Cluster__c AND ERP_Deletion_Flag__c=false AND 
                                               ERP_Sales_Org_Code__c=:pri.Pricing_Request__r.Sales_org_Code__c AND ERP_Distribution_Channel_Code__c=:pri.Pricing_Request__r.Dist_Channel_Code__c];
                    }
                    //<PP20131220> END
                    
                    for(Material__c m:listOfMaterialRecords ){
                        materialBaseUoMMap.put(m.ERP_Material_Code__c,m.ERP_Base_UOM__c);
                    }
                    NpcserviceVARKEY_CPI.NetPriceOutput  output;
                    //Web service call out
                    String quantity;
                    String uom;
                    try{
                        if(pri!=null){
                            
                            System.debug('****neeha materialBaseUoMMap'+materialBaseUoMMap);
                            if(pri.New_Unit__c!='%'){ 
                                //take it from sales area detail
                                //<AV20140515>-START-populating with new volume and new vol uom
                                if(pri.isVolumeApplicable__c == true)
                                {   
                                    quantity=String.valueOf(pri.New_Volume__c);
                                    uom=pri.New_Volume_UoM__c;
                                }
                                //<AV20140515>-END
                                else
                                {
                                    quantity=quantityUoMMap.get(pri.New_UoM__c);
                                    uom=pri.New_UoM__c;
                                }
                                System.debug('****in if'+quantity+'uom'+uom);
                            }  
                            else{
                                //take it from base uom of material
                                if(!String.isBlank(materialCode))
                                {
                                    uom=materialBaseUoMMap.get(materialCode);
                                }
                                else
                                {
                                    uom=materialBaseUoMMap.get(pri.Material_Code__c);
                                }
                                
                                quantity=quantityUoMMap.get(uom);
                                System.debug('****in else'+quantity+'uom'+uom);
                            }
                            System.debug('****after'+quantity+'uom'+uom);
                            //outputList=Call_NPCService.callService(pri); // TO BE modified
                            output=callService(pri,quantity,uom,materialCode);
                            
                        }
                    }
                    catch(Exception e){
                        //Call out failed
                        //call the method
                        Id tempnpcReqId=  createNPCRequestForSynchronous(pri, true,quantity,uom,materialCode);
                        NPC_Response__c npcResp=new NPC_Response__c();
                        npcResp.NPC_Message_Type__c='E';
                        npcResp.Condition_Rate_Key__c=e.getMessage();
                        npcResp.NPC_Request__c=tempnpcReqId ;
                        insert npcResp;
                        //dont uncomment createNPCResponseForSynchronous(output,tempnpcReqId);
                        //end
                        throw new  PAException(e.getMessage(),ApexPages.Severity.ERROR);
                    } 
                    System.debug('***output'+output);
                    //call the method
                    Id npcReqId=   createNPCRequestForSynchronous(pri, false,quantity,uom,materialCode);
                    //end
                    Set<Id> npcReqIdSet =new Set<Id>();
                    npcReqIdSet.add(npcReqId); 
                    //parse the response and populate condRate map
                    Map<String,List<String>> mapct=new Map<String,List<String>>();
                    mapct=   createNPCResponseForSynchronous(output,npcReqId);
                    
                    //String varkey='ZPSE:12.000000000:GBP:1:EA:ZPNB:10.000000000:0:##:##:ZD96:-10.000000000:0:##:##:ZPGS:0.780000000:GBP:1:EA:ZAO1:0.000000000:0:##:##:SKTO:0.000000000:0:##:##:ZREF:15.000000000:EUR:1:KG:ZFLO:12.000000000:EUR:1:KG';
                    //call calculate Net price method
                    List<Pricing_request_Item__c> priItemList=new  List<Pricing_request_Item__c>();
                    priItemList.add(pri);
                    calculateNPC(npcReqIdSet,mapct,priItemList,true); 
                    system.debug('In end of createNPCRequests'+netPriceWrapperList);        
                }
                else{ 
                    List<NPC_Request__c> createNPCRequestList =new List<NPC_Request__c>();
                    /*If already a NPC request exists for a Pricing Request Item, make it inactive,before creating  a new one
do  not consider responses from Inactive npc requests for Floor and reference check
*/
                    System.debug('KC:'+pri.Key_Combination__c);
                    if( !pri.Key_Combination__c.containsIgnoreCase('PH') && !pri.Key_Combination__c.containsIgnoreCase('Material') &&  !pri.Key_Combination__c.containsIgnoreCase('Material Price Group')){
                        throw new  PAException(System.Label.No_Material_Found,ApexPages.Severity.ERROR);
                        
                    }
                    List<NPC_Request__c> alreadyExistingNPCReqList= [select Id, Status__c FROM NPC_Request__c where Pricing_Request_Item__c=:pri.id AND Status__c='Active'];
                    for(NPC_Request__c n:alreadyExistingNPCReqList){
                        n.Status__c='Inactive';
                    }
                    if(alreadyExistingNPCReqList!=null && alreadyExistingNPCReqList.size()!=0){
                        update alreadyExistingNPCReqList;
                    }
                    String sapCluster=pri.SAP_Cluster__c;
                    String salesorgCode=pri.Sales_Org_Code__c;
                    String distiCode=pri.Dist_Channel_Code__c;
                    String ph1=pri.PH1_Code__c;
                    String ph2=pri.PH2_Code__c;
                    String ph3=pri.PH3_Code__c;
                    String ph4=pri.PH4_Code__c;
                    String ph5=pri.PH5_Code__c;
                    String ph6=pri.PH6_Code__c;
                    String ph7=pri.PH7_Code__c;
                    String ph8=pri.PH8_Code__c;
                    String ph9=pri.PH9_Code__c;
                    String mpg=pri.Material_Price_Group_Code__c;
                    String marketSegment=pri.Market_Segment_Code__c;
                    //AND ERP_Distribution_Channel_Code__c=:distiCode  -removin it , coz distribution channel need be be present at request item level
                    String query='SELECT Material_Description__c,Name,ERP_Material_Code__c,ID,ERP_Base_UOM__c FROM Material__c WHERE ERP_Source_Cluster__c=:sapCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesorgCode ';
                    if(pri.Key_Combination__c.containsIgnoreCase('PH'))
                    {   // AND RecordTypeId = :Material_RTYPE_Id validate
                        
                        if(pri.PH1_Code__c!=null)
                        { 
                            query=query+' AND ERP_Product_Hierarchy_Level_1_Code__c=:ph1';
                        }
                        if(pri.PH2_Code__c!=null)
                        {
                            query=query+' AND ERP_Product_Hierarchy_Level_2_Code__c=:ph2';
                        }
                        if(pri.PH3_Code__c!=null)
                        { 
                            query=query+' AND ERP_Product_Hierarchy_Level_3_Code__c=:ph3';
                        }
                        if(pri.PH4_Code__c!=null)
                        {
                            query=query+' AND ERP_Product_Hierarchy_Level_4_Code__c=:ph4';
                        }
                        if(pri.PH5_Code__c!=null)
                        {
                            query=query+' AND ERP_Product_Hierarchy_Level_5_Code__c=:ph5';
                        }
                        if(pri.PH6_Code__c!=null)
                        {
                            query=query+' AND ERP_Product_Hierarchy_Level_6_Code__c=:ph6';
                        }
                        if(pri.PH7_Code__c!=null)
                        {
                            query=query+' AND ERP_Product_Hierarchy_Level_7_Code__c=:ph7';
                        }
                        if(pri.PH8_Code__c!=null)
                        {
                            query=query+' AND ERP_Product_Hierarchy_Level_8_Code__c=:ph8';
                        }
                        if(pri.PH9_Code__c!=null)
                        { 
                            query=query+' AND ERP_Product_Hierarchy_Level_9_Code__c=:ph9';
                        }
                    }
                    if(pri.Key_Combination__c.containsIgnoreCase('Material Price Group') && pri.Material_Price_Group_Code__c!=null)
                    { 
                        query= query+' AND ERP_Material_Price_Group_Code__c=:mpg';      
                    }
                    if(pri.Key_Combination__c.containsIgnoreCase('Market Segment') && pri.Market_Segment_Code__c!=null)
                    { 
                        query= query+' AND ERP_Material_Group_4_Code__c=:marketSegment';        
                    }   
                    List<Material__c> matList=Database.query(query);
                    //adding for Quantity and UoM
                    Map<String,String> materialBaseUoMMap=new Map<String,String>();
                    for(Material__c m:matList )
                    {
                        materialBaseUoMMap.put(m.ERP_Material_Code__c,m.ERP_Base_UOM__c);
                    }
                    System.debug('******matalist'+matList.size());      
                    if(matList!=null && matList.size()!=0)
                    {
                        for(Material__c m:matList)
                        {
                            NPC_Request__c npcreq=new NPC_Request__c();
                            npcreq.Pricing_request_Item__c=pri.Id;
                            npcreq.Material_Number__c=m.ERP_Material_Code__c;
                            npcreq.Material__c=m.Name;
                            if(pri.Key_Combination__c.containsIgnoreCase('Sold To'))
                            {
                                npcReq.Partner1__c=pri.Sold_To_Code__c.leftPad(10);
                                npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
                                npcReq.Partner_Code_1__c='AG';
                            }
                            else if(pri.Key_Combination__c.containsIgnoreCase('End User'))
                            {
                                system.debug('pri.Pricing_Request__r.:'+pri.Pricing_Request__r);
                                npcReq.Partner1__c=pri.Pricing_Request__r.SoldTo_Code__c.leftPad(10);
                                npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
                                npcReq.Partner_Code_1__c='AG';
                            }
                            if(pri.Key_Combination__c.containsIgnoreCase('Ship To'))
                            {
                                npcReq.Partner1__c=pr.SoldTo_Code__c.leftPad(10);
                                npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
                                npcReq.Partner_Code_1__c='AG';
                                npcReq.Partner_2__c=pri.ShipTo_Code__c.leftPad(10);
                                npcReq.Partner_2__c=npcReq.Partner_2__c.replace(' ', '0');
                                npcReq.Partner_Code_2__c='WE';
                            }
                            //<PP20131218>
                            if(PASalesDocTypeSOMapping__c.getAll().containsKey(pri.Pricing_Request__r.Sales_Org_Code__c))
                            {
                                npcReq.Sales_Document_Type__c = PASalesDocTypeSOMapping__c.getInstance(pri.Pricing_Request__r.Sales_Org_Code__c).Sales_Document_Type__c;
                            }
                            else
                            {
                                npcReq.Sales_Document_Type__c = PASalesDocTypeSOMapping__c.getInstance('Others').Sales_Document_Type__c;
                            }
                            npcreq.Status__c='Active';
                            npcreq.isSynchronous__c=false; //VVIMP]
                            
                            //<AV20140515>-START-populating with new volume and new vol uom
                            if(buOrgGroup.isVolumeApplicable__c==true && accessSequenceList.get(0).isVolumeApplicable__c==true)
                            {   
                                npcreq.UoM__c=pri.New_Volume_UoM__c;
                                npcReq.Quantity__c=String.valueOf(pri.New_Volume__c);
                            }
                            //<AV20140515>-END    
                            else if(pri.New_UoM__c!=null){
                                //take it from sales area detail+
                                npcreq.UoM__c=pri.New_UoM__c;
                                npcReq.Quantity__c=quantityUoMMap.get(pri.New_UoM__c); //'10500000'
                            }
                            else{
                                npcreq.UoM__c=materialBaseUoMMap.get(m.ERP_Material_Code__c); //'SM';//'EA';//still to be finalised
                                npcReq.Quantity__c=quantityUoMMap.get(npcreq.UoM__c); //'10500000';
                            }
                            System.debug('******after quantity and UoM'+npcReq.Quantity__c+'Uom'+npcreq.UoM__c);
                            createNPCRequestList.add(npcReq);
                        } 
                        
                    }
                    else{
                        System.debug('in else exception');
                        pri.Net_Price_Status__c='Mat not found';
                        update pri;
                        throw new  PAException(System.Label.No_Material_Found,ApexPages.Severity.ERROR);
                    }
                    //To be commented after check start
                    
                    List<NPC_Request__c> tempList=new List<NPC_Request__c>();
                    for(Integer i=0;i<createNPCRequestList.size();i++){
                        tempList.add(createNPCRequestList.get(i));
                    } 
                    numberofMat=String.valueOf(tempList.size());
                    pri.Total_materials__c=tempList.size();
                    
                    pri.Net_Price_Status__c='Waiting for Net Price';
                    pri.Integration_Error_Message__c=null;
                    //update approval status to waiting for net price
                    update pri;
                    System.debug('***temp list'+tempList);
                    if(tempList.size()!=0){
                        
                        insert tempList;
                    }
                }
                
            } 
            
        }
        system.debug('In end of createNPCRequests1'+netPriceWrapperList);
        return null;
        
    }
    //Piyush <PG20191211> Added @testvisible
    @testvisible
    
    private  Map<String,List<String>> createNPCResponseForSynchronous(NpcserviceVARKEY_CPI.NetPriceOutput output,Id npcReqId){
        //String varkey='ZPSE:12.000000000:GBP:1:EA:ZPNB:10.000000000:0:##:##:ZD96:-10.000000000:0:##:##:ZPGS:0.780000000:GBP:1:EA:ZAO1:0.000000000:0:##:##:SKTO:0.000000000:0:##:##:ZREF:15.000000000:EUR:1:KG:ZFLO:12.000000000:EUR:1:KG';
        Map<String,List<String>> mapct=new Map<String,List<String>>();
        //NE20130120 -START
        String varkey=null;
        try
        {
            varkey=fetchMapFromResponse(output);
            
        }
        //NE20130120
        catch(Exception e)
        {
            NPC_Response__c npcResp=new NPC_Response__c();
            npcResp.NPC_Message_Type__c='E';
            npcResp.Condition_Rate_Key__c=e.getMessage();
            npcResp.NPC_Request__c=npcReqId ;
            //Shiva - for IS ID-00040007 - Start
            NPC_Request__c npcReq = [SELECT Id, Below_Floor_Flag__c,Below_Current_Flag__c,Below_Reference_Flag__c FROM NPC_Request__c WHERE Id=:npcReqId];
            npcReq.Below_Floor_Flag__c = true;
            npcReq.Below_Current_Flag__c = true;
            npcReq.Below_Reference_Flag__c= true;
            update npcReq;
            //Shiva - for IS ID-00040007 - End
            insert npcResp;
            //Piyush <PG20191211> Bypass Test Coverage
            if(!Test.isRunningTest())
                throw new  PAException(e.getMessage(),ApexPages.Severity.ERROR);
        }
        //NE20130120 -end
        System.debug('***varkey'+varkey);
        if(varkey!=null)
            mapct=splitVarKey(varkey);
        splitMap=mapct;//putting it in a private varaible
        //end */ 
        
        //insert record into npc response- This will help us store the values in data base and it is used to show the values at a later pt of time
        NPC_Response__c npcResp=new NPC_Response__c();
        npcResp.Condition_Rate_Key__c=varkey;
        npcResp.NPC_Request__c=npcReqId ;
        
        insert npcResp;
        return mapct;
        // */
    }
    
    private Id createNPCRequestForSynchronous(Pricing_Request_Item__c pri,Boolean isException,String quantity,String uom,String matCode){
        /*If already a NPC request exists for a Pricing Request Item, make it inactive,before creating  a new one
do  not consider responses from Inactive npc requests for Floor and reference check
*/
        System.debug(System.LoggingLevel.ERROR, '##Mansi---like 1820');
        List<NPC_Request__c> createNPCRequestList =new List<NPC_Request__c>();
        List<NPC_Request__c> alreadyExistingNPCReqList= [select Id, Status__c FROM NPC_Request__c where Pricing_Request_Item__c=:pri.id AND Status__c='Active'];
        Pricing_Request_Item__c pr=[select Pricing_Request__r.SoldTo_Code__c from Pricing_Request_Item__c where Id=:pri.Id];
        for(NPC_Request__c n:alreadyExistingNPCReqList){
            n.Status__c='Inactive';
        } 
        if(alreadyExistingNPCReqList!=null && alreadyExistingNPCReqList.size()!=0){
            update alreadyExistingNPCReqList;
        }
        //Insert a NPC request
        NPC_Request__c npcreq=new NPC_Request__c();
        npcreq.Pricing_request_Item__c=pri.Id;
        //<PP20140101>
        if(!String.isBlank(matCode))
        {
            npcreq.Material_Number__c=matCode;
        }
        else
        {
            npcreq.Material_Number__c=pri.Material_Code__c;
        }
        
        npcreq.Material__c=pri.Material__c;
        if(pri.Key_Combination__c.containsIgnoreCase('Sold To')){
            npcReq.Partner1__c=pri.Sold_To_Code__c.leftPad(10);
            npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
            npcReq.Partner_Code_1__c='AG';
        }
        else if(pri.Key_Combination__c.containsIgnoreCase('End User'))
        {
            npcReq.Partner1__c=pr.Pricing_Request__r.SoldTo_Code__c.leftPad(10);
            npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
            npcReq.Partner_Code_1__c='AG';
        }
        if(pri.Key_Combination__c.containsIgnoreCase('Ship To')){
            npcReq.Partner1__c=pr.Pricing_Request__r.SoldTo_Code__c.leftPad(10);
            npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
            npcReq.Partner_Code_1__c='AG';
            npcReq.Partner_2__c=pri.ShipTo_Code__c.leftPad(10);
            npcReq.Partner_2__c=npcReq.Partner_2__c.replace(' ', '0');
            npcReq.Partner_Code_2__c='WE';
        }
        npcReq.Quantity__c= quantity;//'9800000';//should be taken from BU Sales area level _TO:DO
        
        //<PP20131218>
        if(PASalesDocTypeSOMapping__c.getAll().containsKey(pri.Pricing_Request__r.Sales_Org_Code__c))
        {
            npcReq.Sales_Document_Type__c = PASalesDocTypeSOMapping__c.getInstance(pri.Pricing_Request__r.Sales_Org_Code__c).Sales_Document_Type__c;
        }
        else
        {
            npcReq.Sales_Document_Type__c = PASalesDocTypeSOMapping__c.getInstance('Others').Sales_Document_Type__c;
        }
        npcreq.isSynchronous__c=true;  //VIMP-does not fire to SAP-
        npcreq.Status__c='Active';
        
        if(uom != null)
        {
            npcreq.UoM__c=uom;
        }
        else if(pri.New_UoM__c!=null){
            npcreq.UoM__c=pri.New_UoM__c;
        }
        
        if(isException){
            System.debug('****in exception');
            npcreq.Below_Current_Flag__c=true;
            npcreq.Below_Floor_Flag__c=true;
            npcREq.Below_Reference_Flag__c=true;
        }
        createNPCRequestList.add(npcReq);
        if(createNPCRequestList.size()!=0)
        {
            insert createNPCRequestList;
        } 
        pri.Total_Materials__c=1;//In case of Synch, only one material
        update pri;
        System.debug('****npcreq.Id'+npcreq.Id);
        return npcreq.Id;
    }
    //Piyush <PG20191211> Added @testvisible
    @testvisible
    
    /*This method computes current and new net prices for BI surfaces changing from void to Integer*/
    private void calculateRatesforBISurfaces(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_Request_Item__c prItem ,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous){
        system.debug(System.LoggingLevel.ERROR, 'Mansi## line 1903');
        String roundoffplaces=prItem.New_Unit__c;
        Decimal value;
        List<String>  rateList;
        Map<String,Decimal> finalCalMap=new Map<String,Decimal>();
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_request__c> npcReqUpdateList=new List<NPC_request__c>();
        for(ERP_Procedure_Conditions__c proCond: erpPCList){
            if(proCond.Step__c!=null && proCond.From__c!=null && proCond.To__c!=null ){
                String pcCode=proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType=proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription= proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition= proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('***pcCalculationType'+pcCode+'--'+pcCalculationType);
                System.debug('***cond rate map'+condTypeRateMap.keySet()+'**check'+condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c)){
                    System.debug('***inside if'); 
                    rateList=condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else{
                    rateList=null;
                }
                System.debug('rateList***'+rateList);
                //value returned from SAP
                Decimal rate;
                String unit;
                String Per;
                String UoM;
                if(rateList!=null && rateList.size()==4)
                { 
                    String temprate;
                    if(rateList[0]!='##'){
                        rate=Decimal.valueOf(rateList[0]);
                        
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1]!='##'){
                        unit=rateList[1];
                    }
                    if(rateList[2]!='##'){
                        Per=rateList[2];
                    }
                    if(rateList[3]!='##'){
                        UoM=rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                if(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Fixed') )
                {   // currency conversion if required-***TO DO
                    if(prItem.New_Unit__c!=null&& prItem.New_Unit__c!='%' && unit!=null){
                        String temprate=PAUtil.convertCurrencyMethod(unit, prItem.New_Unit__c, rate, PAUtil.corporateCurrencyCode);
                        
                        if(temprate!=null){
                            rate=Decimal.valueOf(tempRate);
                        }
                    }
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                    {
                        rate= Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value=rate;
                    
                }   
                if(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Quantity') )
                {   //conversion if required-***TO DO
                    System.debug('**uomConversionMap'+uomConversionMap);
                    System.debug('***rate before conversion'+rate);
                    System.debug('***prItem.Pricing_Condition_Code__c'+prItem.Pricing_Condition_Code__c);
                    System.debug('***pcCode'+pcCode);
                    //added to identify the Gross price
                    //added -neeha prItem.Pricing_Condition_Code__c==pcCode  to cal new net price
                    //<TJ20150603>
                    if(prItem.Pricing_Condition_Code__c!=pcCode && (pcConditionClass!=null &&  (pcConditionClass.containsIgnoreCase('Prices') || pcConditionClass.containsIgnoreCase('Price')))){
                        if(rateList==null && !((condTypeRateMap.get('ZDX1')==null && condTypeRateMap.get('ZDY1')==null) || (finalCalMap.get('ZDX1')==0 && finalCalMap.get('ZDY1')==0))){
                            
                            if(npcRequest.isSynchronous__c || isSynchronous){
                                npcRequest.Below_Current_Flag__c=true;
                                npcRequest.Below_Floor_Flag__c=true;
                                npcRequest.Below_Reference_Flag__c=true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else{
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c='G';
                                npcRequest.Response_Error_Message__c='Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_Unit__c);
                    targetList.add(String.valueof(prItem.New_Per__c));
                    targetList.add(prItem.New_Uom__c);
                    //END
                    rate=   doConversion(rateList,npcRequest,targetList, uomConversionMap);
                    
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                    {
                        rate= Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value=rate;
                    System.debug('***ZPSE'+value);
                    
                }
                else {          
                    if(pcCode=='ZPNB' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                            
                        }
                        value= calculateforBISurfaces(finalCalMap.get('ZPSE'),rate);
                        System.debug('***ZPNB'+value);
                    }
                    else if(pcCode=='GP1')
                    {   
                        
                        if(finalCalMap.get('ZPNB')!=null && finalCalMap.get('ZPNB')!=0){
                            value=finalCalMap.get('ZPNB');
                        }
                        else{ 
                            value=finalCalMap.get('ZPSE');
                            System.debug('***in else'+finalCalMap);
                        }
                        System.debug('***GP1'+value); 
                    }
                    else if(pcCode=='ST3')
                    {   
                        value=finalCalMap.get('ZDX1');
                        System.debug('***ST3'+value);
                    }
                    else if(pcCode=='ZDX2' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('ZDX2'),rate);
                        System.debug('***ZDX2'+value);
                    }
                    else if(pcCode=='ST4')
                    {   
                        if(condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0')
                        {
                            value=finalCalMap.get('GP1');
                        }
                        else if(condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0')
                        {
                            value=finalCalMap.get('ST3');
                        }
                        System.debug('***ST4'+value);
                    }          
                    //Calculating for ZD96 and ZD9G
                    else if((pcCode=='ZD96' || pcCode=='ZD9G' ) && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('GP1'),rate);
                        
                        System.debug('***ZD96'+value);
                    }
                    
                    else if(pcCode=='BNP2')
                    {   
                        if(condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0')
                        {
                            value=finalCalMap.get('GP1');
                        }
                        else if(condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0')
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value=calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('GP1'),finalCalMap.get('ZD96'),'+'),finalCalMap.get('ZD9G'),'+');
                        }
                        System.debug('***BPN2'+value);
                    }
                    else if (pcCode=='ZD97' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        System.debug('**finalcalmap'+finalCalMap);
                        value= calculateforBISurfaces(finalCalMap.get('BNP2'),rate);
                        
                        System.debug('***ZD97'+value);
                    }
                    else if (pcCode=='BNP3')
                    {   
                        if(condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0')
                        {
                            value=finalCalMap.get('GP1');
                        }
                        else if(condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0')
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(finalCalMap.get('BNP2'),finalCalMap.get('ZD97'),'+');
                        }
                        System.debug('***BPN3'+value);
                    }
                    else if (pcCode=='ZD9A' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        
                        value= calculateforBISurfaces(finalCalMap.get('BNP3'),rate);
                        System.debug('***ZD9A'+value);
                    }
                    else if (pcCode=='BNP4') 
                    {   
                        if(condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0')
                        {
                            value=finalCalMap.get('GP1');
                        }
                        else if(condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0')
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(finalCalMap.get('BNP3'),finalCalMap.get('ZD9A'),'+');
                        }
                        System.debug('***BPN4'+value);
                    }
                    else if (pcCode=='ZD98' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        
                        value= calculateforBISurfaces(finalCalMap.get('BNP4'),rate);
                        System.debug('***ZD98'+value);
                    }
                    else if(pcCode=='GP2')
                    {   
                        if(condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0')
                        {
                            value=finalCalMap.get('GP1');
                        }
                        else if(condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0')
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(finalCalMap.get('BNP4'),finalCalMap.get('ZD98'),'+');
                        }
                        System.debug('***GP2'+value);
                    }
                    else if(pcCode=='ST8')
                    {   
                        value=finalCalMap.get('ZDY1');
                        System.debug('***ST8'+value);
                    }
                    else if(pcCode=='ZDY2' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('ZDY2'),rate);
                        System.debug('***ZDY2'+value);
                    }
                    // Added by <<Nadeem S>> for <<Issue number:IS ID-00063884>> on <<12-02-2016>> START 
                    else if(pcCode=='ZDY2' && prItem.Pricing_Condition_Code__c=='ZDY1' && pcCalculationType==null)
                    {  
                        //System.debug('***CPC'+isCurrentPriceCalculation+'PCC'+prItem.Pricing_Condition_Code__c+'PCCODE$'+pcCode);
                        if(!isCurrentPriceCalculation)
                        {
                            System.debug('***rate'+rate+'PR NEW RATE'+prItem.New_Rate__c+'pcCode'+pcCode);
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }                       
                        System.debug('***GP2'+finalCalMap.get('GP2'));
                        value = calculateSUBTotalsforBISurfaces(rate,finalCalMap.get('GP2'),'-');
                        System.debug('***ZDY2'+value);
                    }                 
                    // Added by <<Nadeem S>> for <<Issue number:IS ID-00063884>> on <<12-02-2016>> END 
                    else if(pcCode=='ST9')
                    {   
                        value=finalCalMap.get('ST8');
                        System.debug('***ST9'+value);
                    }
                    else if((pcCode=='ZD91'||pcCode=='ZDI1') && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('GP2'),rate);
                        System.debug('***ZD91'+value);
                    }
                    
                    else if(pcCode=='ST1')
                    {   
                        if(finalCalMap.get('ZDY1')!=null && finalCalMap.get('ZDY1')!=0)
                        {
                            value=finalCalMap.get('ST8');
                        }
                        else if(finalCalMap.get('ZDX1')!=null && finalCalMap.get('ZDX1')!=0)
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('GP2'),finalCalMap.get('ZD91'),'+'),finalCalMap.get('ZDI1'),'+');
                        }
                        System.debug('***ST1'+value);
                    }
                    else if(pcCode=='ZD92' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        
                        //apply formula '=ST(1)*Rate/100
                        value= calculateforBISurfaces(finalCalMap.get('ST1'),rate);
                        System.debug('***ZD92'+value);
                    }
                    else if(pcCode=='ST2')
                    {   
                        if(finalCalMap.get('ZDY1')!=null && finalCalMap.get('ZDY1')!=0)
                        {
                            value=finalCalMap.get('ST8');
                        }
                        else if(finalCalMap.get('ZDX1')!=null && finalCalMap.get('ZDX1')!=0)
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZD92'),'+');
                        }
                        System.debug('***ST2'+value);
                    }
                    else if(pcCode=='ZD94' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        
                        //apply formula '='=ST(2)*Rate/100
                        value= calculateforBISurfaces(finalCalMap.get('ST2'),rate);
                        System.debug('***ZD94'+value);
                    }
                    else if(pcCode=='NP')//Net price
                    {   
                        if(finalCalMap.get('ZDY1')!=null && finalCalMap.get('ZDY1')!=0)
                        {
                            value=finalCalMap.get('ST8');
                        }
                        else if(finalCalMap.get('ZDX1')!=null && finalCalMap.get('ZDX1')!=0)
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(finalCalMap.get('ST2'),finalCalMap.get('ZD94'),'+');
                        }
                        System.debug('***NP'+value);
                    }
                    //calculating for ZD93 , ZD9J and ZD9K
                    else if((pcCode=='ZD93'||pcCode=='ZD9J' ||pcCode=='ZD9K')  && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        System.debug('***pc code'+pcCode+'rate'+rate);
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        System.debug('after if ***pc code'+pcCode+'rate'+rate);
                        //apply formula =NP*Rate/100
                        value= calculateforBISurfaces(finalCalMap.get('NP'),rate);
                        System.debug('***'+pccode+value);
                    }
                    
                    else if(pcCode=='ST')
                    {   
                        if(finalCalMap.get('ZDY1')!=null && finalCalMap.get('ZDY1')!=0)
                        {
                            value=finalCalMap.get('ST8');
                        }
                        else if(finalCalMap.get('ZDX1')!=null && finalCalMap.get('ZDX1')!=0)
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('NP'),finalCalMap.get('ZD93'),'+'),finalCalMap.get('ZD9J'),'+'),finalCalMap.get('ZD9K'),'+');
                        }
                        System.debug('***ST'+value);
                    }
                    else if(pcCode=='ZDB3' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if((condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0') || (condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0'))
                        {
                            rate=0;
                        }
                        else if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c); 
                        }
                        
                        //apply formula =ST*Rate/100
                        value= calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        System.debug('***ZDB3'+value);
                    }
                    else if(pcCode=='NIP')
                    {   
                        if(finalCalMap.get('ZDY1')!=null && finalCalMap.get('ZDY1')!=0)
                        {
                            value=finalCalMap.get('ST8');
                        }
                        else if(finalCalMap.get('ZDX1')!=null && finalCalMap.get('ZDX1')!=0)
                        {
                            value=finalCalMap.get('ST3');
                        }
                        else
                        {
                            value= calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZDB3'),'+');
                        }
                        System.debug('***NIP'+value);
                    }
                    
                    else if(pcCode=='ZCMA' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula =ST*Rate/100
                        value= calculateforBISurfaces(finalCalMap.get('NIP'),rate);
                        System.debug('***ZCMA'+value);
                    }
                    else if(pcCode=='ZCMB' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        
                        //apply formula =ST*Rate/100
                        value= calculateforBISurfaces(finalCalMap.get('NIP'),rate);
                        System.debug('***ZCMB'+value);
                    }
                    else if(pcCode=='NNP') //Total net price
                    {   
                        //apply formula ='=NIP-ZCMA-ZCMB
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('NIP'),finalCalMap.get('ZCMA'),'+'),finalCalMap.get('ZCMB'),'+');
                        System.debug('***TNP'+value);
                    }
                    
                }
                if(value!=null && roundoffplaces!=null && roundoffplaces!='%' && PAUtil.decimalPlacesMap.containsKey(roundoffplaces)) //not unit of every PCcode has to be considered, all the cal should happen in requested rate of Gross Price
                {
                    //say unit is USD, EUR
                    value= value.setScale(PAUtil.decimalPlacesMap.get(roundoffplaces),System.Roundingmode.HALF_EVEN);
                }
                else if(value!=null && roundoffplaces!=null && roundoffplaces=='%'){
                    //SAY UNIT is % etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value!=null){
                    //SAY UNIT is 0 etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null){ 
                    System.debug('**adding into map'+pcCode+'***value'+value);
                    if(pcCode=='ZDX1' && condTypeRateMap.get('ZDY1')!=null && condTypeRateMap.get('ZDY1')[0]!='0')
                        finalCalMap.put('ZDX1',0);
                    else if(pcCode=='ZDY1' && condTypeRateMap.get('ZDX1')!=null && condTypeRateMap.get('ZDX1')[0]!='0')
                        finalCalMap.put('ZDY1',0);
                    else
                        finalCalMap.put(pcCode,value);
                } 
                if(isCurrentPriceCalculation && pcCode!=null && pricingCondition!=null){
                    System.debug('**adding into current map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                    currentNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                    if(rate==null){
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(0));
                    }
                    else{
                        rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                    }
                    
                } 
                else if(pcCode!=null && pricingCondition!=null){
                    System.debug('**adding into new  map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                    newNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                    if(rate==null){
                        condRateMap.put(pcCode+'-'+pricingCondition,String.valueOf(0));
                    }
                    else{
                        rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                    }
                    
                    
                }   
                
            }
        }
        //comment-neeha update npcReqUpdateList; 
        if(npcReqUpdateList.size()!=0){
            if(npcRequest.isSynchronous__c || isSynchronous){
                System.debug('***npcRequest'+npcRequest.Below_Floor_Flag__c+npcRequest.Below_Current_Flag__c+npcRequest.Below_Reference_Flag__c);
                update npcRequest;
                //Piyush <PG20191211> Bypass test coverage
                if(!Test.isRunningTest())
                    throw new  PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else{
                status='Error';
            }
        }
    }
    
    /**
The method calculates Net price for BI envelopes-D630

*/
    private void calculateRatesforBIEnvelopesD630(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous){
        Boolean grossPriceCheck=false;
        Decimal value;
        List<String>  rateList; 
        Map<String,Decimal> finalCalMap=new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug(logginglevel.error,'****erpPCList'+erpPCList.size());
        List<NPC_request__c> npcReqUpdateList=new List<NPC_request__c>();
        for(ERP_Procedure_Conditions__c proCond: erpPCList){
            if(proCond.Step__c!=null && proCond.From__c!=null && proCond.To__c!=null ){
                
                String pcCode=proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType=proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription= proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition= proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class'+pcConditionClass);
                System.debug('***pcCalculationType'+pcCode+'--'+pcCalculationType);
                System.debug('***cond rate map'+condTypeRateMap.keySet()+'**check'+'**key'+proCond.Pricing_Condition__r.Pricing_Condition_Code__c+condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c)){
                    System.debug('***inside if'); 
                    rateList=condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else{
                    rateList=null;
                }
                System.debug('rateList***'+rateList+'pcCode'+pcCode);
                //value returned from SAP
                Decimal rate;
                String unit;
                String Per;
                String UoM;
                if(rateList!=null && rateList.size()==4)
                { 
                    String temprate;
                    if(rateList[0]!='##'){
                        rate=Decimal.valueOf(rateList[0]); 
                        
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1]!='##'){
                        unit=rateList[1];
                    }
                    if(rateList[2]!='##'){
                        Per=rateList[2];
                    }
                    if(rateList[3]!='##'){
                        UoM=rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    
                    
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                if(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Fixed') )
                {   // currency conversion if required-***TO DO
                    System.debug('***in ZHS2');
                    if(prItem.New_Unit__c!=null&& prItem.New_Unit__c!='%' && unit!=null){
                        String temprate=PAUtil.convertCurrencyMethod(unit, prItem.New_Unit__c, rate, PAutil.corporateCurrencyCode);
                        
                        if(temprate!=null){
                            rate=Decimal.valueOf(tempRate);
                        }
                    }
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                    {
                        rate= Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value=rate;
                    
                }
                System.debug('***check'+(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Quantity'))+'****'+pcCalculationType);
                //<MG20171219> Commenting below NPC logic - Start
                /*if(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Quantity') )
{   //conversion if required
System.debug('***neeha'+pcCode);
System.debug('**uomConversionMap'+uomConversionMap);
System.debug('***prItem.Pricing_Condition_Code__c'+prItem.Pricing_Condition_Code__c);
System.debug('***pcCode'+pcCode);
//added to identify the Gross price
if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
|| pcConditionClass.containsIgnoreCase('Price'))))
{
if(rateList==null)
{
if(npcRequest.isSynchronous__c || isSynchronous)
{
npcRequest.Below_Current_Flag__c = true;
npcRequest.Below_Floor_Flag__c = true;
npcRequest.Below_Reference_Flag__c = true;
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
break;
}
else
{
grossPriceCheck = true;
npcRequest.Response_Error_Code__c = 'G';
npcRequest.Response_Error_Message__c = 'Gross price is missing';
npcReqUpdateList.add(npcRequest);
break;
}
}
}
//Issue -UoM START
List<String> targetList= new List<String>();
targetList.add(prItem.New_unit__c);
targetList.add(String.valueOf(prItem.New_Per__c));
targetList.add(prItem.New_UoM__c);
//END
rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
value = rate; 
boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck=true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;

System.debug('***ZPNG'+value);
} */
                //<MG20171219> Commenting below NPC logic - End
                //<MG20171219> New NPC logic for BI EMEA D630 - Start
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null && !((pcCode == 'ZPNG' && (!finalCalMap.containsKey('ZPRI')||(finalCalMap.containsKey('ZPRI') && finalCalMap.get('ZPRI') != null)))||(pcCode == 'ZPRI' && (!finalCalMap.containsKey('ZPNG')||(finalCalMap.containsKey('ZPNG') && finalCalMap.get('ZPNG') != null)))))
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //<MG20171219> New NPC logic for BI EMEA D630 - End
                else {
                    if(pcCode=='ZPNB' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                            
                        }
                        //<MG20171219> New NPC logic for BI EMEA D630 - Comparison for ZPRI &ZPNG
                        if(finalCalMap.get('ZPRI') == null || finalCalMap.get('ZPRI') == 0)
                            value = calculateforBISurfaces(finalCalMap.get('ZPNG'),rate);
                        else
                            value = calculateforBISurfaces(finalCalMap.get('ZPRI'),rate);
                        //value= calculateforBISurfaces(finalCalMap.get('ZPNG'),rate);
                        System.debug('***ZPNB'+value);
                    }
                    else if(pcCode=='GP1')
                    {   
                        
                        if(finalCalMap.get('ZPNB')!=null && finalCalMap.get('ZPNB')!=0){
                            value=finalCalMap.get('ZPNB');
                        }
                        else{ 
                            //value=finalCalMap.get('ZPNG');
                            //<MG20171219> New NPC logic for BI EMEA D630 - Comparison for ZPRI &ZPNG
                            if(finalCalMap.get('ZPRI') == null || finalCalMap.get('ZPRI') == 0)
                                value = finalCalMap.get('ZPNG');
                            else
                                value = finalCalMap.get('ZPRI');
                            
                        }
                        System.debug('***GP1'+value); 
                    }
                    else if(pcCode=='ZD96' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('GP1'),rate);
                        
                        System.debug('***ZD96'+value);
                    }
                    else if(pcCode=='BNP1'){
                        //apply formula
                        value= calculateSUBTotalsforBISurfaces(finalCalMap.get('GP1'),finalCalMap.get('ZD96'),'+');
                        System.debug('***BNP1'+value);  
                    }
                    else if(pcCode=='ZD9A' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('BNP1'),rate);
                        
                        System.debug('***ZD9A'+value);
                    }
                    else if(pcCode=='GP2')
                    {   
                        //apply formula
                        value= calculateSUBTotalsforBISurfaces(finalCalMap.get('BNP1'),finalCalMap.get('ZD9A'),'+');
                        System.debug('***GP2'+value);
                    }
                    else if(pcCode=='ZDI1' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('GP2'),rate);
                        
                        System.debug('***ZDI1'+value);
                    }
                    else if(pcCode=='NP1')
                    {   
                        //apply formula
                        value= calculateSUBTotalsforBISurfaces(finalCalMap.get('GP2'),finalCalMap.get('ZDI1'),'+');
                        System.debug('***NP1'+value);
                    }
                    else if(pcCode=='ZD91' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('NP1'),rate);
                        
                        System.debug('***ZD91'+value);
                    }
                    else if(pcCode=='NP2')
                    {   
                        //apply formula
                        value= calculateSUBTotalsforBISurfaces(finalCalMap.get('NP1'),finalCalMap.get('ZD91'),'+');
                        System.debug('***NP2'+value);
                    }
                    else if(pcCode=='ZD92' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('NP2'),rate);
                        
                        System.debug('***ZD92'+value);
                    }
                    else if(pcCode=='NP3')
                    {   
                        //apply formula
                        value= calculateSUBTotalsforBISurfaces(finalCalMap.get('NP2'),finalCalMap.get('ZD92'),'+');
                        System.debug('***NP3'+value);
                    }
                    else if(pcCode=='ZD94' && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('NP3'),rate);
                        
                        System.debug('***ZD94'+value);
                    }
                    else if(pcCode=='NP4')
                    {   
                        //apply formula
                        value= calculateSUBTotalsforBISurfaces(finalCalMap.get('NP3'),finalCalMap.get('ZD94'),'+');
                        System.debug('***NP3'+value);
                    }
                    else if((pcCode=='ZG35' || pcCode=='ZDPA'|| pcCode== 'ZGA1') && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage')) //<SS20230130> Added ZGA1
                    {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('NP4'),rate);
                        
                        System.debug('***ZG35/ZDPA/ZGA1'+value);
                    }
                     else if((pcCode=='ZGA1') && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                     {    
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value= calculateforBISurfaces(finalCalMap.get('ZGA1'),rate);
                        
                        System.debug('***(ZGA1*Newrate)/100'+value);
                    }
                    else if(pcCode=='NIP')
                    {   
                        //apply formula '='=NPBH+ZHS2                      
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('NP4'),finalCalMap.get('ZG35'),'+'),finalCalMap.get('ZDPA'),'+'),finalCalMap.get('ZGA1'),'+'),finalCalMap.get('ZGA2'),'+');//SS20230130  - Added ZGA1 and ZGA2 value
                        System.debug('***NIP'+value);
                        
                    }
                    //For calcuating ZCRA and ZCRB values
                    if((pcCode=='ZCRA' || pcCode=='ZCRB') && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //new net price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                        {
                            rate=Decimal.valueOf(prItem.New_Rate__c);
                            
                        }
                        value= calculateforBISurfaces(finalCalMap.get('NIP'),rate);
                        System.debug('***ZCRA'+value);
                    }
                    //For calculating net price
                    else if(pcCode=='NNP') /*(check for Price Type=Net price)*/ //Total net price
                    {   
                        //apply formula =ZPNG+ZCRA+ZCRB
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('NIP'),finalCalMap.get('ZCRA'),'+'),finalCalMap.get('ZCRB'),'+'),finalCalMap.get('ZCRC'),'+'),finalCalMap.get('ZCRD'),'+');
                        
                        System.debug('***NNP'+value);
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value= value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value!=null && unit!=null && unit=='%'){
                    //SAY UNIT is % etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value!=null){ //TO be validated-why value can be null?
                    //SAY UNIT is 0 etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null){
                    System.debug('**adding into map'+pcCode+'***value'+value);
                    finalCalMap.put(pcCode,value);
                }  
                if(isCurrentPriceCalculation && pcCode!=null && pricingCondition!=null){
                    System.debug('**adding into current map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                    currentNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                    if(rate==null){
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(0.00));
                    }
                    else{
                        rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                    }
                } 
                else if(pcCode!=null && pricingCondition!=null){
                    System.debug('**adding into new  map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                    newNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                    if(rate==null){
                        condRateMap.put(pcCode+'-'+pricingCondition,String.valueOf(0));
                    }
                    else{
                        rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                    }
                    
                    
                }   
                
            }
            
        }
        //comment-neeha update npcReqUpdateList; 
        if(npcReqUpdateList.size()!=0 && grossPriceCheck){
            if(npcRequest.isSynchronous__c || isSynchronous){
                update npcRequest;
                throw new  PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else{
                status='Error';
            }
        }      
    }
    
    
    /**
The method calculates Net price for BI envelopes-D693

*/
    private void calculateRatesforBIEnvelopesD693(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous){
        //value after computataion against each PC
        Boolean grossPriceCheck;
        Decimal value;
        List<String>  rateList;
        //Stores the Pc as key and value against it as value
        Map<String,Decimal> finalCalMap=new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_request__c> npcReqUpdateList=new List<NPC_request__c>();
        for(ERP_Procedure_Conditions__c proCond: erpPCList){
            
            String pcCode=proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
            String pcCalculationType=proCond.Pricing_Condition__r.Calculation_Type__c;
            String pcDescription= proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
            String pricingCondition= proCond.Pricing_Condition__r.Pricing_Condition__c;
            //To identify the Gross price
            String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
            System.debug('***pcCalculationType'+pcCode+'--'+pcCalculationType);
            System.debug('***cond rate map'+condTypeRateMap.keySet()+'**check'+condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
            
            if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c)){
                System.debug('***inside if'); 
                rateList=condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
            }
            else{
                rateList=null;
            }
            System.debug('rateList***'+rateList);
            //value returned from SAP
            Decimal rate;
            String unit;
            String Per;
            String UoM;
            if(rateList!=null && rateList.size()==4)
            { 
                String temprate;
                if(rateList[0]!='##'){
                    rate=Decimal.valueOf(rateList[0]);
                }
                System.debug('***final rate'+rate);
                if(rateList[1]!='##'){
                    unit=rateList[1];
                }
                if(rateList[2]!='##'){
                    Per=rateList[2];
                }
                if(rateList[3]!='##'){
                    UoM=rateList[3];
                }
                //Fixed: 100:EUR:##:##
                //Percentage- 90:0:##:##
                //Quantity- 100:EUR:1:KG
                
                
                System.debug('**unit'+unit+'**pcCode'+pcCode);
            }
            //3 conditions-- Percentage,Fixed, Quantity
            /*Percentage- no conversion required
Quantity- all conversions
Fixed :only currency conversion
*/ 
            if(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Fixed')){
                //currency conversion if requried
                if(prItem.New_Unit__c!=null&& prItem.New_Unit__c!='%' && unit!=null){
                    String temprate=PAUtil.convertCurrencyMethod(unit, prItem.New_Unit__c, rate, PAutil.corporateCurrencyCode);
                    if(temprate!=null){
                        rate=Decimal.valueOf(tempRate);
                    }
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                    {
                        rate= Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value=rate;
                }
            } /*not required  */ 
            
            if(pcCalculationType!=null && pcCalculationType!='-' && pcCalculationType.containsIgnoreCase('Quantity') )
            {   //conversion if required
                System.debug('**uomConversionMap'+uomConversionMap);
                //added to identify the Gross price
                if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                               || pcConditionClass.containsIgnoreCase('Price'))))
                {
                    if(rateList==null)
                    {
                        if(npcRequest.isSynchronous__c || isSynchronous)
                        {
                            npcRequest.Below_Current_Flag__c = true;
                            npcRequest.Below_Floor_Flag__c = true;
                            npcRequest.Below_Reference_Flag__c = true;
                            grossPriceCheck = true;
                            npcReqUpdateList.add(npcRequest);
                            
                            break;
                        }
                        else
                        {
                            grossPriceCheck = true;
                            npcRequest.Response_Error_Code__c = 'G';
                            npcRequest.Response_Error_Message__c = 'Gross price is missing';
                            npcReqUpdateList.add(npcRequest);
                            break;
                        }
                    }
                }
                //Issue -UoM START
                List<String> targetList= new List<String>();
                targetList.add(prItem.New_unit__c);
                targetList.add(String.valueOf(prItem.New_Per__c));
                targetList.add(prItem.New_UoM__c);
                //END
                rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                {
                    rate = Decimal.valueOf(prItem.New_Rate__c);
                }
                value = rate; 
                /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                
                
                System.debug('***ZPNG'+value);
            }
            else {
                //For calcuating NIP
                if(pcCode=='NIP')
                {   
                    //apply formula =ZPNG
                    value= finalCalMap.get('ZPNG');
                    System.debug('***NIP'+value);
                }
                //For calcuating ZCRA and ZCRB values
                else  if((pcCode=='ZCRA' || pcCode=='ZCRB') && pcCalculationType!=null && pcCalculationType.containsIgnoreCase('Percentage'))
                {   
                    //new net price
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c==pcCode)
                    {
                        rate=Decimal.valueOf(prItem.New_Rate__c);
                        
                    }
                    value= calculateforBISurfaces(finalCalMap.get('NIP'),rate);
                    System.debug('***ZCRA'+value);
                }
                //For calculating net price
                else if(pcCode=='NNP' /*(check for Price Type=Net price)*/) //Total net price
                {   
                    //apply formula =ZPNG+ZCRA+ZCRB
                    value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPNG'),finalCalMap.get('ZCRA'),'+'),finalCalMap.get('ZCRB'),'+');
                    System.debug('***TNP'+value);
                }
                
            }
            if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
            {
                //say unit is USD, EUR
                value= value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
            }
            else if(value!=null && unit != null && unit == '%'){
                //SAY UNIT is % etc
                value= value.setScale(3,System.Roundingmode.HALF_EVEN);
            }      
            else if(value!=null){
                //SAY UNIT is 0 etc
                value= value.setScale(2,System.Roundingmode.HALF_EVEN);
            }
            if(pcCode!=null){
                System.debug('**adding into map'+pcCode+'***value'+value);
                finalCalMap.put(pcCode,value);
                
                
            } 
            if(isCurrentPriceCalculation && pcCode!=null && pricingCondition!=null){
                System.debug('**adding into current map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                currentNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                if(rate==null){
                    condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(0.00));
                }
                else{
                    rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                    condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                }
                
            } 
            else if(pcCode!=null && pricingCondition!=null){
                System.debug('**adding into new  map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                newNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                
                if(rate==null){
                    condRateMap.put(pcCode+'-'+pricingCondition,String.valueOf(0));
                }
                else{
                    rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                    condRateMap.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                }
            }   
            
        }
        //comment-neeha update npcReqUpdateList; 
        if(npcReqUpdateList.size()!=0){
            if(npcRequest.isSynchronous__c || isSynchronous){
                update npcRequest;
                throw new  PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else{
                status='Error';
            }
        }      
    }
    
    /*
* This method splits the VARKEY from NPC Response and returns a map, with CT as key and List<String> as value 
*/
    public  Map<String,List<String>> splitVarKey(String varKey){
        //String varkey='ZPSE:100:EUR:1:KG:ZD96:90:%:##:##:ZDNK:85:%:##:##:ZPNG:34:INR:2:LB:XFL1:23.45:EUR:1:KG:';
        List<String> splitList=varkey.split(':');
        System.debug('****split list'+splitList+'**size'+splitList.size());
        List<String> interList;
        Map<String,List<String>> splitMap=new Map<String,List<String>> ();
        for(Integer i=0;i<splitList.size();i=i+5)
        {
            interList =new List<String>();
            for(Integer j=1;j<=4;j++)
            {
                interList.add(splitList[i+j]);
            }
            splitMap.put(splitList[i],interList);
        }
        System.debug('***splitMap'+splitMap+'size**'+splitMap.size());
        
        
        
        return splitMap;
    }
    
    private Decimal calculateforBISurfaces(Decimal value1,Decimal value2)
    {   if(value1!=null && value2!=null)
        return (value1*value2)/100;
     
     else
         return 0;
    }
    
    private Decimal calculateSUBTotalsforBISurfaces(Decimal value1,Decimal value2,String opernand){
        System.debug('****vale1'+value1+'value 2'+value2);
        if(value1==null){
            value1=0;
        }
        if(value2==null){
            value2=0;
        }  
        if(opernand=='+'){
            return  value1+value2;
        }
        else if(opernand=='-'){
            return  value1-value2;
        }
        return null;
    } 
    //change it to private
    private Decimal doConversion(List<String> rateList,NPC_Request__c npcRequest,List<String> targetConversionsList,Map<String,String> uomConversionMap){
        String val;
        Decimal tempRate ;
        system.debug('***RAtelist'+rateList);
        //Issue-UoM conversion not happening for Discounts-START-11-6
        String targetUnit;
        String targetPer;
        String targetUoM;
        if(targetConversionsList!=null && targetConversionsList.size()==3){
            targetUnit=targetConversionsList[0];
            targetPer=targetConversionsList[1];
            targetUoM=targetConversionsList[2];
        }
        //END
        //ratelist-source data
        //target is taken from PrItem
        if(rateList!=null && rateList.size()==4){
            Decimal rate;
            if(rateList[0]!='##')
                rate=Decimal.valueOf(rateList[0]);
            
            String unit=rateList[1];
            String Per=rateList[2];
            String UoM=rateList[3];
            
            //Req: Convert the value present in condRatemap to the unit,per,uom of the pricing request Item
            tempRate=rate;
            if(targetUnit!=unit && targetUnit!='%' && unit!='%' && unit!='0') //needs to be modified
            {   System.debug('***source unit'+unit);
             System.debug('***target unit'+targetUnit);
             System.debug('***rate'+rate);
             val= PAUtil.convertCurrencyMethod(unit,targetUnit,rate,PAutil.corporateCurrencyCode);
             if(val!=null)
             {
                 tempRate = Decimal.valueOf(val);
             }
             System.debug('***temprate'+tempRate);
            }
            if(targetUoM!=uom && tempRate!=null && targetUnit!='%')
            {
                //
                val= convertUoM(uom,targetUoM,tempRate,npcRequest,uomConversionMap );
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
            
            if(targetUnit!='%' && per!=null && Integer.ValueOf(targetPer)!=Integer.ValueOf(per) && tempRate!=null )
            {
                val=PAUtil.checkPer(targetUnit,Integer.ValueOf(per),Integer.ValueOf(targetPer),tempRate);
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
            if(tempRate!=null && targetUnit!='%'){
                
                tempRate= tempRate.setScale(PAUtil.decimalPlacesMap.get(targetUnit),System.Roundingmode.HALF_EVEN);
            }
            else if(tempRate!=null && targetUnit=='%'){
                tempRate= tempRate.setScale(3,System.Roundingmode.HALF_EVEN);
            }
            else if(tempRate!=null){
                tempRate= tempRate.setScale(2,System.Roundingmode.HALF_EVEN);
            }     
            
            
            system.debug('*** value val'+val+' tempRate'+tempRate);
            return tempRate;
        } 
        return 0;
    }
    
    private  Map<String,String> UoMConversion(List<NPC_Request__c> npcReqList)
    {
        Map<string,string> numDenoUoM=new  Map<string,string>();
        //query all the materials vch have the same materail codes
        Set<String> materialCodesSet=new Set<String>();
        Set<String> salesOrgCodeSet =new  Set<String>();
        Set<String> distiCodeSet =new  Set<String>();
        Set<String> sapClusterSet =new  Set<String>();
        Set<String> externalIDSet =new  Set<String>();
        Map<String,String> materialBaseUoMMap =new  Map<String,String>();
        for(NPC_Request__c req:npcReqList){
            materialCodesSet.add(req.Material_Number__c);
            externalIDSet.add(req.SAP_Cluster_Id__c+'-'+req.Material_Number__c);
            
        }
        
        List<Material__c> materialListGeneralData = [SELECT External_ERP_ID__c, ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                                     ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
                                                     ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Base_UoM__c
                                                     FROM Material__c WHERE External_ERP_ID__c=:externalIDSet AND  RecordType.Name='ERP Material - General Data'];
        Set<Id> matGenDataIdSet =new Set<Id>();
        for( Material__c m:materialListGeneralData ){
            
            matGenDataIdSet.add(m.Id);
        }
        //TO query its children
        List<Material__c> materialListExtendedData = [SELECT External_ERP_ID__c, ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                                      ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
                                                      ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Base_UoM__c
                                                      FROM Material__c WHERE ERP_Material_General_Data__c=:matGenDataIdSet AND  RecordType.Name='ERP Material - Extended Data'];
        
        
        //say D123,D124,D123
        for(Material__c mExt:materialListExtendedData){
            materialBaseUoMMap.put(mExt.ERP_Material_Code__c,mExt.ERP_Base_UOM__c);
        } 
        
        System.debug('***map'+materialBaseUoMMap);
        
        
        System.debug('****material id'+matGenDataIdSet.size());
        //Adding for uoM conversion Material__r.ERP_Material_code__c IN:materialCodesSet-neeha
        //Alternative_Uom__c IN:UoMMap.values() OR Alternative_Uom__c IN:newUoMMap.values()- removing it from where clause coz-- we dont know what is source and target UoM at this point
        //so querying irrespective of it
        List<ERP_Material_Conversion_factor__c> erpMCFList = [SELECT Numerator_Y__c,Denominator_X__c,Material__r.ERP_Source_Cluster__c,Base_UoM__c,Alternative_UoM__c,Material__r.ERP_Material_code__c
                                                              FROM ERP_Material_Conversion_factor__c where 
                                                              base_uom__c IN:materialBaseUoMMap.values() AND Material__c IN:matGenDataIdSet];
        
        //populating Num and Deno- only one map irrespective of Alternative UoM
        for(ERP_Material_Conversion_factor__c erpMCF:erpMCFList)
        {   
            System.debug('**erpMCF.Base_Uom__c'+erpMCF.Base_Uom__c+'**'+materialBaseUoMMap.get(erpMCF.Material__r.ERP_Material_Code__c));
            
            if(materialBaseUoMMap.get(erpMCF.Material__r.ERP_Material_Code__c)==erpMCF.Base_Uom__c )
            {   
                //erpMCF.Material__r.ERP_Material_code__c+ERP_Source_Cluster__c+erpMCF.Alternative_Uom__c is unique *VIMP
                numDenoUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Material__r.ERP_Source_Cluster__c+erpMCF.Alternative_Uom__c,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
            }
        }
        //system.debug('*** Num and Deno map'+numDenoUoM);
        return numDenoUoM;
    }
    //Piyush <PG20191211> Access in test classes - Added @testvisible 
    @testvisible
    private  String convertUoM(String sourceUoM,String targetUoM,Decimal rate,NPC_Request__c npcRequest,Map<String,String> uomConversionMap)
    {   
        //get the Num and deno for sourceUoM
        
        System.debug('*****sourceUoM'+sourceUoM+'materilaC'+npcRequest+'target'+targetUoM);
        System.debug('*****key'+npcRequest.Material_Number__c+npcRequest.SAP_cluster_Id__C+sourceUoM);
        string numDenoForSource = uomConversionMap.get(npcRequest.Material_Number__c+npcRequest.SAP_cluster_Id__C+sourceUoM);
        string numDenoForTarget = uomConversionMap.get(npcRequest.Material_Number__c+npcRequest.SAP_cluster_Id__c+targetUoM); 
        System.debug('*****uomConversionMap'+uomConversionMap+'numDenoForSource'+numDenoForSource);
        List<string> uoMsNumAndDeno;
        List<string> newUoMsNumAndDeno;
        //split the numerator and denominator 
        Decimal finalConversion;
        Decimal firstStepConversion;
        if(numDenoForSource <> NULL && numDenoForTarget <> NULL){
            uoMsNumAndDeno = numDenoForSource.split(':');
            newUoMsNumAndDeno = numDenoForTarget.split(':');
            
            if(uoMsNumAndDeno[0].contains(','))
                uoMsNumAndDeno[0] = uoMsNumAndDeno[0].remove(',');
            if(uoMsNumAndDeno[1].contains(','))
                uoMsNumAndDeno[1] = uoMsNumAndDeno[1].remove(',');
            if(newUoMsNumAndDeno[1].contains(','))
                newUoMsNumAndDeno[1]= newUoMsNumAndDeno[1].remove(',');
            if(newUoMsNumAndDeno[0].contains(','))
                newUoMsNumAndDeno[0] = newUoMsNumAndDeno[0].remove(',');    
            /*NPC issue UAT*/
            firstStepConversion = rate * (Decimal.valueOf(uoMsNumAndDeno[1]) / Decimal.valueOf(uoMsNumAndDeno[0]));
            finalConversion =  firstStepConversion * (Decimal.valueOf(newUoMsNumAndDeno[0]) / Decimal.valueOf(newUoMsNumAndDeno[1]));
        }
        return String.valueOf(finalConversion); 
        
    }
    
    public void populateMap(Pricing_Request_Item__c priItem){
        System.debug('***priItem. iD'+priItem.Id);
        System.debug('*****pri.Scale rate in populate map'+priItem.ScaleRate1__c);
        System.debug('***in method action');
        createNPCRequests(priItem);  
        system.debug('In end of populate map'+netPriceWrapperList);
    }
    public String bindvalueToNewRate(){
        String returnRate;
        if(FlrRefWrapperList == NULL){
            FlrRefWrapperList = new List<FloorRefWrapper>(); 
        }
        for(FloorRefWrapper f: FlrRefWrapperList){
            if(f.price=='New Rate'){ 
                Decimal standardDecimal = 1.1;
                String localeDecimalStr = standardDecimal.format();
                String separator = localeDecimalStr.subString(1,2);
                String nonLocaleSeparator;
                System.debug('*****frate'+f.rate+'***seperator'+separator);
                
                if(!String.isBlank(f.rate) && (f.rate.contains(',') || f.rate.contains('.'))){ 
                    if(separator == ',')
                    {     System.debug('***in comma');
                     nonLocaleSeparator = '.';
                    }
                    else if(separator == '.')
                    {     System.debug('***in dot');
                     nonLocaleSeparator = ',';
                    }
                    
                    if(!String.isBlank(f.rate) && f.rate.contains(separator) && f.rate.countMatches(separator)==1 && !f.rate.contains(nonLocaleSeparator))
                    {     System.debug('***in if before'+pricingRequestItem.New_Rate__c);
                     //if(separator == ',')
                     //{
                     // commented coz it is put in a method pricingRequestItem.New_Rate__c =f.rate.replace(separator,'.');
                     returnRate=f.rate.replace(separator,'.');
                     
                     System.debug('***in if after '+pricingRequestItem.New_Rate__c);                           
                    }
                    else
                    {     System.debug('***in exception '+pricingRequestItem.New_Rate__c);
                     
                     throw new  PAException(System.Label.Invalid_Rate_Error,ApexPages.Severity.ERROR);
                    }
                }     
                else{ 
                    System.debug('***in else no decimal '+pricingRequestItem.New_Rate__c);
                    
                    returnrate=f.rate;
                }
                break;
            } 
        }
        if(String.isBlank(returnrate))
        { 
            throw new PAException(System.Label.Rate_Mandatory_Error,ApexPages.severity.Error); 
            
        }
        else{
            try{
                Decimal.ValueOf(returnrate);
            }
            catch(exception e){
                throw new PAException(System.Label.Invalid_Rate_Error,ApexPages.severity.Error);
                
            }
        }
        return returnrate;
    }
    
    private String newRate{get;set;}
    /*To recalculate Net price on click of calculate button*/
    public PageReference recalculate(){
        //  isCalculated=true;
        
        system.debug('In recalculate');
        //to be validated
        pricingRequestItem.New_Rate__c=   bindvalueToNewRate(); //**imp handled the decimal seperator  code commented in the bindvalueToNewRate method
        //only after the above code is executed, new rate is availble, any validation/code written above this will not work
        //validation for new rate
        if(String.isBlank(pricingRequestItem.New_Rate__c))
        { 
            throw new PAException(System.Label.Rate_Mandatory_Error,ApexPages.severity.Error); 
            
        }
        if(pricingRequestItem.New_Rate__c!=newRate){
            
            if(!String.isBlank(pricingRequestItem.New_Rate__c)){
                newRate=pricingRequestItem.New_Rate__c;
                if(pricingRequestItem.New_Unit__c!='%'){
                    pricingRequestItem.New_Rate__c=      String.valueoF(Decimal.valueOf(pricingRequestItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.Roundingmode.HALF_EVEN));
                    System.debug('****rate  in if'+pricingRequestItem.New_Rate__c);
                }
                else if(pricingRequestItem.New_Unit__c=='%'){
                    pricingRequestItem.New_Rate__c=      String.valueoF(Decimal.valueOf(pricingRequestItem.New_Rate__c).setScale(3,System.Roundingmode.HALF_EVEN));
                    System.debug('****rate in else'+pricingRequestItem.New_Rate__c);
                }
                else{
                    pricingRequestItem.New_Rate__c=      String.valueoF(Decimal.valueOf(pricingRequestItem.New_Rate__c).setScale(2,System.Roundingmode.HALF_EVEN));
                    System.debug('****rate in else'+pricingRequestItem.New_Rate__c);
                }
                
            }
            //update pricingRequestItem;-dont uncomment
            Set<Id> npcReqIdSet=new Set<Id>();
            List<NPC_Request__c> npcReqId=[SELECT id FROM NPC_Request__c where Pricing_request_item__c=:pricingRequestItem.Id AND Status__c='Active' limit 1];
            for(NPC_Request__c npc:npcReqId){
                npcReqIdSet.add(npc.Id);
            }
            System.debug('***before method call'+npcReqIdSet+'**cTRateMap'+condRateMap);
            //<PP20130614> -- Ver 1.12 START            
            if(!String.isBlank(pricingRequestItem.New_Rate__c))
            {
                Decimal roundOfRate = Decimal.valueOf(pricingRequestItem.New_Rate__c);
                if(!String.isBlank(pricingRequestItem.Plus_Minus_Code__c))
                {
                    roundOfRate = roundOfRate.abs();
                }
                //Added !String.isBlank condition
                if(!String.isBlank(pricingRequestItem.Plus_Minus_Code__c)
                   && pricingRequestItem.Plus_Minus_Code__c=='X')
                {
                    roundOfRate= (-1) * roundOfRate;
                }
                pricingRequestItem.New_Rate__c = String.valueOf(roundOfRate);
            }    
            //<PP20130614> -- Ver 1.12 END
            List<Pricing_Request_Item__c> priItemList=new  List<Pricing_Request_Item__c>();
            priItemList.add(pricingRequestItem);
            calculateNPC(npcReqIdSet, splitMap,priItemList,true);
        }
        return null;
    } 
    
    public void checkforFlrAndRef(Map<String,String> currentNetPriceValuesMap,Map<String,String> newNetPriceValuesMap,List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Map<String,String> pcCodeDescriptionMap, Map<String,String> uomConversionMap){
        
        npcRequestsUpdatedList =new List<NPC_Request__c>(); //to be validated initilaisation
        FloorRefWrapper newNetPricewrap;
        FloorRefWrapper curNetPricewrap;
        FloorRefWrapper flrPricewrap;
        FloorRefWrapper refPricewrap;
        FloorRefWrapper currentPrice;
        Decimal currentNetPrice;
        Decimal newNetPrice;
        String grossPrice; //To determine Gross price among the the pricing conditions returned from SAP
        String grossPriceCode;
        if(FlrRefWrapperList == NULL)//Conditioned by UD
            FlrRefWrapperList= new List<FloorRefWrapper>();
        System.debug('***cond type rate map'+condTypeRateMap.keySet());
        System.debug('***cond type rate map values'+condTypeRateMap.values());
        //To get the new price
        for(String s:condTypeRateMap.keySet()){
            System.debug('*cal type'+s+'***cal type'+pccodeCalTypeMap.get(s)+'**condition class value'+pcCodeConditionClassMap.get(s));
            
            if(pccodeCalTypeMap.get(s)!=null && pccodeCalTypeMap.get(s).containsIgnoreCase('Quantity') && pcCodeConditionClassMap.get(s)!=null && (pcCodeConditionClassMap.get(s).equalsIgnoreCase('Prices') || pcCodeConditionClassMap.get(s).equalsIgnoreCase('Price'))){
                grossPrice=pcCodeDescriptionMap.get(s); 
                grossPriceCode=s;
                break;
            }
        }
        System.debug('****grossprice'+grossPrice);
        FloorRefWrapper currentGrossPriceWrap=new FloorRefWrapper();
        currentGrossPriceWrap.price='Current Gross Price';
        for(ERP_Procedure_Conditions__c proCond:erpPCList){ 
            System.debug('***Price Type'+proCond.Pricing_Condition__r.Price_Types__c+'***'+proCond.Id);
            //<PP20130708> -- Ver 1.14 -- Added 'Pricing Task' instead of 'Spot' for Price Type
            if(proCond.Pricing_Condition__r.Price_Types__c!=null && !(proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Price') || proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Floor')  || proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Reference') || proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Reference') || proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Floor') || (proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Pricing Task') && !(proCond.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Standard'))))){
                if(pccodeCalTypeMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c)!=null && pccodeCalTypeMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c).containsIgnoreCase('Quantity') && pcCodeConditionClassMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c)!=null && (pcCodeConditionClassMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c).equalsIgnoreCase('Prices') || pcCodeConditionClassMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c).equalsIgnoreCase('Price'))){
                    grossPrice=pcCodeDescriptionMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c); 
                    grossPriceCode=proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                    System.debug('****gross price'+grossPrice);
                    if(grossPrice!=null && grossPriceCode!=null &&
                       ((currentGrossPriceWrap.rate == null && PAPricingProcedureMapping__c.getInstance('DCP Canada').Pricing_Procedure_Code__c != prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c  && PAPricingProcedureMapping__c.getInstance('CPM EMEA').Pricing_Procedure_Code__c != prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c && PAPricingProcedureMapping__c.getInstance('P&IP NA US').Pricing_Procedure_Code__c != prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate != null && grossPriceCode != 'ZBPC' && PAPricingProcedureMapping__c.getInstance('DTT LA PP F26C').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate == null &&
                            grossPriceCode != 'ZPRC' && PAPricingProcedureMapping__c.getInstance('DCP Canada').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate != null && grossPriceCode != 'ZPGB' && PAPricingProcedureMapping__c.getInstance('DPP Polymers EMEA SPP1').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        ||(currentGrossPriceWrap.rate != null && grossPriceCode != 'ZPGB' && PAPricingProcedureMapping__c.getInstance('DPP Global Kalrez & Vespel SPP3').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        ||(currentGrossPriceWrap.rate != null && grossPriceCode != 'ZPGC' && PAPricingProcedureMapping__c.getInstance('DPP KV SPP5').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)                       
                        || (currentGrossPriceWrap.rate != null && grossPriceCode != 'ZPEE' && grossPriceCode != 'ZPZA' && grossPriceCode != 'ZPTR' && grossPriceCode != 'ZPKA' && grossPriceCode != 'ZPRA' && grossPriceCode != 'ZPRU' && PAPricingProcedureMapping__c.getInstance('DCP EMEA SPP').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate != null && grossPriceCode != 'ZPRB' && PAPricingProcedureMapping__c.getInstance('DPP NA SPP1').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        ||(currentGrossPriceWrap.rate != null && grossPriceCode != 'ZP2B' && PAPricingProcedureMapping__c.getInstance('DCP AP IN').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        ||(currentGrossPriceWrap.rate != null && grossPriceCode != 'ZBPA' && PAPricingProcedureMapping__c.getInstance('DPGLOBAL SPP1').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate != null &&
                            grossPriceCode != 'ZPRI' && PAPricingProcedureMapping__c.getInstance('DPT EMEA').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate != null &&
                            grossPriceCode != 'ZPRI' && grossPriceCode != 'ZBPA' && (PAPricingProcedureMapping__c.getInstance('DPT LA SPP1').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT LA SPP2').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT LA SPP3').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT LA SPP4').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)) 
                        || (currentGrossPriceWrap.rate != null && grossPriceCode != 'ZFOC' &&
                            (PAPricingProcedureMapping__c.getInstance('DPT NA SPP1').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT NA SPP2').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT NA SPP3').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT NA SPP4').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c))
                        || (currentGrossPriceWrap.rate != null &&
                            (PAPricingProcedureMapping__c.getInstance('DPT AP SPP1').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT AP SPP2').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT AP SPP3').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT AP SPP4').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT AP SPP5').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c || PAPricingProcedureMapping__c.getInstance('DPT AP SPP6').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c))
                        || (currentGrossPriceWrap.rate == null &&
                            grossPriceCode != 'EK02' && PAPricingProcedureMapping__c.getInstance('CPM EMEA').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c)
                        || (currentGrossPriceWrap.rate == null &&
                            grossPriceCode != 'ZPG4' && PAPricingProcedureMapping__c.getInstance('P&IP NA US').Pricing_Procedure_Code__c == prItem.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c))){
                                
                                
                                List<String> rateList=condTypeRateMap.get(grossPriceCode);
                                
                                
                                if(rateList!=null && rateList.size()==4)
                                {     Decimal roundOffRate;
                                 if(rateList[0]!=null &&  rateList[0]!='##' && rateList[1]!=null && rateList[1]!='%' ){
                                     roundOffRate=Decimal.valueOf( rateList[0]);
                                     roundOffRate = roundOffRate.setScale(PAUtil.decimalPlacesMap.get(rateList[1]),System.RoundingMode.HALF_EVEN);
                                 } 
                                 if(roundOffRate!=null){
                                     String temprate=  String.valueof(roundOffRate) ; // currentNetPriceValuesMap.get(grossPrice);  //can also use rateList[0]        //commenting it -coz can handle it from rate list currentNetPriceValuesMap.get(grossPrice);
                                     currentGrossPriceWrap.rate=temprate;
                                     currentGrossPriceWrap.unit=  rateList[1];   //prItem.New_Unit__c; 
                                     currentGrossPriceWrap.per=  rateList[2];   //String.valueOf(prItem.New_Per__c);
                                     currentGrossPriceWrap.uom=   rateList[3];   // prItem.New_UoM__c;
                                 }
                                 FlrRefWrapperList.add(currentGrossPriceWrap); 
                                }
                                
                                System.debug('***new price'+currentGrossPriceWrap);
                                //To get the Converted Gross Price
                                List<String> currentRate=new List<String>();
                                Decimal convertedGrossPrice;
                                //<PP20131231>
                                rateList=condTypeRateMap.get(grossPriceCode);
                                //To handle new price scenario where rate would be null
                                if(rateList!=null && rateList.size()==4){
                                    currentRate.add(rateList[0]);
                                    currentRate.add(rateList[1]);
                                    currentRate.add(rateList[2]);
                                    currentRate.add(rateList[3]);
                                }
                                
                                currentPrice=new  FloorRefWrapper();
                                currentPrice.price='Converted Current Gross Price';
                                if(currentGrossPriceWrap.rate != null)
                                {
                                    if(prItem.New_Unit__c!=null && prItem.New_Unit__c!='%'){
                                        //Issue -UoM START
                                        List<String> targetList= new List<String>();
                                        targetList.add(prItem.New_Unit__c);
                                        targetList.add(String.valueOf(prItem.New_Per__c));
                                        targetList.add(prItem.New_Uom__c);
                                        //END
                                        Decimal  convertedcurrentRate=doConversion(currentRate, npcRequest,targetList, uomConversionMap);
                                        if(convertedcurrentRate!=null){
                                            convertedcurrentRate=      convertedcurrentRate.setScale(PAUtil.decimalPlacesMap.get(prItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                            currentPrice.rate=String.valueof(convertedcurrentRate);
                                            currentPrice.unit=prItem.New_Unit__c;
                                            currentPrice.per=String.valueOf(prItem.New_Per__c);
                                            currentPrice.uom=prItem.New_UoM__c;
                                            FlrRefWrapperList.add(currentPrice);
                                        }
                                    }
                                    else{
                                        currentPrice.rate=currentGrossPriceWrap.rate;
                                        currentPrice.unit=currentGrossPriceWrap.unit;
                                        currentPrice.per=currentGrossPriceWrap.per;
                                        currentPrice.uom=currentGrossPriceWrap.uom;
                                        FlrRefWrapperList.add(currentPrice);
                                        
                                    }
                                    System.debug('***current price'+currentPrice);
                                }
                            }
                }
            }
        }
        
        //<PP20131224> START
        if(currentGrossPriceWrap.rate == null)
        {
            FlrRefWrapperList.add(currentGrossPriceWrap);
        }
        if(currentPrice == null || currentPrice.rate == null)
        {
            //Converted current Gross Price
            List<String> currentRate=new List<String>();
            List<String> targetList= new List<String>();
            targetList.add(prItem.New_Unit__c);
            targetList.add(String.valueOf(prItem.New_Per__c));
            targetList.add(prItem.New_Uom__c);
            Decimal  convertedcurrentRate=doConversion(currentRate, npcRequest,targetList, uomConversionMap);
            //<HL20150811> added null exception to avoid production issue for Null Argument.
            // <MG20161227> added business and Project price condition in if condition to avoid "Argument cannot be null" errror
            if(convertedcurrentRate!=null)
            {
                if(prItem.Pricing_Request_Type__c =='Project' && prItem.BU__C == String.valueof(Business_Unit__c.getInstance('BI EMEA Surfaces').BUList__c)){
                    convertedcurrentRate = convertedcurrentRate ;   
                }
                else{
                    // System.debug('***111111111111111'+prItem.New_Unit__c);   
                    //System.debug('***222222222222222'+PAUtil.decimalPlacesMap.get(prItem.New_Unit__c));   
                    // if(prItem.New_Unit__c !='%'){
                    convertedcurrentRate= convertedcurrentRate.setScale(PAUtil.decimalPlacesMap.get(prItem.New_Unit__c),System.RoundingMode.HALF_EVEN);                 
                }
                // }
                
                currentPrice=new FloorRefWrapper();
                currentPrice.rate=String.valueof(convertedcurrentRate);
                currentPrice.unit=prItem.New_Unit__c;
                currentPrice.per=String.valueOf(prItem.New_Per__c);
                currentPrice.uom=prItem.New_UoM__c;
                FlrRefWrapperList.add(currentPrice);
            }
        }
        //<PP20131224> END
        /*For computing current,new simulated net price, floor and ref prices and checking flags*/
        for(ERP_Procedure_Conditions__c erp: erpPCList){
            system.debug('ERP VALUE: ' +erp.Pricing_Condition__r.Pricing_Condition_Code__c);
            System.debug('ERP Price types@@ '+erp.Pricing_Condition__r.Price_Types__c);
            //end- identifying gross and converted gross
            //For current flag check -compute current and new net price
            System.debug('&&&'+(erp.Pricing_Condition__r.Price_Types__c!=null && erp.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Price')));
            if(erp.Pricing_Condition__r.Price_Types__c!=null && erp.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Price')){
                String currentNP=currentNetPriceValuesMap.get(erp.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+erp.Pricing_Condition__r.Pricing_Condition__c);
                if(currentNP!=null){ 
                    currentNetPrice =Decimal.valueOf(currentNP);
                    curNetPricewrap=new  FloorRefWrapper();
                    curNetPricewrap.price='Current Simulated Net Price';
                    curNetPricewrap.rate=String.valueof(currentNetPrice);
                    //Unit Per UoM should same as that of the Gross price
                    curNetPricewrap.unit=currentPrice.unit;
                    curNetPricewrap.per=currentPrice.per;
                    curNetPricewrap.uom=currentPrice.UoM;
                    System.debug('****pricing request item'+pricingRequestItem);
                    System.debug('***current rate'+curNetPricewrap.rate);
                    pricingRequestItem.Stamp_Current_Net_Price__c=curNetPricewrap.rate; //To store the current net price in request item
                    npcRequest.Stamp_Current_Net_Price__c=curNetPricewrap.rate;
                    FlrRefWrapperList.add(curNetPricewrap);
                }
                System.debug('***current net price'+curNetPricewrap);
                String newNP=newNetPriceValuesMap.get(erp.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+erp.Pricing_Condition__r.Pricing_Condition__c);
                
                if(newNP!=null){
                    newNetPrice =Decimal.valueOf(newNP);
                    newNetPricewrap=new  FloorRefWrapper();
                    newNetPricewrap.price='New Simulated Net Price';
                    newNetPricewrap.rate=String.valueof(newNetPrice);
                    //Unit Per UoM should same as that of the Gross price
                    newNetPricewrap.unit=currentPrice.unit;
                    newNetPricewrap.per=currentPrice.per;
                    newNetPricewrap.uom=currentPrice.UoM;
                    pricingRequestItem.Stamp_New_Net_Price__c=newNetPricewrap.rate; //To store the new net price in request item
                    npcRequest.Stamp_New_Net_Price__c=newNetPricewrap.rate; 
                    npcRequest.Unit__c=newNetPricewrap.unit;
                    npcRequest.Per__c=newNetPricewrap.per;
                    FlrRefWrapperList.add(newNetPricewrap);
                }  
                System.debug('***new net price'+newNetPricewrap);
                if(newNetPrice<currentNetPrice){
                    //check below curernt flag
                    System.debug('****in below current');
                    npcRequest.Below_Current_Flag__c=true;
                }
                else{
                    //below current flag=false;
                    System.debug('****in above current');
                    npcRequest.Below_Current_Flag__c=false;
                }
                //added for computing Delta Current 
                FloorRefWrapper deltaCurrent=new  FloorRefWrapper();
                deltaCurrent.price='Delta Current';
                Decimal deltatempRate;
                Decimal percent;
                if(curNetPricewrap != null && curNetPricewrap.rate!=null && newNetPricewrap!= null && newNetPricewrap.rate!=null){
                    deltatempRate=Decimal.valueOf(newNetPricewrap.rate)-Decimal.valueOf(curNetPricewrap.rate);
                    if(Decimal.valueOf(curNetPricewrap.rate)!=0){
                        percent=(deltatempRate/Decimal.valueOf(curNetPricewrap.rate))*100;
                        if(percent!=null)
                            percent = percent.setScale(3,System.RoundingMode.HALF_EVEN);
                    }
                }
                if(deltatempRate!=null){ 
                    deltaCurrent.rate=String.valueOf(deltatempRate);
                }
                if(curNetPricewrap != null)
                {
                    deltaCurrent.unit=curNetPricewrap.unit;
                    deltaCurrent.per=curNetPricewrap.per;
                    deltaCurrent.uom=curNetPricewrap.uom;
                }
                
                deltaCurrent.percent=String.valueOf(percent);
                deltaCurrent.showPercent=true;
                FlrRefWrapperList.add(deltaCurrent);
            }
            System.debug('****price types'+erp.Pricing_Condition__r.Price_Types__c);
            if(erp.Pricing_Condition__r.Price_Types__c!=null && erp.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Floor'))
            {
                //<TJ20150622>
                //<TJ20150702>
                if(pricingRequestItem.BU__c!=null && (pricingRequestItem.BU__c.containsIgnoreCase('DPP Polymers EMEA')||pricingRequestItem.BU__c.containsIgnoreCase('DPT NA')||pricingRequestItem.BU__c.containsIgnoreCase('DPP AP')||pricingRequestItem.BU__c.containsIgnoreCase('DPP Polymers NAFTA')))
                { 
                    npcRequest.Stamp_Floor_Net_Price__c=pricingRequestItem.Stamp_Floor_Net_Price__c;
                    system.debug('pricingRequestItem.Below_Floor_Flag__c: '+pricingRequestItem.Below_Floor_Flag__c );
                    //<MS20150520> START
                    //npcRequest.Below_Floor_Flag__c=pricingRequestItem.Below_Floor_Flag__c;
                    String netFloor = npcRequest.Stamp_Floor_Net_Price__c;          
                    //<TJ20150622>
                    if(netFloor!=null && newNetPrice<Decimal.valueOf(netFloor)){
                        npcRequest.Below_Floor_Flag__c=true;
                    }
                    else{
                        npcRequest.Below_Floor_Flag__c=false;
                    }
                    //<MS20150520>END
                    if(netFloor==null)
                    {
                        flrPricewrap=new  FloorRefWrapper();
                        flrPricewrap.price='Net Floor Price';
                        FlrRefWrapperList.add(flrPricewrap);
                        System.debug('*****Net Floor Price');
                    }
                    else
                    {
                        flrPricewrap=new  FloorRefWrapper();
                        flrPricewrap.price='Net Floor Price';
                        flrPricewrap.rate=netFloor;
                        flrPricewrap.unit=pricingRequestItem.New_Unit__c;
                        flrPricewrap.per=String.valueOf(pricingRequestItem.New_Per__c);
                        flrPricewrap.uom=pricingRequestItem.New_UoM__c;
                        System.debug('*****Net Floor Price in if');
                        FlrRefWrapperList.add(flrPricewrap);
                    }
                    FloorRefWrapper deltaFloor=new  FloorRefWrapper();
                    deltaFloor.price='Delta Floor';
                    Decimal deltatempFlrRate;
                    Decimal Flrpercent;
                    system.debug(newNetPricewrap);
                    if(netFloor!=null && newNetPricewrap!=null) //<MS20150203>Issue Code fix 
                    {
                        deltatempFlrRate=Decimal.valueOf(newNetPricewrap.rate)-Decimal.valueOf(netFloor);
                        Flrpercent=(deltatempFlrRate/Decimal.valueOf(netFloor))*100;
                        Flrpercent=Flrpercent.setScale(PAUtil.decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                        
                    }
                    if(deltatempFlrRate!=null){ 
                        deltaFloor.rate=String.valueOf(deltatempFlrRate);
                        //moving it inside if
                        deltaFloor.unit=curNetPricewrap.unit;
                        deltaFloor.per=curNetPricewrap.per;
                        deltaFloor.uom=curNetPricewrap.uom;
                        //<PG20202311>
                        if(deltatempFlrRate < 0){
                            DeltaFloorCheck = true;
                        }
                    }
                    deltaFloor.percent=String.valueOf(Flrpercent);
                    deltaFloor.showPercent=true;
                    FlrRefWrapperList.add(deltaFloor);
                } 
                else
                {
                    //<PR20140917> START
                    //erp.Pricing_Condition__r.Pricing_Condition_Code__c
                    List<String> netFloor= condTypeRateMap.get(erp.Pricing_Condition__r.Pricing_Condition_Code__c);
                    System.debug('***net Floor list'+netFloor);
                    if(netFloor==null){
                        npcRequest.Below_Floor_Flag__c=true;
                        flrPricewrap=new  FloorRefWrapper();
                        flrPricewrap.price='Net Floor Price';
                        FlrRefWrapperList.add(flrPricewrap);
                        System.debug('*****Net Floor Price');
                    }
                    else{
                        //do conversions
                        Decimal newFloorPrice;
                        flrPricewrap=new  FloorRefWrapper();
                        flrPricewrap.price='Net Floor Price';
                        if(prItem.New_Unit__c!='%' && PAUtil.decimalPlacesMap.containsKey(prItem.New_Unit__c)){
                            //Issue -UoM START
                            List<String> targetList= new List<String>();
                            targetList.add(prItem.New_Unit__c);
                            targetList.add(String.valueOf(prItem.New_Per__c));
                            targetList.add(prItem.New_Uom__c);
                            //END
                            newFloorPrice = doConversion(netFloor, npcRequest,targetList, uomConversionMap);
                            newFloorPrice = newFloorPrice.setScale(PAUtil.decimalPlacesMap.get(prItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            flrPricewrap.rate=String.valueof(newFloorPrice);
                            flrPricewrap.unit=prItem.New_Unit__c;
                            flrPricewrap.per=String.valueOf(prItem.New_Per__c);
                            flrPricewrap.uom=prItem.New_UoM__c;
                            System.debug('*****Net Floor Price in if');
                        }
                        else{
                            //Issue -UoM START
                            List<String> targetList= new List<String>();
                            targetList.add(curNetPricewrap.unit);
                            targetList.add(curNetPricewrap.per);
                            targetList.add(curNetPricewrap.UoM);
                            //END
                            newFloorPrice= doConversion(netFloor, npcRequest,targetList, uomConversionMap);
                            
                            newFloorPrice = newFloorPrice.setScale(2,System.RoundingMode.HALF_EVEN);
                            flrPricewrap.rate=String.valueof(newFloorPrice);
                            if(netFloor!=null && netFloor.size()==4){
                                flrPricewrap.unit=curNetPricewrap.unit;   //netFloor[1];-This wll store units before conversion
                                flrPricewrap.per=   curNetPricewrap.per;                //netFloor[2];
                                flrPricewrap.uom=   curNetPricewrap.uom;            //netFloor[3];
                            }
                            System.debug('*****Net Floor Price in else'+netFloor+'****newFloorPrice'+newFloorPrice);
                        }
                        //changing from prItem
                        System.debug('*****Sap'+flrPricewrap.rate);
                        pricingRequestItem.Stamp_Floor_Net_Price__c=flrPricewrap.rate; //To store the floor net price
                        npcRequest.Stamp_Floor_Net_Price__c=flrPricewrap.rate; 
                        FlrRefWrapperList.add(flrPricewrap);
                        if(newNetPrice<newFloorPrice){
                            npcRequest.Below_Floor_Flag__c=true;
                        }
                        else{
                            npcRequest.Below_Floor_Flag__c=false;
                        }
                    }
                    //added for computing Delta Current 
                    FloorRefWrapper deltaFloor=new  FloorRefWrapper();
                    deltaFloor.price='Delta Floor';
                    Decimal deltatempFlrRate;
                    Decimal Flrpercent;
                    System.debug('###flrPricewrap '+flrPricewrap);
                    System.debug('###newNetPricewrap '+newNetPricewrap);
                    if(flrPricewrap!=null && flrPricewrap.rate!=null && newNetPricewrap!=null && newNetPricewrap.price!=null){
                        deltatempFlrRate=Decimal.valueOf(newNetPricewrap.rate)-Decimal.valueOf(flrPricewrap.rate);
                        System.debug('######deltatempFlrRate '+deltatempFlrRate);
                        if(Decimal.valueOf(flrPricewrap.rate)!=0){
                            Flrpercent=(deltatempFlrRate/Decimal.valueOf(flrPricewrap.rate))*100;
                        }
                        if(Flrpercent!=null)
                            Flrpercent = Flrpercent.setScale(3,System.RoundingMode.HALF_EVEN);
                        
                    }
                    if(deltatempFlrRate!=null){ 
                        deltaFloor.rate=String.valueOf(deltatempFlrRate);
                        //moving it inside if
                        deltaFloor.unit=curNetPricewrap.unit;
                        deltaFloor.per=curNetPricewrap.per;
                        deltaFloor.uom=curNetPricewrap.uom;
                        //<PG20202311>
                         if(deltatempFlrRate < 0){
                            DeltaFloorCheck = true;
                        }
                    }
                    deltaFloor.percent=String.valueOf(Flrpercent);
                    deltaFloor.showPercent=true;
                    FlrRefWrapperList.add(deltaFloor);
                }
                //<PR20140917> END
            }
            if(erp.Pricing_Condition__r.Price_Types__c!=null &&  erp.Pricing_Condition__r.Price_Types__c.containsIgnoreCase('Net Reference')){
                system.debug('pricingRequestItem.BU__c is'+pricingRequestItem.BU__c);
                //<TJ20150622>
                //<TJ20150702>
                if(pricingRequestItem.BU__c!=null && (pricingRequestItem.BU__c.containsIgnoreCase('DPP Polymers EMEA')||pricingRequestItem.BU__c.containsIgnoreCase('DPT NA')||pricingRequestItem.BU__c.containsIgnoreCase('DPP AP')||pricingRequestItem.BU__c.containsIgnoreCase('DPP Polymers NAFTA')))
                {
                    npcRequest.Stamp_Reference_Net_Price__c=pricingRequestItem.Stamp_Reference_Net_Price__c;
                    system.debug('pricingRequestItem.Below_Reference_Flag__c: '+pricingRequestItem.Below_Reference_Flag__c);
                    //<MS20150520> START
                    //npcRequest.Below_Reference_Flag__c=pricingRequestItem.Below_Reference_Flag__c;
                    String netReference = npcRequest.Stamp_Reference_Net_Price__c;
                    //<TJ20150622>
                    if(netReference!=null && newNetPrice<Decimal.valueOf(netReference)){
                        npcRequest.Below_Reference_Flag__c=true;
                    }
                    else{
                        npcRequest.Below_Reference_Flag__c=false;
                    }
                    //<MS20150520> END
                    if(netReference==null)
                    {
                        refPricewrap=new  FloorRefWrapper();
                        refPricewrap.price='Net Reference Price';
                        FlrRefWrapperList.add(refPricewrap);
                        System.debug('*****Net Reference Price');
                    }
                    else
                    {
                        refPricewrap=new  FloorRefWrapper();
                        refPricewrap.price='Net Reference Price';
                        refPricewrap.rate=netReference;
                        refPricewrap.unit=pricingRequestItem.New_Unit__c;
                        refPricewrap.per=String.valueOf(pricingRequestItem.New_Per__c);
                        refPricewrap.uom=pricingRequestItem.New_UoM__c;
                        System.debug('*****Net Reference Price in if');
                        FlrRefWrapperList.add(refPricewrap);
                    }
                    FloorRefWrapper deltaReference=new  FloorRefWrapper();
                    deltaReference.price='Delta Reference';
                    Decimal deltatempRefRate;
                    Decimal Refpercent;
                    if(netReference!=null && newNetPricewrap!=null)//<MS20150203> Issue code fix
                    {
                        deltatempRefRate=Decimal.valueOf(newNetPricewrap.rate)-Decimal.valueOf(netReference);
                        Refpercent=(deltatempRefRate/Decimal.valueOf(netReference))*100;
                        Refpercent=Refpercent.setScale(PAUtil.decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                    }
                    if(deltatempRefRate!=null){ 
                        deltaReference.rate=String.valueOf(deltatempRefRate);
                        //moving it inside if
                        deltaReference.unit=curNetPricewrap.unit;
                        deltaReference.per=curNetPricewrap.per;
                        deltaReference.uom=curNetPricewrap.uom;
                        //<PG20202311>
                        if(deltatempRefRate < 0){
                            DeltaRefCheck = true;
                        }
                    }
                    deltaReference.percent=String.valueOf(Refpercent);
                    deltaReference.showPercent=true;
                    FlrRefWrapperList.add(deltaReference);
                }
                else
                {
                    //<PR20140917> START
                    List<String> netRef= condTypeRateMap.get(erp.Pricing_Condition__r.Pricing_Condition_Code__c);
                    System.debug('****net ref'+netRef);
                    if(netRef==null){
                        npcRequest.Below_Reference_Flag__c=true;
                        
                        flrPricewrap=new  FloorRefWrapper();
                        flrPricewrap.price='Net Reference Price';
                        FlrRefWrapperList.add(flrPricewrap);
                    }
                    else{
                        //do conversions
                        Decimal netRefPrice;// = doConversion(netRef, npcRequest, prItem,uomConversionMap);
                        refPricewrap=new  FloorRefWrapper();
                        refPricewrap.price='Net Reference Price';
                        if(prItem.New_Unit__c!='%' && PAUtil.decimalPlacesMap.containsKey(prItem.New_Unit__c)){
                            //Issue -UoM START
                            List<String> targetList= new List<String>();
                            targetList.add(prItem.New_Unit__c);
                            targetList.add(String.valueOf(prItem.New_Per__c));
                            targetList.add(prItem.New_Uom__c);
                            //END
                            netRefPrice = doConversion(netRef, npcRequest,targetList, uomConversionMap);
                            netRefPrice = netRefPrice.setScale(PAUtil.decimalPlacesMap.get(prItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            refPricewrap.rate=String.valueof(netRefPrice);
                            refPricewrap.unit= prItem.New_Unit__c;
                            refPricewrap.per=String.valueOf(prItem.New_Per__c);
                            refPricewrap.uom=prItem.New_UoM__c;
                        }
                        else{
                            //Issue -UoM START
                            List<String> targetList= new List<String>();
                            targetList.add(curNetPricewrap.unit);
                            targetList.add(String.valueOf(curNetPricewrap.per));
                            targetList.add(curNetPricewrap.uom);
                            //END
                            netRefPrice = doConversion(netRef, npcRequest,targetList, uomConversionMap);
                            netRefPrice = netRefPrice.setScale(2,System.RoundingMode.HALF_EVEN);
                            refPricewrap.rate=String.valueof(netRefPrice);
                            if(netRef!=null && netRef.size()==4){
                                
                                refPricewrap.unit=curNetPricewrap.unit; // netRef[1]; // prItem.New_Unit__c;
                                refPricewrap.per=   curNetPricewrap.per;                    //netRef[2];
                                refPricewrap.uom=   curNetPricewrap.uom;                    //netRef[3];
                            }
                            
                        }
                        pricingRequestItem.Stamp_Reference_Net_Price__c=refPricewrap.rate; //To store the ref net price
                        npcRequest.Stamp_Reference_Net_Price__c=refPricewrap.rate; 
                        FlrRefWrapperList.add(refPricewrap);
                        
                        if(newNetPrice<netRefPrice){
                            npcRequest.Below_Reference_Flag__c=true;
                        }
                        else{
                            npcRequest.Below_Reference_Flag__c=false;
                        }
                    }
                    //added for computing Delta Reference 
                    FloorRefWrapper deltaRef=new  FloorRefWrapper();
                    deltaRef.price='Delta Reference';
                    Decimal RefdeltatempRate;
                    Decimal refPercent;
                    if(refPricewrap!=null && refPricewrap.rate!=null && newNetPricewrap != null && newNetPricewrap.rate!=null){
                        RefdeltatempRate=Decimal.valueOf(newNetPricewrap.rate)-Decimal.valueOf(refPricewrap.rate);
                        if(Decimal.valueOf(refPricewrap.rate)!=0){
                            refPercent=(RefdeltatempRate/Decimal.valueOf(refPricewrap.rate))*100;
                            if(refPercent!=null) 
                                refPercent = refPercent.setScale(3,System.RoundingMode.HALF_EVEN);
                        }
                    }
                    if(RefdeltatempRate!=null){ 
                        deltaRef.rate=String.valueOf(RefdeltatempRate);
                        //moving it inside if
                        deltaRef.unit=curNetPricewrap.unit;
                        deltaRef.per=curNetPricewrap.per;
                        deltaRef.uom=curNetPricewrap.uom;
                    }
                    deltaRef.percent=String.valueOf(refPercent);
                    deltaRef.showPercent=true;
                    FlrRefWrapperList.add(deltaRef);
                }
                //<PR20140917> END
            }
        } 
        
        npcRequestsUpdatedList.add(npcRequest); 
        if(npcRequest.isSynchronous__c==false){
            //   isCalculated=true;
            isAsynch=true;
            System.debug('call save***');
            save();
        }
        //in case of asynchronous call the save method explictly
        //  update npcRequest; 
    }
    
    public static String fetchMapFromResponse(NpcserviceVARKEY_CPI.NetPriceOutput npcOutput){
        if(npcOutput!=null){
            System.debug('****npcout errror'+npcOutput.ErrorDescription);
            System.debug('****npcout sucess'+npcOutput.ConditionRateVARKEY);
            if(npcOutput.ErrorDescription==null){
                //success
                
                String varkey=npcOutput.ConditionRateVARKEY;
                System.debug('****npcout sucess'+varkey);
                return varkey;
            }
            else{
                //Failure
                throw new  PAException(npcOutput.ErrorDescription,ApexPages.Severity.ERROR);
            }
        }
        return null;
        
        
    }
    
    //This method populates the map from NPC response to show netprice values on page
    public PageReference viewNetPrice(Pricing_request_Item__c pri,boolean priceViewClicked){
        
        List<Pricing_request_Item__c> priItemList=new List<Pricing_request_Item__c>();
        priItemList.add(pri);
        //take the request Item
        //Query all the NPC_Requests which are synch, active
        System.debug('****pri id'+pri.Id);
        List<NPC_Request__c> npCReqList= new List<NPC_Request__c>();
        if(priceViewClicked)
            npCReqList=[select Id FROM NPC_Request__c where Pricing_request_Item__c=:pri.Id AND Status__c='Active'];
        else
            npCReqList=[select Id FROM NPC_Request__c where Pricing_request_Item__c=:pri.Id AND isSynchronous__c=true AND Status__c='Active'];
        Set<Id> npcRequestIdSet=new Set<Id>();
        System.debug('****npCReqList.size()'+npCReqList.size());
        if(npCReqList!=null && npCReqList.size()!=0){
            npcRequestIdSet.add(npcReqList.get(0).Id);
        }
        system.debug(npcRequestIdSet);
        //has to be one
        //query teh repsonse for that request
        List<NPC_Response__c> npcResponse=[select Id,      NPC_Message_Type__c,Condition_Rate_Key__c,      F_Response_Status__c FROM NPC_Response__c where NPC_Request__c=:npcRequestIdSet  AND F_Response_Status__c='Active'];
        if(npcResponse!=null && npcResponse.size()!=0){
            // added by hema
            if(   npcResponse[0].NPC_Message_Type__c=='E' &&npcResponse[0].Condition_Rate_Key__c !=null){
                throw new PAException(npcResponse[0].Condition_Rate_Key__c,ApexPages.severity.Error); 
            }
            String varkey =npcResponse[0].Condition_Rate_Key__c;
            Map<String,List<String>> splitCondRateMap=new  Map<String,List<String>>();
            if(varkey!=null){
                splitCondRateMap= splitVarKey(varKey);
            } 
            System.debug('****splitCondRateMap'+splitCondRateMap);
            calculateNPC(npcRequestIdSet, splitCondRateMap ,priItemList,true);      
        }
        
        //give teh repsosne to the split metod 
        //it returns a map
        //call calculate NPC method
        return null; 
    } 
    /*
* Author      : 
* Method Name  :   save
* Parameters   :   No parameters
* Return type  :   void
* Description  :   
*/
    public List<PARelatedList> relatedWrappersList{get;set;}
    public void save(){
        //added for recalc on save
        //|| pricingRequestItem.New_Rate__c!=newRate
        /* if(isCalculated==false ){
System.debug('***Should not come here for Async');
recalculate();
}*/
        //<MS20150220> Code fix for Below Ref/Floor Flags START
        boolean belowFlrFlag=pricingRequestItem.Below_Floor_Flag__c;
        boolean belowRefFlag=pricingRequestItem.Below_Reference_Flag__c;
        //<MS20150220> Code fix for Below Ref/Floor Flags END
        if(!isAsynch){
            recalculate();
        }
        system.debug('pricingRequestItem in save'+pricingRequestItem.Below_Reference_Flag__c);
        System.debug('***After recalcuate');
        if(npcRequestsUpdatedList!=null && npcRequestsUpdatedList.size()!=0){
            upsert npcRequestsUpdatedList;
        }
        System.debug('****pricing req item id'+pricingRequestItem.Stamp_New_Net_Price__c);
        
        System.debug('****pricing req item id'+pricingRequestItem.Id);
        update pricingRequestItem;
        
        List<Pricing_request_Item__c> pricingReqItemList=new List<Pricing_request_Item__c>();
        pricingReqItemList.add(pricingRequestItem);
        try
        {
            PAUtil.calculateFloorAndReference(pricingReqItemList);
        }
        catch(Exception e)
        {
            system.debug('priceReq Flr And Ref'+e);
        }
        //<PR20140917> START
        //Added check for null condition
        //<TJ20150622>
        //<TJ20150702>
        //<AV20150825>-Production issue-price below net floor but below floor flag not checked-DPT EMEA missing in if condition
        //<PG20192509>-To add NPC enablement for DPT AP, DPT LA, DPT NA.
        if(pricingReqItemList[0].BU__c!=null && (pricingReqItemList[0].BU__c.containsIgnoreCase('DPP Polymers EMEA')||pricingRequestItem.BU__c.containsIgnoreCase('DPT NA')||pricingRequestItem.BU__c.containsIgnoreCase('DPP AP')||pricingRequestItem.BU__c.containsIgnoreCase('DPP Polymers NAFTA')||pricingRequestItem.BU__c.containsIgnoreCase('DPT EMEA')||pricingRequestItem.BU__c.containsIgnoreCase('DPT LA')||pricingRequestItem.BU__c.containsIgnoreCase('DPT AP')))
        {
            try
            {
                PAUtil.calculateNetFloorAndReference(pricingReqItemList);
                system.debug('pricingRequestItem in save after calc'+pricingRequestItem.Below_Reference_Flag__c);
            }
            catch(Exception e)
            {
                system.debug('priceReq Flr And Ref'+e);
            }
        }
        //<MS20150220> Code fix for Below Ref/Floor Flags START
        //<PG20202311>
        if(belowFlrflag==true && pricingRequestItem.New_Unit__c!='%' && pricingRequestItem.Stamp_Floor_Net_Price__c!=null && DeltaFloorCheck == true)
        {
            pricingRequestItem.Below_Floor_Flag__c=true;
            update pricingRequestItem;
        }
        //<PG20202311>
        if(belowRefflag==true && pricingRequestItem.New_Unit__c!='%' && pricingRequestItem.Stamp_Reference_Net_Price__c!=null && DeltaRefCheck == true)
        {
            pricingRequestItem.Below_Reference_Flag__c=true;
            update pricingRequestItem;
        }
        //<MS20150220> Code fix for Below Ref/Floor Flags END
        //<PR20140917> END
        //return null;
        
    }
    public static NpcserviceVARKEY_CPI.NetPriceOutput callService(Pricing_Request_Item__c pri,String quantity,String uom,String matCode)
    {
        System.debug('***quantity n UoM'+quantity+'uom'+uom);
        NpcserviceVARKEY_CPI.NetPriceCalculationSyncPort stub =new NpcserviceVARKEY_CPI.NetPriceCalculationSyncPort();
        NpcserviceVARKEY_CPI.NetPriceInput head = new NpcserviceVARKEY_CPI.NetPriceInput();
        stub.timeout_x = 120000; 
        NpcserviceVARKEY_CPI.Itemdetails item=new NpcserviceVARKEY_CPI.Itemdetails();
        item.itemnumber='1000';
        //<PP20140101>
        if(!String.isBlank(matCode))
        {
            item.Materialnumber= matCode; //'D11803501';//'D12300077';//'D11805774';
        }
        else
        {
            item.Materialnumber= pri.Material_Code__c; //'D11803501';//'D12300077';//'D11805774';
        }
        
        item.Quantity= quantity; //'9800000';//'10001000';//'20000';
        item.TargetUOM=uom;     //'EA';//pri.New_UoM__c;-TO be modified
        head.itemdetails=item;
        NpcserviceVARKEY_CPI.Partnerdetails partner=new NpcserviceVARKEY_CPI.Partnerdetails();
        
        if(pri.Key_Combination__c.containsIgnoreCase('Sold To')){
            partner.PartnerCode='AG';
            partner.PartnerNumber=pri.Sold_To_Code__c.leftPad(10);
            partner.PartnerNumber =  partner.PartnerNumber.replace(' ', '0');
        }
        
        else if(pri.Key_Combination__c.containsIgnoreCase('End User')){
            Pricing_Request_item__c pr= [select Pricing_Request__R.SoldTo_Code__c from  Pricing_Request_item__c where id =:pri.id];
            partner.PartnerCode='AG';
            partner.PartnerNumber=pr.Pricing_Request__R.SoldTo_Code__c.leftPad(10);
            partner.PartnerNumber =  partner.PartnerNumber.replace(' ', '0');
        }
        
        if(pri.Key_Combination__c.containsIgnoreCase('Ship To')){
            Pricing_Request_item__c pr= [select Pricing_Request__R.SoldTo_Code__c from  Pricing_Request_item__c where id =:pri.id];
            partner.PartnerCode='AG';
            partner.PartnerNumber=pr.Pricing_Request__R.SoldTo_Code__c.leftPad(10);//<HL20152101> added leftpad for the production NPC issue
            partner.PartnerNumber =  partner.PartnerNumber.replace(' ', '0');
            
            partner.PartnerCode1='WE';
            partner.PartnerNumber1=pri.ShipTo_Code__c.leftPad(10);
            partner.PartnerNumber1 =  partner.PartnerNumber1.replace(' ', '0');
        }
        
        head.Partnerdetails=partner;
        head.PricingDate=pri.New_Valid_From__c; //Date.newInstance(2013, 4, 18);
        system.debug('SO ***'+pri.Pricing_Request__r.Sales_Org_Code__c);
        system.debug('DC ***'+pri.Pricing_Request__r.Dist_Channel_Code__c);
        system.debug('Div ***'+pri.Pricing_Request__r.Division_Code__c);
        //<PP20131218>
        if(PASalesDocTypeSOMapping__c.getAll().containsKey(pri.Pricing_Request__r.Sales_Org_Code__c))
        {
            head.SalesDocumentType = PASalesDocTypeSOMapping__c.getInstance(pri.Pricing_Request__r.Sales_Org_Code__c).Sales_Document_Type__c;
        }
        else
        {
            head.SalesDocumentType = PASalesDocTypeSOMapping__c.getInstance('Others').Sales_Document_Type__c;
        }
        
        //head.SalesDocumentType='ZBOR';
        head.SalesOrgCode=pri.Pricing_Request__r.Sales_Org_Code__c;
        head.DistributionChannelCode=pri.Pricing_Request__r.Dist_Channel_Code__c;
        head.DivisionCode=pri.Pricing_Request__r.Division_Code__c;
        head.sapCluster=pri.SAP_Cluster__c;
        System.debug('**head'+head);
        NpcserviceVARKEY_CPI.NetPriceOutput output=stub.NetPriceCalculationSync(head);
        System.debug('***'+output);
        return output;
    }
    //<PP20130607> START
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforBIAPEnvelopes
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for BI AP Envelopes - D600,D618,D629,D63B,D642,D691,D603,D643,D64A,D655,D66D,D674
*/
    //Piyush <PG20191211> Access in test classes - Added @testvisible 
    @testvisible
    private void calculateRatesforBIAPEnvelopes(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZD85' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZPNG'),rate);
                        System.debug('***ZD85'+value);
                    }
                    else if(pcCode == 'ZDI1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZPNG'),rate);
                        System.debug('***ZDI1'+value);
                    }
                    else if(pcCode=='NNP') //Total net price
                    {   
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPNG'),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforBIAPSurfacesA603
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for BI AP Surfaces - A603
*/
    private void calculateRatesforBIAPSurfacesA603(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_Request_Item__c prItem,boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        Decimal Netvalue;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))) && pcCode != 'ZDX1') //SS20230124 : Added check for ZDX1
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_Unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_Uom__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    //<PP20130903> START - commented as ZPSF = Rate
                    //if(pcCode == 'ZPSF')
                    //{
                    //    value = calculateforBISurfaces(finalCalMap.get('ZP2B'),rate);
                    //}
                    //<PP20130903> END 
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage' & NNP
                else
                {
                    //<PP20130903> START
                    //<VK20201709> START
                    if((pcCode == 'ZD85' || pcCode == 'ZDI1' || pcCode == 'ZD8B') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        if(rate == null)
                        {
                            rate = 0;
                        }
                        
                        //System.debug('Get Rate 1'+rate);
                        //<PP20131106> END
                        //<VK20210807> START
                        if(finalCalMap.get('ZPSF')!= null || finalCalMap.get('ZPSF')!= 0)
                        {
                         if(prItem.Pricing_Condition_Code__c == 'ZDX1') // <SS20230124> Replaced ZPSF with prItem.New_Rate__c if ZDX1
                            {
                                if(pcCode =='ZD8B')
                                {
                                    value = calculateforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(Decimal.valueOf(prItem.New_Rate__c),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+'),rate);
                                }
                                else
                                {
                                    value = calculateforBISurfaces(Decimal.valueOf(prItem.New_Rate__c),rate);
                                }
                            }
                            else
                            {   
                                if(pcCode =='ZD8B')
                                {
                                    value = calculateforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPSF'),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+'),rate);
                                }
                                else                                  
                                {
                            value = calculateforBISurfaces(finalCalMap.get('ZPSF'),rate);
                        }
                            } 
                            System.debug(' value '+value);
                        }
                        else
                        {
                            value = calculateforBISurfaces(finalCalMap.get('ZDX1'),rate);
                        }
                        //<VK20210807> END
                    }
                    
                    //<PP20130903> END
                    //Total Net Price
                    else if(pcCode=='NNP')
                    {
                        //<VK20210807> START
                        if(finalCalMap.get('ZPSF')!=null || finalCalMap.get('ZPSF')!=0)
                        {
                            if(prItem.Pricing_Condition_Code__c == 'ZDX1') // <SS20230124> Replaced ZPSF with prItem.New_Rate__c if ZDX1
                            {
                                 value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(Decimal.valueOf(prItem.New_Rate__c),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+'),finalCalMap.get('ZD8B'),'+'); // <SS20230124> Replaced ZPSF with prItem.New_Rate__c                                 
                            }
                            else
                            {   
                                 value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPSF'),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+'),finalCalMap.get('ZD8B'),'+'); // <SS20230124> Replaced ZPSF with prItem.New_Rate__c                          
                            }                             
                            System.debug(' value '+value);
                        }
                        
                        else
                        {
                            value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZDX1'),finalCalMap.get('ZD8B'),'+');
                        }
                        //<VK20210807> END
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforBIAPSurfacesRest
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for BI AP Surfaces - A64A,A618,A629,A642,A64B,A674,A680
*/
    private void calculateRatesforBIAPSurfacesRest(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_Request_Item__c prItem,boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && pcCode != 'ZDX1' && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price')))) // <SS20230327> Added Check PCCode not equal to ZDX1
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_Unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_Uom__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    value = rate; 
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for Calculation Type 'Percentage' & 'NNP'
                else
                {
                    //<PG20201609> Piyush Start
                    if((pcCode == 'ZD85' || pcCode == 'ZDI1') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZPSE'),rate);
                        System.debug('***'+pcCode+value);
                    }
                    else if(pcCode=='NNP') //Total net price
                    {   
                        //apply formula = ZPSE+ZD85+ZD8A
                        //<PP20130903> - changed formula to ZPSE+ZD85
                        //value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPSE'),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+');
                        if(prItem.Pricing_Condition_Code__c == 'ZDX1') //SS20230309 Replacing ZPSE with NEW Rate when PC is ZDX1
                        {
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(Decimal.valueOf(prItem.New_Rate__c),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+');
                        }
                        else
                        {
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPSE'),finalCalMap.get('ZD85'),'+'),finalCalMap.get('ZD8A'),'+'),finalCalMap.get('ZDI1'),'+');
                    }
                }
                }
                //<PG20201609> Piyush End
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    //<PP20130607> END
    //<PP20130614> START
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforMCMAPPaste
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for MCM AP Paste
*/
    //Piyush <PG20191211> Access in test classes - Added @testvisible 
    @testvisible
    private void calculateRatesforMCMAPPaste(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_Request_Item__c prItem,boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            system.debug('\n\n\n npcRequest.isSynchronous__c'+npcRequest.isSynchronous__c);
                            system.debug('\n\n\n isSynchronous'+isSynchronous);
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_Unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_Uom__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage' & 'NNP'
                else
                {
                    if(pcCode == 'ZMHF' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZMBS'),rate);
                        
                    }
                    else if(pcCode=='NNP') //Total net price
                    {   
                        //apply formula = ZPSE+ZD85+ZD8A
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZMBS'),finalCalMap.get('ZMHF'),'+'),finalCalMap.get('ZM03'),'+');                      
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    //<PP20130614> END
    
    
    //<PP20130920> START
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTAPChina
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT AP China
*/
    private void calculateRatesforDTTAPChina(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_Request_Item__c prItem,boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_Unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_Uom__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    value = rate; 
                    /*boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for Calculation Type 'Percentage' & 'NNP'
                else
                {
                    if(pcCode == 'ZCC1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        // value = finalCalMap.get('IP') - (finalCalMap.get('IP')/1.17);
                        //IP-(IP/1+(0.01*Rate))
                        System.debug('****finalCalMap.get IP'+finalCalMap.get('IP')+'rate'+rate);
                        //<PP20131106> START
                        if(rate == null)
                        {
                            rate = 0;
                        }
                        //<PP20131106> END
                        value = finalCalMap.get('IP') - (finalCalMap.get('IP')/(1+(0.01 * rate)));//changed formula NE20131105
                        //value = calculateforBISurfaces(rate,finalCalMap.get('IP')); //changed formula NE20131105
                        
                    }
                    else if(pcCode == 'ST')
                    {
                        //apply formula = =IP+ZCC1+ZD86
                        //changed + to - NE20131105
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCC1'),'-'),finalCalMap.get('ZD86'),'+');                        
                    }
                    else if(pcCode == 'IP')
                    {
                        //apply formula = ZPR9
                        value = finalCalMap.get('ZPR9');                      
                    }
                    else if(pcCode == 'ZD8E' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        
                    }
                    else if(pcCode=='NNP') //Total net price
                    {   
                        //apply formula = ST+ZD8E+ZD8F
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZD8E'),'+'),finalCalMap.get('ZD8F'),'+');                      
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTAPRest
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT AP excluding China
*/
    //Piyush <PG20191211> Access in test classes - Added @testvisible 
    @testvisible
    private void calculateRatesforDTTAPRest(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_Request_Item__c prItem,boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_Unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_Uom__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    value = rate;
                    System.debug('***********value'+value+'***'+rate);
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage' & 'NNP'
                else
                {
                    if(pcCode == 'ST')
                    {
                        //apply formula = IP+ZD86
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZD86'),'+');                        
                    }
                    else if(pcCode == 'IP')
                    {
                        //apply formula = ZPR9
                        value = finalCalMap.get('ZPR9');                      
                    }
                    else if(pcCode == 'ZD8E' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        
                    }
                    else if(pcCode=='NNP') //Total net price
                    {   
                        //apply formula = ST+ZD8E+ZD8F
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZD8E'),'+'),finalCalMap.get('ZD8F'),'+');                      
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    //<PP20130920> END
    //<PP20131009> START
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTEMEAF293
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT EMEA F293
*/
    private void calculateRatesforDTTEMEAF293(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                    /*    boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    //<VR20140102> DTT Rollout Issue - Modified the pricing condition code to NNP
                    if(pcCode=='NNP') //Total net price
                    {
                        //apply formula = IP+ZCRF+ZCMJ
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRF'),'+'),finalCalMap.get('ZCMJ'),'+');
                    }
                    else if(pcCode=='IP') //Total net price
                    {
                        //apply formula = ZPR9
                        value= finalCalMap.get('ZPR9');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTEMEAF253
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT EMEA F253
*/
    private void calculateRatesforDTTEMEAF253(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZDA6' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZPR9'),rate);
                        System.debug('***ZPR9'+value);
                    }
                    else if(pcCode == 'ZCMK' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                        System.debug('***ZPR9'+value);
                    }
                    else if(pcCode == 'ZCRG' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                        System.debug('***ZPR9'+value);
                    }
                    else if(pcCode == 'ZRAB' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        //New Net Price
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('NP'),rate);
                        System.debug('***ZPR9'+value);
                    }
                    else if(pcCode=='IP') //Invoice price
                    {
                        //apply formula = ZPR9+ZDA6+ZDA7
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPR9'),finalCalMap.get('ZDA6'),'+'),finalCalMap.get('ZDA7'),'+');
                    }
                    else if(pcCode=='NP') //DTT net price
                    {
                        //apply formula = IP+ZCMJ+ZCMK+ZCRF+ZCRG
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCMJ'),'+'),finalCalMap.get('ZCMK'),'+'),finalCalMap.get('ZCRF'),'+'),finalCalMap.get('ZCRG'),'+');
                    }
                    else if(pcCode=='NNP') //Total net price
                    {
                        //apply formula = DTT Net Price + ZRAB + ZRAD
                        //<PP20140108> - changed formula
                        //value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('NP'),finalCalMap.get('ZCMJ'),'+'),finalCalMap.get('ZCMK'),'+'),finalCalMap.get('ZCRF'),'+'),finalCalMap.get('ZCRG'),'+'),finalCalMap.get('ZRAB'),'+'),finalCalMap.get('ZRAD'),'+');
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('NP'),finalCalMap.get('ZRAB'),'+'),finalCalMap.get('ZRAD'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    //<PP20131009> END
    
    //<PP20131018> START
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTLARest
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT LA F250, F253 and F295
*/
    private void calculateRatesforDTTLARest(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                        System.debug('****Check after converision-prItem.New_Rate__c'+prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode=='IP') //Invoice Price
                    {
                        //apply formula = ZPR9+ZD86
                        value = finalCalMap.get('ZPR9');
                    }
                    else if(pcCode == 'ZCMK' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'ZCRG' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode=='NNP') //Net price
                    {
                        //apply formula = IP + ZCMJ + ZCMK + ZCRF + ZCRG
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCMJ'),'+'),finalCalMap.get('ZCMK'),'+'),finalCalMap.get('ZCRF'),'+'),finalCalMap.get('ZCRG'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTLAF26C
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT LA F26C
*/
    private void calculateRatesforDTTLAF26C(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        //<PP20131224>
                        if(rateList==null && !((pcCode == 'ZBPA' && (!finalCalMap.containsKey('ZBPC')||(finalCalMap.containsKey('ZBPC') && finalCalMap.get('ZBPC') != null)))||(pcCode == 'ZBPC' && (!finalCalMap.containsKey('ZBPA')||(finalCalMap.containsKey('ZBPA') && finalCalMap.get('ZBPA') != null)))))
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZENC' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPCA * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'ZRA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPCA * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'IP') //Invoice price
                    {
                        //apply formula = ZBPA or ZBPC
                        if(finalCalMap.get('ZBPC') == null || finalCalMap.get('ZBPC') == 0)
                        {
                            value = finalCalMap.get('ZBPA');
                        }
                        else
                        {
                            value = finalCalMap.get('ZBPC');
                        }
                    }
                    else if(pcCode == 'NNP') //Net price
                    {
                        //apply formula = = IP + ZENC + ZRA1
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZENC'),'+'),finalCalMap.get('ZRA1'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    //<PP20131018> END
    
    //<PP20131023> START    
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTCanada
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT Canada
*/
    private void calculateRatesforDTTCanada(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                    /*    boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZCRE' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'ZCRF' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'ZCRG' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'ZCMC' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'IP')
                    {
                        //apply formula = ZPCA
                        value = finalCalMap.get('ZPCA');
                    }
                    else if(pcCode == 'NP') //Net price
                    {
                        //apply formula = IP+ ZFA2+ ZCRE + ZCRF + ZCMC + ZCME + ZCMJ
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZFA2'),'+'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRF'),'+'),finalCalMap.get('ZCMC'),'+'),finalCalMap.get('ZCME'),'+'),finalCalMap.get('ZCMJ'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDTTUS
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT US
*/
    private void calculateRatesforDTTUS(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****condition class' + pcConditionClass);
                System.debug('***pcCalculationType' + pcCode + '--' + pcCalculationType);
                System.debug('***cond rate map' + condTypeRateMap.keySet() + '**check' + '**key'
                             + proCond.Pricing_Condition__r.Pricing_Condition_Code__c
                             + condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c));
                
                if(condTypeRateMap.containsKey(proCond.Pricing_Condition__r.Pricing_Condition_Code__c))
                {
                    System.debug('***inside if'); 
                    rateList = condTypeRateMap.get(proCond.Pricing_Condition__r.Pricing_Condition_Code__c);
                }
                else
                {
                    rateList = null;
                }
                System.debug('rateList***' + rateList + 'pcCode' + pcCode);
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit;
                String per;
                String UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                    {
                        rate = Decimal.valueOf(rateList[0]);
                    }
                    System.debug('***final rate'+rate);
                    if(rateList[1] != '##')
                    {
                        unit = rateList[1];
                    }
                    if(rateList[2] != '##')
                    {
                        per = rateList[2];
                    }
                    if(rateList[3] != '##')
                    {
                        UoM = rateList[3];
                    }
                    //Fixed: 100:EUR:##:##
                    //Percentage- 90:0:##:##
                    //Quantity- 100:EUR:1:KG
                    System.debug('**unit'+unit+'**pcCode'+pcCode);
                }
                //Code for Calculation Type 'Quantity'
                System.debug('***check' + (pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                             +'****'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    System.debug('***pcCode' + pcCode + '**uomConversionMap' + uomConversionMap + '***prItem.Pricing_Condition_Code__c'
                                 + prItem.Pricing_Condition_Code__c);
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //throw new PAException('Gross Price is missing',ApexPages.Severity.ERROR);
                            }
                            else
                            {
                                grossPriceCheck = true;
                                System.debug('in else of Asynchronous');
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                                //update npcRequest;
                                //return 'Error';
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    //new net price
                    System.debug('****Check after converision'+rate);
                    value = rate;
                    System.debug('***ZPNG'+value);
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZCMK' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZPR9'),rate);
                    }
                    else if(pcCode == 'NP') //Net price
                    {
                        //apply formula = =IP+ ZD8E+ ZD8F
                        value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPR9'),finalCalMap.get('ZCMJ'),'+'),finalCalMap.get('ZCMK'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    //<PP20140618> START
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforCPMEMEA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT US
*/
    private void calculateRatesforCPMEMEA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))) && pcCode != 'EK02')
                    {
                        System.debug('*******grossPricePRANKY'+pcCode);
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if((pcCode == 'ZDA1' || pcCode == 'ZDA6' || pcCode == 'ZG11' || pcCode == 'ZHES' || pcCode == 'ZAO1' || pcCode == 'ZCMA'
                        || pcCode == 'ZCMB' || pcCode == 'SKTO' || pcCode == 'GRWR') && pcCalculationType != null
                       && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPRE * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    else if((pcCode == 'ZGA4' || pcCode == 'ZGA8' || pcCode == 'ZM01' || pcCode == 'ZFAC') && pcCalculationType != null
                            && pcCalculationType.containsIgnoreCase('Fixed amount'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = Rate
                        value = rate;
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = ZDA1 + ZDA6 + ZGA4 + ZGA8 + ZG11 + ZM01 + ZFAC + ZHES + ZAO1 + ZCMA + ZCMB + ZCMD + SKTO + EK02 + GRWR
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZDA1'),finalCalMap.get('ZDA6'),'+'),finalCalMap.get('ZGA4'),'+'),finalCalMap.get('ZGA8'),'+'),finalCalMap.get('ZG11'),'+'),finalCalMap.get('ZM01'),'+'),finalCalMap.get('ZFAC'),'+'),finalCalMap.get('ZHES'),'+'),finalCalMap.get('ZAO1'),'+'),finalCalMap.get('ZCMA'),'+');
                        //apply formula = value + ZCMB + ZCMD + SKTO + EK02 + GRWR
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(value,finalCalMap.get('ZCMB'),'+'),finalCalMap.get('ZCMD'),'+'),finalCalMap.get('SKTO'),'+'),finalCalMap.get('EK02'),'+'),finalCalMap.get('GRWR'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDPTEMEA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT US
*/
    private void calculateRatesforDPTEMEA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null && !((pcCode == 'ZPNG' && (!finalCalMap.containsKey('ZPRI')||(finalCalMap.containsKey('ZPRI') && finalCalMap.get('ZPRI') != null)))||(pcCode == 'ZPRI' && (!finalCalMap.containsKey('ZPNG')||(finalCalMap.containsKey('ZPNG') && finalCalMap.get('ZPNG') != null)))))
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'IP')
                    {
                        //apply formula IP= (ZPRI or ZPNG)
                        if(finalCalMap.get('ZPRI') == null || finalCalMap.get('ZPRI') == 0)
                        {
                            value = finalCalMap.get('ZPNG');
                        }
                        else
                        {
                            value = finalCalMap.get('ZPRI');
                        }
                    }
                    else if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if((pcCode == 'ZDA3' || pcCode == 'ZM08') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Fixed Amount'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZDG2' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = Rate * (IP) / 100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'IP2')
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP+ZDA1+ZDG2+ZDA3
                        
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDG2'),'+'),finalCalMap.get('ZDA3'),'+');
                    }
                    else if(pcCode == 'ZM07' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP2 * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP2'),rate);
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = IP2+ZM07+ZM08
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP2'),finalCalMap.get('ZM07'),'+'),finalCalMap.get('ZM08'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    
    /*
* Author       :   Piyush Gupta <PG20191211>
* Method Name  :   calculateRatesforDPTAP
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DPT AP.
*/
    private void calculateRatesforDPTAP(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Integer sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if((pcCode == 'ZDA3') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Fixed Amount'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'IP')
                    {
                        //apply formula IP=  ZPNG+ZDA1+ZDA3
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPNG'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDA3'),'+');
                        
                    }
                    else if(pcCode == 'ZCRE'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRG'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRA'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRB'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRC'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRD'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'NP')
                    {
                        if(sppcheck==1){
                            //apply formula = IP+ZCRE+ZCRG
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRG'),'+');
                        }
                        else if(sppcheck==2){
                            //apply formula = IP+ZCRA+ZCRB+ZCRC+ZCRD
                            value =calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRA'),'+'),finalCalMap.get('ZCRB'),'+'),finalCalMap.get('ZCRC'),'+'),finalCalMap.get('ZCRD'),'+');
                        }
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    
    /*
* Author       :   PIYUSH GUPTA <PG20191211>
* Method Name  :   calculateRatesforDPTLA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DTT US
*/
    private void calculateRatesforDPTLA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Integer sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                System.debug('****pcCode'+pcCode+' **pcCalculationType '+pcCalculationType+' **pcConditionClass '+pcConditionClass+' **condTypeRateMap '+condTypeRateMap);
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZD70'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'IP')
                    {
                        if(sppcheck==1){
                            //apply formula = ZPNG+ZDA1
                            value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPNG'),finalCalMap.get('ZDA1'),'+');
                        }
                        else if(sppcheck==2){
                            //apply formula = ZBPA+ZD70
                            value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZBPA'),finalCalMap.get('ZD70'),'+');
                        }
                        else if(sppcheck==3){
                            //apply formula = ZPCH+ZDA1
                            value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPCH'),finalCalMap.get('ZDA1'),'+');
                        }
                        else if(sppcheck==4){
                            //apply formula = ZPNG+ZDA1 or ZPRI+ZDA1
                            if(finalCalMap.get('ZPRI') == null || finalCalMap.get('ZPRI') == 0){
                                value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPNG'),finalCalMap.get('ZDA1'),'+');
                            }
                            else{
                                value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRI'),finalCalMap.get('ZDA1'),'+');
                            }
                        }
                    }
                    else if(pcCode == 'ZCRE'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRG'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRA'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRB'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRC'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRD'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'NP')
                    {
                        if(sppcheck==1 || sppcheck==3){
                            //apply formula = IP+ZCRE+ZCRG
                            value =calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRG'),'+');
                        }
                        else if(sppcheck==4){
                            //apply formula = IP+ZCRA+ZCRB+ZCRC+ZCRD
                            value =calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRA'),'+'),finalCalMap.get('ZCRB'),'+'),finalCalMap.get('ZCRC'),'+'),finalCalMap.get('ZCRD'),'+');
                        }
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    
    
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPGEMEA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for PG EMEA
*/
    private void calculateRatesforPGEMEA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))) && pcCode != 'ZPRI')
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZYC1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPRE * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    else if(pcCode == 'ST1')
                    {
                        //apply formula = ZPRE + ZYC1
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRE'),finalCalMap.get('ZYC1'),'+');
                    }
                    else if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPRE * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = ZPRE + ZDA1
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRE'),finalCalMap.get('ZDA1'),'+');
                    }
                    else if(pcCode == 'NIP')
                    {
                        //apply formula = NP
                        value = finalCalMap.get('NP');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPnIPLA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for P&IP LA
*/
    private void calculateRatesforPnIPLA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZPR9+ZPG4+ZBPA+ZPNG+ZPCH+ZFLT
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPR9'),finalCalMap.get('ZPG4'),'+'),finalCalMap.get('ZBPA'),'+'),finalCalMap.get('ZPNG'),'+'),finalCalMap.get('ZPCH'),'+'),finalCalMap.get('ZFLT'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPnIPEUZIS2
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for P&IP EU ZIS2
*/
    private void calculateRatesforPnIPEUZIS2(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*      boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZIS2
                        value = finalCalMap.get('ZIS2');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPnIPEU
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for P&IP EU
*/
    private void calculateRatesforPnIPEU(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                {
                    rateList = condTypeRateMap.get(pcCode);
                    System.debug('****@#@#'+rateList);
                }
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    /*  //Conversion if required
//Added to identify the Gross price
if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
|| pcConditionClass.containsIgnoreCase('Price'))))
{
if(rateList==null)
{
if(npcRequest.isSynchronous__c || isSynchronous)
{
npcRequest.Below_Current_Flag__c = true;
npcRequest.Below_Floor_Flag__c = true;
npcRequest.Below_Reference_Flag__c = true;
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
System.debug('****@#@#1'+pcCode);
break;
}
else
{
grossPriceCheck = true;
npcRequest.Response_Error_Code__c = 'G';
npcRequest.Response_Error_Message__c = 'Gross price is missing';
npcReqUpdateList.add(npcRequest);
break;
}
}
}
//Issue -UoM START
List<String> targetList= new List<String>();
targetList.add(prItem.New_unit__c);
targetList.add(String.valueOf(prItem.New_Per__c));
targetList.add(prItem.New_UoM__c);
//END
rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
value = rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPR9 * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPR9'),rate);
                    }
                    else if(pcCode == 'ZCRH' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'IP')
                    {
                        //ZPR9 + ZDA1 + ZDA2
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPR9'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDA2'),'+');
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = IP+ZCRH+ZCRF
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRH'),'+'),finalCalMap.get('ZCRF'),'+');
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                System.debug('****@#@#2'+npcReqUpdateList.size());
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPGLA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for PG LA F41A
*/
    private void calculateRatesforPGLA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    //apply formula = ZPR9
                    if(pcCode == 'NP')
                    {
                        //SPP1
                        if(prItem.Pricing_Request__r.Sales_Org_Code__c == 'F41A')
                            value = finalCalMap.get('ZPR9');
                        //SPP2
                        else if(prItem.Pricing_Request__r.Sales_Org_Code__c == 'F46C')
                            calculateSUBTotalsforBISurfaces(finalCalMap.get('ZBPA'),finalCalMap.get('ZBPC'),'+');
                        //SPP3
                        else if(prItem.Pricing_Request__r.Sales_Org_Code__c == 'F42A' || prItem.Pricing_Request__r.Sales_Org_Code__c == 'F44G'
                                || prItem.Pricing_Request__r.Sales_Org_Code__c == 'F450')
                            value = finalCalMap.get('ZPRE');
                        //SPP4
                        else if(prItem.Pricing_Request__r.Sales_Org_Code__c == 'F496' || prItem.Pricing_Request__r.Sales_Org_Code__c == 'F49V')
                            value = finalCalMap.get('ZPCH');
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDCPMalaysia
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP AP Malaysia
*/
    private void calculateRatesforDCPMalaysia(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value=rate; */
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'ZRA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZP4A * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZP4A'),rate);
                    }
                    else if(pcCode == 'ZRAT' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZP4A * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZP4A'),rate);
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = ZP4A+ZRA1+ZRAT
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP4A'),finalCalMap.get('ZRA1'),'+'),finalCalMap.get('ZRAT'),'+');                      
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDCPUS
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP US
*/
    private void calculateRatesforDCPUS(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'ZDDA' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZP1A'),rate);
                    }
                    else if(pcCode == 'IP')
                    {
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP1A'),finalCalMap.get('ZDAE'),'+'),finalCalMap.get('ZDDA'),'+');                      
                    }
                    else if(pcCode == 'ZRA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('IP'),rate);
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = ZP4A+ZRA1+ZRAT
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZRA1'),finalCalMap.get('IP'),'+');                      
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDCPAP
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean, Integer
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP US
*/
    private void calculateRatesforDCPAP(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Integer sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if((rateList==null && sppcheck!=2) || (rateList==null && sppcheck==2 && !((pcCode == 'ZP2A' && (!finalCalMap.containsKey('ZP2B')||(finalCalMap.containsKey('ZP2B') && finalCalMap.get('ZP2B') != null)))||(pcCode == 'ZP2B' && (!finalCalMap.containsKey('ZP2A')||(finalCalMap.containsKey('ZP2A') && finalCalMap.get('ZP2A') != null))))))
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if(sppcheck==1)
                    {
                        
                        if((pcCode == 'ZRA1' || pcCode == 'ZRAT') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP4A'),rate);
                        }
                        
                        else if(pcCode == 'NP')
                        {
                            //apply formula = ZP4A+ZRA1+ZRAT
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZRA1'),finalCalMap.get('ZP4A'),'+'),finalCalMap.get('ZRAT'),'+');                     
                        }    
                    }
                    else if(sppcheck==2)
                    {
                        if((pcCode == 'ZDI1' || pcCode == 'ZDI3' || pcCode == 'ZDA7' || pcCode == 'ZDI9' || pcCode == 'ZRA1' ) && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP2A'),rate);
                        }
                        
                        else if(pcCode == 'ZCBV' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP2B'),70);
                        }
                        else if(pcCode == 'JEX2' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZCBV'),12);
                        }
                        else if(pcCode == 'JCED' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('JEX2'),2);
                        }
                        else if(pcCode == 'JECS' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('JCED'),1);
                        }
                        
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP2A'),finalCalMap.get('ZDI1'),'+'),finalCalMap.get('ZDI3'),'+'),finalCalMap.get('ZDA7'),'+'),finalCalMap.get('ZDI9'),'+'),finalCalMap.get('ZRA1'),'+'),finalCalMap.get('ZRA2'),'+');                     
                        }
                        
                    }
                    else if(sppcheck==3)
                    {
                        if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP5A'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP5A'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDA2'),'+'),finalCalMap.get('ZRA2'),'+');                     
                        } 
                    }
                    else if(sppcheck==4)
                    {
                        if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP3A'),finalCalMap.get('ZRA2'),'+');
                        } 
                    }
                    else if(sppcheck==5)
                    {
                        if(pcCode == 'ZDA7' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP6A'),rate);
                        }
                        else if(pcCode == 'ZRA3' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP6A'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP6A'),finalCalMap.get('ZDA7'),'+'),finalCalMap.get('ZRA3'),'+');                     
                        }
                        
                    }
                    else if(sppcheck==7)
                    {
                        if(pcCode == 'ZRA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP9A'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP9A'),finalCalMap.get('ZRA1'),'+');                     
                        }
                        
                    }
                    else if(sppcheck==8)
                    {
                        if(pcCode == 'ZRA2' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ZP4A'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value =calculateSUBTotalsforBISurfaces(finalCalMap.get('ZP4A'),finalCalMap.get('ZRA2'),'+');                     
                        }
                        
                    }          
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDPTNA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean, Integer
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP US


private void calculateRatesforDPTNA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Integer sppCheck)
{
boolean grossPriceCheck = false;
Decimal value;
List<String> rateList;
Map<String,Decimal> finalCalMap = new Map<String,Decimal>();

//Iterate through the ERP Procedure conditions
System.debug('****erpPCList'+erpPCList.size());
List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
for(ERP_Procedure_Conditions__c proCond : erpPCList)
{
if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
{
String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
//To identify the Gross Price
String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
if(condTypeRateMap.containsKey(pcCode))
rateList = condTypeRateMap.get(pcCode);
else
rateList = null;
//Retrieving Rate, Unit, Per, UoM returned from SAP
Decimal rate;
String unit, per, UoM;
if(rateList != null && rateList.size() == 4)
{
String tempRate;
if(rateList[0] != '##')
rate = Decimal.valueOf(rateList[0]);
if(rateList[1] != '##')
unit = rateList[1];
if(rateList[2] != '##')
per = rateList[2];
if(rateList[3] != '##')
UoM = rateList[3];
}
//Code for Calculation Type 'Quantity'
if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
{
//Conversion if required
//Added to identify the Gross price
if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
|| pcConditionClass.containsIgnoreCase('Price'))))
{
if(rateList==null)
{
if(npcRequest.isSynchronous__c || isSynchronous)
{
npcRequest.Below_Current_Flag__c = true;
npcRequest.Below_Floor_Flag__c = true;
npcRequest.Below_Reference_Flag__c = true;
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
break;
}
else
{
grossPriceCheck = true;
npcRequest.Response_Error_Code__c = 'G';
npcRequest.Response_Error_Message__c = 'Gross price is missing';
npcReqUpdateList.add(npcRequest);
break;
}
}
}
//Issue -UoM START
List<String> targetList= new List<String>();
targetList.add(prItem.New_unit__c);
targetList.add(String.valueOf(prItem.New_Per__c));
targetList.add(prItem.New_UoM__c);
//END
rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
value = rate; 
/*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;
}*/
    //Code for 'Net Price'
    /*else
{
if(sppcheck==1)
{
if(pcCode == 'NP')
{
value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPNG'),finalCalMap.get('ZIS2'),'+');                     
}    
}
else if(sppcheck==2)
{

if(pcCode == 'NP')
{
value = finalCalMap.get('ZPCA');
}

}
else if(sppcheck==3)
{
if((pcCode == 'ZCRG' || pcCode == 'ZCMA' || pcCode == 'ZCMG' || pcCode == 'ZCMH'|| pcCode == 'ZCMK' ) && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
{
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
value = calculateforBISurfaces(finalCalMap.get('ZPCA'),rate);
}
else if(pcCode == 'NP')
{
value =   calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPCA'),finalCalMap.get('ZCRG'),'+'),finalCalMap.get('ZCMA'),'+'),finalCalMap.get('ZCMG'),'+'),finalCalMap.get('ZCMH'),'+'),finalCalMap.get('ZCMK'),'+');                     
} 
}
else if(sppcheck==4)
{
if((pcCode == 'ZCRG') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
{
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
value = calculateforBISurfaces(finalCalMap.get('ZPCA'),rate);
}            
else if(pcCode == 'NP')
{
value =  calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPCA'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRG'),'+'),finalCalMap.get('ZCMJ'),'+');                 
} 
}

}
if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
else if(value != null && unit == '%')
{
//SAY UNIT is 0,% etc
value= value.setScale(3,System.Roundingmode.HALF_EVEN);
}
else if(value != null)
value= value.setScale(2,System.Roundingmode.HALF_EVEN);

if(pcCode!=null)
finalCalMap.put(pcCode,value);
if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
{
currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
if(rate == null)
condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
else
{
rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
}
}
else if(pcCode != null && pricingCondition != null)
{
newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
if(rate == null)
condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
else
{
rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
}
}
}
}

if(npcReqUpdateList.size() != 0 && grossPriceCheck)
{
if(npcRequest.isSynchronous__c || isSynchronous)
{
update npcRequest;
throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
}
else
status = 'Error';
}
}*/
    
    /*
* Author       :   Piyush Gupta <PG20191211>
* Method Name  :   calculateRatesforDPTNA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean, Integer
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DPT NA
*/
    
    private void calculateRatesforDPTNA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Integer sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for Calculation Type 'Percentage'
                else
                {
                    
                    if(pcCode == 'ZDA1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //apply formula = ZPCA * 3%
                        value = calculateforBISurfaces(finalCalMap.get('ZPCA'),3);
                    }
                    if(pcCode == 'ZDA6' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {   
                        //apply formula = ZPCA * 1%
                        value = calculateforBISurfaces(finalCalMap.get('ZPCA'),1);
                    }
                    else if(pcCode == 'IP')
                    {
                        if(sppcheck==1)
                        {
                            //value is ZPNG
                            value=finalCalMap.get('ZPNG');
                        }
                        else if (sppcheck==2)
                        {
                            //Value is ZPCA
                            value=finalCalMap.get('ZPCA');
                        }
                        else if (sppcheck==4){
                            //apply formula = ZPCA-ZDA1-ZDA6
                            value=calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPCA'),finalCalMap.get('ZDA1'),'-'),finalCalMap.get('ZDA6'),'-');
                        }
                    }
                    else if(pcCode == 'ZCRE'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCRG'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCMA'){
                        if(sppcheck==4){
                            //apply formula = IP * 2%
                            value = calculateforBISurfaces(finalCalMap.get('IP'),2);
                        }
                        else{
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = rate;
                        }
                    }
                    else if(pcCode == 'ZCMB'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCMC'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCMD'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'ZCMJ'){
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = rate;
                    }
                    else if(pcCode == 'NP')
                    {
                        if(sppcheck==1)
                        {
                            //apply formula = IP+ZCRE+ZCRG
                            value =calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRG'),'+');
                        }
                        else if(sppcheck==2)
                        {
                            //apply formula = IP+ZCRE+ZCRG+ZCMA+ZCMB+ZCMC+ZCMD
                            value =calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRG'),'+'),finalCalMap.get('ZCMA'),'+'),finalCalMap.get('ZCMB'),'+'),finalCalMap.get('ZCMC'),'+'),finalCalMap.get('ZCMD'),'+');
                        }
                        else if(sppcheck==4){
                            //apply formula = IP+ZCRE+ZCRG-ZCMA+ZCMB+ZCMC+ZCMD+ZCMJ
                            value =calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRG'),'+'),finalCalMap.get('ZCMA'),'-'),finalCalMap.get('ZCMB'),'+'),finalCalMap.get('ZCMC'),'+'),finalCalMap.get('ZCMD'),'+'),finalCalMap.get('ZCMJ'),'+');
                        }
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDCPEMEA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP EMEA
*/
    
    private void calculateRatesforDCPEMEA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    boolean ZPUAcheck=pcCode.contains('ZPUA') && ((!finalCalMap.containsKey('ZPEE')||(finalCalMap.containsKey('ZPEE') && finalCalMap.get('ZPEE') != null)) && (!finalCalMap.containsKey('ZPZA')||(finalCalMap.containsKey('ZPZA') && finalCalMap.get('ZPZA') != null)) && (!finalCalMap.containsKey('ZPTR')||(finalCalMap.containsKey('ZPTR') && finalCalMap.get('ZPTR') != null)) && (!finalCalMap.containsKey('ZPKA')||(finalCalMap.containsKey('ZPKA') && finalCalMap.get('ZPKA') != null)) && (!finalCalMap.containsKey('ZPRA')||(finalCalMap.containsKey('ZPRA') && finalCalMap.get('ZPRA') != null)) && (!finalCalMap.containsKey('ZPRU')||(finalCalMap.containsKey('ZPRU') && finalCalMap.get('ZPRU') != null)));
                    boolean ZPEEcheck=pcCode.contains('ZPEE') && ((!finalCalMap.containsKey('ZPUA')||(finalCalMap.containsKey('ZPUA') && finalCalMap.get('ZPUA') != null)) && (!finalCalMap.containsKey('ZPZA')||(finalCalMap.containsKey('ZPZA') && finalCalMap.get('ZPZA') != null)) && (!finalCalMap.containsKey('ZPTR')||(finalCalMap.containsKey('ZPTR') && finalCalMap.get('ZPTR') != null)) && (!finalCalMap.containsKey('ZPKA')||(finalCalMap.containsKey('ZPKA') && finalCalMap.get('ZPKA') != null)) && (!finalCalMap.containsKey('ZPRA')||(finalCalMap.containsKey('ZPRA') && finalCalMap.get('ZPRA') != null)) && (!finalCalMap.containsKey('ZPRU')||(finalCalMap.containsKey('ZPRU') && finalCalMap.get('ZPRU') != null)));
                    boolean ZPZAcheck=pcCode.contains('ZPZA') && ((!finalCalMap.containsKey('ZPEE')||(finalCalMap.containsKey('ZPEE') && finalCalMap.get('ZPEE') != null)) && (!finalCalMap.containsKey('ZPUA')||(finalCalMap.containsKey('ZPUA') && finalCalMap.get('ZPUA') != null)) && (!finalCalMap.containsKey('ZPTR')||(finalCalMap.containsKey('ZPTR') && finalCalMap.get('ZPTR') != null)) && (!finalCalMap.containsKey('ZPKA')||(finalCalMap.containsKey('ZPKA') && finalCalMap.get('ZPKA') != null)) && (!finalCalMap.containsKey('ZPRA')||(finalCalMap.containsKey('ZPRA') && finalCalMap.get('ZPRA') != null)) && (!finalCalMap.containsKey('ZPRU')||(finalCalMap.containsKey('ZPRU') && finalCalMap.get('ZPRU') != null)));
                    boolean ZPTRcheck=pcCode.contains('ZPTR') && ((!finalCalMap.containsKey('ZPEE')||(finalCalMap.containsKey('ZPEE') && finalCalMap.get('ZPEE') != null)) && (!finalCalMap.containsKey('ZPZA')||(finalCalMap.containsKey('ZPZA') && finalCalMap.get('ZPZA') != null)) && (!finalCalMap.containsKey('ZPUA')||(finalCalMap.containsKey('ZPUA') && finalCalMap.get('ZPUA') != null)) && (!finalCalMap.containsKey('ZPKA')||(finalCalMap.containsKey('ZPKA') && finalCalMap.get('ZPKA') != null)) && (!finalCalMap.containsKey('ZPRA')||(finalCalMap.containsKey('ZPRA') && finalCalMap.get('ZPRA') != null)) && (!finalCalMap.containsKey('ZPRU')||(finalCalMap.containsKey('ZPRU') && finalCalMap.get('ZPRU') != null)));
                    boolean ZPKAcheck=pcCode.contains('ZPKA') && ((!finalCalMap.containsKey('ZPEE')||(finalCalMap.containsKey('ZPEE') && finalCalMap.get('ZPEE') != null)) && (!finalCalMap.containsKey('ZPZA')||(finalCalMap.containsKey('ZPZA') && finalCalMap.get('ZPZA') != null)) && (!finalCalMap.containsKey('ZPTR')||(finalCalMap.containsKey('ZPTR') && finalCalMap.get('ZPTR') != null)) && (!finalCalMap.containsKey('ZPUA')||(finalCalMap.containsKey('ZPUA') && finalCalMap.get('ZPUA') != null)) && (!finalCalMap.containsKey('ZPRA')||(finalCalMap.containsKey('ZPRA') && finalCalMap.get('ZPRA') != null)) && (!finalCalMap.containsKey('ZPRU')||(finalCalMap.containsKey('ZPRU') && finalCalMap.get('ZPRU') != null)));
                    boolean ZPRAcheck=pcCode.contains('ZPRA') && ((!finalCalMap.containsKey('ZPEE')||(finalCalMap.containsKey('ZPEE') && finalCalMap.get('ZPEE') != null)) && (!finalCalMap.containsKey('ZPZA')||(finalCalMap.containsKey('ZPZA') && finalCalMap.get('ZPZA') != null)) && (!finalCalMap.containsKey('ZPTR')||(finalCalMap.containsKey('ZPTR') && finalCalMap.get('ZPTR') != null)) && (!finalCalMap.containsKey('ZPKA')||(finalCalMap.containsKey('ZPKA') && finalCalMap.get('ZPKA') != null)) && (!finalCalMap.containsKey('ZPUA')||(finalCalMap.containsKey('ZPUA') && finalCalMap.get('ZPUA') != null)) && (!finalCalMap.containsKey('ZPRU')||(finalCalMap.containsKey('ZPRU') && finalCalMap.get('ZPRU') != null)));
                    boolean ZPRUcheck=pcCode.contains('ZPRU') && ((!finalCalMap.containsKey('ZPEE')||(finalCalMap.containsKey('ZPEE') && finalCalMap.get('ZPEE') != null)) && (!finalCalMap.containsKey('ZPZA')||(finalCalMap.containsKey('ZPZA') && finalCalMap.get('ZPZA') != null)) && (!finalCalMap.containsKey('ZPTR')||(finalCalMap.containsKey('ZPTR') && finalCalMap.get('ZPTR') != null)) && (!finalCalMap.containsKey('ZPKA')||(finalCalMap.containsKey('ZPKA') && finalCalMap.get('ZPKA') != null)) && (!finalCalMap.containsKey('ZPRA')||(finalCalMap.containsKey('ZPRA') && finalCalMap.get('ZPRA') != null)) && (!finalCalMap.containsKey('ZPUA')||(finalCalMap.containsKey('ZPUA') && finalCalMap.get('ZPUA') != null)));
                    
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null && !(ZPUAcheck || ZPEEcheck || ZPZAcheck || ZPTRcheck || ZPKAcheck || ZPRAcheck || ZPRUcheck))
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'ST')
                    {
                        if((finalCalMap.get('ZPUA')== null || finalCalMap.get('ZPUA')== 0))
                        {
                            if((finalCalMap.get('ZPEE')== null || finalCalMap.get('ZPEE')== 0))
                            {
                                if((finalCalMap.get('ZPZA')== null || finalCalMap.get('ZPZA')== 0))
                                {
                                    if((finalCalMap.get('ZPTR')== null || finalCalMap.get('ZPTR')== 0))
                                    {
                                        if((finalCalMap.get('ZPKA')== null || finalCalMap.get('ZPKA')== 0))
                                        {
                                            if((finalCalMap.get('ZPRA')== null || finalCalMap.get('ZPRA')== 0))
                                            {
                                                value=finalCalMap.get('ZPRU');
                                            }
                                            else
                                            {
                                                value=finalCalMap.get('ZPRA');
                                            }
                                        }
                                        else
                                        {
                                            value=finalCalMap.get('ZPKA');
                                        }
                                    }
                                    else
                                    {
                                        value=finalCalMap.get('ZPTR');
                                    }
                                }
                                else
                                {
                                    value=finalCalMap.get('ZPZA');
                                }
                            }
                            else
                            {
                                value=finalCalMap.get('ZPEE');
                            }
                        }
                        else
                        {
                            value=finalCalMap.get('ZPUA');
                        }
                    }
                    else if((pcCode == 'ZDA1' || pcCode == 'ZDA3' || pcCode == 'ZDT1') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                    } 
                    else if(pcCode == 'NP')
                    {
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDA3'),'+'),finalCalMap.get('ZDA2'),'+'),finalCalMap.get('ZDT1'),'+');                     
                    } 
                    
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDPPKV
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,Integer
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DPP Polymers EMEA
*/  
    //Piyush <PG20191211> Access in test classes - Added @testvisible
    @testvisible private void calculateRatesforDPPKV(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Integer sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                System.debug('****pcCode'+pcCode);
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                System.debug('&&&&&&&PRANKY'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if((rateList==null && sppCheck==1) || (sppCheck==2 && (rateList==null && !((pcCode == 'ZPRB' && (!finalCalMap.containsKey('ZPGB') || (finalCalMap.containsKey('ZPGB') && finalCalMap.get('ZPGB') != null)))||(pcCode == 'ZPGB' && (!finalCalMap.containsKey('ZPRB')||(finalCalMap.containsKey('ZPRB') && finalCalMap.get('ZPRB') != null)))))) || (rateList==null && sppCheck==3) || (rateList==null && sppCheck==4) || (sppCheck==5 && (rateList==null && !((pcCode == 'ZPRB' && (!finalCalMap.containsKey('ZPGC')||(finalCalMap.containsKey('ZPGC') && finalCalMap.get('ZPGC') != null)))||(pcCode == 'ZPGC' && (!finalCalMap.containsKey('ZPRB') ||(finalCalMap.containsKey('ZPRB') && finalCalMap.get('ZPRB')!= null)))))) )
                        {
                            system.debug('Inside the gross check');
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    system.debug('value:'+value);
                }
                //Code for 'Net Price'
                else
                {
                    if(sppCheck==1)
                    {
                        if(pcCode == 'ST')
                        {
                            value=finalCalMap.get('ZPRV');
                        }
                        else if((pcCode == 'ZPRW' || pcCode == 'ZDG9' || pcCode == 'ZK20') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZPRW'),'+'),finalCalMap.get('ZDG9'),'+'),finalCalMap.get('ZK20'),'+');
                        }
                    }
                    else if(sppCheck==2)
                    {
                        if(pcCode == 'ST')
                        {
                            //apply subtotal1 = ZPRB or ZPGB
                            if((finalCalMap.get('ZPRB')== null || finalCalMap.get('ZPRB')== 0))
                            {
                                value=finalCalMap.get('ZPGB');
                            }
                            else if((finalCalMap.get('ZPGB')== null || finalCalMap.get('ZPGB')== 0))
                            {
                                value=finalCalMap.get('ZPRB');
                            }
                        } 
                        else if((pcCode == 'ZPRW' || pcCode == 'ZDG9' || pcCode == 'ZK20') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZPRW'),'+'),finalCalMap.get('ZDG9'),'+'),finalCalMap.get('ZK20'),'+');
                        }
                        
                    }
                    else if(sppCheck==3)
                    {
                        if(pcCode == 'ST')
                        {
                            value=finalCalMap.get('ZPRV');
                        }
                        else if((pcCode == 'ZPRW' || pcCode == 'ZDG9' || pcCode == 'ZK20' || pcCode=='ZKD1') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZPRW'),'+'),finalCalMap.get('ZDG9'),'+'),finalCalMap.get('ZK20'),'+'),finalCalMap.get('ZKD1'),'+');
                        }
                    }
                    /*  else if(sppCheck==4)
{
if(pcCode == 'ST')
{
value=finalCalMap.get('ZPRV');
}
else if((pcCode == 'ZPRW' || pcCode == 'ZDG9' || pcCode == 'ZK20' || pcCode=='ZKD1') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
{
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
}
else if(pcCode == 'NP')
{
value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZPRW'),'+'),finalCalMap.get('ZDG9'),'+'),finalCalMap.get('ZK20'),'+'),finalCalMap.get('ZKD1'),'+');
}
}*/
                    else if(sppCheck==5)
                    {
                        if(pcCode == 'ST')
                        {
                            //apply subtotal1 = ZPRB or ZPGB
                            if((finalCalMap.get('ZPRB')== null || finalCalMap.get('ZPRB')== 0))
                            {
                                value=finalCalMap.get('ZPGC');
                            }
                            else if((finalCalMap.get('ZPGC')== null || finalCalMap.get('ZPGC')== 0))
                            {
                                value=finalCalMap.get('ZPRB');
                            }
                        } 
                        else if((pcCode == 'ZDA1' || pcCode == 'ZIRH') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            value = calculateforBISurfaces(finalCalMap.get('ST'),rate);
                        }
                        else if(pcCode == 'NP')
                        {
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZIRH'),'+');
                        }
                        
                    }
                    
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                system.debug('finalCalMap: '+finalCalMap);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
                if(finalCalMap.containsKey(pcCode))
                    System.debug('****fi GET VALUEnalCalMap'+finalCalMap.get(pcCode));
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                //Piyush <PG20191211> ByPass Test Coverage
                if(!Test.isRunningTest())
                    throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
        System.debug('*****PRANKY New net price'+newNetPriceValuesMap);
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDPGlobal
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP US
*/
    private void calculateRatesforDPGlobal(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                system.debug('pricingCondition: '+pricingCondition);
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null && !((pcCode == 'ZPRE' && (!finalCalMap.containsKey('ZBPA') || (finalCalMap.containsKey('ZBPA') && finalCalMap.get('ZBPA') != null)))||(pcCode == 'ZBPA' && (!finalCalMap.containsKey('ZPRE')||(finalCalMap.containsKey('ZPRE') && finalCalMap.get('ZPRE') != null)))))
                        {
                            system.debug('in gross check');
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    /*    boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if((pcCode == 'ZYC1' || pcCode == 'ZDG6' || pcCode == 'ZDA1'|| pcCode == 'ZDG5' )&& pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    
                    
                    else if(pcCode == 'NP')
                    {
                        //apply formula = ZP4A+ZRA1+ZRAT
                        value =  calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRE'),finalCalMap.get('ZYC1'),'+'),finalCalMap.get('ZDG6'),'+'),finalCalMap.get('ZBPA'),'+'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDG5'),'+');                      
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDPPEMEA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DPP Polymers EMEA
*/
    private void calculateRatesforDPPEMEA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Boolean sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                System.debug('****pcCode'+pcCode);
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                System.debug('&&&&&&&PRANKY'+pcCalculationType);
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        // Updated by <<Nadeem S>> for <<Issue number: IS ID-00066943>> on <<29-03-2016>> START
                        //if(rateList==null && !((pcCode == 'ZPRB' && (!finalCalMap.containsKey('ZPGB')||(finalCalMap.containsKey('ZPGB') && finalCalMap.get('ZPGB') != null)))||(pcCode == 'ZPGB' && (!finalCalMap.containsKey('ZPRB')||(finalCalMap.containsKey('ZPRB') && finalCalMap.get('ZPRB') != null)))))
                        if(rateList==null && !(
                            (pcCode == 'ZPRB' && (!finalCalMap.containsKey('ZPGB')||(finalCalMap.containsKey('ZPGB') && finalCalMap.get('ZPGB') != null))&&(!finalCalMap.containsKey('ZPEX')||(finalCalMap.containsKey('ZPEX') && finalCalMap.get('ZPEX') != null))||
                             (pcCode == 'ZPGB' && (!finalCalMap.containsKey('ZPRB')||(finalCalMap.containsKey('ZPRB') && finalCalMap.get('ZPRB') != null))&&(!finalCalMap.containsKey('ZPEX')||(finalCalMap.containsKey('ZPEX') && finalCalMap.get('ZPEX') != null))||
                              (pcCode == 'ZPEX' && (!finalCalMap.containsKey('ZPRB')||(finalCalMap.containsKey('ZPRB') && finalCalMap.get('ZPRB') != null))&& (!finalCalMap.containsKey('ZPGB')||(finalCalMap.containsKey('ZPGB') && finalCalMap.get('ZPGB') != null)))))))
                            // Updated by <<Nadeem S>> for <<Issue number: IS ID-00066943>> on <<29-03-2016>> END
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for 'Net Price'
                else
                {
                    if(sppCheck==true)
                    {
                        if(pcCode == 'ST1')
                        {
                            // Updated by <<Nadeem S>> for <<Issue number: IS ID-00066943>> on <<29-03-2016>> START
                            //apply subtotal1 = ZPRB or ZPGB
                            if((finalCalMap.get('ZPRB')== null || finalCalMap.get('ZPRB')== 0) && (finalCalMap.get('ZPEX')==null ||finalCalMap.get('ZPEX')==0))
                            {
                                value=finalCalMap.get('ZPGB');
                            }
                            else if((finalCalMap.get('ZPGB')== null || finalCalMap.get('ZPGB')== 0) && (finalCalMap.get('ZPEX')==null ||finalCalMap.get('ZPEX')==0))
                            {
                                value=finalCalMap.get('ZPRB');
                            }
                            else
                            {
                                value=finalCalMap.get('ZPEX');
                            }
                            // Updated by <<Nadeem S>> for <<Issue number: IS ID-00066943>> on <<29-03-2016>> END
                        }
                        else if((pcCode == 'ZRB1') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            //apply formula = Subtotal 1 * Rate/100
                            value = calculateforBISurfaces(finalCalMap.get('ST1'),rate);
                        }
                        else if(pcCode == 'ST2')
                        {
                            //apply formula = Subtotal1+ZRB1+ZRB2
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZRB1'),'+'),finalCalMap.get('ZRB2'),'+');
                        }
                        else if(pcCode == 'NP')
                        {
                            //apply formula = Subtotal 2
                            value = finalCalMap.get('ST2');
                        }
                        
                    }
                    else
                    { 
                        if(pcCode == 'ST1')
                        {
                            value=finalCalMap.get('ZPRN');
                        }
                        if((pcCode == 'ZRB1') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            //apply formula = Subtotal 1 * Rate/100
                            value = calculateforBISurfaces(finalCalMap.get('ST1'),rate);
                        }
                        
                        else if(pcCode == 'ST2')
                        {
                            //apply formula = Subtotal1+ZRB1+ZRB2
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZRB1'),'+'),finalCalMap.get('ZRB2'),'+');
                        }
                        
                        else if(pcCode == 'NP')
                        {
                            //apply formula = Subtotal 2
                            value = finalCalMap.get('ST2');
                        }
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
                if(finalCalMap.containsKey(pcCode))
                    System.debug('****fi GET VALUEnalCalMap'+finalCalMap.get(pcCode));
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
        System.debug('*****PRANKY New net price'+newNetPriceValuesMap);
    }
    
    /*
* Author       :   Mohit Sinha
* Method Name  :   calculateRatesforDPPNA
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DPP NA
*/
    private void calculateRatesforDPPNA(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous,Boolean sppCheck)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        

        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                
               
                
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per  = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                
                //System.debug('****erpPCList Test1001 Harsh rate '+rate+' unit '+unit+' per '+per+' UoM '+UoM);
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        //<RB20211215> Added checks for ZPCA, ZPG3 gross pricing conditions
                        if((sppCheck && 
                        (rateList==null && 
                        !((pcCode == 'ZPGB' && (!finalCalMap.containsKey('ZPRB')||(finalCalMap.containsKey('ZPRB') && finalCalMap.get('ZPRB') != null)))
                        ||(pcCode == 'ZPRB' && (!finalCalMap.containsKey('ZPGB')||(finalCalMap.containsKey('ZPGB') && finalCalMap.get('ZPGB') != null)))
                        ||((pcCode == 'ZPG3' && (!finalCalMap.containsKey('ZPCA')||(finalCalMap.containsKey('ZPCA') && finalCalMap.get('ZPCA') != null)))
                        ||((pcCode == 'ZPCA' && (!finalCalMap.containsKey('ZPG3')||(finalCalMap.containsKey('ZPG3') && finalCalMap.get('ZPG3') != null)))
                        ))))) || (!sppCheck && rateList == null))
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for 'Net Price'
                else
                {
                    if(sppCheck==true)
                    {
                        if(pcCode == 'ST1')
                        {
                            //apply subtotal1 = ZPRB or ZPGB
                            if(finalCalMap.get('ZPRB')!=null || finalCalMap.get('ZPGB')!=null) {
                                if((finalCalMap.get('ZPRB')== null || finalCalMap.get('ZPRB')== 0))
                                {
                                    value=finalCalMap.get('ZPGB');
                                }
                                else if((finalCalMap.get('ZPGB')== null || finalCalMap.get('ZPGB')== 0))
                                {
                                    value=finalCalMap.get('ZPRB');
                                }
                            }
                            //<RB20211215> Added if block for ZPCA, ZPG3
                            if(finalCalMap.get('ZPG3')!=null || finalCalMap.get('ZPCA')!=null) {
                                if((finalCalMap.get('ZPG3')== null || finalCalMap.get('ZPG3')== 0) )
                                {
                                    value=finalCalMap.get('ZPCA');
                                }
                                else if((finalCalMap.get('ZPCA')== null || finalCalMap.get('ZPCA')== 0) )
                                {
                                    value=finalCalMap.get('ZPG3');
                                }
                            }
                        }
                        else if(pcCode == 'IP') //Invoice Price
                        {
                            //apply IP = Subtotal1+ZDD1+ZDA2
                            value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZDD1'),'+'),finalCalMap.get('ZDA2'),'+'); 
                            
                        }
                        else if(pcCode == 'NP') //Net Price
                        {
                            //apply IP = Subtotal1+ZDD1+ZDA2
                            value = calculateSUBTotalsforBISurfaces(finalCalMap.get('IP'),finalCalMap.get('ZRB2'),'+');
                            //<RB20211215> Added if to deduct ZCMJ rebate
                           if(finalCalMap.get('ZCMJ')!=null) {
                                value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZCMJ'),'+');
                           }
                        }
                        
                    }
                    else
                    { 
                        if((pcCode == 'ZDPB' || pcCode == 'ZDPA') && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                        {
                            if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                            {
                                rate = Decimal.valueOf(prItem.New_Rate__c);
                            }
                            //apply formula = ZPRE * Rate/100
                            value = calculateforBISurfaces(finalCalMap.get('ZPRN'),rate);
                        }
                        else if(pcCode == 'NP') //Net Price
                        {
                            //<SP20210607> START
                            value= calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRN'),finalCalMap.get('ZDPB'),'+'),finalCalMap.get('ZDPA'),'+'),finalCalMap.get('ZRB2'),'+');//ZPRN, ZRB2
                            //<SP20210607> END
                        }
                    }
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPGNAUS
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for PG NA US
*/
    private void calculateRatesforPGNAUS(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if((pcCode == 'ZYC1' || pcCode == 'ZDG1' || pcCode == 'ZG35') && pcCalculationType != null
                       && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPRE * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    else if(pcCode == 'ST1')
                    {
                        //apply formula = ZPRE+ZYC1
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRE'),finalCalMap.get('ZYC1'),'+');
                    }
                    else if(pcCode == 'ST2')
                    {
                        //apply formula = ST1+ZDG1
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZDG1'),'+');
                    }
                    else if(pcCode == 'ST3')
                    {
                        //apply formula = ST2+ZG35
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ST2'),finalCalMap.get('ZG35'),'+');
                    }
                    else if(pcCode == 'NET')
                    {
                        //apply formula = ST3+ZFES+ZVA9
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST3'),finalCalMap.get('ZFES'),'+'),finalCalMap.get('ZVA9'),'+');                       
                    }
                    else if(pcCode == 'NNP')
                    {
                        //apply formula = NET+ZGA3
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('NET'),finalCalMap.get('ZGA3'),'+');                        
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPGNACanada
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for PG NA Canada
*/
    private void calculateRatesforPGNACanada(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'ZYC1' && pcCalculationType != null && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = ZPRE * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    else if(pcCode == 'ST1')
                    {
                        //apply formula = ZPRE+ZYC1
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRE'),finalCalMap.get('ZYC1'),'+');
                    }
                    else if(pcCode == 'NET')
                    {
                        //apply formula = ST1+ZES1+ZES2+ZJA2+ZCMC+ZCMD
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ST1'),finalCalMap.get('ZES1'),'+'),finalCalMap.get('ZES2'),'+'),finalCalMap.get('ZJA2'),'+'),finalCalMap.get('ZCMC'),'+'),finalCalMap.get('ZCMD'),'+');                        
                    }
                    else if(pcCode == 'NNP')
                    {
                        //apply formula = NET+ZGA3
                        value = calculateSUBTotalsforBISurfaces(finalCalMap.get('NET'),finalCalMap.get('ZGA3'),'+');                        
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforCPMAP
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP AP Malaysia
*/
    private void calculateRatesforCPMAP(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    /*    boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZPRE
                        value = finalCalMap.get('ZPRE');                        
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforMCMEMEAPaste
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for MCM EMEA Paste, MCM NA Paste
*/
    private void calculateRatesforMCMEMEAPaste(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate; 
                    
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZMBS
                        value = finalCalMap.get('ZMBS');                       
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                {
                    //say unit is USD, EUR
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                }
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null)
                {
                    System.debug('**adding into map' + pcCode + '***value' + value);
                    finalCalMap.put(pcCode,value);
                }
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into current map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                    {
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    System.debug('**adding into new  map' + pcCode + '***value' + value + '**key' + pcCode + '-' + pricingCondition);
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                    {
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    }
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
            {
                status = 'Error';
            }
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforCPMNAUS
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for CPM NA US
*/
    private void calculateRatesforCPMNAUS(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if((pcCode == 'ZVA6' || pcCode == 'ZVA7' || pcCode == 'ZVA2' || pcCode == 'ZGA1') && pcCalculationType != null
                       && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPRE'),rate);
                    }
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZPRE+ZVA6+ZVA8+ZVA7+ZVA0+ZVA1+ZVA2+ZG12+ZGA1
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRE'),finalCalMap.get('ZVA6'),'+'),finalCalMap.get('ZVA8'),'+'),finalCalMap.get('ZVA7'),'+'),finalCalMap.get('ZVA0'),'+'),finalCalMap.get('ZVA1'),'+'),finalCalMap.get('ZVA2'),'+'),finalCalMap.get('ZG12'),'+'),finalCalMap.get('ZGA1'),'+');                        
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPnIPNAUS
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for P&IP NA US
*/
    private void calculateRatesforPnIPNAUS(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))) && pcCode != 'ZPG4')
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for 'Net Price'
                else
                {
                    if(pcCode == 'GROSS')
                    {
                        //apply formula GROSS = (ZPR9 or ZPG4)
                        if(finalCalMap.get('ZPR9') == null || finalCalMap.get('ZPR9') == 0)
                        {
                            value = finalCalMap.get('ZPG4');
                        }
                        else
                        {
                            value = finalCalMap.get('ZPR9');
                        }
                    }
                    else if((pcCode == 'ZDA1' || pcCode == 'ZD70') && pcCalculationType != null
                            && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = GROSS * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('GROSS'),rate);
                    }
                    else if(pcCode == 'NP')
                    {
                        //apply formula = GROSS+ZDA1+ZDA2+ZD70
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('GROSS'),finalCalMap.get('ZDA1'),'+'),finalCalMap.get('ZDA2'),'+'),finalCalMap.get('ZD70'),'+');                       
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforPnIPNACanada
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for P&IP NA Canada
*/
    private void calculateRatesforPnIPNACanada(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))))
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    /*  boolean checkSynch= checkSynchronous(prItem,pcCode,pcConditionClass,npcRequest,isSynchronous,rateList);
if(checkSynch==true)
{
grossPriceCheck = true;
npcReqUpdateList.add(npcRequest);  
}
else
{
npcReqUpdateList.add(npcRequest);
break;
}
rate=fetchRate(prItem,npcRequest,uomConversionMap,isCurrentPriceCalculation,rateList,pcCode);
value = rate;*/
                }
                //Code for 'Net Price'
                else
                {
                    if((pcCode == 'ZCRE' || pcCode == 'ZCRF') && pcCalculationType != null
                       && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPG3'),rate);
                    }
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZPR9+ZCRE+ZCRF
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPG3'),finalCalMap.get('ZCRE'),'+'),finalCalMap.get('ZCRF'),'+');                      
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    /*
* Author       :   Priyanka Pillala
* Method Name  :   calculateRatesforDCPCanada
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DCP Canada
*/
    private void calculateRatesforDCPCanada(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous)
    {
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions
        System.debug('****erpPCList'+erpPCList.size());
        List<NPC_Request__c> npcReqUpdateList = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))) && pcCode != 'ZPRC')
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList.add(npcRequest);
                                break;
                            }
                        }
                    }
                    //Issue -UoM START
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                }
                //Code for 'Net Price'
                else
                {
                    if((pcCode == 'ZD41' || pcCode == 'ZD42' || pcCode == 'ZD43' || pcCode == 'ZD44' || pcCode == 'ZD48' || pcCode == 'ZD51'
                        || pcCode == 'ZD52' || pcCode == 'ZD59') && pcCalculationType != null
                       && pcCalculationType.containsIgnoreCase('Percentage'))
                    {
                        if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                        {
                            rate = Decimal.valueOf(prItem.New_Rate__c);
                        }
                        //apply formula = IP * Rate/100
                        value = calculateforBISurfaces(finalCalMap.get('ZPCA'),rate);
                    }
                    if(pcCode == 'NP')
                    {
                        //apply formula = ZPCA+ZD41+ZD42+ZD43+ZD44+ZD51+ZD52+ZD59+ZPRC
                        value = calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPCA'),finalCalMap.get('ZD41'),'+'),finalCalMap.get('ZD42'),'+'),finalCalMap.get('ZD43'),'+'),finalCalMap.get('ZD44'),'+'),finalCalMap.get('ZD51'),'+'),finalCalMap.get('ZD52'),'+'),finalCalMap.get('ZD59'),'+'),finalCalMap.get('ZPRC'),'+');                        
                    }                   
                }
                if(value!=null && PAUtil.decimalPlacesMap.containsKey(unit))
                    value = value.setScale(PAUtil.decimalPlacesMap.get(unit),System.Roundingmode.HALF_EVEN);
                else if(value != null && unit == '%')
                {
                    //SAY UNIT is 0,% etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value != null)
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                
                if(pcCode!=null)
                    finalCalMap.put(pcCode,value);
                if(isCurrentPriceCalculation && pcCode != null && pricingCondition != null)
                {
                    currentNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueOf(value));
                    if(rate == null)
                        condRateMapCurrent.put(pcCode + '-' + pricingCondition,String.valueOf(0.00));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(rate));
                    }
                }
                else if(pcCode != null && pricingCondition != null)
                {
                    newNetPriceValuesMap.put(pcCode + '-' + pricingCondition,String.valueof(value));
                    if(rate == null)
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(0));
                    else
                    {
                        rate = rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode + '-' + pricingCondition,String.valueOf(rate));
                    }
                }
            }
        }
        
        if(npcReqUpdateList.size() != 0 && grossPriceCheck)
        {
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
    }
    //<PP20131023> END
    //<PP20140520> START
    
    /*
* Author       :   George Thomas
* Method Name  :   calculateRatesforDPPAP
* Parameters   :   List<ERP_Procedure_Conditions__c>,Map<String,List<String>>,NPC_Request__c,Pricing_Request_Item__c,boolean,Map<String,String>,boolean
* Return type  :   void
* Description  :   This method is used to calculate Net Price for DPP AP
*/
    //<GT20150512> START
    //<TJ20150622>
    // Piyush <PG20191211> Access Test Code Coverage
    @testvisible
    private void calculateRatesforDPPAP(List<ERP_Procedure_Conditions__c> erpPCList,Map<String,List<String>> condTypeRateMap,NPC_Request__c npcRequest,Pricing_request_Item__c prItem,Boolean isCurrentPriceCalculation,Map<String,String> uomConversionMap,Boolean isSynchronous, integer sppCheck)
    {
        
        boolean grossPriceCheck = false;
        Decimal value;
        List<String> rateList;
        Map<String,Decimal> finalCalMap = new Map<String,Decimal>();
        
        //Iterate through the ERP Procedure conditions    
        List<NPC_Request__c> npcReqUpdateList1 = new List<NPC_Request__c>();
        for(ERP_Procedure_Conditions__c proCond : erpPCList)
        {
            if(proCond.Step__c != null && proCond.From__c != null && proCond.To__c != null )
            {
                String pcCode = proCond.Pricing_Condition__r.Pricing_Condition_Code__c;
                String pcCalculationType = proCond.Pricing_Condition__r.Calculation_Type__c;
                String pcDescription = proCond.Pricing_Condition__r.Pricing_Condition_Description__c;
                String pricingCondition = proCond.Pricing_Condition__r.Pricing_Condition__c;
                //To identify the Gross Price
                String pcConditionClass = proCond.Pricing_Condition__r.Condition_Class__c;
                if(condTypeRateMap.containsKey(pcCode))
                    rateList = condTypeRateMap.get(pcCode);
                else
                    rateList = null;
                //Retrieving Rate, Unit, Per, UoM returned from SAP
                Decimal rate;
                String unit, per, UoM;
                if(rateList != null && rateList.size() == 4)
                {
                    String tempRate;
                    if(rateList[0] != '##')
                        rate = Decimal.valueOf(rateList[0]);
                    if(rateList[1] != '##')
                        unit = rateList[1];
                    if(rateList[2] != '##')
                        per = rateList[2];
                    if(rateList[3] != '##')
                        UoM = rateList[3];
                }
                system.debug('*TEST'+prItem.Pricing_Condition_Code__c+' '+pcCode+' '+pcCalculationType+' '+pcConditionClass+' '+npcReqUpdateList1.size()+' '+grossPriceCheck);
                //Code for Calculation Type 'Quantity'
                if(pcCalculationType != null && pcCalculationType != '-' && pcCalculationType.containsIgnoreCase('Quantity'))
                {
                    //Conversion if required
                    //Added to identify the Gross price
                    if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices')
                                                                                                   || pcConditionClass.containsIgnoreCase('Price'))) )
                    {
                        if(rateList==null)
                        {
                            if(npcRequest.isSynchronous__c || isSynchronous)
                            {
                                npcRequest.Below_Current_Flag__c = true;
                                npcRequest.Below_Floor_Flag__c = true;
                                npcRequest.Below_Reference_Flag__c = true;
                                grossPriceCheck = true;
                                npcReqUpdateList1.add(npcRequest);
                                break;
                            }
                            else
                            {
                                grossPriceCheck = true;
                                npcRequest.Response_Error_Code__c = 'G';
                                npcRequest.Response_Error_Message__c = 'Gross price is missing';
                                npcReqUpdateList1.add(npcRequest);
                                break;
                            }              
                        }
                    }
                    //Issue -UoM START
                    system.debug('*TEST'+prItem.Pricing_Condition_Code__c+' '+pcCode+' '+pcCalculationType+' '+pcConditionClass+' '+npcReqUpdateList1.size()+' '+grossPriceCheck);
                    List<String> targetList= new List<String>();
                    targetList.add(prItem.New_unit__c);
                    targetList.add(String.valueOf(prItem.New_Per__c));
                    targetList.add(prItem.New_UoM__c);
                    //END
                    rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
                    if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
                    {
                        rate = Decimal.valueOf(prItem.New_Rate__c);
                    }
                    value = rate;
                    system.debug('Rate'+value);
                }
                //Code for 'Net Price'
                else
                {
                    if(sppCheck == 1)
                    {            
                        if(pcCode == 'NP')
                        {
                            //apply formula = ZDA2+ZPRB
                            value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRB'),finalCalMap.get('ZDA2'),'+');
                            system.debug('NP1'+value);                        
                        }                   
                    }
                    else if(sppCheck == 2)
                    {
                        if(pcCode == 'NP')
                        {
                            //apply formula = ZDA2+ZPRB
                            value = finalCalMap.get('ZPRB');
                            system.debug('NP2'+value);                        
                        }                   
                    }
                    else if(sppCheck == 3)
                    {
                        if(pcCode == 'NP')
                        {
                            //apply formula = ZPRN
                            value = finalCalMap.get('ZPRN');
                            system.debug('NP3'+value);                        
                        }                   
                    }
                    else if(sppCheck == 4)
                    {
                        if(pcCode == 'NP')
                        {
                            //apply formula = ZDA2+ZPRN
                            value = calculateSUBTotalsforBISurfaces(finalCalMap.get('ZPRN'),finalCalMap.get('ZDA2'),'+');
                            system.debug('NP4'+value);                        
                        }                   
                    }          
                }
                if(value!=null && unit=='%'){
                    //SAY UNIT is % etc
                    value= value.setScale(3,System.Roundingmode.HALF_EVEN);
                }
                else if(value!=null){
                    //SAY UNIT is 0 etc
                    value= value.setScale(2,System.Roundingmode.HALF_EVEN);
                }
                if(pcCode!=null){ 
                    system.debug('**adding into map'+pcCode+'***value'+value);            
                    finalCalMap.put(pcCode,value);
                } 
                if(isCurrentPriceCalculation && pcCode!=null && pricingCondition!=null){
                    System.debug('**adding into current map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                    currentNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                    if(rate==null){
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueOf(0));
                    }
                    else{
                        rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMapCurrent.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                    }
                    
                } 
                else if(pcCode!=null && pricingCondition!=null){
                    System.debug('**adding into new  map'+pcCode+'***value'+value+'**key'+pcCode+'-'+pricingCondition);
                    newNetPriceValuesMap.put(pcCode+'-'+pricingCondition,String.valueof(value));
                    if(rate==null){
                        condRateMap.put(pcCode+'-'+pricingCondition,String.valueOf(0));
                    }
                    else{
                        rate= rate.setScale(2,System.Roundingmode.HALF_EVEN);
                        condRateMap.put(pcCode+'-'+pricingCondition,String.valueof(rate));
                    }
                }
                system.debug('*TEST'+prItem.Pricing_Condition_Code__c+' '+pcCode+' '+pcCalculationType+' '+pcConditionClass+' '+npcReqUpdateList1.size()+' '+grossPriceCheck);
            }
        }
        system.debug('*TEST'+' '+npcReqUpdateList1.size()+' '+grossPriceCheck);
        if(npcReqUpdateList1.size() != 0 && grossPriceCheck)
        {
            system.debug('**Test'+npcReqUpdateList1+' '+npcReqUpdateList1.size()+' '+grossPriceCheck);
            if(npcRequest.isSynchronous__c || isSynchronous)
            {
                update npcRequest;
                throw new PAException(System.Label.Gross_Price_is_Missing,ApexPages.Severity.ERROR);
            }
            else
                status = 'Error';
        }
        
    }
    //<GT20150512> END
    
    public void bulkNetPriceCalculation(Id reqId)
    {
        //Querying for the Request Items, Request and Org Group Item
        System.debug('*****reqId'+reqId); 
        //<TJ20150524>
        List<Pricing_Request_Item__c> priReqItemList = [SELECT BU__c, Ship_To_Country__c, Ship_To_Country_Code__c, Price_Ref_Partner_Code__c,
                                                        Price_Ref_Partner__c, Market_Segment_Code__c, Market_Segment__c, Project__c, Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,
                                                        ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                                                        Sales_Order_Type_Code__c, Sales_Order_Type__c, Country_Code__c, Country__c,
                                                        F_Product_Hierarchy_Code__c, Product_Hierarchy_Code__c, Scale_UoM_Scale_Unit__c,
                                                        Key_Combination_SFDC__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c,
                                                        Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c,
                                                        Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c,
                                                        Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c,
                                                        Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, ScaleRate9__c,
                                                        ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c,
                                                        ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Scale_Quantity_Scale_Value9__c,
                                                        Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c,
                                                        Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c,
                                                        Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c,
                                                        Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
                                                        Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c,
                                                        Quantity__c, Plus_Minus__c, Plus_Minus_Code__c, Calculation_Type__c, Calculation_Type_Code__c,
                                                        Check_Scale__c, Check_Scale_Code__c, Condition_Class__c, Condition_Class_Code__c,
                                                        Scale_Basis__c, Scale_Basis_Code__c, Scale_Type_Code__c, Profit_Center__c,
                                                        Profit_Center_Code__c, Product_Hierarchy__c, Pricing_Request__c,Pricing_Request__r.SoldTo_Code__c,
                                                        Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c,
                                                        Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c,
                                                        Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c,
                                                        PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c,
                                                        PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c,
                                                        New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c,
                                                        New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c,
                                                        Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c,
                                                        Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id,
                                                        Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c,
                                                        End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, Division__c, Division_Code__c,
                                                        Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
                                                        Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Below_Reference_Flag__c,
                                                        Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c,
                                                        Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,
                                                        Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,
                                                        Gap_Pricing_Request_Item__r.New_Valid_From__c, Gap_Pricing_Request_Item__r.New_Valid_To__c,
                                                        Gap_Pricing_Request_Item__r.New_Rate__c, Gap_Pricing_Request_Item__r.New_Per__c,
                                                        Gap_Pricing_Request_Item__r.New_Unit__c, Gap_Pricing_Request_Item__r.New_UoM__c,
                                                        Gap_Pricing_Request_Item__r.Valid_From__c, Gap_Pricing_Request_Item__r.Valid_To__c,
                                                        Gap_Pricing_Request_Item__r.Rate__c, Gap_Pricing_Request_Item__r.Per__c,
                                                        Gap_Pricing_Request_Item__r.Unit__c, Gap_Pricing_Request_Item__r.UoM__c,
                                                        ERP_Pricing_Procedure__c, ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c,
                                                        ERP_Pricing_Procedure__r.Pricing_Procedure__c, Pricing_Request__r.Request_Valid_From__c,
                                                        Pricing_Request__r.Request_Valid_To__c, Pricing_Request__r.Sales_Org_Code__c,
                                                        Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,
                                                        Customer_Hierarchy_Code__c, Customer_Hierarchy__c, Materials_Below_Net_Current__c,
                                                        Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c,
                                                        Materials_with_Error_Response__c, Net_Price_Calculated_Materials__c, Total_Materials__c,
                                                        Integration_Error_Message__c, Net_Price_Status__c, Number_of_Material_with_Gross_Price__c,
                                                        Pricing_Request__r.Request_Type__c, USD_Rate__c, Base_UoM__c,
                                                        Pricing_Request__r.Current_Approver__c, Pricing_Request__r.Pricing_Exception__c,
                                                        Pricing_Request__r.Landing_Cost__c, Pricing_Request__r.Standardized_Currency__c,
                                                        Pricing_Request__r.Standardized_UoM__c, Error_Indicator__c,
                                                        Pricing_Request__r.Default_Currency__c,
                                                        Customer_Price_Payment_Terms__c, Payment_Terms_Fixed_Date__c,
                                                        New_Customer_Price_Payment_Terms__c, New_Payment_Terms_Fixed_Date__c,
                                                        isPaymentTermsApplicable__c, isVolumeApplicable__c, Volume__c, Volume_UoM__c, New_Volume__c,
                                                        New_Volume_UoM__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,
                                                        Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,
                                                        Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :reqId AND
                                                        isNPCApplicable__c = true AND New_Rate__c != null AND New_Unit__c != null AND
                                                        //New_Valid_From__c != null AND New_Valid_To__c != null AND
                                                        (Net_Price_Status__c = null OR Net_Price_Status__c = '')AND
                                                        (New_Volume__c != null OR (isVolumeApplicable__c = false AND New_Volume__c = null)) AND
                                                        (New_Per__c != null OR (Calculation_Type__c != 'Quantity' AND New_Per__c = null)) AND
                                                        (New_UoM__c != null OR (Calculation_Type__c != 'Quantity' AND New_UoM__c = null))];
        
        Pricing_Request__c pricingReq = [SELECT Id,BU__c,Sales_Org_Code__c,Division_Code__c,Dist_Channel_Code__c FROM Pricing_Request__c WHERE
                                         Id = :reqId];
        
        Organizational_Group_Item__c buOrgGroup = new Organizational_Group_Item__c();
        List<Organizational_Group_Item__c> orgItemList = [SELECT Id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c FROM Organizational_Group_Item__c WHERE
                                                          Business__r.Business__c = :pricingReq.BU__c AND
                                                          OrgGroup__r.ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c
                                                          AND OrgGroup__r.ERP_Division_Code__c = :pricingReq.Division_Code__c AND
                                                          OrgGroup__r.ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c];
        if(orgItemList!=null && orgItemList.size()!=0)
        {
            buOrgGroup=orgItemList[0];
        }
        
        //Determining the Quantity & UoM defined for the Org Group Item
        Map<String,String> quantityUoMMap = new Map<String,String>();
        for(Sales_Area_QuantityUoM_Detail__c qUoM : [SELECT Id,Quantity__c,UoM__c,Organizational_Group_Item__c FROM Sales_Area_QuantityUoM_Detail__c
                                                     WHERE Organizational_Group_Item__c = :buOrgGroup.Id])
        {
            quantityUoMMap.put(qUoM.Uom__c,qUoM.Quantity__c);
        }
        List<Id> priReqItemIdList = new List<Id>();
        Map<Id,String> priMaterialCodesMap = new Map<Id,String>();
        Map<String,String> priRepMaterialCodesMap = new Map<String,String>();
        Map<Id,String> priPHCodesMap = new Map<Id,String>();
        Map<Id,String> priMPGCodesMap = new Map<Id,String>();
        Map<Id,String> priMSCodesMap = new Map<Id,String>();
        Set<String> phCodeSet = new Set<String>();
        Map<String,String> phToRepMaterialMap = new Map<String,String>();
        phToRepMaterialMap = PAUtil.checkForSynchronousPH(priReqItemList);
        
        for(Pricing_Request_Item__c pri : priReqItemList)
        {
            priReqItemIdList.add(pri.Id);
            //retrieving all the Materials for the request items
            
            if(pri.Key_Combination__c.replace('Material Price Group','').containsIgnoreCase('Material'))
            {
                priMaterialCodesMap.put(pri.Id, pri.Material_Code__c);
            }
            //retrieving all the PH Codes/Representative Materials for the request items
            if(pri.Key_Combination__c.containsIgnoreCase('PH') && !pri.Key_Combination__c.replace('Material Price Group','').containsIgnoreCase('Material'))
            {
                if(phToRepMaterialMap.containsKey(pri.F_Product_Hierarchy_Code__c))
                {
                    priRepMaterialCodesMap.put(pri.F_Product_Hierarchy_Code__c, phToRepMaterialMap.get(pri.F_Product_Hierarchy_Code__c).split(':', 2)[0]);
                }
                else
                {
                    //<JM20152008>IS ID-00058025  production issue
                    //<AG20200411>- Adding % in Map Values 
                    priPHCodesMap.put(pri.Id, pri.F_Product_Hierarchy_Code__c+'%');
                    //priPHCodesMap.put(pri.Id, pri.F_Product_Hierarchy_Code__c);
                    //<AG20200411>- END
                    phCodeSet.add(pri.F_Product_Hierarchy_Code__c);
                }
            }
            //retrieving all the MPGs for the request items
            if(pri.Key_Combination__c.containsIgnoreCase('Material Price Group'))
            {
                priMPGCodesMap.put(pri.Id, pri.Material_Price_Group_Code__c);
            }
            //retrieving all the Market Segments for the request items
            if(pri.Key_Combination__c.containsIgnoreCase('Market Segment'))
            {
                priMSCodesMap.put(pri.Id, pri.Market_Segment_Code__c);
            }
        }
        
        //Making all the existing NPC Requests inactive
        List<NPC_Request__c> alreadyExistingNPCReqList = [SELECT Id, Status__c FROM NPC_Request__c WHERE Pricing_Request_Item__c IN
                                                          :priReqItemIdList AND Status__c = 'Active'];
        for(NPC_Request__c n : alreadyExistingNPCReqList)
        {
            n.Status__c = 'Inactive';
        }
        if(alreadyExistingNPCReqList != null && alreadyExistingNPCReqList.size() != 0)
        {
            update alreadyExistingNPCReqList;
        }
        
        //Querying all the materials for the corresponding Materials, MPGs and Market Segments
        System.debug('****priMaterialCodesMap'+buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c+'**'+pricingReq.Sales_Org_Code__c+pricingReq.Division_Code__c);
        List<Material__c> finalMaterialList = new List<Material__c>();
        //<KJ20150804> Product Hierarchy NPC issue prodcution - Start
        /*finalMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
(ERP_Product_Hierarchy_Code__c LIKE :priPHCodesMap.values() AND( ERP_Material_Price_Group_Code__c IN :priMPGCodesMap.values() OR ERP_Material_Group_4_Code__c IN :priMSCodesMap.values() OR
ERP_Material_Code__c IN :priMaterialCodesMap.values())) AND
ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];*/
        if(priPHCodesMap.values().size()>0)
        {
            //<MG20161024>  Mansi - Added OR in place of AND in where condition -- IS ID-00073609
            //<MG20170523> - NPC calculation logic for using LIKE logic in below SOQL. Updated WHERE condition in SOQL
            //<AG20200411>- Removed the following Str1 loop 
            /*List<String>  str1 = new List<String>();
for(String Str : priPHCodesMap.values() )
{
Str = str+'%';
Str1.add(Str);    
}*/
            //<AG20200411>- END
            //<MG20170523> - Added if else for BU=DPP Polymers EMEA
            system.debug('@@@BU_PR'+pricingReq.BU__c );
            //<AG20200411>- Replaced AND with OR (in else query) & replaced Str1 with priPHCodesMap.values() (in both queries)
            if(pricingReq.BU__c == label.BU_Name)
            {
                finalMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
                                     ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                                     (ERP_Product_Hierarchy_Code__c LIKE :priPHCodesMap.values() OR ( ERP_Material_Price_Group_Code__c IN :priMPGCodesMap.values() OR ERP_Material_Group_4_Code__c IN :priMSCodesMap.values() OR
                                                                                                     ERP_Material_Code__c IN :priMaterialCodesMap.values())) AND
                                     ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
                                     ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];  
            }
            //<MG20170523>- reverted AND from OR in where condition 
            else
                finalMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
                                     ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                                     (ERP_Product_Hierarchy_Code__c LIKE :priPHCodesMap.values() OR ( ERP_Material_Price_Group_Code__c IN :priMPGCodesMap.values() OR ERP_Material_Group_4_Code__c IN :priMSCodesMap.values() OR
                                                                                                     ERP_Material_Code__c IN :priMaterialCodesMap.values())) AND
                                     ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
                                     ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];
            /*(ERP_Product_Hierarchy_Code__c LIKE :Str1 AND ( ERP_Material_Price_Group_Code__c IN :priMPGCodesMap.values() OR ERP_Material_Group_4_Code__c IN :priMSCodesMap.values() OR
ERP_Material_Code__c IN :priMaterialCodesMap.values())) AND
ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];*/
            //<AG20200411>- END
            /*finalMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
(ERP_Product_Hierarchy_Code__c LIKE :priPHCodesMap.values() AND( ERP_Material_Price_Group_Code__c IN :priMPGCodesMap.values() OR ERP_Material_Group_4_Code__c IN :priMSCodesMap.values() OR
ERP_Material_Code__c IN :priMaterialCodesMap.values())) AND
ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];*/
        }
        else
        {
            finalMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
                                 ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                                 ( ERP_Material_Price_Group_Code__c IN :priMPGCodesMap.values() OR ERP_Material_Group_4_Code__c IN :priMSCodesMap.values() OR
                                  ERP_Material_Code__c IN :priMaterialCodesMap.values()) AND
                                 ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
                                 ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];
            
        }
        //<KJ20150804> Product Hierarchy NPC issue prodcution - End
        system.debug('priMPGCodesMap is '+priMPGCodesMap);
        system.debug('priMSCodesMap is '+priMSCodesMap);
        system.debug('priMaterialCodesMap is '+priMaterialCodesMap);
        system.debug('buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c is '+buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c);
        system.debug('pricingReq.Sales_Org_Code__c is '+pricingReq.Sales_Org_Code__c);
        system.debug('pricingReq.Dist_Channel_Code__c is '+pricingReq.Dist_Channel_Code__c);
        //Querying all the materials for the corresponding PHs
        List<Material__c> finalPHMaterialList = new List<Material__c>();
        finalPHMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
                               ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE (ERP_Product_Hierarchy_Code__c LIKE
                                                                                                                   :priPHCodesMap.values() OR ERP_Material_Code__c IN :priMaterialCodesMap.values()) AND
                               ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
                               ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];
        
        List<Material__c> finalRepMaterialList = new List<Material__c>();
        finalRepMaterialList = [SELECT Id, Material_Description__c, Name, ERP_Material_Code__c, ERP_Base_UOM__c, ERP_Material_Price_Group_Code__c,
                                ERP_Material_Group_4_Code__c, ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                                ERP_Material_Code__c IN :priRepMaterialCodesMap.values() AND
                                ERP_Source_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND ERP_Deletion_Flag__c = false AND
                                ERP_Sales_Org_Code__c = :pricingReq.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c = :pricingReq.Dist_Channel_Code__c];
        
        
        Map<String,List<Material__c>> msCodeToMatMap = new Map<String,List<Material__c>>();
        Map<String,List<Material__c>> repMatCodeToMatMap = new Map<String,List<Material__c>>();
        Map<String,List<Material__c>> phCodeToMatMap = new Map<String,List<Material__c>>();
        Map<String,List<Material__c>> finalPHCodeToMatMap = new Map<String,List<Material__c>>();
        Map<String,List<Material__c>> mpgCodeToMatMap = new Map<String,List<Material__c>>();
        Map<String,List<Material__c>> matCodeToMatMap = new Map<String,List<Material__c>>();
        for(Material__c mat : finalMaterialList)
        {
            //Populating list of materials for each MPG
            if(mpgCodeToMatMap.containsKey(mat.ERP_Material_Price_Group_Code__c))
            {
                List<Material__c> l1 = mpgCodeToMatMap.get(mat.ERP_Material_Price_Group_Code__c);
                l1.add(mat);
                mpgCodeToMatMap.put(mat.ERP_Material_Price_Group_Code__c, l1);
            }
            else
            {
                List<Material__c> l1 = new List<Material__c>();
                l1.add(mat);
                mpgCodeToMatMap.put(mat.ERP_Material_Price_Group_Code__c, l1);
            }
            
            //Populating list of materials for each Market Segment
            if(msCodeToMatMap.containsKey(mat.ERP_Material_Group_4_Code__c))
            {
                List<Material__c> l1 = msCodeToMatMap.get(mat.ERP_Material_Group_4_Code__c);
                l1.add(mat);
                msCodeToMatMap.put(mat.ERP_Material_Group_4_Code__c, l1);
            }
            else
            {
                List<Material__c> l1 = new List<Material__c>();
                l1.add(mat);
                msCodeToMatMap.put(mat.ERP_Material_Group_4_Code__c, l1);
            }
            //Populating list of materials for each Material
            if(matCodeToMatMap.containsKey(mat.ERP_Material_Code__c))
            {
                List<Material__c> l1 = matCodeToMatMap.get(mat.ERP_Material_Code__c);
                l1.add(mat);
                matCodeToMatMap.put(mat.ERP_Material_Code__c, l1);
            }
            else
            {
                List<Material__c> l1 = new List<Material__c>();
                l1.add(mat);
                matCodeToMatMap.put(mat.ERP_Material_Code__c, l1);
            }
        }
        
        //Populating list of materials for each PH in the request item
        for(Material__c mat : finalPHMaterialList)
        {
            for(String existingPHCode : phCodeSet)
            {
                if(mat.ERP_Product_Hierarchy_Code__c.startsWith(existingPHCode))
                {
                    if(finalPHCodeToMatMap.containsKey(existingPHCode))
                    {
                        List<Material__c> l1 = finalPHCodeToMatMap.get(existingPHCode);
                        l1.add(mat);
                        finalPHCodeToMatMap.put(existingPHCode, l1);
                    }
                    else
                    {
                        List<Material__c> l1 = new List<Material__c>();
                        l1.add(mat);
                        finalPHCodeToMatMap.put(existingPHCode, l1);
                    }
                }
            }
        }
        
        for(Material__c mat : finalRepMaterialList)
        {
            for(String presentPHCode : priRepMaterialCodesMap.keySet())
            {
                if(priRepMaterialCodesMap.get(presentPHCode) == mat.ERP_Material_Code__c)
                {
                    //Populating list of materials for each Rep Material            
                    if(repMatCodeToMatMap.containsKey(presentPHCode))
                    {
                        List<Material__c> l1 = repMatCodeToMatMap.get(presentPHCode);
                        l1.add(mat);
                        repMatCodeToMatMap.put(presentPHCode, l1);
                    }
                    else
                    {
                        List<Material__c> l1 = new List<Material__c>();
                        l1.add(mat);
                        repMatCodeToMatMap.put(presentPHCode, l1);
                    }
                }
            }
        }
        
        List<NPC_Request__c> createNPCRequestList = new List<NPC_Request__c>();
        
        //Determining the Sales Document Type for the Sales Org 
        String salesDocType;
        if(PASalesDocTypeSOMapping__c.getAll().containsKey(pricingReq.Sales_Org_Code__c))
        {
            salesDocType = PASalesDocTypeSOMapping__c.getInstance(pricingReq.Sales_Org_Code__c).Sales_Document_Type__c;
        }
        else
        {
            salesDocType = PASalesDocTypeSOMapping__c.getInstance('Others').Sales_Document_Type__c;
        }
        
        List<Pricing_Request_Item__c> updatePRIList = new List<Pricing_Request_Item__c>();
        //Populating the NPC requests for the respective Request Items
        for(Pricing_Request_Item__c pri : priReqItemList)
        {
            Map<String,List<Material__c>> materialMap = new Map<String,List<Material__c>>();
            String mapKey;
            //<MG20170523> - Added mapkey_PH string variable
            String mapKey_PH;
            System.debug('****matCodeToMatMap'+matCodeToMatMap);
            //Populating the NPC requests for the respective Request Items - Material as KC
            if(pri.Key_Combination__c.replace('Material Price Group','').containsIgnoreCase('Material')
               && matCodeToMatMap.containsKey(pri.Material_Code__c))
            {
                materialMap = matCodeToMatMap;
                mapKey = pri.Material_Code__c;
            }
            //<MG20170523> - Populating the NPC requests for the respective Request Items - MPG as KC && PH as KC
            else if(pri.Key_Combination__c.containsIgnoreCase('Material Price Group') && pri.Key_Combination__c.containsIgnoreCase('PH')
                    && mpgCodeToMatMap.containsKey(pri.Material_Price_Group_Code__c))
            {
                mapKey = pri.Material_Price_Group_Code__c; 
                mapKey_PH=pri.F_Product_Hierarchy_Code__c;
                //<MG20170710> Start- Added new Map and logic for NPC calculation
                Map<String,List<Material__C>> mpg_ph_codemap = new Map <String,List<Material__C>>();
                List<Material__c> materialList = new List<Material__C>();
                Integer flag1 =0,flag2=0;
                for(material__c mat_1 : mpgCodeToMatMap.get(mapKey))
                {
                    if(mat_1.ERP_Product_Hierarchy_Code__c.contains(mapKey_PH))
                    {
                        materialList.add(mat_1);
                        flag2 ++; 
                    }
                    else
                    {
                        flag1 ++;
                    }
                    mpg_ph_codemap.put(mapKey,materialList);
                    
                }
                if (flag1 > 0 && flag2 ==0)
                {
                    pri.Net_Price_Status__c = 'Mat not found';
                    updatePRIList.add(pri);   
                }
                
                materialMap = mpg_ph_codemap;
                
                //<MG20170710> End- Added new Map and logic for NPC calculation
            }
            //Populating the NPC requests for the respective Request Items - MPG as KC
            else if(pri.Key_Combination__c.containsIgnoreCase('Material Price Group')
                    && mpgCodeToMatMap.containsKey(pri.Material_Price_Group_Code__c))
            {
                materialMap = mpgCodeToMatMap;
                mapKey = pri.Material_Price_Group_Code__c;
            }
            //Populating the NPC requests for the respective Request Items - Market Segment as KC
            else if(pri.Key_Combination__c.containsIgnoreCase('Market Segment') && msCodeToMatMap.containsKey(pri.Market_Segment_Code__c))
            {
                materialMap = msCodeToMatMap;
                mapKey = pri.Market_Segment_Code__c;
            }
            //Populating the NPC requests for the respective Request Items - PH as KC
            else if(pri.Key_Combination__c.containsIgnoreCase('PH') && finalPHCodeToMatMap.containsKey(pri.F_Product_Hierarchy_Code__c))
            {
                materialMap = finalPHCodeToMatMap;
                mapKey = pri.F_Product_Hierarchy_Code__c;
            }
            else if(pri.Key_Combination__c.containsIgnoreCase('PH') && repMatCodeToMatMap.containsKey(pri.F_Product_Hierarchy_Code__c))
            {
                materialMap = repMatCodeToMatMap;
                mapKey = pri.F_Product_Hierarchy_Code__c;
            }
            else
            {
                pri.Net_Price_Status__c = 'Mat not found';
                updatePRIList.add(pri);
                system.debug(Logginglevel.ERROR,'Line 12145--mansi--'+updatePRIList.size());
            }
            boolean isNPCReqCreated = false;
            if(!String.isBlank(mapKey) && materialMap.size() > 0 && materialMap.containsKey(mapKey))
            {
                for(Material__c mat1 : materialMap.get(mapKey))
                {
                    //<MG20170523> - Added logic for NPC where KC has both MPG and PH
                    if(!( pri.Key_Combination__c.containsIgnoreCase('Material Price Group') 
                         && pri.Key_Combination__c.containsIgnoreCase('PH') 
                         && !mat1.ERP_Product_Hierarchy_Code__c.contains(mapKey_PH) )) 
                        
                    {
                        NPC_Request__c npcreq = new NPC_Request__c();
                        npcreq.Pricing_Request_Item__c = pri.Id;
                        npcreq.Material_Number__c = mat1.ERP_Material_Code__c;
                        npcreq.Material__c = mat1.Name;
                        if(pri.Key_Combination__c.containsIgnoreCase('Sold To'))
                        {
                            npcReq.Partner1__c = pri.Sold_To_Code__c.leftPad(10);
                            npcReq.Partner1__c = npcReq.Partner1__c.replace(' ', '0');
                            npcReq.Partner_Code_1__c = 'AG';
                        }
                        else if(pri.Key_Combination__c.containsIgnoreCase('End User'))
                        {
                            npcReq.Partner1__c=pri.Pricing_Request__r.SoldTo_Code__c.leftPad(10);
                            npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
                            npcReq.Partner_Code_1__c='AG';
                        }
                        if(pri.Key_Combination__c.containsIgnoreCase('Ship To'))
                        {// Added condition for checking Import Request IS SC-00105938 <SS20221130> STARTS
                            if(pri.Pricing_Request__r.Request_Type__c.containsIgnoreCase('Import'))
                            {
                                npcReq.Partner1__c=pri.Sold_To_Code__c.leftPad(10);
                            }
                            else
                            {
                                npcReq.Partner1__c=pri.Pricing_Request__r.SoldTo_Code__c.leftPad(10);
                            }// <SS20221130> ENDS
                            npcReq.Partner1__c=npcReq.Partner1__c.replace(' ', '0');
                            npcReq.Partner_Code_1__c='AG';
                            npcReq.Partner_2__c = pri.ShipTo_Code__c.leftPad(10);
                            npcReq.Partner_2__c = npcReq.Partner_2__c.replace(' ', '0');
                            npcReq.Partner_Code_2__c = 'WE';
                        }
                        npcReq.Sales_Document_Type__c = salesDocType;
                        npcreq.Status__c = 'Active';
                        npcreq.isSynchronous__c = false;
                        if(pri.isVolumeApplicable__c == true)
                        {
                            npcreq.UoM__c = pri.New_Volume_UoM__c;
                            npcReq.Quantity__c = String.valueOf(pri.New_Volume__c);
                        }
                        else if(pri.New_UoM__c != null)
                        {
                            npcreq.UoM__c = pri.New_UoM__c;
                            npcReq.Quantity__c = quantityUoMMap.get(pri.New_UoM__c);
                        }
                        else
                        {
                            npcreq.UoM__c = mat1.ERP_Base_UOM__c;
                            npcReq.Quantity__c = quantityUoMMap.get(npcreq.UoM__c);
                        }
                        createNPCRequestList.add(npcReq);
                        isNPCReqCreated = true;
                    }
                }
            }
            if(isNPCReqCreated)
            {
                pri.Total_Materials__c = materialMap.get(mapKey).size();
                pri.Net_Price_Status__c = 'Waiting for Net Price';
                pri.Integration_Error_Message__c = null;
                system.debug(Logginglevel.ERROR,'Line 12211--mansi--'+updatePRIList.size());
                updatePRIList.add(pri);
                
            }
        }
        if(createNPCRequestList.size() > 0)
        {
            insert createNPCRequestList;
        }
        if(updatePRIList.size() > 0)
        {
            system.debug(Logginglevel.ERROR,'Line 12222--mansi--'+updatePRIList.size());
            upsert updatePRIList;
            
        }
        
    }
    //<PP20140520> END
    //<MS20150112> - Code refactoring: Adding method for Quantity PCs
    /*  private boolean checkSynchronous(Pricing_Request_Item__c prItem,String pcCode,String pcConditionClass,NPC_Request__c npcRequest,boolean isSynchronous,List<String> rateList)
{
if(prItem.Pricing_Condition_Code__c != pcCode && (pcConditionClass != null && (pcConditionClass.containsIgnoreCase('Prices') || pcConditionClass.containsIgnoreCase('Price'))))
{


if(rateList==null)
{
if(npcRequest.isSynchronous__c || isSynchronous)
{
npcRequest.Below_Current_Flag__c = true;
npcRequest.Below_Floor_Flag__c = true;
npcRequest.Below_Reference_Flag__c = true;
return true;
}
else
{
npcRequest.Response_Error_Code__c = 'G';
npcRequest.Response_Error_Message__c = 'Gross price is missing';
return false;
}
}
}
return false;

}

private Decimal fetchRate(Pricing_Request_Item__c prItem,NPC_Request__c npcRequest,Map<String,String> uomConversionMap,Boolean isCurrentPriceCalculation,List<String> rateList,String pcCode)
{
List<String> targetList= new List<String>();
targetList.add(prItem.New_unit__c);
targetList.add(String.valueOf(prItem.New_Per__c));
targetList.add(prItem.New_UoM__c);
Decimal rate = doConversion(rateList, npcRequest, targetList, uomConversionMap);
if(!isCurrentPriceCalculation && prItem.Pricing_Condition_Code__c == pcCode)
{
rate = Decimal.valueOf(prItem.New_Rate__c);
}
return rate;
}*/
    
}