/*
 * Name     :   SFDCSAPPriceSyncShareHandler
 * Description  :  This class will handle all logic for SFDCSAPPriceSyncShare trigger
 * Author     :   Infosys Limited <GT20150519>
 * Created Date :   19 May 2015
 *
 * Version   Modified Date     Modified By           Modification
     1            Dec.1.2015    Sumit Gupta            Added logic that work for In SAP Not SFDC.
 * ---------------------------------------------------------------------------------------------------- 
 *

*/
public class SFDCSAPPriceSyncShareHandler extends TriggerHandlerBase {
  
    List<SFDC_SAP_Price_Sync__c> syncRecList=(List<SFDC_SAP_Price_Sync__c>)Trigger.New;
    Map<Id,SFDC_SAP_Price_Sync__c> mapIdOldSyncRec;
    List<SFDC_SAP_Price_Sync__share> syncShareList ;
  
  
  //Handle the set of operations on after event of trigger
    public override void  bulkAfter(){
        syncShareList = new List<SFDC_SAP_Price_Sync__share>();
        //List<SFDC_SAP_Price_Sync__c> syncRecList = (List<SFDC_SAP_Price_Sync__c>)Trigger.New;
        mapIdOldSyncRec =  (Map<Id,SFDC_SAP_Price_Sync__c>)Trigger.oldMap;
      
        // Handle updates and share the records to respective assignee if any change in assignee
        if(trigger.isUpdate)
        {
          for(SFDC_SAP_Price_Sync__c syncRec:syncRecList )
          {
            if(syncRec.Assigned_To__c!=null && mapIdOldSyncRec.get(syncRec.id).Assigned_To__c!=syncRec.Assigned_To__c)
            {
                    prepShareRec(syncRec,new List<Id>{syncRec.Assigned_To__c},'Edit', 'Assignee');
            }
          }
          
          insertSyncShare();
        }
        
        //Handle insert cases and share defects with all viewers belongs to the repective business, sales area
        if(trigger.isInsert)
        {
            //Map<String,string> idSalesAreaMap = new Map<String,string>();
            Set<ID> priceIds = new Set<ID>();
            list<String> SalesOrgCode = new List<String>();
            list<String> DistCode = new List<String>();
            list<String> DivCode = new List<String>();
            list<String> bus = new List<String>();
            Boolean withRecordId = false;
            Boolean withoutRecordId = false;
            for(SFDC_SAP_Price_Sync__c syncRec: syncRecList){
                if(syncRec.SFDC_PA_Price_Record__c!=null){
                    priceIds.add(syncRec.SFDC_PA_Price_Record__c);
                    bus.add(syncRec.SFDC_PA_BU__c);
                    withRecordId = true;
                }
                else{
                    if(syncRec.SAP_BU__c != null && syncRec.SAP_Dist_Channel_Code__c != null && syncRec.SAP_Division_Code__c != null && syncRec.SAP_Sales_Org_Code__c != null){
                        SalesOrgCode.add(syncRec.SAP_Sales_Org_Code__c);
                        DistCode.add(syncRec.SAP_Dist_Channel_Code__c);
                        DivCode.add(syncRec.SAP_Division_Code__c);
                        if(syncRec.SAP_BU__c.contains(',')){
                          String[] buString = syncRec.SAP_BU__c.split(',');
                            for(String s:buString){
                                bus.add(s);
                            }
                        }else{
                          bus.add(syncRec.SAP_BU__c);
                        }
                        withoutRecordId=true;
                    }
                }   
            }
            if(withRecordId){
                InSfdcNotSAPOrBoth(priceIds, bus);
                withRecordId = false;
            }
            if(withoutRecordId){
                InSapNotSfdc(SalesOrgCode,DistCode,DivCode,bus);
                withoutRecordId = false;
            }
        }        
    }
    public void InSfdcNotSAPOrBoth(Set<ID> priceIds,list<String> bus){        
        Map<String,string> idSalesAreaMap = new Map<String,string>();
        list<String> SalesOrgCode = new List<String>();
        list<String> DistCode = new List<String>();
        list<String> DivCode = new List<String>();
        Boolean fourShareFieldExist = false;
        for(ERP_Export_to_SAP__c price:[select id,BU__c,Sales_Org_Code__c,Distribution_Channel_Code__c,Division_Code__c from ERP_Export_to_SAP__c where id in :priceIds]){
            if(price.bu__c != null && price.Sales_Org_Code__c != null && price.Distribution_Channel_Code__c!= null && price.Division_Code__c != null){  
                idSalesAreaMap.put(price.id, price.bu__c+price.Sales_Org_Code__c+price.Distribution_Channel_Code__c+price.Division_Code__c);
                SalesOrgCode.add(price.Sales_Org_Code__c);
                DistCode.add(price.Distribution_Channel_Code__c);
                DivCode.add(price.Division_Code__c);
                fourShareFieldExist=true;
            }   
        }
        system.debug('>>>>>>SOC>>>>>>>'+SalesOrgCode+'<>DIST<>'+DistCode+'<>DIV<>'+DivCode+'<>BUS<>'+bus);
        if(fourShareFieldExist){
            GetOrgUsers(SalesOrgCode,DistCode,DivCode,bus,idSalesAreaMap);
            fourShareFieldExist=false;
        }   
    }  
    
