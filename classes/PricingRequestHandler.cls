/*************************************************************************************************************
 * Email        :   priyanka_pillala@infosys.com
 * Date         :   25 May 2013
 * Description  :   Called from a Trigger trigPricingRequest to send Notifications to backup Approvers and CSRs
 **************************************************************************************************************
 * Version      Modified Date       Modified By     Modification
 *  1.0         09-02-2013          Utkarsh         Added Email Notification Logic
 *  1.1         14-3-2013           Sanjib          Added delegate approvl logic
 *  1.2         7-6-2013            Utkarsh         NPC and Back up logic merged
 *  1.3         09-May-2013         Bala            Added logic for Out Of Office
 * -------------------------------------------------------------------------------------------------------------
 ***********************************************Modification Log************************************************
<PP20130429>
Last Modified By   :   Priyanka Pillala
Last Modified Date :   29 Apr 2013
Description        :   Added logic for sending notifications to CSR - APAC ROLLOUT1(1.4)
 *****************************************************************************************************************
<VR20131126>
Last Modified By   :   Vinoth Rajapandian
Last Modified Date :   26 Nov 2013
Description        :   DTT Rollout Issue - changing the actor id when the request is sent to backup approver
 *****************************************************************************************************************
<SS20131226>
Last Modified By   :   Shiva 
 Last Modified Date :   26 Dec 2013
Description        :   Bulk Approval Production Issue  
 *****************************************************************************************************************
<VR20140303>
Last Modified By   :   Vinoth 
Last Modified Date :   03-03-2014
Description        :   Global Rollout - Notification to CSR on Submit 
 *****************************************************************************************************************
<GT20141021>
Last Modified By   :   George Thomas 
Last Modified Date :   21-10-2014
Description        :   Wave2 - Mapping import request as CS/NCS based on Key combination
 *****************************************************************************************************************
<IS ID-00058392>
Last Modified      :  Sumit Gupta
Modified Date      :  Dec 22 2015    
Description        :  Restrict DPP Polymer EMEA CSR to receive notification on submission of Request. 
 **************************************************************************************************************** 
 <IS ID-00062267>
Last Modified      :  Mansi Gupta
Modified Date      :  Jan 20 2016    
Description        :  PR escalated to BU Admin notification 
 ****************************************************************************************************************
  <IS ID-00065153>
Last Modified      :  Madhurima Daggumati
Modified Date      :  Feb 5 2016    
Description        :  Spot Price Bulk Approval Error 
 ****************************************************************************************************************
   <IS ID-00076073>
Last Modified      :  Mansi gupta
Modified Date      :  Nov 7 2016    
Description        :  DPP Polymers EMEA- Revoke Approver access from BU Admin 
 ****************************************************************************************************************
   <IS ID-00075535>
Last Modified      :  Shyam Bansal
Modified Date      :  Jan 2 2017    
Description        :  Salesforce workflow could not perform a pending action
 ****************************************************************************************************************
<IS EI-00093805>
Last Modified      :  Harsh Gurvanshi
Modified Date      :  Mar 22 2022    
Description        :  Backup approval - Email Template change
 ****************************************************************************************************************
 <IS TI-00094494>
Last Modified      :  Satyandra
Modified Date      :  Jul 26 2022    
Description        :  Backup approval - Email Template change for M&M business
 ****************************************************************************************************************
 
 /

//Comments from PRBIBU Trigger
/* Version      Modified Date       Modified By     Modification
 *  1.0         09-02-2013           Utkarsh        Added Email Notification Logic
    1.1         14-3-2013            sanjib          added delegate approvl logic 
    1.2         7-6-2013            UTkarsh         NPC and Back up logic merged
    1.3         09-May-2013          Bala           Added logic for Out Of Office
    1.4         23-05-2013           Bala           Added date fields to the out office logic .
    1.5         23-05-2013          UTkarsh         Changed the If condition for out of office Logic.
    1.6                 26-06-2013              Utkarsh                 included a set to collect the level for which the backup is out of office. and improvised the conditions for backup out of office.
    1.7                 1-07-2013               Utkarsh                 Put a condition to assign to backup only if he is present.
 * -------------------------------------------------------------------------------*/
