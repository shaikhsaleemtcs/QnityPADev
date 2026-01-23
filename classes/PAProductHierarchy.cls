/*
 * Name      :   PAProductHierarchy
 * Description  :   This class acts as a business component to retrieve the PA Product Hierarchy details
 * Author      :   Infosys Limited
 * Created Date :   22-01-2013
 *
 * Version    Modified Date    Modified By   Modification
 * -------------------------------------------------------------
 * 1.1        28-Feb-2013        Priyanka       Changed sObjectList to sObjectRecord in wrapper
 * 1.1.1        05-Mar-2013         Bala            Changed Map for UAT issue #13
 * 1.1.2        28-04-2014       Jawahar       Added Rep material ,Default Per,Default UoM intp BUPH Object.
 * 1.1.3        04-Sep-2014                Hema Latha             Added condition for PHcreation Page
 * -------------------------------------------------------------
 <JM20140428>
 Last Modified By    :   Jawahar Muthuadaikalam
 Last Modified Date  :   22 April 2014
 Description         :   CAPITAL PROJECT - <JM20140428> Added Rep Material,Material Name,Defualt Per ,Default UoM into BUPHListFinal list
*****************************************************************************************************************
 <SP20140529>
 Last Modified By    :   Shiva
 Last Modified Date  :   29 Apr 2014
 Description         :   CAPITAL PROJECT - Changes related to product hierarchy lookup - global config page
 ***********************************************************************************************************************
 <HL20140904>
Last Modified By    :   Hema Latha
Last Modified Date  :   04 Sep 2014
Description         :   Added condition for PH creation page.
*****************************************************************************************************************
<HL20140904>
Last Modified By    :   Nadeem Shaik
Last Modified Date  :   01 Aug 2019
Description         :   Added condition for "already existing PH" error but for new BU-PH to be allowed to inserted.
*****************************************************************************************************************/
 
public class PAProductHierarchy implements IPAServiceComponent
{
    public PAOrganizationalGroupItems paOGItem{get;set;}  
    
    public PAServiceState serviceState{get;set;}
        
    public String valuePH {get;set;}
    
    public string selectedPHValue {get;set;}
    

    
    public string errorDispPH {get;set;}
      
    public List<PARelatedList> relatedWrappersList{get;set;}
    
    public List<string> PHLevelSplit {get;set;}
    
    public Map<string,string> PHLevelToDesc {get;set;} 
        
    //<HL20140904> -- Start added String Value 
    public Product_Hierarchy__c ph{get;set;}
    public BU_PH__c buph{get;set;}
    public boolean PHvalueCheck{get;set;}   
    public string PHcode{get;set;}
    public Integer PHlevel{get;set;}
    public string NewPH{get;set;}
    public boolean shownewPH{get;set;}
    public boolean checkIfBuPhExists{get;set;}
    /*public string PH2{get;set;}
    public string PH3{get;set;}
    public string PH4{get;set;}
    public string PH5{get;set;}
    public string PH6{get;set;}
    public string PH7{get;set;}
    public string PH8{get;set;}
    public string PH9{get;set;}*/
    public String selectedBU{get;set;}
    
    //<HL20140904> -- End added String Value 
    
    public PAProductHierarchy() 
    { 
    }
            
    public PAProductHierarchy(PAServiceState paServiceState) 
    {
         serviceState = paServiceState;
        paOGItem = paServiceState.ogItems;
        //<HL20140904> Added ph, buph and selected BU
        ph = new Product_Hierarchy__c();
        buph = new BU_PH__c();
        selectedBU = [select Business__c FROM OrgGroup__c WHERE id=:paServiceState.ogitems.selectedBU].Business__c;
        
    }
    
 
    
