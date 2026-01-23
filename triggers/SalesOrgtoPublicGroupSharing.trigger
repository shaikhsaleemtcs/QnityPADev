trigger SalesOrgtoPublicGroupSharing on Pricing_Request__c (after insert,after update) {

    map<string, Id> grpNameIdMap = new map<string, Id>();
    List<string> grpNameSet = new List<string>();
    String dash = '_' ;
    system.debug( 'test');
      for(Pricing_Request__c price : trigger.new){
        
        String SalesOrgName = price.Sales_Org_Code__c;
        String BUName = price.BU__c;
        if(BUName.contains('&') && BUName !=null)
            BUName = BUName.replace('&','And');

        String PublicGroupName = BUName.deleteWhitespace() + dash + SalesOrgName;  
         system.debug( PublicGroupName);    
        grpNameSet.add(PublicGroupName);  
    }
    
     for( Group grp : [Select DeveloperName, Id from Group Where DeveloperName IN :grpNameSet]){
        grpNameIdMap.put(grp.DeveloperName, grp.Id);
    }
    
    list<Pricing_Request__Share> priceShareInsertList  = new list<Pricing_Request__Share>();
       
    
    for(Pricing_Request__c price : trigger.new){
    
    String BUName = price.BU__c;
        if(BUName.contains('&'))
            BUName = BUName.replace('&','And');
            
        String PublicGroupName1 = BUName.deleteWhitespace() + dash + price.Sales_Org_Code__c;
        if(grpNameIdMap.get(PublicGroupName1) != null){
            Pricing_Request__Share priceShare = new Pricing_Request__Share();
            priceShare.ParentId = price.id;
            priceShare.AccessLevel = 'Edit'; //Control the access level "Read" or "Edit"          
            priceShare.UserOrGroupId = grpNameIdMap.get(PublicGroupName1);
            priceShare.RowCause = Schema.Pricing_Request__Share.RowCause.Sharing_with_Public_Group__c;
            priceShareInsertList.add(priceShare); 
        }
    }
    
    try
    {
        Database.insert(priceShareInsertList, false);
    }
    catch(DMLException E)
    {
    }    

}