    /**********Added logic for sharing Prices If in SAP but not in SFDC**************/
    public void InSapNotSfdc(list<String> SalesOrgCode,list<String> DistCode,list<String> DivCode,list<String> bus){
        Map<String,string> idSalesAreaMap = new Map<String,string>();
        /*
        for(ERP_Export_to_SAP__c price:[select id,BU__c,Sales_Org_Code__c,Distribution_Channel_Code__c,Division_Code__c from ERP_Export_to_SAP__c 
            where BU__c IN: bus AND Sales_Org_Code__c IN: SalesOrgCode AND Distribution_Channel_Code__c IN: DistCode AND Division_Code__c IN: DivCode])
        {
            idSalesAreaMap.put(price.id, price.bu__c+price.Sales_Org_Code__c+price.Distribution_Channel_Code__c+price.Division_Code__c);
            
        }
        */
        system.debug('>>>>>>SOC>>>>>>>'+SalesOrgCode+'<>DIST<>'+DistCode+'<>DIV<>'+DivCode+'<>BUS<>'+bus);
        
        GetOrgUsers(SalesOrgCode,DistCode,DivCode,bus,null); //,idSalesAreaMap
    }
    
    public void GetOrgUsers(list<String> SalesOrgCode,list<String> DistCode,list<String> DivCode,list<String> bus,Map<String,string> idSalesAreaMap){   
        Map<String,List<Id>> saViewUsrMap = new Map<String,List<Id>>();
        string key;
        for(Organizational_Group_User__c orgUsr : [select Related_User__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,
                        OrgGroup__r.ERP_Division_Code__c,Organizational_Group_Item__r.Business__r.Business__c from Organizational_Group_User__c where 
                            OrgGroup__r.ERP_Sales_Org_Code__c in :SalesOrgCode and OrgGroup__r.ERP_Distribution_Channel_Code__c in :DistCode 
                            and OrgGroup__r.ERP_Division_Code__c in :DivCode and Related_User__r.Profile.name='Price Approval-Viewer'
                            and Organizational_Group_Item__r.Business__r.Business__c in :bus ]){
            key = orgUsr.Organizational_Group_Item__r.Business__r.Business__c+orgUsr.OrgGroup__r.ERP_Sales_Org_Code__c+orgUsr.OrgGroup__r.ERP_Distribution_Channel_Code__c+orgUsr.OrgGroup__r.ERP_Division_Code__c;
            List<Id> userIds = new List<Id>();
            if(saViewUsrMap.containsKey(key)){
                userIds = saViewUsrMap.get(key);
                userIds.add(orgUsr.Related_User__c);
                saViewUsrMap.put(key,userIds);
            }
            else{
                userIds.add(orgUsr.Related_User__c);
                saViewUsrMap.put(key,userIds);
            }
        }
      
      for(SFDC_SAP_Price_Sync__c syncRec:syncRecList)
      {
        /*
        if(idSalesAreaMap != null){
            List<Id> userIds = saViewUsrMap.get(idSalesAreaMap.get(syncRec.SFDC_PA_Price_Record__c));
        }else{
        }*/ 
        List<id> userIds = saViewUsrMap.get(key);
        
        prepShareRec(syncRec,userIds,'Read', 'Viewers');
      }
      
      insertSyncShare();
    }
  
  
  //Prepare the the sharing records with respective access level
    public void prepShareRec(SFDC_SAP_Price_Sync__c Rec,List<Id> usrIds, string accessLevel, String shareRecordto){
        try{
            for(Id usrId:usrIds){
          
                SFDC_SAP_Price_Sync__share syncShare = new SFDC_SAP_Price_Sync__share();
                syncShare.ParentId = Rec.id;
                syncShare.AccessLevel = accessLevel;          
                syncShare.UserOrGroupId = usrId;
                if(shareRecordto =='Viewers')
                    syncShare.RowCause = Schema.SFDC_SAP_Price_Sync__share.RowCause.Share_with_all_viewers__c;
                if(shareRecordto =='Assignee')
                    syncShare.RowCause = Schema.SFDC_SAP_Price_Sync__share.RowCause.Share_with_assignee__c;
                    syncShareList.add(syncShare);
            }
        }
        catch(Exception e){
          Rec.addError('Unable to share the records at SFDC end');
        }
    }
  
  //Insert the sharing records
    public void insertSyncShare(){
        if(syncShareList.size()>0){
            try{
              database.insert (syncShareList,false);
            }
            catch(Exception e){
              System.debug('Exception from Class SFDCSAPPriceSyncShareHandler, Message:'+e.getMessage());
            }
        }
    }
}