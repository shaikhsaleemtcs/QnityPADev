/*******************************************************************************
Copyright © 2014 DuPont. All rights reserved. 
Author: Nishant Chopra
Email: nishant_chopra01@infosys.com
Description:  Controller for page: CustMasterDataReqNewEdit
 ********************************************************************************/ 

public with Sharing class CtrlCOBUtilCustMDataReqOverrideNewEdit{

    public static final string MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Miscellaneous_customer_data_request');
    public static final string MODIFYEXISTINGCUSTDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Existing_Customer_Data');
    public static final string NEWCUSTOMERCREATION_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','New_Customer_Creation');  
    public static final string MODIFYCREDITDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Credit_Data');
    public static final string EXTENDEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Extend_Existing_Customer');
    public static final string PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Create_partner_function_Link_Contact_Link_Existing_Partner');


    private static Customer_Data_Request__c so;  
    Public String Clone{get;set;}
    Public String UserProfile;


    //constructor
    public CtrlCOBUtilCustMDataReqOverrideNewEdit(ApexPages.StandardController controller) {
        UserProfile = [Select Name,Id from Profile where Id =:UserInfo.getProfileID()].Name;
        so=(Customer_Data_Request__c)controller.getRecord();
        if(ApexPages.currentPage().getParameters().containsKey('clone')){
            Clone=ApexPages.currentPage().getParameters().get('clone');
        } 
    }

    public CtrlCOBUtilCustMDataReqOverrideNewEdit() {}

    /**
     * Name: redirect
     * Params: None
     * Description: Method will be called whenever page is loaded and it will Directed to  CustomerOnboardingRequest page.  
     */ 
    public PageReference redirect() {
        PageReference returnURL;

        SET<String> rtypes = new SET<String>();

        rtypes.add(MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE);
        rtypes.add(MODIFYEXISTINGCUSTDATA_COB_RTYPE);
        rtypes.add(MODIFYCREDITDATA_COB_RTYPE);
        rtypes.add(NEWCUSTOMERCREATION_COB_RTYPE); 
        rtypes.add(EXTENDEXISTINGCUSTOMER_COB_RTYPE);
        rtypes.add(PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE);        

        //Redirect to the CustomerOnBoardingRequest VF Page 

        if (returnURL==null && (rtypes.CONTAINS(String.valueof(so.get('RecordTypeId')))||(String.valueof(so.get('RecordTypeId'))==null))){
            if(so.Id!=null){
                return accessCheck();
            }
            else{
                if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == NEWCUSTOMERCREATION_COB_RTYPE){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Data Request for the requested Record Type cannot be created'));
                    return null;
                }
                else if((String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE) && (UserProfile.contains('Credit Analyst') || UserProfile.contains('DMS Process Managers') || UserProfile.contains('System Administrator') || UserProfile.contains('Credit Process Managers') || UserProfile.contains('Data Analyst'))){
                    returnURL= new PageReference('/apex/COBUtilMiscellaneousRequest?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
                    return returnURL;
                }
                else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == MODIFYEXISTINGCUSTDATA_COB_RTYPE){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Data Request for the requested Record Type cannot be created'));
                    return null;
                }  
                else if((String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == MODIFYCREDITDATA_COB_RTYPE) && (UserProfile.contains('Credit Analyst') || UserProfile.contains('Credit Process Managers')|| UserProfile.contains('System Administrator'))){
                    returnURL= new PageReference('/apex/COBModifyCreditData?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
                    return returnURL;
                }
                else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Data Request for the requested Record Type cannot be created'));
                    return null;
                }                   
                else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == EXTENDEXISTINGCUSTOMER_COB_RTYPE){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Data Request for the requested Record Type cannot be created'));
                    return null;
                }                   
                else    
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Data Request for the requested Record Type cannot be created'));
                return null;
            }
        }
        //Return to standard Page
        if (returnURL==null && !ApexPages.hasMessages(ApexPages.SEVERITY.ERROR)) 

            returnURL=new PageReference('/%2F'+so.Id);        
        return returnURL;  
    }

    /**
     * Name: accessCheck
     * Params: None
     * Description: Method will be called to check whether the running user will access to run this class or not .  
     */ 
    Public PageReference accessCheck(){
        Id custId = so.Id;
        List<UserRecordAccess> custShareList = new List<UserRecordAccess>();   
        custShareList =[SELECT RecordId, HasEditAccess FROM UserRecordAccess WHERE UserId = :UserInfo.getUserId() AND RecordId = :custId ];
        if((custShareList.size()!=0 && custShareList.get(0).HasEditAccess == false) || UserProfile  == 'Business Process Owners'){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Insufficient Privileges!! You do not have access to edit this Request. Please contact your administrator'));
            return null;
        }
        else{
            if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == NEWCUSTOMERCREATION_COB_RTYPE){
                return new PageReference('/apex/COBNewCustomerCreation?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
            }
            else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE){
                return new PageReference('/apex/COBUtilMiscellaneousRequest?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
            }
            else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == MODIFYEXISTINGCUSTDATA_COB_RTYPE){
                return new PageReference('/apex/COBUtilModifyExistingCustomer?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
            }  
            else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == MODIFYCREDITDATA_COB_RTYPE){
                return new PageReference('/apex/COBModifyCreditData?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
            }
            else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE){
                return new PageReference('/apex/COBUtilPartnerLink?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
            }                   
            else if(String.valueof(so.get('RecordTypeId'))!=null && String.valueof(so.get('RecordTypeId')) == EXTENDEXISTINGCUSTOMER_COB_RTYPE){
                return new PageReference('/apex/COBExtendExistingCustomer?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
            }
            else{
                //return new PageReference('/apex/CustomerOnboardingRequest?RecordTypeId='+so.get('RecordTypeId')+'&Id='+so.get('Id')+'&Clone='+Clone);
                return null;
            }                   

        }
    }
}