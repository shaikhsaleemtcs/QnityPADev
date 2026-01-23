/**********************************************Modification Log********************************************************
<PP20131024>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 October 2013
Description         :   Sending notification on expiry SIT Issue #67 - ROLLOUT2
 ***********************************************************************************************************************
<VR20131122>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   22 November 2013
Description         :   DTT Rollout Issue - Removed String.valueOf conversion and assigning Valid to of holder to record
 ***********************************************************************************************************************
<SP20140206>
Last Modified By    :   Shiva
Last Modified Date  :   06 Feb 2014
Description         :   Prod Issue # - IS ID-00039567 - Expiry notifications are sent to sales reps from other BU / Sales org
<VR20140227>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   27 Feb 2014
Description         :   DTT Global Rollout - Modified the entire Batch to send expire prices in excel file
 ***********************************************************************************************************************
<MS20140415>
Last Modified By    :   Mohit Sinha
Last Modified Date  :   15 Apr 2014
Description         :  Expiry Notification- Modified soldToCSR map to enable single expiry notification to users for all CSRs
***********************************************************************************************************************
<HL20140827>
Last Modified By    :   Hema Latha
Last Modified Date  :   27 Aug 2014
Description         :  Added condition to stop Notifition for short term price requests i.e less than 20 days
 ***********************************************************************************************************************
<IS ID-00064918>
Last Modified By    :  Sumit Gupta
Last Modified Date  :  Feb 22 2016
Description         :  Pricing admin should get notification when non customer prices are expiring

***********************************************************************************************************************
<IS ID-00063013>
Last Modified By    :  Sumit Gupta
Last Modified Date  :  Mar 21 2016
Description         :  DPP Global Kalrez and Vespel Pricing admin and Sales Rep should get notification when non customer and 
                       customer prices are expiring

************************************************************************************************************************
<IS ID-00068791>
Last Modified By    :  Sumit Gupta
Last Modified Date  :  May 16 2016
Description         :  Turn on the "pricing expiry notifications for 60 days" for Diagnostics Global business. 
                       Add BU Admins in the distribution list. 

************************************************************************************************************************
<IS ID-00070035>
Last Modified By    :  Sumit Gupta
Last Modified Date  :  May 16 2016
Description         :  Correct Recipient for Expiry notification

************************************************************************************************************************
<IS ID-00080812>
Last Modified By    :  Priyanci Gupta
Last Modified Date  :  Apr 12 2017
Description         :  Removed extra fields of price holders so to avoid Heap Size Error
************************************************************************************************************************
<IS TI-00088966>
Last Modified By    :  Arrola Sireesha
Last Modified Date  :  Dec 17 2019
Description         :  Changed Sap Cluster from GP1(Utility) to P23(SpecCo) at line 516
************************************************************************************************************************
************************************************************************************************************************
<SK28-07-20 IS SC-00095108>
Last Modified By    :  Siaram Kumar
Last Modified Date  :  July 28 2020
Description         :  Apex Developer Script exception

************************************************************************************************************************
<AS19-08-20 IS ID-00071280>
Last Modified By    :  Arrola Sireesha
Last Modified Date  :  August 19 2020
Description         :  Send Expiry Notification to ZU partner based on Partner Counter for DPP Polymers EMEA 
************************************************************************************************************************
<VK27-08-20 IS ID-00083279>
Last Modified By    :  Vamsi Krishna
Last Modified Date  :  August 19 2020
Description         :  Send Expiry Notification to BU Admin for PG LA 
************************************************************************************************************************
<AS11-09-20 IS ID-00071280>
Last Modified By    :  Arrola Sireesha
Last Modified Date  :  Sep 11 2020
Description         :  Extend Send Expiry Notification to ZU partner based on Partner Counter for DPP Polymers NAFTA

************************************************************************************************************************
<RB24-03-21 IS ID-TI-00091539>
Last Modified By    :  Rajesh Barda
Last Modified Date  :  March 24 2021
Description         :  Setup Expiry Notification for Sales Orgs B900, B974, B929 for DPP Global Kalrez & Vespel -Division Code 11
********************************************************************************************************************************
<KK25-05-23 IS EI-00098148>
Last Modified By    :  Koteswararao Kasani
Last Modified Date  :  May 25 2023
Description         :  Send Expiry Notification to BU Admin for PG EMEA
*****************************************************************************************************************************************************************
<KK29-06-23 IS EI-00098777>
Last Modified By    :  Koteswararao Kasani
Last Modified Date  :  June 29 2023
Description         :  Setup Expiry Notification only for " B950 " Sales Org for DPP Global Kalrez & Vespel -Division Code 11
****************************************************************************************************************************************************************/
global  class batchSendCustomerPriceDueToExpire implements Database.Batchable<sObject>, Database.Stateful
{
    Map<string,List<string>> soldToCodeCSRMap = new Map<string,List<string>>();
    Map<string,List<string>> soldToCodeCSRMap1 = new Map<string,List<string>>();
    Map<string,Map<string,string>> soldToTableMap = new Map<string,Map<string,string>>();
    Map<string,Map<string,string>> soldToTableMap1 = new Map<string,Map<string,string>>();
    Map<String,String> ZUpartnermap =new Map<String,String>();//<AS19-08-20>
    String bUAdminBu ; //<VK27-08-20 IS ID-00083279> // <KK25-05-23 IS EI-00098148>
    integer count1;
    List<String> businessSplit=new List<String>();
    List<String> business = new List<String>();
    List<String> NcBusiness = new List<String>();
    Set<ERP_Sales_Prices_SAP__c> expPrices;
    //<AS19-08-20>-added isDPPEMEA //<VK27-08-20 IS ID-00083279> added isPGLA //<KK02-05-23 IS EI-00098148> added PG EMEA
    Boolean isCustomerBu=false, isNonCustomerBu=false, isDppGlobal=false, is11DppGlobal=false, is13DppGlobal=false, is11NcDppGlobal=false, is13NcDppGlobal=false, isDiagnosticsGlobal = false, isDPPEMEA = false, isPGLA = false,isPGEMEA =false;
    public batchSendCustomerPriceDueToExpire(String Bu)
    {   
        BusinessSplit = Bu.split(',');
        PA_Expiry_Notification__mdt [] BuForExpiry = [select MasterLabel from PA_Expiry_Notification__mdt]; // <KK25-05-23 IS EI-00098148>
        for(String bus : BusinessSplit){
            if(bus.contains('NC_')){
                if(bus.contains('11')){
                    is11NcDppGlobal = true;
                    bus= bus.replace('11','');
                    is13NcDppGlobal=false;
                }else if(bus.contains('13')){
                    is13NcDppGlobal=true;
                    bus= bus.replace('13','');
                    is11NcDppGlobal=false;
                }
                NcBusiness.add(bus.substring(3));
                isNonCustomerBu=true;
            }else{
                if(bus.contains('11')){
                    is11DppGlobal = true;
                    bus= bus.replace('11','');
                    is13DppGlobal=false;
                }else if(bus.contains('13')){
                    is13DppGlobal=true;
                    bus= bus.replace('13','');
                    is11DppGlobal=false;
                }
                if(bus.equalsIgnoreCase('DPP Global Kalrez & Vespel')){
                   isDppGlobal=true;
                }
                if(bus.contains('Diagnostics Global'))
                    isDiagnosticsGlobal=true;
                //<AS19-08-20>-start
                //AS11-09-20  extended ZU Partner Expiry Notification to DPP Polymers NAFTA Bu as well
                if(bus.equalsIgnoreCase('DPP Polymers EMEA')|| bus.equalsIgnoreCase('DPP Polymers NAFTA'))
                    isDPPEMEA=true;
                //<AS19-08-20>-end
                //<VK27-08-20 IS ID-00083279>-start
                //if(bus.equalsIgnoreCase('PG LA'))
                  //  isPGLA=true;
                  
                for (PA_Expiry_Notification__mdt BusinessMetadata :BuForExpiry ){  // <KK25-05-23 IS EI-00098148>
                    if(bus.equalsIgnoreCase(BusinessMetadata.MasterLabel))
                        bUAdminBu = BusinessMetadata.MasterLabel ;
                } 
                //<VK27-08-20 IS ID-00083279>-end
                
                business.add(bus);
                isCustomerBu = true;
                system.debug(business);
               
            }   
        }
    }
    
      // global Iterable<Sobject> start(Database.BatchableContext BC)
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        system.debug(system.logginglevel.error,'inside start method');
        system.debug('isCustomerBu>>'+isCustomerBu+' <<Business > >'+Business + '< < isNonCustomerBu > >'+isNonCustomerBu+'< < NcBusiness > >' + NcBusiness+'<< isDppGlobal >>'+isDppGlobal+'<<isDPPEMEA>>'+isDPPEMEA);
        expPrices= new Set<ERP_Sales_Prices_SAP__c>();
        //<PG20170412> Removed extra fields of price holders to avoid heap size error
        string queryString = 'SELECT Id';
        //Map<String, Schema.SObjectField> objAPIFieldMap = Schema.getGlobalDescribe().get('ERP_Sales_Prices_SAP__c').getDescribe().fields.getMap();
        //Map<String, String> objAPIMap = new Map<String, String>();
        //for(Schema.SObjectField f : objAPIFieldMap.Values()) {
        //    queryString+=f.getDescribe().getName()+',';
        //}
        //queryString=queryString.substring(0, queryString.length()-1);
        //<HL20140827> Added condition to stop Notifition for short term price requests i.e less than 20 days
        if(isCustomerBu){
            if(isDppGlobal){
                if(is11DppGlobal){
                    //<RB24-03-21>-start
                    queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Sold_To_Code__c!=null AND Customer_Specific__c=true AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:30 AND Valid_To__c>=TODAY) AND Sales_Org_Code__c IN ' +'(\'B950\' )'+ ' AND Distribution_Channel_Code__c=' +'\'10\'' + ' AND Division_Code__c=' +'\'11\''+ ' AND bu__c IN :business  order by Approved_Date__c DESC';//<KK29-06-23 IS EI-00098777>
                    //<RB24-03-21>-end
                }else
                    queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Sold_To_Code__c!=null AND Customer_Specific__c=true AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:30 AND Valid_To__c>=TODAY) AND Sales_Org_Code__c=' +'\'B953\''+ ' AND Distribution_Channel_Code__c=' +'\'10\'' + ' AND Division_Code__c=' +'\'13\''+ ' AND bu__c IN :business  order by Approved_Date__c DESC';
            }else if(isDiagnosticsGlobal){
                queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Sold_To_Code__c!=null AND Customer_Specific__c=true AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:60 AND Valid_To__c>=TODAY) AND bu__c IN :business  order by Approved_Date__c DESC';
            }else
                queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Sold_To_Code__c!=null AND Customer_Specific__c=true AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:30 AND Valid_To__c>=TODAY) AND bu__c IN :business  order by Approved_Date__c DESC';
            
        }
        if(isNonCustomerBu){
            if(is11NcDppGlobal){
                queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Customer_Specific__c=false AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:30 AND Valid_To__c>=TODAY) AND Sales_Org_Code__c=' +'\'B953\''+ ' AND Distribution_Channel_Code__c=' +'\'10\'' + ' AND Division_Code__c=' +'\'11\''+ ' AND bu__c IN :NcBusiness  order by Approved_Date__c DESC';
            }else if(is13NcDppGlobal){
                queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Customer_Specific__c=false AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:30 AND Valid_To__c>=TODAY) AND Sales_Org_Code__c=' +'\'B953\''+ ' AND Distribution_Channel_Code__c=' +'\'10\'' + ' AND Division_Code__c=' +'\'13\''+ ' AND bu__c IN :NcBusiness  order by Approved_Date__c DESC';
            }else            
                queryString+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Customer_Specific__c=false AND isPriceHolder__c=true AND markForDeletion__c=false AND (Valid_To__c!= NULL AND Valid_To__c<=NEXT_N_DAYS:30 AND Valid_To__c>=TODAY) AND bu__c IN :NcBusiness  order by Approved_Date__c DESC';
        }
        system.debug('QUERY STRING > > ' + queryString);
        try{ 
            system.debug('inside try block');
            return Database.getQueryLocator(queryString);  
        }catch(Exception e){
           // system.debug('inside catch block');
            system.debug('Batch Query Exception>>' + e);
            return null;
        }
        
      //  system.debug(system.logginglevel.error,'Database.getQueryLocator(queryString)'+Database.getQueryLocator(queryString).size());
      /*List<ERP_Sales_Prices_SAP__c> salesPriceSAPRecList = new List<ERP_Sales_Prices_SAP__c>();
        system.debug('****Wats in it'+queryString);
        Database.QueryLocator ql = Database.getQueryLocator(queryString);
        Database.QueryLocatorIterator it =  ql.iterator();

       
        while (it.hasNext())
        {
                            
            ERP_Sales_Prices_SAP__c sapRec = (ERP_Sales_Prices_SAP__c)it.next();
            Integer noOfDays = sapRec.Valid_From__c.daysBetween(sapRec.Valid_To__c);
            if(noOfDays >= 20) 
            salesPriceSAPRecList.add(sapRec);
            
        }

        map<id,list<ERP_Sales_Prices_SAP__c>> holderChildMap=new map<id,list<ERP_Sales_Prices_SAP__c>>();       

        for(ERP_Sales_Prices_SAP__c listdisplay:salesPriceSAPRecList)
        {
            String holderRec=listdisplay.Price_Holder__c;
            if(holderChildMap.get(holderRec)==null)
            {
                list<ERP_Sales_Prices_SAP__c> nonHolderRec=new list<ERP_Sales_Prices_SAP__c>();
                nonHolderRec.add(listdisplay);
                holderChildMap.put(holderRec,nonHolderRec);
            }
            else
            {
                list<ERP_Sales_Prices_SAP__c> nonHolderRec=holderChildMap.get(holderRec);
                nonHolderRec.add(listdisplay);
                holderChildMap.put(holderRec,nonHolderRec);
            }
        }                 

        list<ERP_Sales_Prices_SAP__c> salesPriceFinalList=new list<ERP_Sales_Prices_SAP__c>();
        for(String checkdate:holderChildMap.keyset())
        {
            for(ERP_Sales_Prices_SAP__c X:holderChildMap.get(checkdate))
            {
                //<VR20131122> DTT Rollout Issue - Removed String.valueOf conversion and assigning Valid to of holder to record
                if(X.Price_Holder__r.Valid_To__c>=X.Valid_From__c && X.Price_Holder__r.Valid_To__c<=X.Valid_To__c)
                {
                    X.Valid_To__c = X.Price_Holder__r.Valid_To__c;
                    salesPriceFinalList.add(X);
                    break;
                }
            }
        }
        return salesPriceFinalList;  */
    
    }

    
    global void execute(Database.BatchableContext BC,List<sObject> scope)
    {
        
        system.debug(system.logginglevel.error,'inside execute method');
        List<ERP_Sales_Prices_SAP__c> priceHolderRecs = (List<ERP_Sales_Prices_SAP__c>)scope;
        set<ID> priceHolderRecsids = new set<ID>();
        system.debug(logginglevel.error,'***********SalesPriceSAPlist'+priceHolderRecs);
        for(ERP_Sales_Prices_SAP__c saleprice : priceHolderRecs){
            priceHolderRecsids.add(saleprice.id);
            //priceHolderRecsids.add(saleprice.price_holder__c);
        }   
        string queryString1 = 'SELECT ';
        Map<String, Schema.SObjectField> objAPIFieldMap = Schema.getGlobalDescribe().get('ERP_Sales_Prices_SAP__c').getDescribe().fields.getMap();
        Map<String, String> objAPIMap = new Map<String, String>();
        for(Schema.SObjectField f : objAPIFieldMap.Values()) {
            queryString1+=f.getDescribe().getName()+',';            
        }
        queryString1=queryString1.substring(0, queryString1.length()-1);
        //<HL20140827> Added condition to stop Notifition for short term price requests i.e less than 20 days
        if(isCustomerBu){
            if(isDiagnosticsGlobal){
                queryString1+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Sold_To_Code__c!=null AND Customer_Specific__c=true AND isPriceHolder__c=false AND markForDeletion__c=false AND Price_Holder__r.Valid_To__c!= NULL AND Price_Holder__r.Valid_To__c<=NEXT_N_DAYS:60 AND Price_Holder__r.Valid_To__c>=TODAY and price_holder__r.id in : priceHolderRecsids order by Approved_Date__c DESC';
            }else           
                queryString1+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Sold_To_Code__c!=null AND Customer_Specific__c=true AND isPriceHolder__c=false AND markForDeletion__c=false AND Price_Holder__r.Valid_To__c!= NULL AND Price_Holder__r.Valid_To__c<=NEXT_N_DAYS:30 AND Price_Holder__r.Valid_To__c>=TODAY and price_holder__r.id in : priceHolderRecsids order by Approved_Date__c DESC';
        }
        if(isNonCustomerBu){
            queryString1+= ',Price_Holder__r.Valid_To__c,Price_Holder__r.Valid_From__c,Owner.email FROM ERP_Sales_Prices_SAP__c Where Key_Combination__c!=null AND Customer_Specific__c=false AND isPriceHolder__c=false AND markForDeletion__c=false AND Price_Holder__r.Valid_To__c!= NULL AND Price_Holder__r.Valid_To__c<=NEXT_N_DAYS:30 AND Price_Holder__r.Valid_To__c>=TODAY and price_holder__r.id in : priceHolderRecsids order by Approved_Date__c DESC';
        }   
        List<ERP_Sales_Prices_SAP__c> salesPriceSAPNonHolderRecList = new List<ERP_Sales_Prices_SAP__c>();
        salesPriceSAPNonHolderRecList = Database.query(queryString1);
        map<id,list<ERP_Sales_Prices_SAP__c>> holderChildMap=new map<id,list<ERP_Sales_Prices_SAP__c>>(); 
        //List<ERP_Sales_Prices_SAP__c> salesPriceSAPNonHolderRecList = new List<ERP_Sales_Prices_SAP__c>();  
        //salesPriceSAPNonHolderRecList = (List<ERP_Sales_Prices_SAP__c>)scope;
        system.debug(system.logginglevel.error,'salesPriceSAPNonHolderRecList size is '+salesPriceSAPNonHolderRecList.size());
        
        for(ERP_Sales_Prices_SAP__c listdisplay:salesPriceSAPNonHolderRecList)
        {
            String holderRec=listdisplay.Price_Holder__c;
            if(holderChildMap.get(holderRec)==null)
            {
                list<ERP_Sales_Prices_SAP__c> nonHolderRec=new list<ERP_Sales_Prices_SAP__c>();
                nonHolderRec.add(listdisplay);
                holderChildMap.put(holderRec,nonHolderRec);
            }
            else
            {
                list<ERP_Sales_Prices_SAP__c> nonHolderRec=holderChildMap.get(holderRec);
                nonHolderRec.add(listdisplay);
                holderChildMap.put(holderRec,nonHolderRec);
            }
        }                 

        list<ERP_Sales_Prices_SAP__c> salesPriceFinalListtoProcess =new list<ERP_Sales_Prices_SAP__c>();
        for(String checkdate:holderChildMap.keyset())
        {
            for(ERP_Sales_Prices_SAP__c X:holderChildMap.get(checkdate))
            {
                //<VR20131122> DTT Rollout Issue - Removed String.valueOf conversion and assigning Valid to of holder to record
                if(X.Price_Holder__r.Valid_To__c>=X.Valid_From__c && X.Price_Holder__r.Valid_To__c<=X.Valid_To__c)
                {
                    X.Valid_To__c = X.Price_Holder__r.Valid_To__c;
                    salesPriceFinalListtoProcess.add(X);
                    break;
                }
            }
        }
        expPrices.addall(salesPriceFinalListtoProcess);
      //  system.debug('salesPriceFinalListtoProcess size is '+salesPriceFinalListtoProcess.size());  
        set<string> soldToCodeSet = new set<string>();
        set<string> soldToSalesOrgCodeSet = new set<string>();
        Map<string,List<ERP_Sales_Prices_SAP__c>> SoldToRecords = new Map<string,List<ERP_Sales_Prices_SAP__c>>();
        Map<string,Map<string,List<ERP_Sales_Prices_SAP__c>>> SoldToPCRecords = new Map<string,Map<string,List<ERP_Sales_Prices_SAP__c>>>();

        for(ERP_Sales_Prices_SAP__c sapObj: salesPriceFinalListtoProcess)
        //for(ERP_Sales_Prices_SAP__c sapObj: (List<ERP_Sales_Prices_SAP__c>)scope) 
        {           
            if(SoldToPCRecords.get(sapObj.Sold_To_Code__c+sapObj.Sales_Org_Code__c)==null)
            { 
                Map<string,List<ERP_Sales_Prices_SAP__c>> PCRecordsList=new Map<string,List<ERP_Sales_Prices_SAP__c>>();
                List<ERP_Sales_Prices_SAP__c> sapRec = new List<ERP_Sales_Prices_SAP__c>();
                sapRec.add(sapObj);
                PCRecordsList.put(sapObj.Pricing_Condition_Code__c+sapObj.Key_Combination_Code__c,sapRec);
                SoldToPCRecords.put(sapObj.Sold_To_Code__c+sapObj.Sales_Org_Code__c,PCRecordsList);
            }
            else
            {
                Map<string,List<ERP_Sales_Prices_SAP__c>> PCRecordsList = SoldToPCRecords.get(sapObj.Sold_To_Code__c+sapObj.Sales_Org_Code__c);
                if(PCRecordsList.get(sapObj.Pricing_Condition_Code__c+sapObj.Key_Combination_Code__c) == null) {
                    List<ERP_Sales_Prices_SAP__c> sapRec = new List<ERP_Sales_Prices_SAP__c>();
                    sapRec.add(sapObj);
                    PCRecordsList.put(sapObj.Pricing_Condition_Code__c+sapObj.Key_Combination_Code__c,sapRec);
                    SoldToPCRecords.put(sapObj.Sold_To_Code__c+sapObj.Sales_Org_Code__c,PCRecordsList);
                }
                else {
                    List<ERP_Sales_Prices_SAP__c> sapRec = PCRecordsList.get(sapObj.Pricing_Condition_Code__c+sapObj.Key_Combination_Code__c);
                    sapRec.add(sapObj);
                    PCRecordsList.put(sapObj.Pricing_Condition_Code__c+sapObj.Key_Combination_Code__c,sapRec);
                    SoldToPCRecords.put(sapObj.Sold_To_Code__c+sapObj.Sales_Org_Code__c,PCRecordsList);
                }
            } 
            soldtoCodeSet.add(sapObj.Sold_To_Code__c);
            soldtoSalesOrgCodeSet.add(sapObj.Sold_To_Code__c+sapObj.Sales_Org_Code__c);
        }

        system.debug(system.logginglevel.error,'***setsize'+soldtoCodeSet.size());

        List<ERP_Relationship__c> relationshipList = new List<ERP_Relationship__c>();
        
        
        List<OrgGroup__c> orgUserList = new List<OrgGroup__c>();
        
        if(isCustomerBu){
            if(isDppGlobal && is11DppGlobal){
                relationshipList=[SELECT id,User__c,User__r.name,User__r.Email,ERP_Customer__r.Sales_Org_Code__c,ERP_Customer__r.Division_Code__c,
                                ERP_Customer__r.Distribution_Channel_Code__c,ERP_Customer__r.Street__c,ERP_Customer__r.City__c,ERP_Customer__r.Country__c,
                                ERP_Customer__r.ZIP_Postal_Code__c,ERP_Customer__r.Customer_code__c FROM 
                                ERP_Relationship__c WHERE ERP_Customer__r.Customer_code__c IN:soldtoCodeSet AND Partner_Function_Code__c='ZR'
                                AND User__c!=null ];
            }//<AS19-08-20> start
            else 
                if(isDPPEMEA){
                relationshipList =[SELECT id,User__c,User__r.name,User__r.Email,ERP_Customer__r.Sales_Org_Code__c,ERP_Customer__r.Division_Code__c,
                                ERP_Customer__r.Distribution_Channel_Code__c,ERP_Customer__r.Street__c,ERP_Customer__r.City__c,ERP_Customer__r.Country__c,
                                ERP_Customer__r.ZIP_Postal_Code__c,ERP_Customer__r.Customer_code__c,Partner_Counter__c FROM 
                                ERP_Relationship__c WHERE ERP_Customer__r.Customer_code__c IN:soldtoCodeSet AND Partner_Function_Code__c='ZU'
                                    AND User__c!=null order by Partner_Counter__c desc];
                                   
                                    for (ERP_Relationship__c list1 : relationshipList){
                                       String custcode = list1.ERP_Customer__r.Customer_code__c+list1.ERP_Customer__r.Sales_Org_Code__c;
                                      //system.debug('customer code with sales Area'+custcode);
                                        if(ZUpartnermap.get(custcode)==null){
                                           ERP_Relationship__c  erplist = new  ERP_Relationship__c();
                                            erplist=list1;
                                          ZUpartnermap.put(custcode,erplist.User__r.Email);
                                          //system.debug('relationship'+erplist+'\n');
                                        }
                                    }
              
                                    
            }//<AS19-08-20>-end
            
            else
                relationshipList=[SELECT id,User__c,User__r.name,User__r.Email,ERP_Customer__r.Sales_Org_Code__c,ERP_Customer__r.Division_Code__c,
                                ERP_Customer__r.Distribution_Channel_Code__c,ERP_Customer__r.Street__c,ERP_Customer__r.City__c,ERP_Customer__r.Country__c,
                                ERP_Customer__r.ZIP_Postal_Code__c,ERP_Customer__r.Customer_code__c FROM 
                                ERP_Relationship__c WHERE ERP_Customer__r.Customer_code__c IN:soldtoCodeSet AND Partner_Function_Code__c='ZU'
                                AND User__c!=null ];
        }
        if(isNonCustomerBu){
            orgUserList=[SELECT Id,Owner.Name, owner.Email FROM OrgGroup__c WHERE Business__c=: NcBusiness];
        }
        count1 = 1;
        //<MS20140415> - Modified Map to send single notification to each user for all CSR 
        if(isCustomerBu){
            for(ERP_Relationship__c relObj:relationshipList) 
            {
              if(count1 <= 40000 ){
                if(soldToCodeCSRMap.get(relObj.User__r.Email)==null)
                {
                    
                    list<String> csrList=new list<String>();
                    csrList.add(relObj.ERP_Customer__r.Customer_code__c+relObj.ERP_Customer__r.Sales_Org_Code__c);
                    soldToCodeCSRMap.put(relObj.User__r.Email,csrList);
                }
                else
                {
                    list<String> csrList=soldToCodeCSRMap.get(relObj.User__r.Email);
                    csrList.add(relObj.ERP_Customer__r.Customer_code__c+relObj.ERP_Customer__r.Sales_Org_Code__c);
                    soldToCodeCSRMap.put(relObj.User__r.Email,csrList);
                }  
              }
              else{
                 if(soldToCodeCSRMap1.get(relObj.User__r.Email)==null)
                {
                    
                    list<String> csrList=new list<String>();
                    csrList.add(relObj.ERP_Customer__r.Customer_code__c+relObj.ERP_Customer__r.Sales_Org_Code__c);
                    soldToCodeCSRMap1.put(relObj.User__r.Email,csrList);
                }
                else
                {
                    list<String> csrList=soldToCodeCSRMap1.get(relObj.User__r.Email);
                    csrList.add(relObj.ERP_Customer__r.Customer_code__c+relObj.ERP_Customer__r.Sales_Org_Code__c);
                    soldToCodeCSRMap1.put(relObj.User__r.Email,csrList);
                }
              
              }
              count1++;
              system.debug(system.logginglevel.error,+'count1'+count1);
            }
        }
        if(isNonCustomerBu){
            for(OrgGroup__c relObj:orgUserList) 
            {
              if(count1 <= 40000 ){
                if(soldToCodeCSRMap.get(relObj.Owner.Email)==null)
                {
                    
                    list<String> csrList=new list<String>();
                    csrList.add(relObj.Owner.Email);
                    soldToCodeCSRMap.put(relObj.Owner.Email,csrList);
                }
                else
                {
                    list<String> csrList=soldToCodeCSRMap.get(relObj.Owner.Email);
                    csrList.add(relObj.Owner.Email);
                    soldToCodeCSRMap.put(relObj.Owner.Email,csrList);
                }  
              }
              else{
                 if(soldToCodeCSRMap1.get(relObj.Owner.Email)==null)
                {
                    
                    list<String> csrList=new list<String>();
                    csrList.add(relObj.Owner.Email);
                    soldToCodeCSRMap1.put(relObj.Owner.Email,csrList);
                }
                else
                {
                    list<String> csrList=soldToCodeCSRMap1.get(relObj.Owner.Email);
                    csrList.add(relObj.Owner.Email);
                    soldToCodeCSRMap1.put(relObj.Owner.Email,csrList);
                }
              
              }
              count1++;
              system.debug(system.logginglevel.error,+'count1'+count1);
            }
            
        }
            

        Map<string,List<string>>  soldToPC = new Map<string,List<string>>();
        integer count = 0;   
        for(string soldToSalesOrgCode : soldtoSalesOrgCodeSet) {
            Map<string,List<ERP_Sales_Prices_SAP__c>> pckcRecords = SoldToPCRecords.get(soldToSalesOrgCode);
            for(string pckc : pckcRecords.keyset()) {
                if(pckcRecords.get(pckc)!=null) {
                    count++;
                    system.debug(system.logginglevel.error,+'count1'+count1);
                    string header = columnGenerate(pckcRecords.get(pckc)[0]);
                    string table = expDataGen(header, 'ERP_Sales_Prices_SAP__c', pckcRecords.get(pckc), null);
                    if(count <= 40000){
                    if(soldToTableMap.get(soldToSalesOrgCode)==null){
                        Map<string,string> pckcTable = new Map<string,string>();
                        pckcTable.put(pckc,table);
                        soldToTableMap.put(soldToSalesOrgCode,pckcTable);
               
                    }       
                    else {
                        Map<string,string> pckcTable = soldToTableMap.get(soldToSalesOrgCode);
                        if(pckcTable.get(pckc)==null) {
                            pckcTable.put(pckc,table);
                            soldToTableMap.put(soldToSalesOrgCode,pckcTable);
                        }
                        else {
                            pckcTable.put(pckc,pckcTable.get(pckc)+'\n'+table.subStringAfter('\n'));
                            soldToTableMap.put(soldToSalesOrgCode,pckcTable);
                        }
                    } 
                    }
                    if(count >= 40000 && count <= 75000){
                    //added to avoid large heap size
                     if(soldToTableMap.get(soldToSalesOrgCode)==null){
                        Map<string,string> pckcTable = new Map<string,string>();
                        pckcTable.put(pckc,table);
                        soldToTableMap1.put(soldToSalesOrgCode,pckcTable);
               
                    }       
                    else {
                        Map<string,string> pckcTable = soldToTableMap.get(soldToSalesOrgCode);
                        if(pckcTable.get(pckc)==null) {
                            pckcTable.put(pckc,table);
                            soldToTableMap1.put(soldToSalesOrgCode,pckcTable);
                        }
                        else {
                            pckcTable.put(pckc,pckcTable.get(pckc)+'\n'+table.subStringAfter('\n'));
                            soldToTableMap1.put(soldToSalesOrgCode,pckcTable);
                        }
                    } 
                    }
                    
                                                  
                }
            }
        }
        system.debug(system.logginglevel.error,' soql queries issued are '+system.limits.getQueries());
        system.debug(system.logginglevel.error,'***mapsize'+soldToTableMap.size());


    } 
    private string columnGenerate(ERP_Sales_Prices_SAP__c sapObj) {
        system.debug('inside columnGenerate method');
        string mustColumns;
        string descriptions='';
        //<PP20130711>
        //Fix for IS ID-00047188
        String soCode, dcCode, divCode;
        if(sapObj.Sales_Org_Code__c != null)
            soCode = sapObj.Sales_Org_Code__c;
        else
            soCode = '%';
        if(sapObj.Distribution_Channel_Code__c != null)
            dcCode = sapObj.Distribution_Channel_Code__c;
        else
            dcCode = '%';
        if(sapObj.Division_Code__c != null)
            divCode = sapObj.Division_Code__c;
        else
            divCode = '%';
        System.debug('*****test'+soCode+dcCode+divCode);
        try{
        Organizational_Group_Item__c orgGroupItemObj = [select Request_Class__c, Enable_Request_Class__c,id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,
                                                        ERP_Pricing_Procedure__r.SAP_Client_Id__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c 
                                                        from Organizational_Group_Item__c where Business__r.Business__c=:sapObj.BU__c 
                                                        AND OrgGroup__r.ERP_Sales_Org_Code__c LIKE :soCode
                                                        AND OrgGroup__r.ERP_Distribution_Channel_Code__c LIKE :dcCode
                                                        AND OrgGroup__r.ERP_Division_Code__c LIKE :divCode limit 1];
        ERP_Procedure_Conditions__c proCondObj = [select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__r.Calculation_Type__c ,Pricing_Condition__r.Scale_Type__c
                                                  from ERP_Procedure_Conditions__c 
                                                  WHERE Sales_Pricing_Procedure__c=:orgGroupItemObj.ERP_Pricing_Procedure__c AND 
                                                  Pricing_Condition__r.Pricing_Condition_Code__c=:sapObj.Pricing_Condition_Code__c limit 1];
        //<AV20150404>-Start-production issue- notifiaction not goig for A580
        String kc =  (String)sapObj.Key_Combination_Code__c;
        String kcdesc = (String)sapObj.Key_Combination__c;
        if(sapObj.SAP_Cluster__c == 'P23' &&  (kc == 'A580' || kc == 'A832' || kc == 'A692' || kc == 'A695' || kc == 'A871' || kc == 'A916')){
            if(kcdesc.containsIgnoreCase('Sold to') || kcdesc.containsIgnoreCase('Customer')){
                kc = kc+'SD';
            }
            else if(kcdesc.containsIgnoreCase('Ship to'))
            {
                kc = kc+'SH';
            }
            else if(kcdesc.containsIgnoreCase('End User'))
            {
                kc = kc+'EU';
            }
        }                                         
        ERP_Key_Combination__c keyCombinationObject = [SELECT Key_Combination_Code__c,Key_Combination_Tech__c FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c=:kc AND SAP_Cluster__c=:sapObj.SAP_Cluster__c limit 1];
        system.debug('@^$%'+keyCombinationObject+','+sapObj.Key_Combination_Code__c+','+sapObj.SAP_Cluster__c);
        //<AV20150404>-End-production issue- notifiaction not goig for A580

        string keyCombTech = keyCombinationObject.Key_Combination_Tech__c.split('-')[0].replace('/',',');
        descriptions = keyCombinationObject.Key_Combination_Tech__c.split('-')[1];
        descriptions = descriptions.replace('Sales Org./','');
        descriptions = descriptions.replace('Dist. Channel/','');
        descriptions = descriptions.replace('Division/','');
        //<VR20130509>
        if(proCondObj.Sales_Pricing_Procedure_Condition_Config__c != null && proCondObj.Sales_Pricing_Procedure_Condition_Config__c.contains('Enable Scale')) {
            if(!('Quantity').contains(proCondObj.Pricing_Condition__r.Calculation_Type__c)) {
                mustColumns = keyCombTech+','+descriptions.replace('/',',')+',Pricing Condition Code,Pricing Condition,Key Combination Code,Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Valid From,Valid To,Pricing Request Number';
            }
            else {
                mustColumns = keyCombTech+','+descriptions.replace('/',',')+',Pricing Condition Code,Pricing Condition,Key Combination Code,Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Per,UoM,Valid From,Valid To,Pricing Request Number';
            }
        }
        else {
            if(!('Quantity').contains(proCondObj.Pricing_Condition__r.Calculation_Type__c)) {
                mustColumns = keyCombTech+','+descriptions.replace('/',',')+',Pricing Condition Code,Pricing Condition,Key Combination Code,Rate,Unit,Valid From,Valid To,Pricing Request Number';
            }
            else {
                mustColumns = keyCombTech+','+descriptions.replace('/',',')+',Pricing Condition Code,Pricing Condition,Key Combination Code,Rate,Unit,Per,UoM,Valid From,Valid To,Pricing Request Number';
                //system.debug();
            }
        }      
        
        }
        Catch(Exception e){
            system.debug(system.logginglevel.error,e.getMessage());
        }
        //mustColumns= mustColumns+','+descriptions.replace('/',',')+',sid';
        //mustColumns= mustColumns+',Pricing Request Number';
        if(mustColumns != null){
            return mustColumns;    
        }else
            return 'Expiring Pricing Report - Look at complete sheet; else No Records Here';
    }
    
    private string expDataGen(string recordString,string objectAPIName,List<Sobject> expList,string rejectLog) {
        system.debug(system.logginglevel.error,'inside expDataGen method');

        Map<string,string> objAPIMap = new Map<string,string>();    
        Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(objectAPIName).getDescribe().fields.getMap();

        for(Schema.SObjectField f : objectFields.Values()) {
            string Label = f.getDescribe().getLabel();
            string value = f.getDescribe().getName();
            objAPIMap.put(Label.toLowerCase(),value);
        }
        string separator='\t';
        string characterAttach = '\'';
        string numberseparator;
        Decimal decimalDigitCheck = 1.1;
        string separatorcheck = decimalDigitCheck.format();
        numberseparator = separatorcheck.subString(1,2);

        string recordStringLower = recordString.toLowerCase();
        string[] headerArray=recordStringLower.split(',');
        system.debug('***exportcheck'+numberseparator);
        recordString = recordString.replace(',',separator);

        //Generating the data for the csv file from the fetched list based on the header sequence generated
        List<string> columnList = new List<string>();
        List<string> rowList = new List<string>();
        for(Sobject sObj : expList) {
            columnList.clear();
            for(Integer i=0;i<headerArray.size();i++) {
                try {
                    if(headerArray[i].trim().equalsIgnoreCase('sid')) {
                        if(objectAPIName=='ERP_Sales_Prices_SAP__c') {
                            columnList.add(string.valueOf(sObj.get('id')));                       
                        }
                        else  {
                            columnList.add(sObj.get('ERP_Sales_Prices_SAP__c')==null ? ' ' : string.valueOf(sObj.get('ERP_Sales_Prices_SAP__c')));
                        }
                    }
                    else if(headerArray[i].trim().equalsIgnoreCase('per') || headerArray[i].trim().containsIgnoreCase('rate') || headerArray[i].trim().containsIgnoreCase('quantity')) {
                        if(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null && (string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim()))).escapeCsv()).contains('.')) {                                
                            columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim()))).replace('.',numberseparator)).escapeCsv() : ' ');                      
                        }
                        else {                              
                            columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim())))).escapeCsv() : ' ');
                        }
                    }
                    //<VR20130509>
                    else if(headerArray[i].trim().equalsIgnoreCase('Scale Type') && objectAPIName=='ERP_Sales_Prices_SAP__c'){
                        columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (characterAttach+string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim())))).escapeCsv() : 'Base-Scale');
                    }
                    else if(!(headerArray[i].equalsIgnoreCase('Valid From') || headerArray[i].equalsIgnoreCase('Valid To'))) {                                                                                            
                        columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (characterAttach+string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim())))).escapeCsv() : ' ');
                    }
                    else {                        
                        Date importDate = (Date)sObj.get(objAPIMap.get(headerArray[i].trim()));
                        columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (characterAttach+(importDate.year()+(string.valueOf(importDate.month()).length()==1 ? '0'+importDate.month() : ''+importDate.month())+(string.valueOf(importDate.day()).length()==1 ? '0'+importDate.day() : ''+importDate.day()))).escapeCsv() : ' ');
                    }
                }
                catch(Exception e) {
                    columnList.add(' ');
                }
            }
            rowList.add(string.join(columnList,separator));
        }
        return recordString+'\n'+string.join(rowList,'\n');   //returning the string which holds the header and data which is to be exported
    }
    global void finish(Database.BatchableContext BC){
        
        Map<string,string> pckcTable=new Map<String,String>();
        Map<String,Map<String,String>> custTable=new Map<String,Map<String,String>>();
        system.debug('inside finish method');
        String csr,custSA='';
        String custsalesorg; //<AS19-08-20>
        
        String combinedTable;
        map<String,String> csrPriceMap=new map<String,String>();        
        system.debug('***mapsize'+soldToTableMap.size()+','+soldToTableMap);
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        //<TJ20150116> START - Fix For Support Issue-Expiry Notification
        List<String> add = new List<String>();
        /*if(soldToCodeCSRMap.keySet().size()>0)
        {
            for(String s:soldToCodeCSRMap.keySet())//CSR Emails, All CSR where price expiring
            {   
                add.clear();
                string combinedTable='';
                for(String cust:soldToCodeCSRMap.get(s))//List of customer for a specific csr
                {
                    system.debug('@#%%^^%inside for');
                    if(soldToTableMap.get(cust)!=null)//Customer, Map of pckc,price 
                    {
                        pckcTable = soldToTableMap.get(cust);
                        //custTable.put(cust,pckcTable);
                        for(string key: pckcTable.keyset())
                        {
                            combinedTable += pckcTable.get(key)+'\n\n\n\n\n\n';
                        }
                        combinedTable.removeEnd('\n\n\n\n\n\n');                        
                    }
                }
                for(string table : custTable.keyset()) {
                    
                }*/
                
           List<OrgGroup__c> orgUserLists = new List<OrgGroup__c>();
        String OGOwnerMail; /* Joel-20200122 */
          OrgGroup__c orgUserList;
          //2020 query: ERP Customer with partner function Code = ZR.filter duplicates and Add records to csrPriceMap  add CSR and BU Admins to notification recepient list Issue
         //<SK28-07-20 IS SC-00095108>
            if(isNonCustomerBu){
                orgUserLists=[SELECT Id,Owner.Name, owner.Email FROM OrgGroup__c WHERE Business__c=: NcBusiness];
            }          
        if(orgUserLists.size()>0){
                    orgUserList = orgUserLists[0];
               //2020 OGOwnerMail = orgUserList.owner.email; 
                 //2020       csrPriceMap.put(OGOwnerMail,'');
                system.debug('Sumit> orgUserList' + orgUserList + 'Owner' + OGOwnerMail);
            }
         string BUAdminemail='';
        if(!test.isrunningtest())
        { BUAdminemail=[SELECT Email FROM User where id in (SELECT Ownerid fROM OrgGroup__c where Business__c=:bUAdminBu) Limit 1].Email;}//<VK27-08-20 IS ID-00083279>
                //System.debug('email is--->'+buAdminemail);                
                for(ERP_Sales_Prices_SAP__c price: expPrices)
                {
                    //<AS19-08-20>-start
                    if(isDPPEMEA){
                       custsalesorg=price.Sold_To_Code__c+price.Sales_Org_Code__c;
                        csr=ZUpartnermap.get(custsalesorg);
                        system.debug(csr); 
                        //<AS19-08-20>-end
                    }
                    //<VK27-08-20 IS ID-00083279>-start                        
                    else if(bUAdminBu!= null && bUAdminBu != '' ) // <KK25-05-23 IS EI-00098148>
                    {
                        csr = (BUAdminEmail!=null && BUAdminEmail!='') ? BUAdminEmail : Price.Owner.Email;
                    //system.debug('******'+csr);
                    }
                    //<VK27-08-20 IS ID-00083279>-end
                   
                    else{
                        csr=price.owner.email;
                        system.debug(csr);}
                    if(!csrPriceMap.keyset().contains(csr))
                    {
                        csrPriceMap.put(csr,'');
                    }
                    custSA=price.sold_To_Code__c+price.Sales_Org_Code__c;
                    pckcTable = soldToTableMap.get(custSA);
                    for(string key: pckcTable.keyset())
                    {
                        combinedTable=csrpricemap.get(csr);
                        if(csrpricemap.get(csr)!='' && !csrpricemap.get(csr).contains(pckcTable.get(key)))
                        csrpricemap.put(csr,csrpricemap.get(csr)+ pckcTable.get(key)+'\n\n');
                        else if(!csrpricemap.get(csr).contains(pckcTable.get(key)))
                        csrpricemap.put(csr,pckcTable.get(key)+'\n\n');                                             
                    }                                       
                    //system.debug('@&#^&^123'+csrpricemap.keyset().size()+' '+csrpricemap.keyset());                   
                }
                
                for(string emailid:csrpricemap.keyset())
                {   
                    add.clear();
                    system.debug('&#^*&$^#*'+emailid);
                    if(emailid!=null && csrpricemap.get(emailid)!='')
                    {
                        system.debug('&#^*&$^#*1'+emailid);
                        Blob myBlob=Blob.valueof(csrpricemap.get(emailid));
                        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
                        attach.setContentType('aapplication/vnd.ms-excel');
                        attach.setFileName('Prices OutLook mail.xls');
                        attach.setInline(false);
                        attach.Body = myBlob;
                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        mail.setUseSignature(false);
                        //add.add(emailid);
                        //add.add('gupta.sumit3@tcs.com');
                        
                        if(isCustomerBu){
                            if(is13DppGlobal==false) //<IS ID-00070035>
                                add.add(emailid);
                            mail.setSubject('SFDC PA Notification – Customer prices due to expire');
                            if(isDiagnosticsGlobal)
                                mail.setHtmlBody('Dear Sales Representative,<br><br> The attached file contains a list of customer prices due to expire in the next 60 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                           else
                                mail.setHtmlBody('Dear Sales Representative,<br><br> The attached file contains a list of customer prices due to expire in the next 30 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                        }
                        if(isNonCustomerBu){
                            if(OrgUserList != Null && is11NcDppGlobal==false && is13NcDppGlobal==false)//<IS ID-00070035>
                                add.add(orgUserList.Owner.Email);
                            mail.setSubject('SFDC PA Notification – Non Customer prices due to expire');
                            mail.setHtmlBody('Dear BU Admin,<br><br> The attached file contains a list of non customer prices due to expire in the next 30 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                        }
                        if(is11DppGlobal || is11NcDppGlobal){
                            List<String> EmailSplit = (Label.DppGlobalKnV11BuNotifyEmail).split(',');
                            for(String e:EmailSplit){
                                add.add(e);
                            }
                        }
                        if(is13DppGlobal || is13NcDppGlobal){
                            List<String> EmailSplit = (Label.DppGlobalKnV13BuNotifyEmail).split(',');
                            for(String e:EmailSplit){
                                add.add(e);
                            }
                        }
                        if(isDiagnosticsGlobal){
                            List<String> EmailSplit = (Label.DiagnosticsGlobalExpiryNotification).split(',');
                            for(String e:EmailSplit){
                                add.add(e);
                            }
                        }
                        mail.setToAddresses(add);
                        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
                        mails.add(mail);
                    }
                    if(isNonCustomerBu){
                        break;
                    }
                }
                
                
                
                /*Blob myBlob = Blob.valueof(combinedTable);
                Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
                attach.setContentType('aapplication/vnd.ms-excel');
                attach.setFileName('Customer OutLook mail.xls');
                attach.setInline(false);
                attach.Body = myBlob;
                //system.debug('ATTACH'+ attach);
    
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setUseSignature(false);
                system.debug(count1+' '+soldToCodeCSRMap+' '+soldToCodeCSRMap1);
                //add.add(s);
                add.add('abhijeet08560@gmail.com');
                //<PP20131024> START
                if(combinedTable!='')
                {
                    system.debug('#%&@%#@&@1');   
                    mail.setToAddresses(add);
                    mail.setSubject('SFDC PA Notification – Customer prices due to expire');
                    mail.setHtmlBody('Dear Sales Representative,<br><br> The attached file contains a list of customer prices due to expire in the next 30 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
                    mails.add(mail);
                    system.debug('#%&@%#@&@2');
                }
            }
        }
        /*else if(soldToCodeCSRMap1.keySet().size()>0)
        {
            for(String s:soldToCodeCSRMap1.keySet())
            {   
                add.clear();
                custTable.clear();
                string combinedTable='';
                for(String cust:soldToCodeCSRMap1.get(s))
                {
                    system.debug('@#%%^^%inside for');
                    if(soldToTableMap.get(cust)!=null)
                    {
                        pckcTable = soldToTableMap.get(cust);          
                        custTable.put(cust,pckcTable);
                    }
                }
                for(string table : custTable.keyset()) {
                    if(pckcTable.get(table)!= null)
                    {
                    combinedTable += pckcTable.get(table)+'\n\n\n\n\n\n';
                    }
                }
                combinedTable.removeEnd('\n\n\n\n\n\n');
                Blob myBlob = Blob.valueof(combinedTable);
                Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
                attach.setContentType('aapplication/vnd.ms-excel');
                attach.setFileName('Customer OutLook mail.xls');
                attach.setInline(false);
                attach.Body = myBlob;
                //system.debug('ATTACH'+ attach);
    
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setUseSignature(false);            
                add.add(s);
                //<PP20131024> START
                if(combinedTable!='')
                {
                    system.debug('#%&@%#@&@1');   
                    mail.setToAddresses(add);
                    mail.setSubject('SFDC PA Notification – Customer prices due to expire');
                    mail.setHtmlBody('Dear Sales Representative,<br><br> The attached file contains a list of customer prices due to expire in the next 30 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
                    mails.add(mail);
                    system.debug('#%&@%#@&@2');
                }
            }
        }        
       
        
        /*for(String s:soldToTableMap.keyset())
        {
            system.debug('@#%%^^%inside for');
            Map<string,string> pckcTable = soldToTableMap.get(s);
            string combinedTable='';
            for(string table : pckcTable.keyset()) {
                combinedTable += pckcTable.get(table)+'\n\n\n\n\n\n';
            }
            combinedTable.removeEnd('\n\n\n\n\n\n');
            Blob myBlob = Blob.valueof(combinedTable);
            Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
            attach.setContentType('aapplication/vnd.ms-excel');
            attach.setFileName('Customer OutLook mail.xls');
            attach.setInline(false);
            attach.Body = myBlob;
            //system.debug('ATTACH'+ attach);

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setUseSignature(false);
            system.debug(count1+' '+soldToCodeCSRMap+' '+soldToCodeCSRMap1);
            //<PP20131024> START
            if(soldToCodeCSRMap.get(s) != null)
            {
                system.debug('#%&@%#@&@1');   
                mail.setToAddresses(soldToCodeCSRMap.get(s) );
                mail.setSubject('SFDC PA Notification – Customer prices due to expire');
                mail.setHtmlBody('Dear Sales Representative,<br><br> The attached file contains a list of customer prices due to expire in the next 30 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
                mails.add(mail);
                system.debug('#%&@%#@&@2');
            } 
            if(soldToCodeCSRMap1.get(s) != null)
            {
                system.debug('^$#&#^%#$&1');   
                mail.setToAddresses(soldToCodeCSRMap1.get(s) );
                mail.setSubject('SFDC PA Notification – Customer prices due to expire');
                mail.setHtmlBody('Dear Sales Representative,<br><br> The attached file contains a list of customer prices due to expire in the next 30 days. Please review <br>the information and take appropriate action.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
                mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
                mails.add(mail);
                system.debug('^$#&#^%#$&2');
            } 
                                       
        }*/
         //<TJ20150116> END
        system.debug(system.logginglevel.error,'MAILS are sent to'+ soldToCodeCSRMap);
        if(!test.isRunningTest())
            Messaging.sendEmail(mails);
    }   
}