    /*
     * Author      : 
     * Method Name  :   getListBusinessComponents
     * Parameters   :   No parameters
     * Return type  :   List<sObject>
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public List<sObject> getListBusinessComponents() 
    {
        return null;
    }
    
    
    /*
     * Author      : 
     * Method Name  :   getListOptions
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public List<SelectOption> getListOptions() 
    {
        List<SelectOption> PHDropDown = new List<SelectOption>();
        List<Product_Hierarchy__c> PHList = new List<Product_Hierarchy__c>();
        List<BU_PH__c> BUPHList = new List<BU_PH__c>();
        
        //Changing the query as the data model has changed --> shiva for global config - 07/02/13
        BUPHList = [SELECT Id,OrgGroup__c,Product_Hierarchy__c,Business_Description__c,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.Description__c,Product_Hierarchy__r.PH_Level__c FROM BU_PH__c WHERE Product_Hierarchy__r.PH_Level__c=1 AND OrgGroup__c=:paOGItem.selectedRecordId];
        
        for(BU_PH__c X:BUPHList)
        {
            String concatPH1 = X.Product_Hierarchy__r.PH_Code__c+'-'+X.Product_Hierarchy__r.Description__c;
            PHDropDown.add(new selectOption(X.Product_Hierarchy__r.PH_Code__c,concatPH1));
        }
      
        return PHDropDown; 
    }
   
    /*
     * Author      : 
     * Method Name  :   getListWrappers
     * Parameters   :   No parameters
     * Return type  :   List<RelatedList>
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public List<PARelatedList> getListWrappers() 
    {
        
        boolean errorLocal = false; //<SP20140529> START
        Integer FinalPHLevel;
        String redefinedPH=selectedPHValue;
        string FinalPH;
        List<string> finalPHIds = new List<string>(); 
        Map<Integer,Integer> lengthToLevelMap = new Map<Integer,Integer>(); 
        List<string> PHSplitList = new List<string>(); 
        
        PHLevelSplit = new List<string>();
        PHLevelToDesc= new Map<string,string>();
        
        
        lengthToLevelMap.put(2,2);
        lengthToLevelMap.put(4,3);
        lengthToLevelMap.put(6,4);
        lengthToLevelMap.put(8,5);
        //modified the map - bala 5th March(UAT defect#13)
        lengthToLevelMap.put(10,6);
        lengthToLevelMap.put(12,7);
        lengthToLevelMap.put(14,8);
        lengthToLevelMap.put(16,9);
        lengthToLevelMap.put(18,9);
        
        system.debug('@@ Org Grp Id '+paOGItem.selectedRecordId+'@@ selectedPHValue '+selectedPHValue);

        if(selectedPHValue != null)
        {
             
            for(Integer i=0; i<=selectedPHValue.length();i++)
            {
                redefinedPH = redefinedPH.removeEnd('#');
            }
            system.debug('*** redefinedPH'+redefinedPH);
            finalPH = redefinedPH.replace('#','_');
        }
        FinalPHLevel = lengthToLevelMap.get(FinalPH.length());
        if(math.mod(FinalPH.length(),2)!=0)
            throw new  PAException('Product hierarchy code should not be odd in length ',ApexPages.Severity.ERROR);
            
        for(Integer i=0;i<FinalPH.length();i=i+2)
        {
            PHSplitList.add(FinalPH.substring(i,i+2));
        }
        system.debug('@@## PHSplitList '+PHSplitList+'@@## PHSplitList size'+PHSplitList.size());
        system.debug('@@## PHLevelSplit '+PHLevelSplit+'@@## PHLevelSplit size'+PHLevelSplit.size());

        List<String> finalPHListConcat = new List<String>(); 
        
        if(PHSplitList.size()!= null || PHsplitList.size()!= 0)
        {
            string dynamicPHCode='';
            for(Integer i=0; i<PHSplitList.size();i++)
            {
                dynamicPHCode = dynamicPHCode+PHsplitList[i];
                finalPHListConcat.add(dynamicPHCode);       
            }
        }
        
        system.debug('@@## finalPHListConcat '+finalPHListConcat);
        system.debug('@@## finalPHListConcat size'+finalPHListConcat.size());
            
        //List<Product_Hierarchy__c> PHFinalDescriptionList = [SELECT Id,Name__c,Description__c,PH_Code__c,PH_Level__c FROM Product_Hierarchy__c WHERE PH_Code__c IN :finalPHListConcat];
        
        List<BU_PH__c> PHFinalDescriptionList = [SELECT Id,Product_Hierarchy__r.Name__c,Product_Hierarchy__r.Description__c,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_Level__c FROM BU_PH__c WHERE Product_Hierarchy__r.PH_Code__c IN :finalPHListConcat AND OrgGroup__r.Id=:paOGItem.selectedRecordId];
        
        if(PHFinalDescriptionList.size()==0)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'No matching product hierarchy found!'); 
            ApexPages.addMessage(myMsg);
            errorLocal = true;
        }
        //<SP20140529> START
        
        set<string> PHCodesFinalSet = new set<String>();
        
        for(BU_PH__c X:PHFinalDescriptionList)
            {
            PHCodesFinalSet.add(X.Product_Hierarchy__r.PH_Code__c);
        }
        
        if(!string.isBlank(selectedPHValue) && PHCodesFinalSet!= null && PHCodesFinalSet.size() >0)
        {
            //Added logic to igore case on PH code
            if(!PHCodesFinalSet.contains(selectedPHValue.toUpperCase()))
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'PH not valid. Please use lookup or autocomplete'); 
                ApexPages.addMessage(myMsg);
                errorLocal = true;
            }
        }
    
        system.debug('@@## PHCodesFinalSet '+PHCodesFinalSet);
        system.debug('@@## PHCodesFinalSet size '+PHCodesFinalSet.size());
        
        //<SP20140529> END
        
        system.debug('@@## PHFinalDescriptionList '+PHFinalDescriptionList);
        system.debug('@@## PHFinalDescriptionList size'+PHFinalDescriptionList.size());
        
        if(errorLocal == false) //<SP20140529> 
        {
            for(BU_PH__c X:PHFinalDescriptionList)
            {
                    PHLevelToDesc.put('PH'+X.Product_Hierarchy__r.PH_Level__c,X.Product_Hierarchy__r.Description__c);
            }
    
        PHLevelSplit.addall(PHLevelToDesc.keyset());
        PHLevelSplit.sort();
        system.debug('@@## PHLevelToDesc '+PHLevelToDesc+'@@## PHLevelToDesc size'+PHLevelToDesc.size());
        /*--------------------------Displaying PH Descriptions ENDS---------------------------------*/
        system.debug('@@ FinalPHLevel '+FinalPHLevel);
        List<Product_Hierarchy__c> PHListFinal = [SELECT Id,Name__c,Description__c,PH_Code__c,PH_Level__c FROM Product_Hierarchy__c WHERE PH_Code__c LIKE :FinalPH+'%' AND PH_Level__c =:FinalPHLevel ORDER BY PH_Level__c ASC LIMIT 1000];
        for(Product_Hierarchy__c X:PHListFinal)
        {
            finalPHIds.add(X.Id);
        }
        system.debug('@@ finalPHIds '+finalPHIds);
            //<JM20140428> Added Rep Material,Material Name,Defualt Per ,Default UoM into BUPHListFinal list.
            List<BU_PH__c> BUPHListFinal = [SELECT Id,Product_Hierarchy__c,Product_Hierarchy__r.Description__c,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_Level__c,Business_Description__c,OrgGroup__c,Representative_Material_Code__c,Representative_Material_Description__c,Default_Per__c,Default_UoM__c FROM BU_PH__c WHERE OrgGroup__r.Id=:paOGItem.selectedRecordId AND Product_Hierarchy__r.Id IN :finalPHIds];
        
