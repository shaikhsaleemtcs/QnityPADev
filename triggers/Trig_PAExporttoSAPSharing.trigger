trigger Trig_PAExporttoSAPSharing on ERP_Export_to_SAP__c (after insert, after update) {
try{
    map<string, Id> grpNameIdMap = new map<string, Id>();
    List<string> grpNameSet = new List<string>();
    String dash = '_' ;
    system.debug( 'test');
    for(ERP_Export_to_SAP__c price : trigger.new){
        
        String SalesOrgName = price.Sales_Org_Code__c;
        String BUName = price.BU__c;
        
        String PublicGroupName = BUName.deleteWhitespace().replace('&','And') + dash + SalesOrgName;  
         system.debug( PublicGroupName);    
        grpNameSet.add(PublicGroupName);       
        
    }
    
    
    for( Group grp : [Select DeveloperName, Id from Group Where DeveloperName IN: grpNameSet]){
        grpNameIdMap.put(grp.DeveloperName, grp.Id);
    }
    
    list<ERP_Export_to_SAP__Share> priceShareInsertList  = new list<ERP_Export_to_SAP__Share>();
       
    
    for(ERP_Export_to_SAP__c price : trigger.new){
        String PublicGroupName1 = price.BU__c.deleteWhitespace().replace('&','And') + dash + price.Sales_Org_Code__c;
        if(grpNameIdMap.get(PublicGroupName1) != null){
            ERP_Export_to_SAP__Share priceShare = new ERP_Export_to_SAP__Share();
            priceShare.ParentId = price.id;
            priceShare.AccessLevel = 'Read'; //Control the access level "Read" or "Edit"          
            priceShare.UserOrGroupId = grpNameIdMap.get(PublicGroupName1);
            priceShare.RowCause = Schema.ERP_Export_to_SAP__Share.RowCause.Sharing_with_Public_Group__c;
            priceShareInsertList.add(priceShare);
        }
    }
    
    Database.insert(priceShareInsertList, false);
}catch(Exception e){
  
}   

}