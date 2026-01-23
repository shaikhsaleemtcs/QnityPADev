/*
 * Name         :   trigPricingRequest
 * Description  :   This trigger will update the pricing Request object.
 * Author       :   Infosys Limited
 * Created Date :   Utkarsh
 *
 * Version      Modified Date       Modified By     Modification
 *  1.0         09-02-2013          Utkarsh         Added Email Notification Logic
 *  1.1         14-3-2013           Sanjib          Added delegate approvl logic
 *  1.2         7-6-2013            Utkarsh         NPC and Back up logic merged
 *  1.3         09-May-2013         Bala            Added logic for Out Of Office
 * -------------------------------------------------------------------------------
 ***********************************************Modification Log************************************************
 <PP20130429>
 Last Modified By   :   Priyanka Pillala
 Last Modified Date :   29 Apr 2013
 Description        :   Added logic for sending notifications to CSR - APAC ROLLOUT1(1.4)
 ****************************************************************************************************************
 <PP20130529>
 Last Modified By   :   Priyanka Pillala
 Last Modified Date :   29 May 2013
 Description        :   1) Changed the name of the trigger from PRBIBU to trigPricingRequest according to DuPont
                        naming conventions - APAC ROLLOUT1(1.5)
                        2) Moved the code to PricingRequestHandler class according to DuPont standards
                        - APAC ROLLOUT1(1.5)
 *****************************************************************************************************************/
//<PP20130529> -- Ver 1.5 START
trigger trigPricingRequest on Pricing_Request__c (before Update) {
     //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
    
    //<MS20150522>
    //if(PAUtil.trigPricingRequestCheck == null || PAUtil.trigPricingRequestCheck==false)
    //{
       /* <AJ20160112> START Added logic to revert status back to previous values if it changes incorrectly from 
          Submitted --> Draft/ Approved --> Submitted/ Submitted --> Validated          
       */        
        boolean donotexecclass = false;
    
        for(Pricing_Request__c p:trigger.new)
        {
            if(trigger.oldmap.get(p.id).Request_Approval_Status__c != p.Request_Approval_Status__c)
            {
                if(trigger.oldmap.get(p.id).Request_Approval_Status__c == 'Submitted' && p.Request_Approval_Status__c == 'Draft')
                {
                    p.Request_Approval_Status__c = 'Submitted';
                    donotexecclass = true;
                }
                if(trigger.oldmap.get(p.id).Request_Approval_Status__c == 'Approved' && p.Request_Approval_Status__c == 'Submitted')
                {
                    p.Request_Approval_Status__c = 'Approved';
                    donotexecclass = true;
                }
                if(trigger.oldmap.get(p.id).Request_Approval_Status__c == 'Submitted' && p.Request_Approval_Status__c == 'Validated')
                {
                    p.Request_Approval_Status__c = 'Submitted';
                    donotexecclass = true;
                }
            }
        }
        //<AJ20160112> END
        
         if(!donotexecclass)
         {
            PricingRequestHandler pricingRequestHandlerInstance = new PricingRequestHandler();
            pricingRequestHandlerInstance.onTrigger();
         }   
       // PAUtil.trigPricingRequestCheck=true;
    //}
        
}
//<PP20130529> -- Ver 1.5 END