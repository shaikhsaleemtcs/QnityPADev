/*
 * Name         :   BU_PricingRequestItem_DuplicateCheck
 * Description  :   This trigger will check for the duplicate Request Items and Below Current Flag Check 
 * Author       :   Infosys Limited
 * Created Date :   NA
 *
 * Version      Modified Date       Modified By     Modification
 *  1.0         01-02-2013           Priyanka   
 *  1.1         19-02-2013           Bala          Adding the logic for current Price chek
 *  1.2         19-02-2013           Priyanka      Changing PCKC concatenation
 *  1.3         20-02-2013           Bala          Removing the logic for current flag checking 
 *  1.4         22-02-2013           Priyanka      Removing name check from query and putting it in if condition
                                                   This is used to avoid self duplicate check in massive
 *  1.5         02-03-2013           Priyanka      Changed if condition for duplicate check
 *  1.6         24-04-2013           Shiva         Changing PCKC concatenation(addition of End User)
    1.7         10-05-2013           Neeharika     Added NPC code  
    1.8         03-06-2013          Utkarsh         Added condition and Flag for recursive update of Pr Status
    1.9         11-07-2013          Utkarsh/Neeha   Added condition for Recall error check
    2.0      07-03-2022      Rajesh      Updated code to include PR number to the error message that is shown when a duplicate request item with the overlapping validity already exists in another PR.
 * -------------------------------------------------------------------------------------------------------------------
 */

/***********************************************Modification Log************************************************
  <VR20130509>
Last Modified By   :   Vinoth Rajapandian
Last Modified Date :   09 May 2013
Description        :   Adding logic for extra key field Customer Hierarchy - APAC ROLLOUT1(1.8)                        

 *****************************************************************************************************************
 <BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(1.9)
 *****************************************************************************************************************
<PP20130925>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   25 September 2013
Description         :   Removing Distribution Channel Code and Division Code from query - APAC ROLLOUT2(2.0)
 *****************************************************************************************************************
<PP20131028>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   28 October 2013
 Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
 *****************************************************************************************************************
<PP20140122>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   22 January 2014
 Description         :   Modified logic for querying Duplicate Request Item - UNIT TESTING
 ***********************************************************************************************************************
<BB20140404>
Last Modified By    :  Bisnupriya Budek
Last Modified Date  :  04 April 2014
Description         :  CAPITAL PROJECT - Logic was added to allow the duplicate requestItems to insert into the request with the Error message.
*****************************************************************************************************************
<PP20140929>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   29 Sep 2014
 Description         :   Added External ERP ID to Pricing Request Item - Fix for Issue IS ID-00047158
*****************************************************************************************************************
<RB20220307>
 Last Modified By    :   Rajesh Barda
 Last Modified Date  :   07 March 2022
 Description         :   Updated code to include PR number to the error message that is shown when a duplicate request item with the overlapping validity already exists in another PR. IS TI-00093632.
*****************************************************************************************************************
<SS20220826>
 Last Modified By    :   Shantanu Sharma
 Last Modified Date  :   26 Aug 2022
 Description         :   Updated logic to include Sales Order Item for duplicate check.
 *****************************************************************************************************************/

