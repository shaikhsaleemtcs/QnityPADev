/*
 * Name      :  PAPHSelection 
 * Description  :  To save the Product Hierarchy LookUp details and actions
 * Author      :  Infosys Limited
 * Created Date :  

 *   Ver.          Developer                           Changes                      Date                 Dependancies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.1         Shiva                         Added cleanup logic               21-02-13                None
//  1.1.1          Bala                           Added fix for UAT defect 10           5-march-2013            None
//  1.1.2          Shiva                          Adding 'ALL' to the  
//                                                  selectoption List                   6-march-2013            None
//1.1.3             Bala                          Changing to with sharing              8-march-2013            None
//1.1.4             Shiva                        Adding selectoptions value to a 
//                                              list from set in populatePH method      8-march-2013            None
public with sharing class PAPHSelection implements IPAComponent
{


	// <SP20140515>
	public string PHCodeInput {get;set;}
	public string PHDescInput {get;set;}
	public list<string> PHLevelInput {get;set;}
	public boolean displayTableBoolean {get;set;}
	public list<phWrapper> phSearchResult {get;set;}


	//variable used in PH Component
	public String filter_PH{get;set;}
	public boolean displayPH{get;set;}
	//private Integer level{get;set;}
	//private Integer prevLevel{get{if(prevLevel==null)return 0;return prevLevel;}set;}
	//private List<String > selectedPHList;
	final String BLANK = '';
	//Map<Integer,List<SelectOption>> targetDropDown{get
	//  {
	//  if(targetDropDown==null)
	//      return new Map<Integer,List<SelectOption>>{1=>dropDownPH1,2=>dropDownPH2,3=>dropDownPH3,
	//  4=>dropDownPH4,5=>dropDownPH5,6=>dropDownPH6,
	//  7=>dropDownPH7,8=>dropDownPH8,9=>dropDownPH9};
	//      else
	//          return targetDropDown;                                                          
	//  }set;}
	//Map<Integer,String> targetSelectedPH{get;set;}

	//variables for dropdowns
	//public List<SelectOption> dropDownPH1 {get;set;}
	//public List<SelectOption> dropDownPH2 {get;set;}
	//public List<SelectOption> dropDownPH3 {get;set;}
	//public List<SelectOption> dropDownPH4 {get;set;}
	//public List<SelectOption> dropDownPH5 {get;set;}
	//public List<SelectOption> dropDownPH6 {get;set;}
	//public List<SelectOption> dropDownPH7 {get;set;}
	//public List<SelectOption> dropDownPH8 {get;set;}
	//public List<SelectOption> dropDownPH9 {get;set;}
	//public String selectedPH1 {get;set;}
	//public String selectedPH2 {get;set;}
	//public String selectedPH3 {get;set;}
	//public String selectedPH4 {get;set;}
	//public String selectedPH5 {get;set;}
	//public String selectedPH6 {get;set;}
	//public String selectedPH7 {get;set;}
	//public String selectedPH8 {get;set;}
	//public String selectedPH9 {get;set;}
	////private Map<string,string> phDesc; 
	public string completePH{get;set;}
	public String desiredAction{get;set;}

	public string KCFromPage {get;set;}
	public Integer requiredPHLength {get;set;}

	public Integer lastPHLevelSelected {get;set;}

	public string selectedBUFromPage {get;set;}
	//For BU-PH Description - Bala
	//private Map<Id,string> buPHDesc;

	//<TJ>
	public String label{get;set;}

	//counstructor 
	public PAPHSelection ()
	{
		displayPH=false;
		//buPHDesc = new Map<Id,string>();
		//phDesc = new Map<string,string>();
		//dropDownPH1 = new List<SelectOption>();
		///dropDownPH2 = new List<SelectOption>();
		//dropDownPH3 = new List<SelectOption>();
		///dropDownPH4 = new List<SelectOption>();
		//dropDownPH5 = new List<SelectOption>();
		//dropDownPH6 = new List<SelectOption>();
		//dropDownPH7 = new List<SelectOption>();
		//dropDownPH8 = new List<SelectOption>();
		//dropDownPH9 = new List<SelectOption>();
		//selectedPHList=new list<string>();
		phSearchResult = new list<phwrapper>();


	}

	//Methods of PH Component
	/*
	 * Author      : 
	 * Method Name  :   action
	 * Parameters   :   
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference action()
	{
		if(desiredAction.equalsIgnoreCase('populatePH'))
		{
			//displayPHPopUp();
			populatePHMethod();
		}
		//else if(desiredAction.equalsIgnoreCase('FetchPH')) 
		//{
		//fetchPHMethod();
		//}
		else if(desiredAction.containsIgnoreCase('selectAll'))
		{
			selectAllPH();          
		}
		else if(desiredAction.equalsIgnoreCase('SearchPH'))
		{
			searchPHMethod();
		}
		return null;
	} 


	/*
	 * Author      : 
	 * Method Name  :   displayPopUpWindowMethod
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference displayPopUpWindow() 
	{
		PHLevelInput = new list<string>();
		phSearchResult = new list<phWrapper>();

		system.debug(' ^^ ^^ ^^ KCFromPage '+KCFromPage);
		if(!String.IsBlank(KCFromPage))
		{
			for(Integer i=1;i<=10;i++)
			{
				if(!KCFromPage.contains('PH'+String.valueOf(i)))
				{
					requiredPHLength = i-1;
					break;                    
				}
			}
			KCLevel = requiredPHLength;
			requiredPHLength = requiredPHLength*2;
		}
		else
		{
			requiredPHLength = 18;
		}

		system.debug(' ^^ ^^ ^^ requiredPHLength '+requiredPHLength);
		return displayPHPopUp();
	}

	/*
	 * Author      : 
	 * Method Name  :   searchCustomer
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference dosearch() 
	{
		system.debug('*&** desiredaction'+desiredaction);
		if(desiredaction.equalsignorecase('SaveAndClose'))
		{
			return saveandClose();
		}
		else if(desiredaction.equalsignorecase('SaveAndContinue'))
		{
			return saveandContinue();
		}
		//return ChoosePH();
		return null;
	}
	/*
	 * Author      : 
	 * Method Name  :   returnData
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference returnData() 
	{
		return null;
	}

	/*
	 * Author      : 
	 * Method Name  :   closeWindow
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference closeWindow()
	{
		return closePhPopUp();
	}

	/*
	 * Author     : Anand Darshi
	 * Method Name : displayPHPopUp
	 * Parameters  : No parameters
	 * Return type : Pagereference
	 * Description : This Method display PH PopUp.
	 */
	private List<String> listPHCodes;
	private PageReference displayPHPopUp() 
	{
		//map<string,string> removeDuplicate = new map<string,string>(); 
		//dropDownPH1 = new List<SelectOption>();
		//to avoid it populating the list items again and again
		//if(dropDownPH1.size()<2)
		//{
		//  List<Product_Hierarchy__c> listPH1 = new List<Product_Hierarchy__c>();
		//buPHDesc = new Map<Id,string>(); 
		//listPHCodes = new List<string>();

		//  set<SelectOption> setDropDownPH1=new set<SelectOption>();

		//  listPH1 = [SELECT id,PH_Code__c,PH_Level__c,Name__c,Description__c FROM Product_Hierarchy__c where PH_Code__c!=null AND PH_Level__c=1];
		//  for(Product_Hierarchy__c X:listPH1)
		//  {
		//      buPHDesc.put(X.id,X.PH_Code__c);
		//  }
		//  system.debug('***Bufrompage'+selectedBUFromPage);
		//  system.debug('***Bufrompage1'+buPHDesc);
		////    List<BU_PH__c> buphLevel1 = [SELECT id,Business_Description__c,Product_Hierarchy__c,Product_Hierarchy__r.description__c,Product_Hierarchy__r.PH_Code__c
		//                               FROM BU_PH__c where Product_Hierarchy__c IN:buPHDesc.keyset() AND 
		/// system.debug('*****X.buphLevel1=- '+buphLevel1);
		//system.debug('*****X.buphLevel1 Size =- '+buphLevel1.size());                 

		//  for(BU_PH__c X:buphLevel1)
		//{
		//      system.debug('*****X.Product_Hierarchy__r.PH_Code__c=- '+X.Product_Hierarchy__r.PH_Code__c);
		//      system.debug('*****X.Business_Description__c=- '+X.Business_Description__c);
		//      listPHCodes.add(X.Product_Hierarchy__r.PH_Code__c);
		//      setDropDownPH1.add(new selectOption(X.Product_Hierarchy__r.PH_Code__c,X.Business_Description__c));
		//  }

		//dropDownPH1.addAll(setDropDownPH1);
		//if(dropDownPH1.size()>1)
		//{
		//  dropDownPH1.add(0,new SelectOption('--Select--','--Select--'));
		//}
		//  else if(dropDownPH1.size() == 1)
		//  {
		//  selectedPH1 = listPHCodes[0];
		//      populatePHMethod();
		//  }
		//}
		displayPH=true;
		return null;
	}


	/*
	 * Author     : Bala
	 * Method Name : populatePH
	 * Parameters  : No parameters
	 * Return type : Pagereference
	 * Description : This Method is called when drop down in PH is selected.
	 */

	private PageReference populatePHMethod()
	{
		//  boolean flag=true;
		//boolean queryFlag=false;

		//List<Product_Hierarchy__c> allMaterialList = new List<Product_Hierarchy__c>(); 
		//  map<string,string> removeDuplicate = new map<string,string>(); 
		//  map<string,string> descToCodeMap = new map<string,string>();
		//  set<string> setPHDesc= new set<string>();
		//list<string> listPHDesc= new list<string>();
		//  buPHDesc = new Map<Id,string>();


		//  targetSelectedPH = new Map<Integer,string>{1=>selectedPH1,2=>selectedPH2,3=>selectedPH3,
		//  4=>selectedPH4,5=>selectedPH5,6=>selectedPH6,
		//      7=>selectedPH7,8=>selectedPH8,9=>selectedPH9};
		//logic for calculation of level
		//      if(selectedPH1!=null && selectedPH2==null )
		//      {
		//          level=1;
		//      }
		//  else
		//      { 
		//      system.debug('&& Map'+targetSelectedPH);
		//      system.debug('&& list'+selectedPHList);

		//for(integer i=0;i<prevLevel;i++)
		//{
		//  system.debug('&& compare i'+i);
		//  if(selectedPHList[i]!=targetSelectedPH.get(i+1))
		//  {
		//      level=i+1;
		//      flag=false;
		//      break;
		//}
		//}
		//if(flag)
		//{

		////    for(Integer i=1;i<=9;i++)
		//  {
		//      system.debug('&& continue'+i);
		//      if(targetSelectedPH.get(i)==null || targetSelectedPH.get(i)==BLANK)
		//      {   
		//      level=i-1;
		//  //      system.debug('&& continue,level'+level);
		//          break;
		//      }
		//  }
		//}
		//if(level <= prevLevel)
		//{
		//  system.debug('&&& refresh method called');
		//  refreshPHDropDownList();
		//}
		//}

		//system.debug('&&& 1 level:'+level);
		//system.debug('&&& 2 prevlevel:'+prevLevel);

		//Integer nextLevel = Level + 1;

		//list<SelectOption> generalList = new list<SelectOption>();
		//string whereClause = BLANK;
		//string tempPH = BLANK;
		//string phCodeConcat;
		//system.debug('&& targetSelectedPH - '+targetSelectedPH);
		//phCodeConcat = targetSelectedPH.get(level);
		//if(!string.isBlank(phCodeConcat))
		//{
		//  phCodeConcat = phCodeConcat.replace('#','_');
		//  phCodeConcat = phCodeConcat.remove('null');
		//}

		//if(level<9)
		//{
		//  tempPH=phCodeConcat;

		//  if(!string.isBlank(tempPH))
		//  {   
		//      queryFlag=true;
		//      string splitValue = BLANK;
		//      system.debug('*** when some value selected'+tempPH+' Level'+level);

		//      whereClause+=' PH_Code__c like \'' + String.escapeSingleQuotes(tempPH.trim()) + '%\' AND PH_Level__c=:nextLevel';
		//  }

		//  if(queryFlag)
		//  {

		//      String completeQuery = 'SELECT  id,PH_Code__c,Description__c FROM  Product_Hierarchy__c  where '+whereClause;
		//      system.debug('&&& 7 nextLevel'+nextLevel);
		//      system.debug('&&& 7 Query Generated'+completeQuery);
		//      allMaterialList = Database.query(completeQuery);

		//      if(allMaterialList!=null)
		//      {
		//          for(Product_Hierarchy__c material:allMaterialList)
		//          {
		//              String s = String.valueOf(material.get('Description__c'));
		//adding values to map
		//              buPHDesc.put(material.id,s);
		//          }

		//query the BU-PH for the desc.

		//          List<BU_PH__c> descriptions = [SELECT id,Business_Description__c,Product_Hierarchy__c,Product_Hierarchy__r.description__c,Product_Hierarchy__r.PH_Code__c
		//                                       FROM BU_PH__c where Product_Hierarchy__c IN:buPHDesc.keyset() AND 
		//                                   OrgGroup__c = :selectedBUFromPage ORDER BY Business_Description__c limit 1001];
		//      system.debug('BU-PH Descriptions'+descriptions+' '+descToCodeMap);
		//          system.debug('BU-PH Descriptions size '+descriptions.size());
		//          string tempCode;

		//      for(BU_PH__c des:descriptions)
		//      {
		//Temp Fix- If there is no description in BU-PH --> Shiva
		//          if(des.Business_Description__c == null)
		//      {
		//              string S = des.Product_Hierarchy__r.PH_Code__c+' - No Description';
		//              listPHDesc.add(S);
		//              descToCodeMap.put(S,des.Product_Hierarchy__r.PH_Code__c);
		//          }
		//End Temp- Fix
		//      else
		//      {
		//              listPHDesc.add(des.Business_Description__c);
		//      descToCodeMap.put(des.Business_Description__c,des.Product_Hierarchy__r.PH_Code__c);
		//      }
		//  }
		//  system.debug('BU-PH Descriptions'+listPHDesc+' BU-PH Descriptions Map '+descToCodeMap);

		//  listPHDesc.sort();
		//  system.debug('@@@ listPHDesc - '+listPHDesc);
		//  system.debug('@@@ listPHDesc size - '+listPHDesc.size());
		//if(listPHDesc!= null && listPHDesc.size()>1000)
		//  {
		//      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'PH'+nextLevel+' returns more than 1000 values. Please select values for previous levels'); 
		//      ApexPages.addMessage(myMsg);
		//  }
		//  else
		//  {
		//      for(String X:listPHDesc)
		//      {
		//      generalList.add(new SelectOption(descToCodeMap.get(X),X));
		//      }

		//      system.debug('@@@ generalList - '+generalList);
		//  system.debug('@@@ generalList - '+generalList.size());
		//      targetDropDown.get(nextLevel).clear();  
		//      targetDropDown.get(nextLevel).add(new SelectOption(' ','--select--'));
		//After discussion with Bala adding this.. Adding 'ALL' to the selectoption list irrespective of the size of the list V1.1.2
		//      targetDropDown.get(nextLevel).add(new SelectOption(targetSelectedPH.get(level)+'##','All')); 
		//ver 1.1.2 END
		//  targetDropDown.get(nextLevel).addAll(generalList);
		//targetDropDown.get(nextLevel).addAll(generalSet);
		//      generalList.clear();
		//generalSet.clear();
		//  }
		//}
		//}
		//}  

		//prevLevel=level;
		//selectedPHList.clear();
		//selectedPHList.addAll(targetSelectedPH.Values());
		//system.debug('&& selectedPHList '+selectedPHList);
		//targetSelectedPH  = null;
		return null;
	}

	/*
	 * Author     : Shiva
	 * Method Name : fetchPHMethod
	 * Parameters  : No parameters
	 * Return type : void
	 * Description : This Method is called when clicked on Fetch PH button.
	 */   
	public list<phWrapper> phWrapperList {get;set;}
	private Integer KCLevel {get;set;}
	public boolean selectAllFlag {get;set;}

	//public void fetchPHMethod()
	//{
	//ChoosePH(); 
	//List<Product_Hierarchy__c> prodHierList= new List<Product_Hierarchy__c>();
	//List<String> phIdList = new List<String>();
	//phWrapperList = new list<phWrapper>();
	//Integer levelToUse; 
	//string redefinedPH = filter_PH;
	//string FinalPH;
	///system.debug('*** KCLevel'+KCLevel);
	//if(KCLevel>lastPHLevelSelected)
	//{
	//  levelToUse = lastPHLevelSelected+1;
	//}
	//else
	//{
	//  levelToUse = KCLevel;
	//}
	//if(!String.isBlank(filter_PH))
	//{
	//  for(Integer i=0; i<=filter_PH.length();i++)
	//  {
	//      redefinedPH = redefinedPH.removeEnd('#');
	//  }
	//}
	//system.debug('*** redefinedPH'+redefinedPH);
	//if(!String.isBlank(redefinedPH))
	//{
	//  FinalPH = redefinedPH.replace('#','_');
	//}
	//prodHierList = [SELECT id,PH_Code__c, PH_Level__c FROM Product_Hierarchy__c WHERE PH_Code__c like :FinalPH+'%' AND PH_Level__c=:levelToUse];
	//for(Product_Hierarchy__c X:prodHierList)
	//{
	//  phIdList.add(X.Id);
	//}
	//List<BU_PH__c> phDescList = [SELECT Id,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_level__c,OrgGroup__c,Business_Description__c FROM BU_PH__c WHERE Product_Hierarchy__c IN:phIdList AND OrgGroup__c = :selectedBUFromPage];
	//map<string,BU_PH__c> phCodeToBUPHRecMap = new map<string,BU_PH__c>(); 
	//for(BU_PH__c X:phDescList)
	//{
	//  phCodeToBUPHRecMap.put(X.Product_Hierarchy__r.PH_Code__c,X);
	//}

	//for(Product_Hierarchy__c ph:prodHierList)
	//{
	//phWrapper WraperObj=new phWrapper();
	//WraperObj.phObj = ph;
	//WraperObj.phDescBUPH = phCodeToBUPHRecMap.get(ph.PH_Code__c);
	//phWrapperList.add(WraperObj);
	//}

	//for(BU_PH__c X:phDescList)
	//{
	//  phWrapper WraperObj=new phWrapper();
	////    WraperObj.phDescBUPH = X;
	//  phWrapperList.add(WraperObj);
	//}
	//system.debug('%%% phWrapperList size ^^ '+phWrapperList.size());
	//}

	/*
	 * Author     : Shiva
	 * Method Name : phWrapper
	 * Parameters  : No parameters
	 * Return type : 
	 * Description : Wrapper class
	 */  

	public class phWrapper
	{
		public boolean isSelected {get;set;}
		//public PA_ERP_Material__c materialObj {get;set;}
		public Product_Hierarchy__c phObj {get;set;}
		public BU_PH__c phDescBUPH {get;set;}

		public phWrapper()
		{
			this.isSelected =false;

		}

	}

	/*
	 * Author     : Shiva
	 * Method Name : selectAllph
	 * Parameters  : No parameters
	 * Return type : 
	 * Description : Select All Method
	 */


	private void selectAllph()
	{
		if(selectAllFlag)
		{
			for(phWrapper phWrap:phSearchResult)
			{
				phWrap.isSelected = true;
			}
		}
		else
		{
			for(phWrapper phWrap:phSearchResult)
			{
				phWrap.isSelected = false;
			}
		}
	}

	/*
	 * Author     : Anand Darshi
	 * Method Name : refreshPHDropDownList
	 * Parameters  : No parameters
	 * Return type : Pagereference
	 * Description : This clear all value from drop down.
	 * Modified By : Balakrishnan
	 */

	//private pageReference refreshPHDropDownList()
	//{

	//      for(Integer i=level+1; i<=prevLevel+1;i++){
	//  targetDropDown.get(i).clear(); 
	//  targetSelectedPH.put(i,null);
	//  if(i==1){selectedPH1=BLANK;}
	//  if(i==2){selectedPH2=BLANK;}
	//  if(i==3){selectedPH3=BLANK;}
	//  if(i==4){selectedPH4=BLANK;}
	////    if(i==5){selectedPH5=BLANK;}
	//  if(i==6){selectedPH6=BLANK;}
	//  if(i==7){selectedPH7=BLANK;}
	//  if(i==8){selectedPH8=BLANK;}
	//  if(i==9){selectedPH9=BLANK;}
	//}
	//return null;
	//}





	/*
	 * Author     : Anand Darshi
	 * Method Name : ChoosePH
	 * Parameters  : No parameters
	 * Return type : Pagereference
	 * Description : This Method concatinate all selected value from drop down in PH.
	 */

	//public pageReference ChoosePH()
	//{   
	//system.debug('$$$$'+selectedPHList+' size '+selectedPHList.size());
	//targetSelectedPH = new Map<Integer,string>{1=>selectedPH1,2=>selectedPH2,3=>selectedPH3,
	//  4=>selectedPH4,5=>selectedPH5,6=>selectedPH6,
	//  7=>selectedPH7,8=>selectedPH8,9=>selectedPH9};
	//  system.debug('$$$$'+targetSelectedPH);
	//  filter_PH = null;
	//  boolean flag = false;
	//  if(String.IsBlank(selectedPH1))
	//  {
	//      System.debug('*****in error message'); 
	//      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, system.label.PH1_Mandatory_Error); 
	//      ApexPages.addMessage(myMsg);
	//  }
	//  else
	//  {
	//      for(Integer i=targetSelectedPH.size();i>=1;i--)
	//      {
	//          if(targetSelectedPH.get(i)!=null && targetSelectedPH.get(i)!=' ' && targetSelectedPH.get(i)!='')
	//          {
	//              filter_PH = setFilterPHOnChoose(targetSelectedPH.get(i),i,targetSelectedPH);
	//              break;  
	//          }
	//      }

	//      system.debug('** PH : '+filter_PH);
	//      if(!String.IsBlank(filter_PH))
	//      {
	//          lastPHLevelSelected = filter_PH.length()/2;
	//      }
	//      system.debug('***lastPHLevelSelected : '+lastPHLevelSelected);
	//      
	//      for(Integer i=filter_PH.length();i<18;i+=2)
	//      {
	//          filter_PH = filter_PH+'##';
	//      }


	//  system.debug('***desiredAction : '+desiredAction);
	//  if(desiredAction.equalsIgnoreCase('ChoosePH'))
	//  {
	//      displayPH=false;
	//      cleanup();
	//      phWrapperList = null; 
	//  }
	//  else if(desiredAction.equalsIgnoreCase('fetchPHChoose'))
	//  {
	//      system.debug('In fecthPHChoose');
	//      filter_PH = BLANK;
	//      completePH = BLANK;

	//  for(phWrapper wrap1:phWrapperList)
	//  {
	//      if(wrap1.isSelected == true)
	//          {
	//          flag = true;
	////                break;
	//          }
	//  }
	//  if(flag == false)
	//{
	//      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
	//      ApexPages.addMessage(myMsg);
	//}
	//  else
	//{

	//  if(phWrapperList.size()>0)
	//      {
	//      for(integer i=0;i<phWrapperList.size();i++)
	//      {
	//          if(phWrapperList[i].isSelected)
	//          {
	//              filter_PH= filter_PH +phWrapperList[i].phDescBUPH.Product_Hierarchy__r.PH_Code__c +',';
	//              completePH=completePH + phWrapperList[i].phDescBUPH.Product_Hierarchy__r.PH_Code__c+ '='+phWrapperList[i].phDescBUPH.Business_Description__c+'==';
	//          }
	//      }
	//      if(!string.IsBlank(filter_PH))
	//      {
	//          filter_PH=filter_PH.substring(0, filter_PH.length()-1);
	//      }
	//  if(!string.IsBlank(completePH))
	//      { 
	//          completePH=completePH.substring(0, completePH.length()-2);
	//      }
	//  }
	//  displayPH=false;
	//  cleanup();
	//  phWrapperList = null; 
	//  }
	//}
	//  system.debug('$$$ filter_PH '+ filter_PH);
	//  system.debug('$$$ completePH '+ completePH);
	//  }
	//   return null;

	//}

	/*
	 * Author     : Anand Darshi
	 * Method Name : closePhPopUp
	 * Parameters  : No parameters
	 * Return type : Pagereference
	 * Description : This Method closes PH PopUp.
	 */

	private PageReference closePhPopUp() 
	{
		displayPH=false;
		// displayPopUp=false;
		phWrapperList = null;       
		cleanup(); 
		return null;
	}

	/*
	 * Author     : Anand Darshi
	 * Method Name : setFilterPHOnChoose
	 * Parameters  : string,integer and map
	 * Return type : string
	 * Description : This Method returns the selected PH when choose button is clicked 
	 */

	//public string setFilterPHOnChoose(string phValue,Integer highestLevel,Map<Integer,string> workMap) 
	//{
	//  string tempValue,splitValue;
	//  splitValue = BLANK;
	//  for(Integer i=1;i<=highestLevel;i++)
	//  {
	//
	//  tempValue = workMap.get(i);
	//      splitValue = splitValue + tempValue.substring(tempValue.length()-2 ,tempValue.length());
	//added - neeharika
	//  completePH+=phDesc.get(splitValue)+'==';
	//  }       


	//  return splitValue;
	//}

	/*
	 * Author     : Anand Darshi
	 * Method Name : setFilterPHOnChoose
	 * Parameters  : string,integer and map
	 * Return type : string
	 * Description : This Method returns the selected PH when choose button is clicked 
	 */

	public string populateTempPH() 
	{
		return '';
	}

	/*
	 * Author     : Shiva
	 * Method Name : cleanup
	 * Parameters  : No Parameters
	 * Return type : void
	 * Description : 
	 */   
	private void cleanup()
	{
		filter_PH = BLANK;
		completePH = BLANK;
		//selectedPH1=BLANK;
		//selectedPH2=BLANK;
		//selectedPH3=BLANK;
		//selectedPH4=BLANK;
		//selectedPH5=BLANK;
		//selectedPH6=BLANK;
		//selectedPH7=BLANK;
		//selectedPH8=BLANK;
		//selectedPH9=BLANK;
	}

	// <SP20140515>
	/*   
	 * Author      : Shiva
	 * Method Name : search Method
	 * Parameters  : No Parameters
	 * Return type : void
	 * Description : 
	 */
	private void searchPHMethod()
	{   
		system.debug('** PH Code input '+PHCodeInput+'-'+'** PH Desc input '+PHDescInput+'-'+'** PH Level input '+PHLevelInput);
		phSearchResult.clear();
		displayTableBoolean = true;     
		String whereClause=' where Id!=null';
		if(!string.isBlank(PHCodeInput))
			whereClause+=' AND Product_Hierarchy__r.PH_Code__c like \''+ String.escapeSingleQuotes(PHCodeInput.trim())+ '%\'';
		if(!string.isBlank(PHDescInput))
			whereClause+=' AND Business_Description__c like \''+ String.escapeSingleQuotes(PHDescInput.trim())+ '%\'';
		if(PHLevelInput.size() > 0)
		{
			String temp='';
			for(integer i=0; i<PHLevelInput.size(); i++)
			{
				if(PHLevelInput[i]!='--Select--')
				{
					if(i != PHLevelInput.size()-1)
						temp += ' Product_Hierarchy__r.PH_level__c ='+' '+PHLevelInput[i]+' OR';
					else
						temp +=' Product_Hierarchy__r.PH_level__c ='+' '+PHLevelInput[i];
				}
			}
			if(temp!='')
				whereClause +=' AND ('+temp+')';
		}
		system.debug('selectedBUFromPage is '+selectedBUFromPage);
		system.debug('requiredPHLength is '+requiredPHLength);
		String query = 'SELECT Id,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_level__c,Business_Description__c FROM BU_PH__c '+whereClause+ ' AND OrgGroup__c = :selectedBUFromPage AND Product_Hierarchy__r.PH_level__c <= :requiredPHLength order by Product_Hierarchy__r.PH_level__c limit 200';
		system.debug('*** QUERY *** '+query);
		for(BU_PH__c X:database.query(query))
		{
			phWrapper phSearchRecord = new phWrapper();
			phSearchRecord.phDescBUPH = X;
			phSearchResult.add(phSearchRecord);
		}
		system.debug('**** phSearchResult **'+phSearchResult+'**** phSearchResult size **'+phSearchResult.size());
		if(phSearchResult.size()==0)
		{
			ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found');
			ApexPages.addMessage(errorMsg);         
		}
		if(phSearchResult.size()==200)
		{
			ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Search returned 200 records,Please use Filters.');
			ApexPages.addMessage(errorMsg);         
		}
	}

	public pagereference saveandContinue()
	{
		boolean flag = false;
		for(phWrapper ph: phSearchResult)
		{
			if(ph.isSelected == true)
			{
				flag = true;
				break;
			}
		}
		if(flag == false)
		{
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
			ApexPages.addMessage(myMsg);
		}
		else
		{
			if(!String.isBlank(filter_PH))
			{
				filter_PH = filter_PH+',';
			}
			if(!String.isBlank(completePH))
			{
				completePH = completePH+'==';
			}

			for(phWrapper ph: phSearchResult)
			{
				if(ph.isSelected == true && !filter_PH.contains(ph.phDescBUPH.Product_Hierarchy__r.PH_Code__c))
				{
					filter_PH= filter_PH +ph.phDescBUPH.Product_Hierarchy__r.PH_Code__c +',';
					completePH=completePH +ph.phDescBUPH.Product_Hierarchy__r.PH_Code__c+ '='+ph.phDescBUPH.Business_Description__c+'==';

					system.debug('******* filter_PH b4 if cont****'+filter_PH); 
					system.debug('******* complte_PH****'+completePH);
				}
			}
			if(!string.IsBlank(filter_PH))
			{
				filter_PH=filter_PH.substring(0, filter_PH.length()-1);
			}
			if(!string.IsBlank(completePH))
			{ 
				completePH=completePH.substring(0, completePH.length()-2);
			}
		}
		system.debug('******* filter_PH last if cont****'+filter_PH);
		system.debug('******* complte_PH****'+completePH);
		return null;
	}

	public pagereference saveandClose()
	{
		boolean flag = false;
		for(phWrapper ph: phSearchResult)
		{
			if(ph.isSelected == true)
			{
				flag = true;
				break;
			}
		}

		if(flag == false)
		{
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
			ApexPages.addMessage(myMsg);
		}
		else
		{
			if(!String.isBlank(filter_PH))
			{
				filter_PH = filter_PH+',';
			}
			if(!String.isBlank(completePH))
			{
				completePH = completePH+'==';
			}

			for(phWrapper ph: phSearchResult)
			{
				if(ph.isSelected == true && !filter_PH.contains(ph.phDescBUPH.Product_Hierarchy__r.PH_Code__c))
				{
					filter_PH= filter_PH +ph.phDescBUPH.Product_Hierarchy__r.PH_Code__c +',';
					completePH=completePH +ph.phDescBUPH.Product_Hierarchy__r.PH_Code__c+ '='+ph.phDescBUPH.Business_Description__c+'==';

					system.debug('******* filter_PH b4 if close****'+filter_PH);
					system.debug('******* complte_PH****'+completePH);
				}
			}
			if(!string.IsBlank(filter_PH))
			{
				filter_PH=filter_PH.substring(0, filter_PH.length()-1);
			}
			if(!string.IsBlank(completePH))
			{
				completePH=completePH.substring(0, completePH.length()-2);
			} 
			displayPH=false;
			displayTableBoolean = false;
		}
		system.debug('******* filter_PH last close****'+filter_PH);
		system.debug('******* complte_PH****'+completePH);
		return null;
	}


	public void singleSelectMethod()
	{
		filter_PH = '';
		completePH = '';
		system.debug('******* desiredaction ****'+desiredaction);
		BU_PH__c buphSingleSelect = new BU_PH__c();

		buphSingleSelect = [SELECT Id,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_level__c,Business_Description__c FROM BU_PH__c WHERE Id = :desiredaction];

		filter_PH = buphSingleSelect.Product_Hierarchy__r.PH_Code__c;
		completePH = buphSingleSelect.Product_Hierarchy__r.PH_Code__c +'=' +buphSingleSelect.Business_Description__c;

		displayPH=false;
		displayTableBoolean = false;

		system.debug('******* filter_PH last close****'+filter_PH);
		system.debug('******* complte_PH****'+completePH);

	}

	public static String phSObjectType
	{
		get
		{
			return  String.valueOf(BU_PH__c.sObjectType);
		}
		set;
	}
	public static String phFieldsList
	{
		get
		{
			return 'Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_level__c,Business_Description__c';
		}       
		set;
	}
	public String phWhereClause
	{
		get
		{
			//ERP_Source_Cluster__c=:request.pricingCondition.pricingCondition.SAP_Cluster__c
			//System.debug('**materialWhereClause'+request.pricingRequest.Sales_Org_Code__c+'**'+request.pricingRequest.Dist_Channel_Code__c+'***'+request.pricingCondition.pricingCondition.SAP_Cluster__c);
			//return 'RecordType.Name=\'ERP Material - Extended Data\' AND ERP_Sales_Org_Code__c = \''+ request.pricingRequest.Sales_Org_Code__c + '\' AND ERP_Deletion_Flag__c = false AND ERP_Distribution_Channel_Code__c = \'' + request.pricingRequest.Dist_Channel_Code__c + '\' AND ERP_Source_Cluster__c = \'' + request.pricingCondition.pricingCondition.SAP_Cluster__c +'\'';
			return 'OrgGroup__c = :\''+selectedBUFromPage;  
		}
		set;
	}


	//<TJ20140519>
	public PageReference helpLink()
	{
		PAHelpLinks__c link;
		link = PAHelpLinks__c.getInstance(label);
		//system.debug('**Link '+link.Help_Link__c);
		PageReference pref=new PageReference(link.Help_Link__c);
		pref.setRedirect(false);
		system.debug('**PREF '+pref);
		return pref;
	}
}