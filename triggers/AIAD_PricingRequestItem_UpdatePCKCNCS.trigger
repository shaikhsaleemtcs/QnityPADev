/*
 * Name         :   AIAD_PricingRequestItem_UpdatePCKCNCS
 * Description  :   updates the PC and KC columns in the status links
 * Author       :   Infosys Limited
 * Created Date :   09/03/2013
 *
 /*   Ver.    Date     Developer      Changes                                                   Dependancies

<MS20140502> 02 May 2014    Mohit Sinha     Added logic for updating Pricing Request type in case of Floor,Reference   None
<MS20140528> 28 May 2014    Mohit Sinha     Added PC and KC codes to Pricing condition and Key combination fields   None
<PG20201606> 16 June 2020   Piyush Gupta    Added code for Pricing Request of Type Reference under Non Customer Specific Category.
----------------------------------------------------------------------------------------------------------------------*/    
trigger AIAD_PricingRequestItem_UpdatePCKCNCS on Pricing_Request_Item__c (after insert,after delete) {
    list<Pricing_Request__c> pr = new list<Pricing_Request__c>();
    list<Pricing_Request__c> prAD = new list<Pricing_Request__c>();
    list<String> listofid=new list<String>();
    list<String> listofidAD=new list<String>();
    List<Pricing_Request_Item__c> lAD = new List<Pricing_Request_Item__c>();
    List<Pricing_Request_Item__c> lAI = new List<Pricing_Request_Item__c>();
    List<ERP_Key_Combination__c> selectedKC = new List<ERP_Key_Combination__c>();
    //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
    if(Trigger.isDelete && Trigger.isAfter)
 
    {
         system.debug('dec2'+Trigger.old[0].Pricing_Request__c);
        prAD=[SELECT id,pricing_condition__c,key_combination__c,Pricing_Request_Type__c, isNPCApplicable__c,Request_Type__c FROM Pricing_Request__c WHERE
                Id =:Trigger.old[0].Pricing_Request__c  and (Request_Type__c='Non Customer Specific' OR Request_Type__c='Import'
                OR(Request_Type__c='Customer Specific' AND Pricing_Request_Type__c = 'Permanent'))];
        for(Pricing_Request__c s:prAD)
        {
            String s1=s.id;
            listofidAD.add(s1);
        }
        lAD  = [SELECT Id,Pricing_Request_Type__c,Pricing_Condition_Code__c,Pricing_Condition__c,Key_Combination_Code__c,key_combination__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :listofidAD];
        Integer iAD = lAD.size();
        for(Pricing_Request__c p:prAD)
        {   
            if(iAD==0)
            {
                if(p.Request_Type__c=='Non Customer Specific')
                {
                    p.Pricing_Condition__c='';
                    p.Key_Combination__c='';
                    p.Pricing_Request_Type__c='Permanent';
                }
                else if(p.Request_Type__c=='Import')
                {
                    p.Pricing_Condition__c='';
                    p.Key_Combination__c='';
                    p.Pricing_Request_Type__c='Import';
                }       

                update p;
            }
            else if(iAD>0)
            {
                p.pricing_condition__c=lAD[0].Pricing_Condition_Code__c +'-'+ lAD[0].Pricing_Condition__c;
                p.key_combination__c=lAD[0].Key_Combination_Code__c +'-'+ lAD[0].key_combination__c;
                if(lAD[0].Pricing_Request_Type__c.containsIgnoreCase('Floor')||lAD[0].Pricing_Request_Type__c.containsIgnoreCase('Reference')||lAD[0].Pricing_Request_Type__c.containsIgnoreCase('Net Reference') ||lAD[0].Pricing_Request_Type__c.containsIgnoreCase('Net Floor'))
                {
                    p.Pricing_Request_Type__c='Floor';
                }
                update p;
            }
        }
    }
    else if(Trigger.isInsert && Trigger.isAfter)
    {
        Pricing_Request_Item__c tn=trigger.new[0];
        system.debug('After INSERTTTTTTTTTT tn'+tn);
        system.debug('After INSERTTTTTTTTTT tn'+tn.pricing_request__r.Request_Type__c);
        pricing_request__c prn=[select id, pricing_condition__c,key_combination__c,request_type__c from pricing_request__c where id= :tn.Pricing_Request__c ];        
        if(prn.Request_Type__c=='Non Customer Specific'  || prn.Request_Type__c=='Import'){
            lAI=[SELECT id,pricing_condition__c,Pricing_Condition_Code__c,key_combination__c,Key_Combination_Code__c,Pricing_Request_Type__c,pricing_request__c,SAP_Cluster__c,
                SAP_Application_Id__c,SAP_Client_ID__c FROM Pricing_Request_item__c WHERE pricing_request__c =:prn.id limit 1]; 
            system.debug('lAI:'+lAI);
            if(lAI!=null && lAI.size()!=0)
            {
                //<MS20140528> Adding PC code and KC Code to the PC/KC fields
                prn.pricing_condition__c=lAI[0].Pricing_Condition_Code__c +'-'+ lAI[0].Pricing_Condition__c;
                prn.key_combination__c=lAI[0].Key_Combination_Code__c +'-'+ lAI[0].key_combination__c;
                //<MS20140502>Adding logic to update Request type for Floor, Reference
                //<MS20140502>START
                //<PG20201606> START

                if(lAI[0].Pricing_Request_Type__c.containsIgnoreCase('Floor')||lAI[0].Pricing_Request_Type__c.containsIgnoreCase('Net Floor'))
                {
                    prn.Pricing_Request_Type__c='Floor';
                }
                else if(lAI[0].Pricing_Request_Type__c.containsIgnoreCase('Reference')||lAI[0].Pricing_Request_Type__c.containsIgnoreCase('Net Reference'))
                {
                    prn.Pricing_Request_Type__c='Reference';
                }
                //<PG20201606> END Logic Separated for Reference as well as Floor as it was previously only for Floor.
                //<MS20140502>END
            }
            update prn;
        }
    }
}