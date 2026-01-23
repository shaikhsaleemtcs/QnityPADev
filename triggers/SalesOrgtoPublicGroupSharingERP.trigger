/*
 * Name             :   SalesOrgtoPublicGroupSharingERP
 * Description      :   The Trigger is responsible for creating apex sharing for ERP Sales Prices SAP record being created.
 * Author           :   Vipul Sharma
 * Oroganisation    :   Infy
 * Created Date     :   12/20/2014
 *
 * Version   Modified Date     Modified By                Modification
 * 
 * --------------------------------------------------------------------------------------------------------------------------------------------------------
 *  v1.1  11/17/2016      Haider Naseem      <HN111716> Method createTimeLineforERPSap() has been made to call only on Insert and AfterInsert
 *  v1.2  12/09/2016    Haider Naseem           <HN120916> Method createTimeLineforERPSap() will be called only if trigger has not been initiated by BatchToMapHolder
 *  v1.3  04/10/2017    Mansi Gupta        <MG04102017> Added if condition to add only non holders prices in timeline creation     
 */
 
 
 
trigger SalesOrgtoPublicGroupSharingERP on ERP_Sales_Prices_SAP__c (after insert,after update) {
try{
map<string, Id> grpNameIdMap = new map<string, Id>();
    List<string> grpNameSet = new List<string>();
    String dash = '_' ;
    system.debug( 'test');
    for(ERP_Sales_Prices_SAP__c price : trigger.new){
        
        String SalesOrgName = price.Sales_Org_Code__c;
        String BUName = price.BU__c;
        if(buname.contains('&'))
        {
            buname=buname.replace('&','And');
        }
        String PublicGroupName = BUName.deleteWhitespace() + dash + SalesOrgName;  
         system.debug( PublicGroupName);    
        grpNameSet.add(PublicGroupName);       
        
    }
    
    
    for( Group grp : [Select DeveloperName, Id from Group Where DeveloperName IN: grpNameSet]){
        grpNameIdMap.put(grp.DeveloperName, grp.Id);
    }
    
    list<ERP_Sales_Prices_SAP__Share> priceShareInsertList  = new list<ERP_Sales_Prices_SAP__Share>();
       
    
    for(ERP_Sales_Prices_SAP__c price : trigger.new){
        String BUName = price.BU__c;
        if(BUName.contains('&'))
            BUName = BUName.replace('&','And');
            
        String PublicGroupName1 = BUName.deleteWhitespace() + dash + price.Sales_Org_Code__c;
        if(grpNameIdMap.get(PublicGroupName1) != null){
            ERP_Sales_Prices_SAP__Share priceShare = new ERP_Sales_Prices_SAP__Share();
            priceShare.ParentId = price.id;
            priceShare.AccessLevel = 'Read'; //Control the access level "Read" or "Edit"          
            priceShare.UserOrGroupId = grpNameIdMap.get(PublicGroupName1);
            priceShare.RowCause = Schema.ERP_Sales_Prices_SAP__Share.RowCause.Sharing_with_Public_Group__c;
            priceShareInsertList.add(priceShare);
        }
    }
    
    Database.insert(priceShareInsertList, false);
    System.debug(System.LoggingLevel.ERROR, 'Callout to class from Trigger');

    system.debug(System.LoggingLevel.ERROR,'##:'+BatchToMapHolder.isBatch);
                      Set <Id> timelineCreate = new Set <Id>();
    //<MG04102017> - added non holder reacords only  to the timeline
    For (ERP_Sales_Prices_SAP__c timelinedata : trigger.new)
    {
        if (timelinedata.isPriceHolder__c == false)
            timelineCreate.add(timelinedata.id);
        
    } 
    //<HN111716> Method createTimeLineforERPSap() has been made to call only on Insert and AfterInsert
    //<HN120916> In addition to <HN111716>, Method createTimeLineforERPSap() will be called only if trigger has not been initiated by BatchToMapHolder
    //<MG04102017> Added conditions in if condition
    if(Trigger.IsInsert && trigger.isAfter && (!BatchToMapHolder.isBatch) && (timelineCreate != null) && timelineCreate.size()>0){
 
        if(System.Label.Switch_for_Timeline_Code == 'True')
        {  

            //System.debug(System.LoggingLevel.ERROR, 'calling createtimeline');
            //System.debug(System.LoggingLevel.ERROR, '--map keyset'+timelineCreate  );
            timelineCreationHandler.createTimeLineforERPSap(timelineCreate);
        }
    } 
 
    
}catch(Exception e){
    
} 

}