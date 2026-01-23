/*
 * Name     :   ctrlPAMain
 * Description  :   This class acts as a controller to the Price Approval Page
 * Author     :   Infosys Limited
 * Created Date :   16-01-2013
 *
 * Version    Modified Date    Modified By                  Modification
 *    1.1    28-02-2013       Priyanka              Added new method loadPage and changed businesscomponentaction
 *    1.2    05-03-2013       Prachi                  Added conditions based on fetched Id in onLoadCall()
 *    1.3    13-03-2013       Utkarsh/Prachi        Added condition in onload call for case when id is passed in URL
 *    1.4    02-07-13         Shiva                Fix for issue407
 *    1.5    06-09-13         Shiva                PC-KC issue fix while passing id in url
 *<TJ20140509>                Tarun Jain            Added a String to store the navigation flow text
 *<TJ20140513>                Tarun Jain            Added new method for Help URL generation 
***********************************************Modification Log********************************************************
<PP20140916>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   16 Sep 2014
Description         :   Fix for IS ID-00046442 - Nullifying the Id in URL on redirecting from Pending Requests page
                        to Request Detail page   
***********************************************************************************************************************
*<IS ID-00065529>
Last Modified By    :   Sumit Gupta
Last Modified Date  :   Mar 15 2016
Description         :   Added Line of code to fix issue of Valid From and Valid TO date on Rebate Agreement request.   

***********************************************************************************************************************
*<CC20191107>                Calment Cleo            Added parameter in url for Active Prices Batch VF Page and the controller for Active Prices. 
------------------------------------------------------------------------------
*/
public class ctrlPAMain
{    
    public string keyComb{get;set;}
    public String serviceComponentName {get;set;}
    private boolean checkQuitBoolean=false; //Shiva - For Issue 407 Ver 1.4

    public String currentPageLabel
    {
        get
        {
            if(currentpageLabel == null) 
            {  
                currentPageLabel = 'PAHome';
            }
            return currentpageLabel;
        }
        set {
            currentPageLabel = value;
            System.debug('Set of CurrentPageLabel'+currentPageLabel);
        }
    }
    //public String businessAction {get;set;}
    
    public String businessAction
    {
        get
        {
            System.debug('Sumit_BusinessAction >>'+businessAction);
            return businessAction;
             
        }
        set;
    }
    /********Start*** Added By Sumit for Validity Date test *****/
    public boolean getValiditySetDates(){
       // system.debug(service.PAServicestate.currentrequest.pricingRequest.Request_Valid_To__c) ;
        if(service.PAServicestate.currentrequest.pricingRequest.Request_Valid_To__c == Null || service.PAServicestate.currentrequest.pricingRequest.Request_Valid_From__c == Null){
            return True;
        }else{
            return false;
        }      
    }
    public boolean getValidityGetDates(){
       // system.debug(service.PAServicestate.currentrequest.pricingRequest.Request_Valid_To__c) ;
        if(service.PAServicestate.currentrequest.pricingRequest.Request_Valid_To__c != Null || service.PAServicestate.currentrequest.pricingRequest.Request_Valid_From__c != Null){
            return true;
        }else{
            return false;
        }      
    }   

    /*END*Sumit****************/
    public String newPageLabel;

    //<TJ20140509> String to store page name and complete navigation flow
    public String pageName{get;set;}
    public String navigationText{get;set;}
    public String trimText{get;set;}
    public String label{get;set;}
    public String BUName{get;set;}
    public String newlink{get;set;}
    public String sVolume{get;set;}
    public boolean backflow{get;set;}
    
    
    
    //<TJ20140621>
    public boolean done_button{get
        {
        if(service.PAServicestate != null && service.PAServicestate.currentRequest != null
                && service.PAServicestate.currentRequest.keyCombination != null
                && service.PAServicestate.currentRequest.keyCombination.pckcConcat!=null
                && service.PAServicestate.currentRequest.keyCombination.pckcConcat != '--Select--'
        )
            return false;
        else
            return true; 
        }
    set;}
    public boolean prTable{get;set;}
    public PAService service{get;set;}//changing
    public ctrlPAMain()
    {
        service = new PAService();
    }
    