public without sharing class PricingRequestHandler extends TriggerHandlerBase
{
  public static boolean changeStatusFlag = false;
  private List<String> toAddresses = new List<String>();
  private Map<Id,Pricing_Request__c> pricingReqOldMap;
  private List<Pricing_Request__c> pricingReqList;
  private List<Pricing_Request_Item__c> priList =new List<Pricing_Request_Item__c>();
  public override void bulkBefore()
  {
    if(Trigger.isUpdate)
    {
      // <SS20131226>  - START
      Boolean executeTrigger= false;
      Boolean executeSendNotificationtoCSR=false;
      Boolean changeNPCStatus=false;
      Boolean executeSendNotificationtoCSROnSubmit=false;
      // <SS20131226>  - END
      pricingReqOldMap = (Map<Id,Pricing_Request__c>)Trigger.oldMap;
      pricingReqList = (List<Pricing_Request__c>)Trigger.new;

      // <SS20131226>  - START
      for(Pricing_Request__c prHandler: pricingReqList)
      {
        if((pricingReqOldMap.get(prHandler.Id).Approver1_Date__c==null && prHandler.Approver1_Date__c!=null) || (pricingReqOldMap.get(prHandler.Id).Approver2_Date__c==null && prHandler.Approver2_Date__c!=null) || (pricingReqOldMap.get(prHandler.Id).Approver3_Date__c==null && prHandler.Approver3_Date__c!=null) || (pricingReqOldMap.get(prHandler.Id).Approver4_Date__c==null && prHandler.Approver4_Date__c!=null) || (pricingReqOldMap.get(prHandler.Id).Approver5_Date__c==null && prHandler.Approver5_Date__c!=null))
        {
          executeTrigger=true;
        }

        //<HL20151902> changed the condition to fix production issue for CSR notification
        if( (pricingReqOldMap.get(prHandler.Id).Request_Approval_Status__c!=prHandler.Request_Approval_Status__c && prHandler.Request_Approval_Status__c=='Approved'))
        {
          executeSendNotificationtoCSR=true;
        }
        //<VR20140303> Global Rollout - Notification to CSR on Submit
        if(prHandler.Request_Approval_Status__c=='Submitted' && pricingReqOldMap.get(prHandler.Id).Request_Approval_Status__c!=prHandler.Request_Approval_Status__c)
        {
            /*************This if condition is added to avoid DPP Polymers EMEA 
            CSR to receive notification on submission of Requests*************/
            system.debug('Pricing Request Business >>> ' + prHandler.BU__c);
            if(prHandler.BU__c != 'DPP Polymers EMEA'){
                executeSendNotificationtoCSROnSubmit=true;
            }else
                executeSendNotificationtoCSROnSubmit=false; 
            system.debug('executeSendNotificationtoCSROnSubmit>>> '+ executeSendNotificationtoCSROnSubmit);
        }
        if((pricingReqOldMap.get(prHandler.Id)!=null && pricingReqOldMap.get(prHandler.Id).NPC_Status__c=='Waiting For Submission' && prHandler.NPC_Status__c=='Waiting for Net Price') || (prHandler.NPC_Status__c=='Waiting For Submission' && prHandler.Request_Approval_Status__c=='Submitted'))
        {
          changeNPCStatus = true;
        }
        if(prHandler.Request_Approval_Status__c=='Approved' && pricingReqOldMap.get(prHandler.Id).Request_Approval_Status__c!=prHandler.Request_Approval_Status__c)
        {
          prHandler.Delegation_Comments__c='';
        }
      }
      if(!executeTrigger)
      {
        System.debug('***trigger call');
        Set<Id> preqIdSet= new Set<Id>();
        for(Pricing_Request__c pr:pricingReqList)
        {
          preqIdSet.add(pr.Id);
        }
      }

      if(executeSendNotificationtoCSR)
      {
        sendNotificationToCSR();
      }
      if(executeSendNotificationtoCSROnSubmit)
      {
        sendNotificationToCSROnSubmit();
      }

      if(changeNPCStatus)
      {
        changeNetPriceStatus();
      }
      //<MS20150522>
      //<AV20150604>-Start-Production issue- Status of req item not updating
      if(pautil.trigExecChk == null || pautil.trigExecChk == false)
      {
        sendNotificationToApprovers();
        //pautil.trigExecChk =true;
      }
      //<AV20150604>-End-Production issue- Status of req item not updating
      // <SS20131226>  - END
      updateImportCSNCS();
    }

  }

  //<GT20141021> Added logic to map the import requests as customer specific/ Non customer specific 
  private void updateImportCSNCS()
  {
    List<Id> prReqIdList = new List<Id>();
    for(Pricing_Request__c pr:pricingReqList)
    {
      if(pr.Request_Type__c=='Import')
      {
        prReqIdList.add(pr.id);
        System.debug('Key Combination from PR:'+pr.Key_Combination__c);
      }
    }
    if(prReqIdList.size()>0)
    {
      Set<String> sapCluster = new Set<String>();
      Set<String> kcSet = new Set<String>();
      Map<Id,String> mapReqIdKc = new map<Id,String>();
      Map<String,boolean>mapKcCodeCs = new Map<String,boolean>();
      for(Pricing_Request_Item__c prItem:[select Key_Combination_Code__c,Pricing_Request__c, Pricing_Request__r.SAP_Cluster__c from Pricing_Request_Item__c where Pricing_Request__c in :prReqIdList])
      {
        sapCluster.add(prItem.Pricing_Request__r.SAP_Cluster__c);
        kcSet.add(prItem.Key_Combination_Code__c);
        if(!mapReqIdKc.containsKey(prItem.Pricing_Request__c))
          mapReqIdKc.put(prItem.Pricing_Request__c,prItem.Key_Combination_Code__c);
      }
      System.debug('mapReqIdKc:-'+mapReqIdKc);
      for(ERP_Key_Combination__c kc: [Select Customer_Specific__c,Key_Combination_Code__c FROM ERP_Key_Combination__c where Key_Combination_Code__c in:kcSet and SAP_Cluster__c in:sapCluster ])
      {
        if(!mapKcCodeCs.containsKey(kc.Key_Combination_Code__c))
          mapKcCodeCs.put(kc.Key_Combination_Code__c,kc.Customer_Specific__c);
      }
      System.debug('mapKcCodeCs:-'+mapKcCodeCs);
      for(Pricing_Request__c pr:pricingReqList)
      {
        System.debug('Request Customer specific ?:'+mapKcCodeCs.get(mapReqIdKc.get(pr.id)));
        if(mapKcCodeCs.get(mapReqIdKc.get(pr.id))!=null)
          pr.Customer_Specific__c =mapKcCodeCs.get(mapReqIdKc.get(pr.id));
      }
    }  
  }

  //neeharika- To change the Status to Net Price received from Waiting for Submission - 
  private void changeNetPriceStatus()
  {
    //For Same time response error-fix START
    //neeha-july 5th
    Set<Id> preqIdSet= new Set<Id>();
    for(Pricing_Request__c pr:pricingReqList)
    {
      preqIdSet.add(pr.Id);
    }
    List<Pricing_Request_Item__c> priList=[SELECT Id,Net_Price_Status__c,Pricing_Request__c FROM Pricing_Request_Item__c where Pricing_Request__c=:preqIdSet];

    Map<Id,List<Pricing_Request_Item__c>> preqpReqItemMap= new Map<Id,List<Pricing_Request_Item__c>>();
    for(Pricing_Request_Item__c pritem:priList)
    {
      if(!preqpReqItemMap.containskey(pritem.Pricing_Request__c))
      {
        List<Pricing_Request_Item__c> l=new List<Pricing_Request_Item__c>();
        l.add(pritem);
        preqpReqItemMap.put(pritem.Pricing_Request__c,l);
      }      
      else
      {        
        List<Pricing_Request_Item__c> hList = preqpReqItemMap.get(pritem.Pricing_Request__c);
        hList.add(pritem);
        preqpReqItemMap.put(pritem.Pricing_Request__c,hList);
      }
    }

    Boolean pending=false;
    for(Pricing_Request__c pr:pricingReqList)
    {            
      if(pricingReqOldMap.get(pr.Id)!=null && pricingReqOldMap.get(pr.Id).NPC_Status__c=='Waiting For Submission'
          && pr.NPC_Status__c=='Waiting for Net Price')
      {
        for(Pricing_Request_Item__c priitemCheck:preqpReqItemMap.get(pr.Id))
        {
          if(priitemCheck.Net_Price_Status__c=='Waiting For Net Price')
          {
            pending=true;
            break;
          }
        }
        if(!pending)
          pr.NPC_Status__c='Net Price Received';
      }
      else if(pr.NPC_Status__c=='Waiting For Submission' && pr.Request_Approval_Status__c=='Submitted')
      {
        pr.NPC_Status__c=null;
      }
      System.debug('***in new trigger'+pr.NPC_Status__c);
    } 
    //END
  }

  private void sendNotificationToApprovers()
  {
    Set<String> routingParameter = new Set<String>();
    Map<Id, Pricing_Request__c> mapPricingRequestRec = new Map<Id, Pricing_Request__c>();
    List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
    Map<Id, Id> mapPRItemPR= new Map<Id, Id>();
    String toUserId;
    String templateToBUAdminNoBackup;
    String templateToBackupId;
    String templateToadminAssignedtobackup;
    String templateToDelegateApprovar;
    changeStatusFlag = false;
    List<String> toAddresses = new List<String>();
    List<OrgGroup__c> orgGroupObjList = [SELECT ID, Business__c, OwnerId FROM OrgGroup__c WHERE Business__c <> NULL];
    //1.2 Bala
    List<Id> approversInScope = new List<Id>();
    for(Pricing_Request__c pr : pricingReqList)
    {
      Id buAdminId = returnBuAdminId(pr,orgGroupObjList);
      approversInScope.add(buAdminId);
      approversInScope.add(pr.Approver1__c);
      approversInScope.add(pr.Backup_Level_1__c);
      approversInScope.add(pr.Approver2__c);
      approversInScope.add(pr.Backup_Level_2__c);
      approversInScope.add(pr.Approver3__c);
      approversInScope.add(pr.Backup_Level_3__c);
      approversInScope.add(pr.Approver4__c);
      approversInScope.add(pr.Backup_Level_4__c);
      approversInScope.add(pr.Approver5__c);
      approversInScope.add(pr.Backup_Level_5__c);
    }
    //gives the map of if approver is marked out of office or not (no entrty available if he is out of office)
    //<IS ID-00076073> Mansi- Added profile.name in below query
    Map<Id,User> userAvailabilityMap = new Map<Id,User>([SELECT id,Name,email, profile.name,DelegatedApproverId,out_of_office__c,out_of_office_Start_Date__c,out_of_office_End_Date__c
                                                         FROM User WHERE Id IN :approversInScope AND isActive=true]);

    //End Bala
    //<IS TI-00094494> Start
    Set<String> setBusinessNames = new Set<String>();
    List<PA_Business_Name__mdt> lstPABN = PA_Business_Name__mdt.getAll().values();
    for(PA_Business_Name__mdt objPABN : lstPABN){
        setBusinessNames.add(objPABN.Business_Name__c);
    }
    //<IS TI-00094494> End
    for(Pricing_Request__c pr : pricingReqList)
    {  
      //Version 1.6
      Set <String> setBackupLevel = new Set<String>();
      if(pr.Request_Approval_Status__c == 'Submitted' && pr.Request_Approval_Status__c == pricingReqOldMap.get(pr.id).Request_Approval_Status__c)
      {
        if(pr.Current_Level__c == '1' && pr.Approver1_Date__c <> NULL)
        {
          if(pr.Approver2__c <> NULL)
            pr.Current_Level__c = '2';
          else if(pr.Approver3__c <> NULL)
            pr.Current_Level__c = '3';
          else if(pr.Approver4__c <> NULL)
            pr.Current_Level__c = '4';
          else if(pr.Approver5__c <> NULL)
            pr.Current_Level__c = '5';

          pr.Delegation_Comments__c='';
        }
        else if(pr.Current_Level__c == '2' && pr.Approver2_Date__c <> NULL)
        {
          if(pr.Approver3__c <> NULL)
            pr.Current_Level__c = '3';
          else if(pr.Approver4__c <> NULL)
            pr.Current_Level__c = '4';
          else if(pr.Approver5__c <> NULL)
            pr.Current_Level__c = '5';        

          pr.Delegation_Comments__c='';
        }
        else if(pr.Current_Level__c == '3' && pr.Approver3_Date__c <> NULL)
        {
          if(pr.Approver4__c <> NULL)
            pr.Current_Level__c = '4';
          else if(pr.Approver5__c <> NULL)
            pr.Current_Level__c = '5';
          pr.Delegation_Comments__c='';
        }
        else if(pr.Approver5__c <> NULL && pr.Approver4_Date__c <> NULL)
        {
          pr.Current_Level__c = '5';
          pr.Delegation_Comments__c='';
        }
      }     



      //modifying for out of office
      if(pr.Current_Level__c <> pricingReqOldMap.get(pr.id).Current_Level__c || pr.Approver1__c <> pricingReqOldMap.get(pr.id).Approver1__c
          || pr.Approver2__c <> pricingReqOldMap.get(pr.id).Approver2__c || pr.Approver3__c <> pricingReqOldMap.get(pr.id).Approver3__c
          || pr.Approver4__c <> pricingReqOldMap.get(pr.id).Approver4__c || pr.Approver5__c <> pricingReqOldMap.get(pr.id).Approver5__c
          || (!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c)
          || ((!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c && pr.Sent_to_BUAdmin__c)))
      {
        System.debug('*****sent to bu admin2'+pr.Sent_to_BUAdmin__c);  
        //Version 1.7: shifted it above.
        Id buAdminId = returnBuAdminId(pr,orgGroupObjList);
        //<VR20131126> DTT Rollout Issue - Changing the actor id to current approver when backup flag is checked
        System.debug('*****buAdminId'+buAdminId);  
        if(pr.Current_Level__c == '1' && pr.Approver1__c <> NULL)
        {
          //Bala 1.3 if condition
          //1.4 adding if condition to check if the user is out of office on the running day 
          if(userAvailabilityMap.get(pr.Approver1__c)!=null)
          {

            if((userAvailabilityMap.get(pr.Approver1__c).out_of_office__c==true && 
                (userAvailabilityMap.get(pr.Approver1__c).out_of_Office_start_date__c<=System.today()
                &&userAvailabilityMap.get(pr.Approver1__c).out_of_Office_End_date__c>=System.today()))
                /*//Version 1.6*/||(!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c)
                || (!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c && pr.Sent_to_BUAdmin__c))
            {
              System.debug('*****sent to buadmin'+pr.Sent_to_BUAdmin__c);  
              //move it to backup approver 
              //1.5: changed this if condition as it was take wrongly before in version 1.4                           
              /*//Version 1.6*/
              if(!String.isBlank(String.valueOf(pr.Backup_Level_1__c)) && userAvailabilityMap.get(pr.Backup_Level_1__c)!=null &&
                  userAvailabilityMap.get(pr.Backup_Level_1__c).out_of_office__c==true && 
                  (userAvailabilityMap.get(pr.Backup_Level_1__c).out_of_Office_start_date__c<=System.today()
                  &&userAvailabilityMap.get(pr.Backup_Level_1__c).out_of_Office_End_date__c>=System.today()))
              {

                setBackupLevel.add('1');
                //Assign to BU Admin
                //Version 1.7: commented and shifted it above.
                if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                  pr.Current_Approver__c =  pr.Approver1__c = buAdminId;
                System.debug('*****pr.Current_Approver__c else if 1'+pr.Current_Approver__c); 
              }
              //Version 1.7: Added this condition to make sure that the request goes to admin if backup is nt present.
              else if(pr.Backup_Level_1__c<> NULL && (! pr.Sent_to_BUAdmin__c)){
                System.debug('*****sent to bu admin'+pr.Sent_to_BUAdmin__c);
                //neeha-24th dec
                pr.Current_Approver__c =  pr.Approver1__c = pr.Backup_Level_1__c;
                System.debug('*****pr.Current_Approver__c else if 2'+pr.Current_Approver__c);  
              }
              else if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
              {
                System.debug('*****sent to bu admin 2'+pr.Sent_to_BUAdmin__c);
                pr.Current_Approver__c =  pr.Approver1__c = buAdminId;
                System.debug('*****Current_Approver__c else if 3'+pr.Current_Approver__c+'*bu admin'+buAdminId);
              }
            }
            else    
              pr.Current_Approver__c =  pr.Approver1__c;
          }
          System.debug('*****pr.Current_Approver__c'+pr.Current_Approver__c);  
        }
        else if(pr.Current_Level__c == '2' && pr.Approver2__c <> NULL)
        {
          if(userAvailabilityMap.get(pr.Approver2__c)!=null)
          {
            if((userAvailabilityMap.get(pr.Approver2__c).out_of_office__c==true && 
                (userAvailabilityMap.get(pr.Approver2__c).out_of_Office_start_date__c<=System.today()
                &&userAvailabilityMap.get(pr.Approver2__c).out_of_Office_End_date__c>=System.today()))
                /*//Version 1.6*/ ||(!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c)
                || (!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c && pr.Sent_to_BUAdmin__c))
            {
              //move it to backup approver 
              //1.5: changed this if condition as it was take wrongly before in version 1.4
              /*//Version 1.6*/
              if(!String.isBlank(String.valueOf(pr.Backup_Level_2__c)) && userAvailabilityMap.get(pr.Backup_Level_2__c)!=null &&
                  userAvailabilityMap.get(pr.Backup_Level_2__c).out_of_office__c==true && 
                  (userAvailabilityMap.get(pr.Backup_Level_2__c).out_of_Office_start_date__c<=System.today()
                  &&userAvailabilityMap.get(pr.Backup_Level_2__c).out_of_Office_End_date__c>=System.today()))
              {
                setBackupLevel.add('2');
                //Assign to BU Admin
                //Version 1.7: commented and shifted it above.
                if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                  pr.Current_Approver__c =  pr.Approver2__c = buAdminId;
              }
              //Version 1.7: Added this condition to make sure that the request goes to admin if backup is nt present.
              else if(pr.Backup_Level_2__c<> NULL && (! pr.Sent_to_BUAdmin__c))
              {
                pr.Current_Approver__c =  pr.Approver2__c = pr.Backup_Level_2__c;
              }
              else if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
              {
                pr.Current_Approver__c =  pr.Approver2__c = buAdminId;
              }

            }
            else    
              pr.Current_Approver__c =  pr.Approver2__c;
          }

        }
        else if(pr.Current_Level__c == '3' && pr.Approver3__c <> NULL)
        {

          if(userAvailabilityMap.get(pr.Approver3__c)!=null)
          {

            if((userAvailabilityMap.get(pr.Approver3__c).out_of_office__c==true && 
                (userAvailabilityMap.get(pr.Approver3__c).out_of_Office_start_date__c<=System.today()
                &&userAvailabilityMap.get(pr.Approver3__c).out_of_Office_End_date__c>=System.today()))
                /*//Version 1.6*/ ||(!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c)
                || (!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c && pr.Sent_to_BUAdmin__c))
            {

              //move it to backup approver 
              //1.5: changed this if condition as it was take wrongly before in version 1.4
              /*//Version 1.6*/



              if(!String.isBlank(String.valueOf(pr.Backup_Level_3__c)) && userAvailabilityMap.get(pr.Backup_Level_3__c)!=null &&
                  userAvailabilityMap.get(pr.Backup_Level_3__c).out_of_office__c==true && 
                  (userAvailabilityMap.get(pr.Backup_Level_3__c).out_of_Office_start_date__c<=System.today()
                  &&userAvailabilityMap.get(pr.Backup_Level_3__c).out_of_Office_End_date__c>=System.today()))
              {

                setBackupLevel.add('3');
                //Assign to BU Admin
                //Version 1.7: commented and shifted it above.
                if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                  pr.Current_Approver__c =  pr.Approver3__c = buAdminId;
              }
              //Version 1.7: Added this condition to make sure that the request goes to admin if backup is nt present.
              else if(pr.Backup_Level_3__c<> NULL && (! pr.Sent_to_BUAdmin__c))
              {
                pr.Current_Approver__c =  pr.Approver3__c = pr.Backup_Level_3__c;
              }
              else if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
              {
                pr.Current_Approver__c =  pr.Approver3__c = buAdminId;
              }

            }
            else    
              pr.Current_Approver__c =  pr.Approver3__c; 
          }
        }
        else if(pr.Current_Level__c == '4' && pr.Approver4__c <> NULL)
        {
          if(userAvailabilityMap.get(pr.Approver4__c)!=null)
          {
            if((userAvailabilityMap.get(pr.Approver4__c).out_of_office__c==true && 
                (userAvailabilityMap.get(pr.Approver4__c).out_of_Office_start_date__c<=System.today()
                &&userAvailabilityMap.get(pr.Approver4__c).out_of_Office_End_date__c>=System.today()))
                /*//Version 1.6*/||(!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c)
                || (!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c && pr.Sent_to_BUAdmin__c))
            {
              //move it to backup approver 
              //1.5: changed this if condition as it was take wrongly before in version 1.4
              /*//Version 1.6*/
              if(!String.isBlank(String.valueOf(pr.Backup_Level_4__c)) && userAvailabilityMap.get(pr.Backup_Level_4__c)!=null &&
                  userAvailabilityMap.get(pr.Backup_Level_4__c).out_of_office__c==true && 
                  (userAvailabilityMap.get(pr.Backup_Level_4__c).out_of_Office_start_date__c<=System.today()
                  &&userAvailabilityMap.get(pr.Backup_Level_4__c).out_of_Office_End_date__c>=System.today()))
              {
                setBackupLevel.add('4');
                //Assign to BU Admin
                //Version 1.7: commented and shifted it above.
                if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                  pr.Current_Approver__c =  pr.Approver4__c = buAdminId;
              }
              //Version 1.7: Added this condition to make sure that the request goes to admin if backup is nt present.
              else if(pr.Backup_Level_4__c<> NULL && (! pr.Sent_to_BUAdmin__c))
              {
                pr.Current_Approver__c =  pr.Approver4__c = pr.Backup_Level_4__c;
              }
              else if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
              {
                pr.Current_Approver__c =  pr.Approver4__c = buAdminId;
              }

            }
            else    
              pr.Current_Approver__c =  pr.Approver4__c;
          }
        }
        else if(pr.Current_Level__c == '5' && pr.Approver5__c <> NULL)
        {
          if(userAvailabilityMap.get(pr.Approver5__c)!=null)
          {
            if((userAvailabilityMap.get(pr.Approver5__c).out_of_office__c==true && 
                (userAvailabilityMap.get(pr.Approver5__c).out_of_Office_start_date__c<=System.today()
                &&userAvailabilityMap.get(pr.Approver5__c).out_of_Office_End_date__c>=System.today()))
                /*//Version 1.6*/||(!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c) || (!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c && pr.Sent_to_BUAdmin__c))
            {
              //move it to backup approver 
              //1.5: changed this if condition as it was take wrongly before in version 1.4
              /*//Version 1.6*/
              if(!String.isBlank(String.valueOf(pr.Backup_Level_5__c)) && userAvailabilityMap.get(pr.Backup_Level_5__c)!=null &&
                  userAvailabilityMap.get(pr.Backup_Level_5__c).out_of_office__c==true && 
                  (userAvailabilityMap.get(pr.Backup_Level_5__c).out_of_Office_start_date__c<=System.today()
                  &&userAvailabilityMap.get(pr.Backup_Level_5__c).out_of_Office_End_date__c>=System.today()))
              {
                setBackupLevel.add('5');
                //Assign to BU Admin
                //Version 1.7: commented and shifted it above.
                if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                  pr.Current_Approver__c =  pr.Approver5__c = buAdminId;
              }
              //Version 1.7: Added this condition to make sure that the request goes to admin if backup is nt present.
              else if(pr.Backup_Level_5__c<> NULL && (! pr.Sent_to_BUAdmin__c))
              {
                pr.Current_Approver__c =  pr.Approver5__c = pr.Backup_Level_5__c;
              }
              else if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
              {
                pr.Current_Approver__c =  pr.Approver5__c = buAdminId;
              }

            }
            else    
              pr.Current_Approver__c =  pr.Approver5__c; 
          }
        }
        System.debug('** approver 1'+pr.Current_Approver__c);
        //<VR20131126> DTT Rollout Issue - Changing the actor id to current approver when backup flag is checked
      }

      //Async Call
      System.debug('*** above trigger async'+pr.NPC_Status__c+'***Trigger. old map'+pricingReqOldMap.get(pr.Id).NPC_Status__c);
      if((pricingReqOldMap.get(pr.Id).NPC_Status__c=='Waiting for Net Price' || pricingReqOldMap.get(pr.Id).NPC_Status__c=='Error'
          || pricingReqOldMap.get(pr.Id).NPC_Status__c=='Waiting for Submission' ) && pr.NPC_Status__c == 'Net Price Received')
      {                                     
        PAApprovalWF.submitFuture(pr.id, pr.BU__c);       
      }

//IS ID-00062267 PR escalated to BU Admin notification - start
 
            if(!pricingReqOldMap.get(pr.Id).Sent_to_BUAdmin__c   && pr.Sent_to_BUAdmin__c)
            {
             String templateToBUAdmin = PA_Email_Template_Custom_Settings__c.getInstance('escalatedToBuAdmin').template_Id__c;
                
                if(pr.Current_Approver__c!=null){
                    toAddresses.clear();
                    if(userAvailabilityMap!=null && userAvailabilityMap.containsKey(pr.Current_Approver__c) && userAvailabilityMap.get(pr.Current_Approver__c)!=null)
                    {
                        toAddresses.add(userAvailabilityMap.get(pr.Current_Approver__c).Email);
                    }
                system.debug('***To BU Admin'+toAddresses+pr.Current_Approver__c+templateToBUAdmin);
                PAUtil.sendEmailMethod(templateToBUAdmin, toAddresses, pr.id, pr.Current_Approver__c); 
                }
            }
             //IS ID-00062267 PR escalated to BU Admin notification - end
             
             
      //For Escalation and Delagation
      //<AJ20160120>IS ID-00062166 Added condition "pautil.runOnce()" to fix duplicate email issue for BU Admin
      if(!pricingReqOldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c && pautil.runOnce())
      {
        templateToBUAdminNoBackup = PA_Email_Template_Custom_Settings__c.getInstance('EscalationNotificationNoBackup').template_Id__c;
        templateToadminAssignedtobackup = PA_Email_Template_Custom_Settings__c.getInstance('EscalationNotificationtoBUAdmin').template_Id__c;
        //ver 1.1
        //IS EI-00093805  -- template change form "Approval Template" to "EscalationNotificationToBackupApprover"
        //IS TI-00094494  -- template change form "Approval Template" to "EscalationNotificationToBackupApprover" for M&M business
          templateToDelegateApprovar = (pr.bu__c <> NULL && setBusinessNames.contains(pr.bu__c)) ? 
                          PA_Email_Template_Custom_Settings__c.getInstance('Approval Template').template_Id__c : 
                          PA_Email_Template_Custom_Settings__c.getInstance('EscalationNotificationToBackupApprover').template_Id__c;
          //<IS ID-00076073> Mansi -- Added Condition to not send escalated approval mail if backup approver is BU Admin for BU DPP Polymers EMEA
     //  <IS ID-00075535>[Shyam] If condition and condition is added
        if(pr.Current_Level__c == '1' && pr.Backup_Level_1__c <> NULL )
        {
          /*//Version 1.6*/
           //<IS ID-00076073>
          if(!(pr.bu__c == label.BU_Name && string.valueof(userAvailabilityMap.get(pr.Backup_Level_1__c).profile.name) == label.BU_Admin_Profile_Name ) && !setBackupLevel.contains('1'))
          {
            pr.Approver1__c = pr.Backup_Level_1__c;
            toUserId = pr.Backup_Level_1__c;
          }
        }
          //  <IS ID-00075535>[Shyam] If condition and condition is added
        else if(pr.Current_Level__c == '2' && pr.Backup_Level_2__c <> NULL )
        {
          /*//Version 1.6*/
          //<IS ID-00076073>
          if(!(pr.bu__c == label.BU_Name && string.valueof(userAvailabilityMap.get(pr.Backup_Level_2__c).profile.name) == label.BU_Admin_Profile_Name ) && !setBackupLevel.contains('2'))
          {
            pr.Approver2__c = pr.Backup_Level_2__C;
            toUserId = pr.Backup_Level_2__c;
          }
        }
          //  <IS ID-00075535>[Shyam] If condition and condition is added
        else if(pr.Current_Level__c == '3' && pr.Backup_Level_3__c <> NULL)
        {
          /*//Version 1.6*/
           //<IS ID-00076073>
          if(!(pr.bu__c == label.BU_Name && string.valueof(userAvailabilityMap.get(pr.Backup_Level_3__c).profile.name) == label.BU_Admin_Profile_Name )  && !setBackupLevel.contains('3'))
          {
            pr.Approver3__c = pr.Backup_Level_3__c;
            toUserId = pr.Backup_Level_3__c;
          }
        }
          //  <IS ID-00075535>[Shyam] If condition and condition is added
        else if(pr.Current_Level__c == '4' && pr.Backup_Level_4__c <> NULL)
        {
          /*//Version 1.6*/
            //<IS ID-00076073>
          if(!(pr.bu__c == label.BU_Name && string.valueof(userAvailabilityMap.get(pr.Backup_Level_4__c).profile.name) == label.BU_Admin_Profile_Name ) && !setBackupLevel.contains('4'))
          {
            pr.Approver4__c = pr.Backup_Level_4__c;
            toUserId = pr.Backup_Level_4__c;
          }
        }
          //  <IS ID-00075535>[Shyam] If condition and condition is added
        else if(pr.Current_Level__c == '5'&& pr.Backup_Level_5__c <> NULL)
        {
          /*//Version 1.6*/
            //<IS ID-00076073>
          if(!(pr.bu__c == label.BU_Name && string.valueof(userAvailabilityMap.get(pr.Backup_Level_5__c).profile.name) == label.BU_Admin_Profile_Name ) && !setBackupLevel.contains('5'))
          {
            pr.Approver5__c = pr.Backup_Level_5__c;
            toUserId = pr.Backup_Level_5__c;
          }
        }
        toAddresses.clear();
        if(userAvailabilityMap!=null && userAvailabilityMap.containsKey(toUserId) && userAvailabilityMap.get(toUserId)!=null)
        {
          toAddresses.add(userAvailabilityMap.get(toUserId).Email);
        }
        system.debug('***To Delegate Approver'+toAddresses+toUserId+templateToDelegateApprovar);
        if(!Test.isRunningTest()){
            PAUtil.sendEmailMethod(templateToDelegateApprovar, toAddresses, pr.id, toUserId); //added by hema
        }
              system.debug('>>toUserId>> ' + toUserId);
        if(toUserId <> NULL)
        {
          //added to send the mail to the delegate approvar versn 1.1 
          system.debug('****All '+templateToDelegateApprovar+ toAddresses+ pr.id+ toUserId);
          //versn 1.1 ends
          //1.2 Bala 
          if(pr.Current_Level__c == '1' && toUserId <> NULL)
            if(userAvailabilityMap.get(toUserId)!=null)
              pr.Approver1__c = toUserId;
            else
            {
              Id buAdminId  = returnBuAdminId(pr,orgGroupObjList);
              if(buAdminId!=null)
                pr.Approver1__c = buAdminId;
            }
          else if(pr.Current_Level__c == '2' && toUserId <> NULL)
            if(userAvailabilityMap.get(toUserId)!=null)
              pr.Approver2__c = toUserId;
            else
            {
              Id buAdminId  = returnBuAdminId(pr,orgGroupObjList);
              if(buAdminId!=null)
                pr.Approver2__c = buAdminId;
            }

          else if(pr.Current_Level__c == '3' && toUserId <> NULL)
            if(userAvailabilityMap.get(toUserId)!=null)
              pr.Approver3__c = toUserId;
            else
            {
              Id buAdminId  = returnBuAdminId(pr,orgGroupObjList);
              if(buAdminId!=null)
                pr.Approver3__c = buAdminId;
            }

          else if(pr.Current_Level__c == '4' && toUserId <> NULL)
            if(userAvailabilityMap.get(toUserId)!=null)
              pr.Approver4__c = toUserId;
            else
            {
              Id buAdminId  = returnBuAdminId(pr,orgGroupObjList);
              if(buAdminId!=null)
                pr.Approver4__c = buAdminId;
            }

          else if(pr.Current_Level__c == '5' && toUserId <> NULL)
          if(userAvailabilityMap.get(toUserId)!=null)
            pr.Approver5__c = toUserId;
          else
          {
            Id buAdminId  = returnBuAdminId(pr,orgGroupObjList);
            if(buAdminId!=null)
              pr.Approver5__c = buAdminId;
          }  

          if(pr.Current_Level__c <> pricingReqOldMap.get(pr.id).Current_Level__c || pr.Approver1__c <> pricingReqOldMap.get(pr.id).Approver1__c
              || pr.Approver2__c <> pricingReqOldMap.get(pr.id).Approver2__c || pr.Approver3__c <> pricingReqOldMap.get(pr.id).Approver3__c
              || pr.Approver4__c <> pricingReqOldMap.get(pr.id).Approver4__c || pr.Approver5__c <> pricingReqOldMap.get(pr.id).Approver5__c){
            if(pr.Current_Level__c == '1' && pr.Approver1__c <> NULL){
              pr.Current_Approver__c =  pr.Approver1__c;
            }
            else if(pr.Current_Level__c == '2' && pr.Approver2__c <> NULL){
              pr.Current_Approver__c = pr.Approver2__c;
            }
            else if(pr.Current_Level__c == '3' && pr.Approver3__c <> NULL){
              pr.Current_Approver__c = pr.Approver3__c;
            }
            else if(pr.Current_Level__c == '4' && pr.Approver4__c <> NULL){
              pr.Current_Approver__c = pr.Approver4__c;
            }
            else if(pr.Current_Level__c == '5' && pr.Approver5__c <> NULL){
              pr.Current_Approver__c = pr.Approver5__c;
            }
          } 

          //changed the position for getting the current approver
          //Logic to identify the BU Admin
          for(OrgGroup__c orgGrp : orgGroupObjList)
          {
            if(orgGrp.Business__c == pr.BU__c)
            {
              toUserId = orgGrp.OwnerId;
            }
          }
          
          toAddresses.clear();
          if(userAvailabilityMap!=null && userAvailabilityMap.containsKey(toUserId) && userAvailabilityMap.get(toUserId)!=null){
            toAddresses.add(userAvailabilityMap.get(toUserId).Email);
          }
          system.debug('*** To admin assigned to backup'+templateToadminAssignedtobackup+toAddresses);
             if (!Test.isRunningTest()) {
          PAUtil.sendEmailMethod(templateToadminAssignedtobackup, toAddresses, pr.id, toUserId);
             }
          //Update the current approver with the new delegate approver user.
        } 
        else
        {
          //If the Delegaet approver is not defined, send the notification to BU Admin
          for(OrgGroup__c orgGrp : orgGroupObjList)
          {
            if(orgGrp.Business__c == pr.BU__c)
            {
              toUserId = orgGrp.OwnerId;
            }
          }

          toAddresses.clear();
          if(userAvailabilityMap!=null && userAvailabilityMap.containsKey(toUserId) && userAvailabilityMap.get(toUserId)!=null){
            toAddresses.add(userAvailabilityMap.get(toUserId).Email);
          }
          system.debug('*** To admin assigned to backup'+templateToadminAssignedtobackup+toAddresses);
            if (!Test.isRunningTest()) {
                PAUtil.sendEmailMethod(templateToBUAdminNoBackup, toAddresses, pr.Id, toUserId);
            }
        }          
      }
      //For updating the status of Pricing Request Items     
      if(pricingReqOldMap.get(pr.Id).Request_Approval_Status__c <> pr.Request_Approval_Status__c)
      {     
        mapPricingRequestRec.put(pr.Id, pr);
        system.debug('***Map'+mapPricingRequestRec.keyset());       
        changeStatusFlag = true;
      }
    }
    if(changeStatusFlag)
    {
      for(Pricing_Request_Item__c prItem : [SELECT Approval_Status__c, Pricing_Request__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c
                                            IN :mapPricingRequestRec.keySet()])
      {
        mapPRItemPR.put(prItem.Id, prItem.Pricing_Request__c);
        System.debug('***Map'+mapPRItemPR.keyset());
        Pricing_Request__c pr = mapPricingRequestRec.get(mapPRItemPR.get(prItem.Id));
        System.debug('***Map'+mapPRItemPR.keyset()+pr.Request_Approval_Status__c);
        prItem.Approval_Status__c = pr.Request_Approval_Status__c;
        prItemList.add(prItem);
      }
      upsert prItemList;
    }
  }

  //1.2 bala this method returns the BU Admin Id
  private Id returnBuAdminId(Pricing_Request__c pr,List<OrgGroup__c> OrgGroupList)
  {
    Id returnId;
    for(OrgGroup__c orgGrp:OrgGroupList)
    {
      if(orgGrp.Business__c.equalsIgnoreCase(pr.BU__c))
      {
        returnId = orgGrp.OwnerId;
      }
    }
    return returnId;
  }

  private void sendNotificationToCSR()
  {
    Set<String> soldToCodeSet = new Set<String>();
    Map<String,List<ERP_Relationship__c>> soldToCSRMap = new Map<String,List<ERP_Relationship__c>>();
    Map<String,String> pricingReqtoSoldToMap = new Map<String,String>();
    Set<String> pricingReqSalesOrgSet = new  Set<String>();
    Set<String> pricingReqDistiSet = new  Set<String>();
    Set<String> pricingReqDivisionSet = new  Set<String>();
    Set<String> userIdList = new Set<String>();
    Map<String,boolean> userToCSRNotificationMap = new Map<String,boolean>();
    String templateToCSRId;
    Set<String> uniqueCustomerIdentifierSet = new Set<String>();
    List<Pricing_Request_Item__c> priList=[SELECT Id,SAP_Cluster__c,Pricing_Request__c FROM Pricing_Request_Item__c
                                           WHERE Pricing_Request__c=:pricingReqList];

    System.debug('Debug MF 1:-'+priList);
    Map<String,String> priDetailsMap= new Map<String,String>();

    for(Pricing_Request_Item__c pri:priList)
    {
      priDetailsMap.put(pri.Pricing_Request__c,pri.SAP_Cluster__c);
    }
    System.debug(logginglevel.error,'priDetailsMap'+priDetailsMap);
    Pricing_Request_Item__c pricingReqItem;
    for(Pricing_Request__c pricingReq : pricingReqList)
    {
      if(pricingReqOldMap.get(pricingReq.Id).Request_Approval_Status__c != pricingReq.Request_Approval_Status__c && pricingReq.Request_Approval_Status__c == 'Approved'
          && !String.isBlank(pricingReq.SoldTo_Code__c)) 
      {
        System.debug(logginglevel.error,'****in for'+priDetailsMap.get(pricingReq.Id)+ '-' + pricingReq.SoldTo_Code__c + '-' + pricingReq.Sales_Org_Code__c + '-' + pricingReq.Dist_Channel_Code__c + '-' + pricingReq.Division_Code__c);
        soldToCodeSet.add(pricingReq.SoldTo_Code__c);
        pricingReqtoSoldToMap.put(pricingReq.Id,pricingReq.SoldTo_Code__c);
        pricingReqSalesOrgSet.add(pricingReq.Sales_Org_Code__c);
        pricingReqDistiSet.add(pricingReq.Dist_Channel_Code__c);
        pricingReqDivisionSet.add(pricingReq.Division_Code__c);
        //To avoid non selective query error.
        String sapCluster=priDetailsMap.get(pricingReq.Id);
        uniqueCustomerIdentifierSet.add(sapCluster + '-' + pricingReq.SoldTo_Code__c + '-' + pricingReq.Sales_Org_Code__c + '-' + pricingReq.Dist_Channel_Code__c + '-' + pricingReq.Division_Code__c);
      }
    }
    System.debug('*****uniqueCustomerIdentifierSet'+uniqueCustomerIdentifierSet);
    List<ERP_Relationship__c> erpRelations = new List<ERP_Relationship__c>();
    //commenting as it might throw non-selective error.
    erpRelations = [SELECT Id,User__c,User__r.Name,User__r.Email,ERP_Customer__r.Sales_Org_Code__c,ERP_Customer__r.Division_Code__c,
                    ERP_Customer__r.Distribution_Channel_Code__c,ERP_Customer__r.Street__c,ERP_Customer__r.City__c,ERP_Customer__r.Country__c,
                    ERP_Customer__r.ZIP_Postal_Code__c,ERP_Customer__r.Customer_code__c FROM ERP_Relationship__c WHERE
                    ERP_Customer__r.External_ERP_ID__c=:uniqueCustomerIdentifierSet AND  User__c != null AND Partner_Function_Code__c = 'ZR' 
                    ];

    System.debug('Debug MF 2:-'+erpRelations);
    for(ERP_Relationship__c erp : erpRelations)
    {
      userIdList.add(erp.User__c);
      System.debug('Debug MF 3:-'+userIdList);
      if(soldToCSRMap.containsKey(erp.ERP_Customer__r.Customer_code__c))
      {
        System.debug('Debug MF 3.1:-'+soldToCSRMap);
        List<ERP_Relationship__c> sList = soldToCSRMap.get(erp.ERP_Customer__r.Customer_code__c);
        sList.add(erp);
        soldToCSRMap.put(erp.ERP_Customer__r.Customer_code__c,sList);
      }
      else
      {
        List<ERP_Relationship__c> sList = new List<ERP_Relationship__c>();
        sList.add(erp);
        soldToCSRMap.put(erp.ERP_Customer__r.Customer_code__c,sList);
        System.debug('Debug MF 3.2:-'+soldToCSRMap);
      }
    }

    System.debug('Debug MF 4:-'+soldToCSRMap);

    if(soldToCSRMap.size()>0)
    {

      System.debug('Debug MF 4.1:-'+soldToCSRMap);
      List<Organizational_Group_User__c> orgGroupUsersList = new List<Organizational_Group_User__c>();
      orgGroupUsersList = [SELECT Id,PA_Notify_opt_in__c,Related_User__c FROM Organizational_Group_User__c WHERE Related_User__c IN :userIdList
                           AND Organizational_Group_Item__c IN (SELECT Id FROM Organizational_Group_Item__c WHERE Business__r.Business__c =
                           :pricingReqList[0].BU__c AND OrgGroup__r.ERP_Sales_Org_Code__c IN :pricingReqSalesOrgSet AND
                           OrgGroup__r.ERP_Distribution_Channel_Code__c IN :pricingReqDistiSet AND
                           OrgGroup__r.ERP_Division_Code__c IN :pricingReqDivisionSet)];

      System.debug('Debug MF 4.3:-'+orgGroupUsersList);
      for(Organizational_Group_User__c ogu : orgGroupUsersList)
      {     
        userToCSRNotificationMap.put(ogu.Related_User__c,ogu.PA_Notify_opt_in__c);
      }
      templateToCSRId = PA_Email_Template_Custom_Settings__c.getInstance('FinalApprovalNotification').template_Id__c;
    // Updated by Madhurima(Commented the for loop and implemented a new for loop) IS ID-00065153 3 Feb 2016 Start 
     map<String, List<Id>> pridCSRMap = new map<String, List<Id>>();
   /* for(String priReqId : pricingReqtoSoldToMap.keySet())
      {     
        for(ERP_Relationship__c erpRel : soldToCSRMap.get(pricingReqtoSoldToMap.get(priReqId)))
        {
          if(userToCSRNotificationMap!=null && userToCSRNotificationMap.containsKey(erpRel.User__c)
              && userToCSRNotificationMap.get(erpRel.User__c) && !String.isBlank(templateToCSRId))
          {
            toAddresses.clear();
            toAddresses.add(erpRel.User__r.Email);
            PAUtil.sendEmailMethod(templateToCSRId, toAddresses, priReqId, erpRel.User__c);
            
          }
        }
      } */
     for(String priReqId : pricingReqtoSoldToMap.keySet())
      {  
        System.debug('Debug MF 4.4:-'+pricingReqtoSoldToMap);
        List<Id> tempUserList = new List<Id>();
        for(ERP_Relationship__c erpRel : soldToCSRMap.get(pricingReqtoSoldToMap.get(priReqId)))
        {
          if(userToCSRNotificationMap!=null && userToCSRNotificationMap.containsKey(erpRel.User__c)
              && userToCSRNotificationMap.get(erpRel.User__c) && !String.isBlank(templateToCSRId))
          {
            System.debug('Debug MF 4.4:-'+tempUserList);
            tempUserList.add(erpRel.User__r.Id);
          }
        }
        System.debug('Debug MF 5:-'+tempUserList);
        if(tempUserList.size()>0)
            pridCSRMap.put(priReqId, tempUserList);
      }
      PAUtil.sendEmailToCSR(templateToCSRId, pridCSRMap); 
      // Updated by Madhurima(Commented the for loop and implemented a new for loop) IS ID-00065153 3 Feb 2016 End
      System.debug('%%%%%'+toAddresses + '***' +userToCSRNotificationMap+'***'+ soldToCSRMap);
    }
  }

  //<VR20140303> Global Rollout - Method created to send notification to CSR on submit    
  private void sendNotificationToCSROnSubmit()
  {
    Set<String> soldToCodeSet = new Set<String>();
    Map<String,List<ERP_Relationship__c>> soldToCSRMap = new Map<String,List<ERP_Relationship__c>>();
    Map<String,String> pricingReqtoSoldToMap = new Map<String,String>();
    Set<String> pricingReqSalesOrgSet = new Set<String>();
    Set<String> pricingReqDistiSet = new Set<String>();
    Set<String> pricingReqDivisionSet = new  Set<String>();
    Set<String> userIdList = new Set<String>();
    Map<String,boolean> userToCSRNotificationMap = new Map<String,boolean>();
    String templateToCSRId;
    Set<String> uniqueCustomerIdentifierSet = new Set<String>();
    List<Pricing_Request_Item__c> priList = [SELECT Id,SAP_Cluster__c,Pricing_Request__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c=:pricingReqList];
    Map<String,String> priDetailsMap = new Map<String,String>();

    for(Pricing_Request_Item__c pri:priList)
    {
      priDetailsMap.put(pri.Pricing_Request__c,pri.SAP_Cluster__c);
    }
    System.debug(logginglevel.error,'priDetailsMap'+priDetailsMap);
    Pricing_Request_Item__c pricingReqItem;
    for(Pricing_Request__c pricingReq : pricingReqList)
    {
      if(pricingReqOldMap.get(pricingReq.Id).Request_Approval_Status__c != pricingReq.Request_Approval_Status__c && pricingReq.Request_Approval_Status__c == 'Submitted'
          && !String.isBlank(pricingReq.SoldTo_Code__c)) 
      {
        System.debug(logginglevel.error,'****in for'+priDetailsMap.get(pricingReq.Id)+ '-' + pricingReq.SoldTo_Code__c + '-' + pricingReq.Sales_Org_Code__c + '-' + pricingReq.Dist_Channel_Code__c + '-' + pricingReq.Division_Code__c);
        soldToCodeSet.add(pricingReq.SoldTo_Code__c);
        pricingReqtoSoldToMap.put(pricingReq.Id,pricingReq.SoldTo_Code__c);
        pricingReqSalesOrgSet.add(pricingReq.Sales_Org_Code__c);
        pricingReqDistiSet.add(pricingReq.Dist_Channel_Code__c);
        pricingReqDivisionSet.add(pricingReq.Division_Code__c);
        //To avoid non selective query error.
        String sapCluster=priDetailsMap.get(pricingReq.Id);
        uniqueCustomerIdentifierSet.add(sapCluster + '-' + pricingReq.SoldTo_Code__c + '-' + pricingReq.Sales_Org_Code__c + '-' + pricingReq.Dist_Channel_Code__c + '-' + pricingReq.Division_Code__c);
      }
    }
    System.debug('*****uniqueCustomerIdentifierSet'+uniqueCustomerIdentifierSet);
    List<ERP_Relationship__c> erpRelations = new List<ERP_Relationship__c>();
    //commenting as it might throw non-selective error.
    erpRelations = [SELECT Id,User__c,User__r.Name,User__r.Email,ERP_Customer__r.Sales_Org_Code__c,ERP_Customer__r.Division_Code__c,
                    ERP_Customer__r.Distribution_Channel_Code__c,ERP_Customer__r.Street__c,ERP_Customer__r.City__c,ERP_Customer__r.Country__c,
                    ERP_Customer__r.ZIP_Postal_Code__c,ERP_Customer__r.Customer_code__c FROM ERP_Relationship__c WHERE
                    ERP_Customer__r.External_ERP_ID__c=:uniqueCustomerIdentifierSet AND  User__c != null AND Partner_Function_Code__c = 'ZR' 
                    ];

    System.debug('Line MF 1011 debug' + erpRelations);

    for(ERP_Relationship__c erp : erpRelations)
    {
      userIdList.add(erp.User__c);
      if(soldToCSRMap.containsKey(erp.ERP_Customer__r.Customer_code__c))
      {
        List<ERP_Relationship__c> sList = soldToCSRMap.get(erp.ERP_Customer__r.Customer_code__c);
        sList.add(erp);
        soldToCSRMap.put(erp.ERP_Customer__r.Customer_code__c,sList);
      }
      else
      {
        List<ERP_Relationship__c> sList = new List<ERP_Relationship__c>();
        sList.add(erp);
        soldToCSRMap.put(erp.ERP_Customer__r.Customer_code__c,sList);
      }
    }

    if(soldToCSRMap.size()>0)
    {
      List<Organizational_Group_User__c> orgGroupUsersList = new List<Organizational_Group_User__c>();
      orgGroupUsersList = [SELECT Id,PA_Notify_opt_in__c,Related_User__c FROM Organizational_Group_User__c WHERE Related_User__c IN :userIdList
                           AND Organizational_Group_Item__c IN (SELECT Id FROM Organizational_Group_Item__c WHERE Business__r.Business__c =
                           :pricingReqList[0].BU__c AND OrgGroup__r.ERP_Sales_Org_Code__c IN :pricingReqSalesOrgSet AND
                           OrgGroup__r.ERP_Distribution_Channel_Code__c IN :pricingReqDistiSet AND
                           OrgGroup__r.ERP_Division_Code__c IN :pricingReqDivisionSet)];
    System.debug('Line MF 1038 debug' + orgGroupUsersList);
      for(Organizational_Group_User__c ogu : orgGroupUsersList)
      {     
        userToCSRNotificationMap.put(ogu.Related_User__c,ogu.PA_Notify_opt_in__c);
      }
      templateToCSRId = PA_Email_Template_Custom_Settings__c.getInstance('OnBehalfNotification').template_Id__c;
      // Updated by Sumita Dabas(Commented the for loop and implemented a new for loop) IS ID-00064533 20 Jan 2016 Start 
     map<String, List<Id>> pridCSRMap = new map<String, List<Id>>();
   /* for(String priReqId : pricingReqtoSoldToMap.keySet())
      {     
        for(ERP_Relationship__c erpRel : soldToCSRMap.get(pricingReqtoSoldToMap.get(priReqId)))
        {
          if(userToCSRNotificationMap!=null && userToCSRNotificationMap.containsKey(erpRel.User__c)
              && userToCSRNotificationMap.get(erpRel.User__c) && !String.isBlank(templateToCSRId))
          {
            toAddresses.clear();
            toAddresses.add(erpRel.User__r.Email);
            PAUtil.sendEmailMethod(templateToCSRId, toAddresses, priReqId, erpRel.User__c);
            System.debug('$$$$$'+toAddresses);
          }
        }
      } */
      for(String priReqId : pricingReqtoSoldToMap.keySet())
      {  
        List<Id> tempUserList = new List<Id>();
        for(ERP_Relationship__c erpRel : soldToCSRMap.get(pricingReqtoSoldToMap.get(priReqId)))
        {
          if(userToCSRNotificationMap!=null && userToCSRNotificationMap.containsKey(erpRel.User__c)
              && userToCSRNotificationMap.get(erpRel.User__c) && !String.isBlank(templateToCSRId))
          {
            tempUserList.add(erpRel.User__r.Id);
          }
        }
        System.debug('Line MF 1071 debug' + tempUserList);
        if(tempUserList.size()>0)
            pridCSRMap.put(priReqId, tempUserList);
      }
      PAUtil.sendEmailToCSR(templateToCSRId, pridCSRMap); 
      // Updated by Sumita Dabas(Commented the for loop and implemented a new for loop) IS ID-00064533 20 Jan 2016 End 
      System.debug('%%%%%'+toAddresses + '***' +userToCSRNotificationMap+'***'+ soldToCSRMap);
    }
  }
}