        List<PARelatedList> relatedPHGCList = new List<PARelatedList>();
        PARelatedList setupPHGC = new PARelatedList();
        setupPHGC.sObjectTypeName=BU_PH__c.sObjectType.getDescribe().getName().toLowerCase();
        setupPHGC.wrapperList = new List<PAWrapper>();
        setupPHGC.keyCombinationColumns = Schema.SObjectType.BU_PH__c.fieldSets.getMap().get('PAProductHierarchy').getFields();
        PAWrapper roWrap ;
        for(BU_PH__c X:BUPHListFinal)
        {
            roWrap = new PAWrapper();
            roWrap.isSelected = false;
            roWrap.sObjectRecord = X;
            roWrap.stringMap.put('Name','');
            setupPHGC.wrapperList.add(roWrap);
         }      
        relatedPHGCList.add(setupPHGC);
        system.debug('***## related list '+relatedPHGCList); 
        return relatedPHGCList;
    }
        return null;
        
    }
    
    /*
     * Author      : 
     * Method Name  :   getName
     * Parameters   :   No parameters 
     * Return type  :   String
     * Description  :   This method is used to determine the name of the business component
     */
    public String getName()
    {
       return PAService.NAME_PH;
    }
    
    /* 
     * Author      :  
     * Method Name  :   validate
     * Parameters   :   String
     * Return type  :   String
     * Description  :   This method is used to validate the action performed
     */
    public String validate(String desiredAction) 
    {
        String errorMsgPH;
        String errorMessage;
        if(paOGItem.getListOptions().size() == 0)
        {
            errorMessage=System.Label.No_Business_Error;
            return errorMessage;
        }
        if(paOGItem.selectedBU == '--Select--' || string.isBlank(paOGItem.selectedBU))
        {
            errorMessage = errorMessage+'<br>'+System.Label.No_Business_Selected_Error;
            return errorMessage;
        }
        system.debug('&&&&'+desiredAction);
        if(desiredAction.contains('_'))
        {
            errorMsgPH = system.label.PH_Code_Error;
        }
        // <HL20140904> changes by hema Start
                            
        if(desiredAction.contains('BUSetupAddNewPH'))
        {
            shownewPH = True;   
            if(NewPH == '')
            {
                 throw new PAException('Please enter Value for mandatory filed PHCode', ApexPages.Severity.ERROR);
                //system.debug('*********NewPH - '+NewPH); 
            }
            //system.debug('** ---- NewPH - '+NewPH);
            
            if(NewPH != ''){
            Pattern p = Pattern.compile('[^a-z0-9A-Z ]');
            Matcher m = p.matcher(NewPH);
            if (m.find())
              throw new PAException('Please enter Valid value for mandatory filed PHCode', ApexPages.Severity.ERROR);
                   
            }
            if(ph.Description__c == '')
            {
                 throw new PAException('Please enter Value for mandatory filed Description', ApexPages.Severity.ERROR);
            }
            
            
        
        }
        
        return errorMsgPH;
    }
    
    /*
     * Author      : 
     * Method Name  :   action
     * Parameters   :   String,String,String
     * Return type  :   String
     * Description  :   This method is called when action on the corresponding page is called
     */
    public String action(String newPageLabel,String currentPageLabel,String desiredAction) 
    {
        
        if(!String.isBlank(desiredAction) &&desiredAction.equalsIgnoreCase('BUSetup'))
        {
            String str =  validate(desiredAction);
            if(!String.isBlank(str))
            {
                str=str.remove('null');
                throw new PAException('<html>'+str+'</html>', ApexPages.Severity.ERROR);
            }
            
        }
        //<HL20140904> Start
        /*if(desiredAction!=null && desiredAction.equalsIgnoreCase('PHCreation'))
        {
            valuePH='PHCreation';           
        }*/
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('BUSetupAddNewPH'))
        {
            system.debug('** Inside DesiredAction ValuePH - '+valuePH);
            String str =  validate(desiredAction);
            valuePH='BUSetupAddNewPH'; 
            save();          
        }
        //<HL20140904> End
        
        
        if(desiredAction.containsIgnoreCase('BUSetupPHSave'))
        {
            valuePH = 'PHSetup';
            save();
        }
        if(desiredAction.containsIgnoreCase('BUSetupNamePHSave'))
        {
            valuePH = 'NamePH';
            save();
            selectedPHValue = null;
        }
        if(desiredAction.containsIgnoreCase('BUSetupFetchPH'))
        {
            string FinalPH;
            string redefinedPH=selectedPHValue;
            PHlevel=(selectedPHValue.length()/2)+1; //<HL20140904>
            
            
            if(selectedPHValue != null)
            {
                 
                for(Integer i=0; i<=selectedPHValue.length();i++)
                {
                    redefinedPH = redefinedPH.removeEnd('#');
                }
                FinalPH = redefinedPH.replace('#','_');
            }
            system.debug('&&& FianlPH '+FinalPH);
            errorDispPH = validate(FinalPH);
            
            if(errorDispPH!=null)
            {
                System.debug('### errorMessage '+errorDispPH);
                errorDispPH=errorDispPH.remove('null');
                throw new PAException(errorDispPH, ApexPages.Severity.ERROR);
            }
            else
            {
                relatedWrappersList = getListWrappers();
            }
            
        }
        if(desiredAction.containsIgnoreCase('Cancel'))
        {
            relatedWrappersList = null;
            paOGItem.selectedRecordId = null;
            selectedPHValue=null;
        }
        return newPagelabel;
    }
    
    /*
     * Author      : 
     * Method Name  :   save
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public void save()
    {
        system.debug('** -- ValuePH - '+valuePH);
        String errorMessage;
        checkIfBuPhExists = false;
        
        if(valuePH.equalsIgnoreCase('NamePH'))
        {
            Map<Id,String> productHierarchyToNameMap = new Map<Id,String>();
            List<sObject> upsertList = new List<sObject>();
            
            for(PARelatedList rel : relatedWrappersList)
            {
                for(PAWrapper paWrap : rel.wrapperList)
                {
                    productHierarchyToNameMap.put(paWrap.sObjectRecord.Id,paWrap.stringMap.get('Name'));
                    if(paWrap.sObjectRecord instanceof BU_PH__C)
                    {
                            BU_PH__C BUPH  = (BU_PH__C)paWrap.sObjectRecord;
                            if(BUPH.Default_Per__c==0)
                                BUPH.Default_Per__c=null;
                            upsertList.add(paWrap.sObjectRecord);
                    }
                    else
                        upsertList.add(paWrap.sObjectRecord);
                }
            }
            system.debug('++++productHierarchyToNameMap'+productHierarchyToNameMap);
            system.debug('++++upsertList'+upsertList);
            update upsertList;
        
        }
        //<HL20140904> Start -- added code for PH creation
        if(valuePH.equalsIgnoreCase('BUSetupAddNewPH'))
        {
        
        system.debug('++++NewPH :'+NewPH);
        
        ph.PH_Code__c = selectedPHValue+NewPH;
        system.debug('++++ph.PH_Code__c :'+ph.PH_Code__c);
         
        //PHlevel=selectedPHValue.length()/2;   
         
         ph.PH_Level__c= ph.PH_Code__c.length()/2;
        system.debug('++++ph.ph :'+ph);
        List<Product_Hierarchy__c> PHList = new List<Product_Hierarchy__c>();
        PHList = [SELECT Id,PH_Code__c,Name__c FROM Product_Hierarchy__c where PH_Level__c = :ph.PH_Level__c and PH_Code__c=:ph.PH_Code__c];
           if(PHList.size()>0)
            {   // Nadeem - Start
               // List<Product_Hierarchy__c> BUPHid = new List<Product_Hierarchy__c>();
                List<BU_PH__c> BUPHid = new List<BU_PH__c>();       
        //BUPHid = [SELECT Id,PH_Code__c,PH_Level__c,Description__c FROM Product_Hierarchy__c WHERE PH_Code__c = :ph.PH_Code__c];
          BUPHid = [SELECT Id,OrgGroup__c,F_Product_Hierarchy_Code__c,Business_Description__c FROM BU_PH__c WHERE F_Product_Hierarchy_Code__c = :ph.PH_Code__c];
        //system.debug('++++BUPHid :'+BUPHid[0].Id); 
        //system.debug('++++BUPHid.size() :'+BUPHid.size()); 
        List<OrgGroup__c> orggrpid = new List<OrgGroup__c>();
        
        orggrpid = [SELECT Id FROM OrgGroup__c WHERE Business__c = :selectedBU];
        //system.debug('++++orggrpid :'+orggrpid[0].id);
        //buph.Product_Hierarchy__c = BUPHid;
        //buph.OrgGroup__c = orggrpid;
         //buph = new BU_PH__c();
               buph.Business_Description__c = ph.Description__c;
                     system.debug('buph.Representative_Material_Description__c:' +buph.Representative_Material_Description__c);
                     buph.Product_Hierarchy__c=PHList[0].Id;
                     buph.OrgGroup__c=orggrpid[0].id;      
            if(BUPHid.size()>0)
            {
            for(BU_PH__c Y:BUPHid)
            {
                //system.debug('buph.OrgGroup__c:' +buph.OrgGroup__c);
                //system.debug('Y.OrgGroup__c:' +Y.OrgGroup__c);
                if(buph.OrgGroup__c==Y.OrgGroup__c)
                {
                    checkIfBuPhExists=TRUE;
                    //system.debug('++++checkIfBuPhExists 1111111111:'+checkIfBuPhExists); 
                     
                }
                else
                {
                     checkIfBuPhExists=FALSE;
                    //system.debug('++++checkIfBuPhExists 22222222:'+checkIfBuPhExists); 
                }
            }
            }
            
        if(checkIfBuPhExists==FALSE)               
        {
            //system.debug('++++insert buph *********:'); 
        insert buph;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'PH has been created'); 
                ApexPages.addMessage(myMsg);
                shownewPH = False;
                action('PAGlobalConfig','PAGlobalConfig','BUSetupFetchPH');
        }
        if(checkIfBuPhExists==TRUE)
        {
            throw new PAException('PH value already exists', ApexPages.Severity.ERROR);
        }   
         
         buph.clear();
         ph.clear();
         NewPH = NULL;
            // Nadeem - End 
    }
            else
            {  
                insert ph;
                
                List<Product_Hierarchy__c> BUPHid = new List<Product_Hierarchy__c>();
        
        BUPHid = [SELECT Id,PH_Code__c,PH_Level__c,Description__c FROM Product_Hierarchy__c WHERE PH_Code__c = :ph.PH_Code__c];
        system.debug('++++BUPHid :'+BUPHid[0].Id);
        
        List<OrgGroup__c> orggrpid = new List<OrgGroup__c>();
        
        orggrpid = [SELECT Id FROM OrgGroup__c WHERE Business__c = :selectedBU];
        system.debug('++++orggrpid :'+orggrpid[0].id);
        
        //buph.Product_Hierarchy__c = BUPHid;
        //buph.OrgGroup__c = orggrpid;
         //buph = new BU_PH__c();
         buph.Business_Description__c = ph.Description__c;
         system.debug('buph.Representative_Material_Description__c:' +buph.Representative_Material_Description__c);
         buph.Product_Hierarchy__c=BUPHid[0].id;
         buph.OrgGroup__c=orggrpid[0].id;
        if(BUPHid.size()>0) 
        {
        insert buph;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'PH has been created'); 
                ApexPages.addMessage(myMsg);
                shownewPH = False;
                action('PAGlobalConfig','PAGlobalConfig','BUSetupFetchPH');
        }
        else
        {
            throw new PAException('PH not created due to some error', ApexPages.Severity.ERROR);
        }   
         
         buph.clear();
         ph.clear();
         NewPH = NULL;
            }
        
        }
        //<HL20140904> end -- added code for PH creation            
    }
    
    


    /*
     * Author      : 
     * Method Name  :   deleteRecord
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public void deleteRecord()
    {

    }
}