trigger BU_PricingRequestItem_DuplicateCheck on Pricing_Request_Item__c (before update, before insert){
    //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
    System.debug('$$$ in trigger dup chk');
    static boolean test = false;
    List<Id> priIdList = new List<Id>();
    List<String> pcKCList = new List<String>();
    //<PP20140929>
    List<String> externalERPIdList = new List<String>();
    Map<Pricing_Request_Item__c,String> reqItemToPCKCMap = new Map<Pricing_Request_Item__c,String>();
    Map<String, Pricing_Request_Item__c> pckcToOldReqItemMap = new Map<String, Pricing_Request_Item__c>();//<RB20220307>
    Map<String,List<Pricing_Request_Item__c>> pcKCToExistingReqItemMap = new Map<String,List<Pricing_Request_Item__c>>();
    Pricing_Request__c pr = new Pricing_Request__c();
    String pckc;
    System.debug('**********Trigger.new[0].Pricing_Request__c'+Trigger.new[0].Pricing_Request__c);
    pr=[SELECT Name,BU__c,Sales_Org_Code__c,Request_Approval_Status__c, NPC_Status__c,Division_Code__c,Dist_Channel_Code__c,Customer_Specific__c,
        Pricing_Request_Type__c,Approver1_Date__c,Current_Level__c, Submitted_on__c ,Approver5__c,Cloned_Request__c, F_NPC_Callout_Status__c,isNPCApplicable__c FROM Pricing_Request__c WHERE Id= :Trigger.new[0].Pricing_Request__c];
    //<PP20140929> START - Moved the code from below the for loop to above
    String  PricingRequestType;
    if(pr.Pricing_Request_Type__c != null && pr.Pricing_Request_Type__c =='Project Pricing')
    {
        PricingRequestType='Project';
    }
    else
    {
        PricingRequestType=pr.Pricing_Request_Type__c;
    }
    //<PP20140929> END
    System.debug('**** pr'+pr);
    //<PP20140626>
    List<Pricing_Request_Item__c> prItems = [SELECT Id, Net_Price_Status__c,Total_Materials__c,Net_Price_Calculated_Materials__c,Expire__c, isNPCApplicable__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :pr.Id]; 
    Boolean itemPendingFlag = false;

    for(Pricing_Request_Item__c pri : Trigger.new)
    {
        priIdList.add(pri.Id);
        //Ver1.2,1.6 START
        //ver 1.3 START - Bala
        //<VR20130509> Ver 1.8 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
        //<BB20130726> Ver 1.9 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Sales Type, Incoterms
        //<PP20131028>
        //<MS20140515> Adding variant and sales order type codes to pckc
        //<SS20220826> Adding Sales Order Item to PCKC
        String s = pri.Pricing_Condition_Code__c + pri.Sales_Org_Code__c+pri.Dist_Channel_Code__c+ pri.Division_Code__c+ pri.Sold_To_Code__c + pri.Material_Code__c+pri.PH1_Code__c + pri.PH2_Code__c + pri.PH3_Code__c + pri.PH4_Code__c + pri.PH5_Code__c + pri.PH6_Code__c + pri.PH7_Code__c + pri.PH8_Code__c + pri.PH9_Code__c+ pri.ShipTo_Code__c + pri.Sales_Office_Code__c + pri.Customer_Price_Group_Code__c + pri.Material_Price_Group_Code__c + pri.Price_List_Type_Code__c+ pri.Terms_Of_Payment_Code__c + pri.Disc_Ref__c +pri.End_Use_Code__c+pri.Market_Segment_Code__c+pri.Variant_Code__c+pri.Sales_Order_Type_Code__c+pri.Sales_Order_Item_Code__c+pri.Price_Ref_Partner_Code__c+pri.Country_Code__c+pri.End_User_Code__c+pri.Customer_Hierarchy_Code__c+pri.Profit_Center_Code__c+pri.Incoterms_Code__c+pri.Ship_To_Country_Code__c+pri.ComPartner_Code__c+pri.Material_Group_5_Key_Code__c+pri.Material_Group_1_Code__c+pri.Partner_ZF_Code__c+pri.Payer_Code__c+pri.FixValDate__c+pri.Disc_Ref_No__c+pri.Campaign_Code__c+pri.Document_Currency_Code__c+pri.State_Code__c;
        //Ver 1.3 END -Bala 
        //Ver1.2 END
        s = s.remove('null');
        pckc=s;
        pcKCList.add(s);
        s = s + '-' + pr.BU__c + '-' + pricingRequestType;
        externalERPIdList.add(s);
        System.debug('*****pri.Net_Price_Status__c'+pri.Net_Price_Status__c);
        if(Trigger.isUpdate)
        {
            //for current instance check the flag with updated but not inserted instance.
            //for Recall error start -VER 1.9
            system.debug('***BU Ducplicate'+pri.Total_Materials__c+'**NPC'+pri.Net_Price_Calculated_Materials__c);
            if(pri.isNPCApplicable__c && pri.Total_Materials__c != pri.Net_Price_Calculated_Materials__c )
            { 
                if((pri.Net_Price_Status__c == 'Waiting for Net Price' || pri.Net_Price_Status__c == NULL ))
                {
                    itemPendingFlag = true;
                    break; 
                }     
                else if(( pri.Net_Price_Status__c == 'Mat not found'))
                {
                    itemPendingFlag=null;
                }       
            }

            //End
            for(Pricing_Request_Item__c prItem : prItems)
            {
                //for pri, checked above
                if(pri.Id <> prItem.Id)
                {
                    System.debug('****total mat'+prItem.Total_Materials__c+'npc'+prItem.Net_Price_Calculated_Materials__c);
                    if(prItem.isNPCApplicable__c && prItem.Total_Materials__c != prItem.Net_Price_Calculated_Materials__c  )
                    { 
                        if((prItem.Net_Price_Status__c == 'Waiting for Net Price' || prItem.Net_Price_Status__c == NULL)  && !prItem.Expire__c )
                        {
                            system.debug('***BU Ducplicate'+Trigger.oldMap.get(pri.id).Net_Price_Status__c+'***'+pri.Net_Price_Status__c);
                            itemPendingFlag = true;
                            break; 
                        } 
                        else if(( pri.Net_Price_Status__c == 'Mat not found' ))
                        { //modified pri to PrItem
                            itemPendingFlag=null;
                        }

                    }
                }

            }
            if(itemPendingFlag!=null && itemPendingFlag)
            {
                break;
            }
        }
    }  
    System.debug('****itemPendingFlag'+itemPendingFlag);
    //Done for NPC: UTkarsh
    if(Trigger.isUpdate)
    {
        Boolean recalledFlag=false;//this flag is to identify when it is recalled.
        Boolean rejectedFlag=false;//to identify that the action is user rejecting a request
        //to be validated
        Boolean changetoWaitingforSubmisssion=false;
        for(Pricing_Request_Item__c pri:Trigger.new)
        {
            System.debug('*****Trigger.oldMap.get(pri.Id).Approval_Status__c'+Trigger.oldMap.get(pri.Id).Approval_Status__c+'**Status'+pri.Approval_Status__c);
            if(pri.Approval_Status__c=='Draft' || pri.Approval_Status__c=='Recalled' || pri.Approval_Status__c=='Rejected')
            {
                changetoWaitingforSubmisssion=true;
            }
            if(Trigger.oldMap.get(pri.Id)!=null && Trigger.oldMap.get(pri.Id).Approval_Status__c!='Recalled'   && pri.Approval_Status__c=='Recalled'  )
            {
                System.debug('***in recall check');
                recalledFlag=true;
                break;
            }
            if(Trigger.oldMap.get(pri.Id)!=null && Trigger.oldMap.get(pri.Id).Approval_Status__c!='Rejected'  && pri.Approval_Status__c=='Rejected'   )
            {
                System.debug('***in reject check');
                rejectedFlag=true; 
                break;
            }
        }  
        System.debug('*****in update'+pr.NPC_Status__c+'falg'+itemPendingFlag );
        //if condition will be executed in case of auto submission
        System.debug('*****recalledFlag'+recalledFlag);
        System.debug('*****rejectedFlag'+rejectedFlag);  
        System.debug('*****current level'+pr.Current_Level__c);
        System.debug('****pr.Request_Approval_Status__c'+pr.Request_Approval_Status__c);
        System.debug('****pr.Approver__c'+pr.Approver5__c);
        boolean toUpdate = false;
        if(itemPendingFlag!=null && !itemPendingFlag && pr.NPC_Status__c!=null && pr.NPC_Status__c.equalsIgnoreCase('Waiting For Net Price'))
        {
            system.debug('***in BU Duplicate triger'+pr.NPC_Status__c);

            pr.NPC_Status__c = 'Net Price Received';
            toUpdate = true;

        }
        //to resolve same time response error 
        //to remove self referrnce 
        //this is executed, when the last response is received and user has not clicked on Submitted  && pr.Current_Level__c!=null
        else if(itemPendingFlag!=null && !itemPendingFlag && pr.NPC_Status__c==null && (pr.Request_Approval_Status__c=='Draft' || (pr.Request_Approval_Status__c=='Recalled' && pr.Current_Level__c!=null) || (pr.Request_Approval_Status__c=='Rejected' && pr.Current_Level__c!=null )) && changetoWaitingforSubmisssion   )
        {
            system.debug('***in BU Duplicate triger'+pr.NPC_Status__c);
            pr.NPC_Status__c = 'Waiting for Submission';

        }



        if(toUpdate)
        {
            upsert pr;
        }


    }
    //End    
    
    List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
    //<PP20130925>
    //<PP20140122> - Commented customer specific and Validated
    //<PP20140929>
    //<RB20220307> added Pricing_Request__r.Name to the below SOQL
    priList = [SELECT Id,Name,New_Valid_To__c,PCKC__c,New_Valid_From__c,Pricing_Request__r.Name FROM Pricing_Request_Item__c WHERE
                External_ERP_Id__c IN :externalERPIdList AND (Approval_Status__C!='Approved' AND Approval_Status__c!='Abandoned'
                AND Approval_Status__c!='Requested' AND  Approval_Status__c!='Cancelled')]; 
    for(Pricing_Request_Item__c existingPRI : priList)
    {
        if(pcKCToExistingReqItemMap.containsKey(existingPRI.PCKC__c))
        {
            List<Pricing_Request_Item__c> l1 = new List<Pricing_Request_Item__c>();
            l1 = pcKCToExistingReqItemMap.get(existingPRI.PCKC__c);
            l1.add(existingPRI);
            pcKCToExistingReqItemMap.put(existingPRI.PCKC__c,l1);
        }
        else
        {
            List<Pricing_Request_Item__c> l2 = new List<Pricing_Request_Item__c>();
            l2.add(existingPRI);
            pcKCToExistingReqItemMap.put(existingPRI.PCKC__c,l2);
        }
    }                 
    System.debug('$$$$ priList'+priList);
    List<Pricing_Request_Item__c> prItemAddErrorList = new List<Pricing_Request_Item__c>();
    for(Pricing_Request_Item__C priNew : Trigger.new)
    {
        //Ver 1.6
        // modified PCKC population - Bala
        //<VR20130509> Ver 1.8 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
        //<BB20130726> Ver 1.9 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Sales Type Incoterms
        //<PP20131028>
        //<MS20140515> Adding variant and sales order type codes
        //<SS20220826> Adding Sales Order Item to PCKC
        String s1 = priNew.Pricing_Condition_Code__c + priNew.Sales_Org_Code__c+  priNew.Dist_Channel_Code__c  +priNew.Division_Code__c  + priNew.Sold_To_Code__c + priNew.Material_Code__c+priNew.PH1_Code__c + priNew.PH2_Code__c + priNew.PH3_Code__c + priNew.PH4_Code__c + priNew.PH5_Code__c + priNew.PH6_Code__c + priNew.PH7_Code__c + priNew.PH8_Code__c + priNew.PH9_Code__c+ priNew.ShipTo_Code__c + priNew.Sales_Office_Code__c + priNew.Customer_Price_Group_Code__c + priNew.Material_Price_Group_Code__c + priNew.Price_List_Type_Code__c+ priNew.Terms_Of_Payment_Code__c + priNew.Disc_Ref__c +priNew.End_Use_Code__c+priNew.market_Segment_Code__c+priNew.Variant_Code__c+priNew.Sales_Order_Type_Code__c+priNew.Sales_Order_Item_Code__c+priNew.Price_Ref_Partner_Code__c+priNew.Country_Code__c+priNew.End_User_Code__c+priNew.Customer_Hierarchy_Code__c+priNew.Profit_Center_Code__c+priNew.Incoterms_Code__c+priNew.Ship_To_Country_Code__c+priNew.ComPartner_Code__c+priNew.Material_Group_5_Key_Code__c+priNew.Material_Group_1_Code__c+priNew.Partner_ZF_Code__c+priNew.Payer_Code__c+priNew.FixValDate__c+priNew.Disc_Ref_No__c+priNew.Campaign_Code__c+priNew.Document_Currency_Code__c+priNew.State_Code__c;
        s1 = s1.remove('null');
        //Ver 1.5
        //<PP20140122>
        //<BB20140404>
        if((priNew.Approval_Status__c == 'Draft'||priNew.Approval_Status__c == 'Rejected'||priNew.Approval_Status__c == 'Recalled'
            || priNew.Approval_Status__c == 'Validated') && !String.isBlank(priNew.New_Rate__c)  && priNew.New_Valid_From__c!=null && priNew.New_Valid_To__c!=null
            && pcKCToExistingReqItemMap.containsKey(s1))
        {
            for(Pricing_Request_Item__c pri : pcKCToExistingReqItemMap.get(s1))
            {
                //Ver 1.4 START
                system.debug('priNew.Name  is '+priNew.Name+' pri.Name  is '+pri.Name );
        system.debug('pri.PCKC__c  is '+pri.PCKC__c+' s1  is '+s1  );
        system.debug('priNew.New_Valid_To__c  is '+priNew.New_Valid_To__c+' pri.New_Valid_To__c  is '+pri.New_Valid_To__c );
        system.debug('priNew.New_Valid_From__c  is '+priNew.New_Valid_From__c+' pri.New_Valid_From__c  is '+pri.New_Valid_From__c );
        
                if((priNew.Name != pri.Name)&&(pri.PCKC__c == s1) &&(((priNew.New_Valid_From__c >= pri.New_Valid_From__c) && (priNew.New_Valid_From__c <= pri.New_Valid_To__c)) ||
                        ((priNew.New_Valid_To__c  >= pri.New_Valid_From__c)  && (priNew.New_Valid_To__c  <= pri.New_Valid_To__c)) ||
                        ((priNew.New_Valid_From__c <= pri.New_Valid_From__c) && (priNew.New_Valid_To__c  >= pri.New_Valid_To__c))))
                    //Ver 1.4 END
                    {

                    //throw new  PAException('DUPLICATE CHECK',ApexPages.Severity.ERROR);
                    //Ver 1.6
                    //<VR20130509> Ver 1.8 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
                    //<BB20130726> Ver 1.9 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Sales Type Incoterms
                    //<PP20131028>
                    //<MS20140515> Added Variant and SalesOrderType codes
                    //<SS20220826> Adding Sales Order Item to PCKC
                    String pckc1 = 'PC: '+priNew.Pricing_Condition_Code__c + ' KC: ' +priNew.Sold_To_Code__c + '-' +priNew.Material_Code__c+ '-' +priNew.ShipTo_Code__c + '-' +priNew.Sales_Office_Code__c + '-' +priNew.Customer_Price_Group_Code__c +'-' + priNew.Material_Price_Group_Code__c +'-' + priNew.Price_List_Type_Code__c+'-' + priNew.Terms_Of_Payment_Code__c +'-' + priNew.Disc_Ref__c +'-' +priNew.End_Use_Code__c+'-' +priNew.Market_Segment_Code__c+'-'+priNew.Variant_Code__c+'-'+priNew.Sales_Order_Type_Code__c+'-'+priNew.Sales_Order_Item_Code__c+'-'+priNew.Price_Ref_Partner_Code__c+'-'+priNew.Country_Code__c+'-'+priNew.End_User_Code__c+'-'+priNew.Customer_Hierarchy_Code__c+'-'+priNew.Profit_Center_Code__c+'-'+priNew.Incoterms_Code__c+'-'+priNew.Ship_To_Country_Code__c+'-'+priNew.ComPartner_Code__c+'-'+priNew.Material_Group_5_Key_Code__c+'-'+priNew.Material_Group_1_Code__c+'-'+priNew.Partner_ZF_Code__c+'-'+priNew.Payer_Code__c+'-'+priNew.FixValDate__c+'-'+priNew.Disc_Ref_No__c+'-'+priNew.Campaign_Code__c+'-'+priNew.Document_Currency_Code__c+'-'+priNew.State_Code__c;
                    pckc1 = pckc1.remove('null-');
                    pckc1 = pckc1.removeEnd('-null');
                    String ph = priNew.PH1_Code__c + priNew.PH2_Code__c + priNew.PH3_Code__c + priNew.PH4_Code__c + priNew.PH5_Code__c + priNew.PH6_Code__c + priNew.PH7_Code__c + priNew.PH8_Code__c + priNew.PH9_Code__c;
                    ph = ph.remove('null');
                    if(ph != '')
                    {
                        pckc1 = pckc1 + '-' + ph;
                    }
                    reqItemToPCKCMap.put(priNew,pckc1);
                    prItemAddErrorList.add(priNew);
                    pckcToOldReqItemMap.put(priNew.pckc__c, pri); //<RB20220307>
                    //priNew.addError('Request already exists for that period. Please change the validity dates for'+s1);
                    }
                else if(pr.Cloned_Request__c && trigger.isUpdate){
                    priNew.Error_Indicator__c = '';
                }
            }
        }
    }
    for(Pricing_Request_Item__c pri1 : prItemAddErrorList)
    {
        System.debug('*****PCKC in trigger error'+reqItemToPCKCMap.get(pri1));
        if(pr.Pricing_Request_Type__c=='Project Pricing')
        {
            pri1.addError('Selected records already available in the request '+reqItemToPCKCMap.get(pri1));
        }
        else {
            //<BB20140404>
            system.debug('***pr.Cloned_Request__c'+pr.Cloned_Request__c);
            if(pr.Cloned_Request__c == true){
                pri1.Error_Indicator__c='WARNING:Adjust the validity Dates,as a request already exists for the requested period';
                system.debug('***pr.Error_Indicator__c'+pri1.Error_Indicator__c);
            }
            else{
                pri1.addError('Request Item already exists for that period in '+(pckcToOldReqItemMap.containsKey(pri1.pckc__c)?pckcToOldReqItemMap.get(pri1.pckc__c).Pricing_Request__r.Name:'system')+'. Please change the validity dates for '+reqItemToPCKCMap.get(pri1)); //<RB20220307>
            }
        }
    }
}