    //<CC20191107> Start
    public ctrlPAMain(activePrices controller)
    {
        service = new PAService();
    }
    //<CC20191107> End
    /*
     * Author     : 
     * Method Name  :   getNewPageLabel
     * Parameters   :   No parameters
     * Return type  :   String
     * Description  :   
     */
    public String getNewPageLabel()
    {
        return newPageLabel;
    }
    /*
     * Author     : 
     * Method Name  :   setNewPageLabel
     * Parameters   :   String
     * Return type  :   void
     * Description  :   
     */
    public void setNewPageLabel(String value)
    {
        this.newPageLabel=value; 
    }
    //<PP20140422>
    
    //<MS20141021>
    
    public boolean saveStateflag{get
        {
             return true;
        }
        
        set;
    }
    
    public boolean checkErrorFlag {get
        {
        if(ApexPages.hasMessages(ApexPages.Severity.ERROR))
        {
            return true;
        }
        return false;
        }set;
    }
    //Ver 1.1 START
    /*
     * Author     : 
     * Method Name  :   loadPage
     * Parameters   :   No parameters
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference loadPage()
    {
        return new PageReference('/apex/'+currentPageLabel);
    }
    //Ver 1.1 END
    //chaning the retuen type
    public PageReference businessComponentAction()  
    { 
        system.debug('\n\n\n businessAction '+businessAction);
        //Added to debug view state issues
        /*System.debug('PARequest-relatedWrappersList - '+service.PAServiceState.currentRequest.relatedWrappersList);
        System.debug('PARequest-relatedListRequestItemsList - '+service.PAServiceState.currentRequest.relatedListRequestItemsList);
        System.debug('PARequest-elatedListERPSalesList - '+service.PAServiceState.currentRequest.relatedListERPSalesList);
        System.debug('PARequest-pricingReqItemList - '+service.PAServiceState.currentRequest.pricingReqItemList);
        System.debug('PARequest-currentRequestItem - '+service.PAServiceState.currentRequestItem);
        */
        //pautil.deleteViewState(service.PAServiceState.currentRequest);
        //<TJ20140515>
        //System.debug('***service.PAServiceState.ogItems.selectedBU - '+service.PAServiceState.ogItems.selectedBU);
        if(service.PAServiceState.ogItems != null && service.PAServiceState.ogItems.selectedBU!=null && service.PAServiceState.ogItems.selectedBU!='--Select--' && service.paServiceState.ogItems.selectedBU!=''
            && service.PAServiceState.ogItems.buIdToNameMap!= null && service.PAServiceState.ogItems.buIdToNameMap.containsKey(service.PAServiceState.ogItems.selectedBU))
        {
            BUName=service.PAServiceState.ogItems.buIdToNameMap.get(service.PAServiceState.ogItems.selectedBU);
        }
        PageReference pr = null;
        checkErrorFlag = false;
        prTable=false;
        //System.Savepoint savePoint= Database.setsavePoint();
        try
        { 
            checkErrorFlag = false;
            IPAServiceComponent component = null;
            //Shiva - Added checkQuitBoolean for Issue 407- Start Ver 1.4
            if(currentPageLabel == 'PAHome')
            {
                checkQuitBoolean = true;
            }
            //Shiva - Added checkQuitBoolean for Issue 407 - End
            if(ApexPages.currentPage().getParameters().get('id') <> NULL && checkQuitBoolean == false) //Ver 1.4
            {//changin from newpagelabel
                currentPageLabel = 'PAPricingRequest';
                System.debug('*****check here');
            }
            component= service.getBusinessComponent(businessAction,serviceComponentName );
            System.debug('*****check here after business component');
            System.debug('*****component'+component);
            System.debug('*****here-----'+currentpageLabel+'****newPageLabel'+newPageLabel+'*****businessAction'+businessAction);
            this.currentpageLabel = component.action(newPageLabel,currentpageLabel,businessAction);

            System.debug('currentpageLabel after calling action method is '+currentpageLabel+'****newPageLabel is '+newPageLabel);
            //<GT20150520>
            
            //<CC20191107> Start
            if(businessAction=='ActivePrices')
                currentpageLabel+='?BuName='+BUName;
            //<CC20191107> End    

            pr = new PageReference((businessAction=='openReportPRByStatus')?currentPageLabel :('/apex/'+currentPageLabel));
            pr.setRedirect(false);
            system.debug('chflg'+checkErrorFlag);
            if(service.PAServiceState!=null)
                System.debug('After ALL view state returns:-'+service.PAServiceState);
            //system.debug('service.PAServicestate.currentRequest.salesPriceSAP.relatedWrappersList in business action size is '+ service.PAServicestate.currentRequest.salesPriceSAP.relatedWrappersList.size());

        }
        catch(Exception e)
        {     
            if(e instanceof PAException)
            {
                if(((PAException)e).severity != ApexPages.Severity.INFO)
                {
                    checkErrorFlag = true;
                }
                ApexPages.Message errorMsg = new ApexPages.Message(((PAException)e).severity,e.getMessage());  
                ApexPages.addMessage(errorMsg); 
                System.debug('***c Pagelabel PAException');
            }
            else 
            { //'Transaction was not successful. Please retry.'
                System.debug('unexpected exception'+e+'line num'+e.getLineNumber());
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,e.getMessage() ));
            } 
            system.debug('chflg'+checkErrorFlag); 
        } 
        //Ver 1.1 START
        return pr; 
    }   
    public void businessComponentActionForRerender()  
    { 
        businessComponentAction();
    }   
    public void onLoadCall()
    { 
        //gets serviceComponentName from Custom Settings
        //fetching the passed Id from Page on overriding the Task and Requests - 5th march
        PAPageComponentMapping__c pageComp = null;
        System.debug('*****businessAction'+businessAction);
        String currentPageId = ApexPages.currentPage().getParameters().get('id');
        System.debug('*****currentPageId'+currentPageId);
        //<PP20140916> - Fix for IS ID-00046442
        if(businessAction == 'View')
        {
            ApexPages.currentPage().getParameters().put('id',null);
            currentPageId = null;
        }
            
        //PC-KC issue fix while passing id in url - Shiva
        if(currentPageId != NULL && checkQuitBoolean == false && (String.isBlank(businessAction)/* || (businessAction != null && businessAction!='NPCRequests' && 
    !businessAction.containsIgnoreCase('ViewNetPriceDetails') && !businessAction.containsIgnoreCase('ViewDone'))*/))
        {
            pageComp = PAPageComponentMapping__c.getInstance(currentPageId.subString(0,3));
        }
        else {  
            pageComp= PAPageComponentMapping__c.getInstance(currentPageLabel.toUpperCase());
        }
        System.debug('*****pageComp'+pageComp);
        if(pageComp!=null)
            serviceComponentName = service.name =  pageComp.ComponentName__c;
        // invokes service to instantiate and update viewstate
        System.debug('*****serviceComponentName'+serviceComponentName);
        service.getBusinessComponent(businessAction, service.name);
        navigate();
    }
    //<TJ20140509> -START - Method to store and update the navigation flow text.
    /*
     * Author       : 
     * Method Name  :   navigate
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   stores and updates the navigation flow text.
     */
    public void navigate()
    { system.debug('****nav1'+navigationText);
    system.debug('****pagename'+pageName);
    if(newPageLabel=='PAHome'||currentPageLabel=='PAHome')
    {
        navigationText='';
        ApexPages.currentPage().getParameters().put('id',null);
        pageName=null;
    }
    else
    {

        if(!String.isBlank(navigationText) && pageName!='Sales Representative List')
        {   
            system.debug('***Last Index OF: '+navigationText.lastindexOf(pageName));
            if(navigationText.lastindexOf(pageName)>0 && pageName!='stay' && pageName!='Sales Representative List')
            {
                String rejectedText;
                if(navigationText.indexOf('>',navigationText.lastindexOf(pageName))>0)
                {
                    rejectedText=navigationText.substring(navigationText.lastindexOf(pageName),navigationText.indexOf('>',navigationText.lastindexOf(pageName)));
                }
                else
                    rejectedText=navigationText.substring(navigationText.lastindexOf(pageName),navigationText.length());
                system.debug('***rejected Text: '+rejectedText);
                if(rejectedText==pageName)
                {
                    navigationText=navigationText.substring(0,navigationText.lastindexOf(pageName)-4);
                    system.debug(rejectedText.equals(pageName));
                }
                else
                {
                    navigationText=navigationText+'>>  '+pageName;
                }
                system.debug('***Last Index OFnav: '+navigationText);
            }

            else if(navigationText.lastindexOf(pageName)==0 && pageName!='stay' && pageName!='Sales Representative List')
            {
                navigationText=null;
                system.debug('***nulltext: '+navigationText);
            }
            else if(pageName!=null&&pageName!='stay' && pageName!='Sales Representative List')
            {
                navigationText=navigationText+'>>  '+pageName;
                system.debug('***nextpage: '+navigationText);
            }
            if(navigationText!=null && navigationText!='' && navigationText.lastindexOf(pageName)>=0 && pageName!='Sales Representative List')
            {
                trimText=navigationText.substring(navigationText.lastindexOf(pageName),navigationText.length());
                system.debug('***Trim Text: '+trimText);
            }
        }   
        else if(pageName!='Sales Representative List')
        {
            if(pageName!='stay')
                navigationText=pageName;
            system.debug('****inside back nav2'+navigationText);
        }
        else
        {
            if(navigationText!=null)
            {
                system.debug('In If');
                if(navigationText.contains('Price Request Clone') && backflow!=true)
                {
                    system.debug('In if');                      
                    navigationText=navigationText+'>>  '+pageName;
                }
                else if(backflow==true)
                {
                    system.debug('In else if');
                    String rejectedText;
                    system.debug('***Last Index OF: '+navigationText.lastindexOf(pageName));
                    if(navigationText.lastindexOf(pageName)==0)
                    {
                        navigationText=null;
                    }
                    else if(navigationText.lastindexOf(pageName)>0)
                    {
                        navigationText=navigationText.substring(0,navigationText.lastindexOf(pageName)-4);
                    }                    
                    else
                    {
                        navigationText=pageName;
                    }
                }
            }
            else
                navigationText=pageName;
        }
    }
    system.debug('****nav3'+navigationText);
    }
    //<TJ20140513> Generate URL for Help Link
    public PageReference helpLink()
    {
        PAHelpLinks__c link;
        system.debug('**label'+label);
        link = PAHelpLinks__c.getInstance(label);
        //system.debug('**Link '+link.Help_Link__c);
        PageReference pref=new PageReference(link.Help_Link__c);
        pref.setRedirect(false);
        system.debug('**PREF '+pref);
        return pref;
    }
    //<TJ20140621>
    public void disableDone()
    {
        system.debug('**done '+done_button);
        if(service.PAServicestate.currentRequest.keyCombination.pckcconcat!='--Select--'&&service.PAServicestate.currentRequest.keyCombination.pckcconcat!=null)
        {
            //service.PAServicestate.currentRequest.salesPriceSAP.relatedWrappersList.clear();
            done_button=false;
        }
        else
        {
            done_button=true;
            if(service.PAServicestate.currentRequest.salesPriceSAP != null)
                service.PAServicestate.currentRequest.salesPriceSAP.relatedWrappersList = new List<PARelatedList>();
        }
        system.debug('**done '+done_button);
        //System.debug('service.PAServicestate.currentRequest.salesPriceSAP.relatedWrappersList:-'+service.PAServicestate.currentRequest.salesPriceSAP.relatedWrappersList);
    }  
    
    public void dummyFunction(){
    }
    

}