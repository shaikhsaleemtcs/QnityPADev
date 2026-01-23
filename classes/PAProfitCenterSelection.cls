/*
 * Name		 :  PAProfitCenterSelection
 * Description  :  To save the Profit Center LookUp details and actions
 * Author	   :  Infosys Limited
 * Created Date : 

 *   Ver.		   Developer						   Changes			   Date				 Dependancies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.1			 Shiva						  Added cleanup logic	   21-02-13			   None
//  1.1.1 			Bala							with sharing 			 08-march-2013			None
//  1.1.2 			Neeha						cleared listFRB4 to reduce viewstate			 21-June-2013			None

public with sharing class PAProfitCenterSelection implements IPAComponent 
{
	

	public boolean displayFRB{get;set;}
	public string filter_FRB{get;set;}
	public string selectedBUFromPage{get;set;}
	//variable used in FRB DropDown population.
	private List<Profit_Center__c> listFRB4  {get;set;}
	public List<Selectoption> dropDownFRB4 {get;set;}
	private set<Selectoption> setDropDownFRB4 {get;set;}
	private String concatFRB4 {get;set;}
	public String selectedFRB4 {get;set;}

	private List<Profit_Center__c> listFRB5  {get;set;}
	public List<Selectoption> dropDownFRB5 {get;set;}
	private set<Selectoption> setDropDownFRB5 {get;set;}
	private String concatFRB5 {get;set;}
	public String selectedFRB5 {get;set;}

	private List<Profit_Center__c> listFRB6  {get;set;}
	public List<Selectoption> dropDownFRB6 {get;set;}
	private set<Selectoption> setDropDownFRB6 {get;set;}
	private String concatFRB6 {get;set;}
	public String selectedFRB6 {get;set;}
	
	private List<Profit_Center__c> listFRB7  {get;set;}
	public List<Selectoption> dropDownFRB7 {get;set;}
	private set<Selectoption> setDropDownFRB7 {get;set;}
	private String concatFRB7 {get;set;}
	public String selectedFRB7 {get;set;}
	
	private List<Profit_Center__c> listFRB8  {get;set;}
	public List<Selectoption> dropDownFRB8 {get;set;}
	private set<Selectoption> setDropDownFRB8 {get;set;}
	private String concatFRB8 {get;set;}
	public String selectedFRB8 {get;set;}
	
	private List<Profit_Center__c> listFRB9  {get;set;}
	public List<Selectoption> dropDownFRB9 {get;set;}
	private set<Selectoption> setDropDownFRB9 {get;set;}
	private String concatFRB9 {get;set;}
	public String selectedFRB9 {get;set;}
	
	private List<Profit_Center__c> listFRB10  {get;set;}
	public List<Selectoption> dropDownFRB10 {get;set;}
	private set<Selectoption> setDropDownFRB10 {get;set;}
	private String concatFRB10 {get;set;}
	public String selectedFRB10 {get;set;}
	
	//<TJ20140519>
	public String label{get;set;}
	
	//variables used in dropDown populate method.
	private Integer level{get;set;}
	private Integer frbLevel {get;set;}
	private Integer prevLevel{get{if(prevLevel==null)return 0;return prevLevel;}set;}
	private list<string > selectedFRBList;
	public Integer heighestFRBLevel {get;set;}
	Map<Integer,List<SelectOption>> targetDropDown{get
		{
			if(targetDropDown==null)
			return new Map<Integer,List<SelectOption>>{4=>dropDownFRB4,5=>dropDownFRB5,6=>dropDownFRB6,
														   7=>dropDownFRB7,8=>dropDownFRB8,9=>dropDownFRB9,
														   10=>dropDownFRB10};
			else
			return targetDropDown;															
		}set;}
	Map<Integer,string> targetSelectedFRB{get;set;}
	public String desiredAction{get;set;}
	//Constructor	  
	public PAProfitCenterSelection(){
		
		displayFRB=false;
		dropDownFRB4 = new List<selectOption>();
		dropDownFRB5 = new List<selectOption>();
		dropDownFRB6 = new List<selectOption>();
		dropDownFRB7 = new List<selectOption>();
		dropDownFRB8 = new List<selectOption>();
		dropDownFRB9 = new List<selectOption>();
		dropDownFRB10 = new List<selectOption>();
		selectedFRBList=new list<string>();
	
	}
	
	//Methods of FRB Component 
	/*
	 * Author	   : 
	 * Method Name  :   action
	 * Parameters   :   
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference action(){
	if(desiredAction!=null && desiredAction.equalsIgnoreCase('populateFRB')){
	populateFRBMethod();
	}
	return null;
	} 

   
	/*
	 * Author	   : 
	 * Method Name  :   displayPopUpWindowMethod
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference displayPopUpWindow() {
	return displayFRBPopUp();
	}
	
	/*
	 * Author	   : 
	 * Method Name  :   searchCustomer
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference dosearch() {
		
		return ChooseFRB();
	} 
	 /*
	 * Author	   : 
	 * Method Name  :   returnData
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference returnData() {
	return null;
	}

	 /*
	 * Author	   : 
	 * Method Name  :   closeWindow
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference closeWindow(){
	return closeFRBPopUp();
	}
	/*
	* Author	  : Anand Darshi
	* Method Name : displayFRBPopUp
	* Parameters  : No parameters
	* Return type : Pagereference
	* Description : This Method display FRB PopUp.
	*/
	  
	private PageReference displayFRBPopUp() 
	{
		//getting for BU specific
		System.debug('****selected BU'+selectedBUFromPage);
		OrgGroup__c BU = [SELECT ID,Owning_Business__c FROM OrgGroup__c where id=:selectedBUFromPage];
		string frbCode4 = BU.Owning_Business__c;

		frbCode4.toUpperCase();

		listFRB4=new List<Profit_Center__c>();
		dropDownFRB4= new List<Selectoption>();
		setDropDownFRB4=new set<Selectoption>();
		
		listFRB5=new List<Profit_Center__c>();
		dropDownFRB5= new List<Selectoption>();
		setDropDownFRB5=new set<Selectoption>();
		
		listFRB6=new List<Profit_Center__c>();
		dropDownFRB6= new List<Selectoption>();
		setDropDownFRB6=new set<Selectoption>();
		
		listFRB7=new List<Profit_Center__c>();
		dropDownFRB7= new List<Selectoption>();
		setDropDownFRB7=new set<Selectoption>();
		
		listFRB8=new List<Profit_Center__c>();
		dropDownFRB8= new List<Selectoption>();
		setDropDownFRB8=new set<Selectoption>();
		
		listFRB9=new List<Profit_Center__c>();
		dropDownFRB9= new List<Selectoption>();
		setDropDownFRB9=new set<Selectoption>();
		

		listFRB4 = [SELECT id,ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,
					ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c 
					 FROM Profit_Center__c WHERE ERP_Profit_Center_4_Code__c!=null AND ERP_Profit_Center_4__c=:frbCode4 ];

		
		dropDownFRB5.add(new selectOption('', '--Select--'));
		dropDownFRB6.add(new selectOption('', '--Select--'));
		dropDownFRB7.add(new selectOption('', '--Select--'));
		dropDownFRB8.add(new selectOption('', '--Select--'));
		dropDownFRB9.add(new selectOption('', '--Select--'));
		
		for(Profit_Center__c X:listFRB4)
		{
			concatFRB4 = X.ERP_Profit_Center_4_Code__c+'-'+X.ERP_Profit_Center_4__c;
			setDropDownFRB4.add(new selectOption(X.ERP_Profit_Center_4_Code__c, concatFRB4));
		}
		
		dropDownFRB4.add(new selectOption('', '--Select--'));
		dropDownFRB4.addAll(setDropDownFRB4);
	   	setDropDownFRB4=null;
	  	
	  	listFRB4.clear();//Neeharika -View State error fix 
		displayFRB=true;
		return null;
	}
	
	/*
	* Author	  : 
	* Method Name : populatePH
	* Parameters  : No parameters
	* Return type : Pagereference
	* Description : This Method is called when drop down in PH is selected.
	*/
	
	private PageReference populateFRBMethod()
	{
		system.debug('Inside FRB populate'+selectedFRB4);
		boolean flag=true;
		boolean queryFlag=false;
		List<Profit_Center__c> allProfitCenterList = new List<Profit_Center__c>(); 
		targetSelectedFRB = new Map<Integer,string>{
													 4=>selectedFRB4,5=>selectedFRB5,6=>selectedFRB6,
													 7=>selectedFRB7,8=>selectedFRB8,9=>selectedFRB9};
													 
		//logic for calculation of level.
		if(selectedFRB4!=null && (selectedFRB5==null|| selectedFRB5==''))
		{			
			 level=1;
			 system.debug('inside if level'+level);
		}
		else
		{ 
			system.debug('&& Map'+targetSelectedFRB+'&& list'+selectedFRBList);

			//checking if user have selected any previous selected Level if yes then assigne that Level.  
			for(integer i=0;i<prevLevel;i++)
			{
				system.debug('&& compare i'+i);
				if(selectedFRBList[i]!=targetSelectedFRB.get(i+4))
				{
					level=i+1;
					flag=false;
					break;
				}
			}
			//If user have not selected previous selected level then continue populating Next level.
			if(flag)
			{
			  
				for(Integer i=4;i<=10;i++)
				{
					system.debug('&& continue'+i);
					if(targetSelectedFRB.get(i)==null || targetSelectedFRB.get(i)=='')
					{	
						level=(i-3)-1;
						break;
					}
				}
			}
			//If user have selected any previous selected Level then refresh the Next all Level. 
			if(level<=prevLevel)
			{
				refreshPHDropDownList();
			}
		}
		
		system.debug('&&& 1 level:'+level+'&&& 2 prevlevel:'+prevLevel);
		
		//Based on level calculated find Out Next dropdown to be populated and Its API Name.
		frbLevel=Level+3;
		Integer nextFrbLevel=frbLevel + 1;
		
		string apiNameofSelectedPC = 'ERP_Profit_Center_'+string.valueOf(frbLevel)+'__c';
		string apiNameofSelectedPCCode = 'ERP_Profit_Center_'+string.valueOf(frbLevel)+'_code__c';  
		string fieldToGet = 'ERP_Profit_Center_'+string.valueOf(nextFrbLevel);
		string fieldToGetCode = fieldToGet+'_code__c';
		string apiNameOfNextFRB = fieldToGet+'__c';
		set<selectoption> generalSet = new set<Selectoption>();
		string whereClause = '';
		string tempFRB = '';
			
		//Baesd on level calculated and API Name find the queryString. 
		if(frbLevel<9)
		{
			for(Integer i = 4;i<=frbLevel;i++)
			{
				tempFRB = targetSelectedFRB.get(i);
				system.debug('&&& 3 inside for loop,i:' +i+'' +tempFRB);
					
				if(tempFRB==' ')
				{
					queryFlag=false;
					break;
				}
				
				if(tempFRB==null){}
				
				else
				{	
					queryFlag=true;
					if(i==4)
					{   
						system.debug('&&& 4 inside loop '+i);
						whereClause = 'ERP_Profit_Center_4_code__c  like \'' + String.escapeSingleQuotes(tempFRB.trim()) + '%\' AND ERP_Profit_Center_'+string.valueOf(i+1)+'_code__c !=null';
						system.debug('&&& 5 whereClause'+i);
					}
					else
					{
						system.debug('&&& 6? inside loop '+i);
						whereClause+=' AND '+'ERP_Profit_Center_'+string.valueOf(i)+'_code__c like \'' + String.escapeSingleQuotes(tempFRB.trim()) + '%\'  AND ERP_Profit_Center_'+string.valueOf(i+1)+'_code__c !=null';
					}
				}
			}   
					
			//Based on queryString search record			
			if(queryFlag)
			{   
				
				string completeQuery = 'select  id,'+apiNameOfNextFRB+', '+fieldToGetCode+' FROM  Profit_Center__c  where '+whereClause+' ';
				system.debug('&&& 7 Query Generated'+completeQuery);
				allProfitCenterList = Database.query(completeQuery);
				system.debug('inside queryflag allProfitCenterList Brundha'+allProfitCenterList);
				if(allProfitCenterList!=null)
				{
					for(Profit_Center__c pc:allProfitCenterList)
					{
						string s = string.valueOf(pc.get(apiNameOfNextFRB));
						string s1 = string.valueOf(pc.get(fieldToGetCode));
						generalSet.add(new selectOption(s1,s1+'-'+s));
						
					}	
						
						targetDropDown.get(nextFrbLevel).clear();	
						targetDropDown.get(nextFrbLevel).add(new selectOption(' ','--Select--'));
						targetDropDown.get(nextFrbLevel).addAll(generalSet);
						
						generalSet.clear();
				}
			}
		}  
	
		prevLevel=level;
		selectedFRBList.clear();
		selectedFRBList.addAll(targetSelectedFRB.Values());
		system.debug('&& '+selectedFRBList);
		targetSelectedFRB  = null;
		return null;	
	}
	
	/*
	* Author	  : Anand Darshi
	* Method Name : refreshPHDropDownList
	* Parameters  : No parameters
	* Return type : Pagereference
	* Description : This clear all value from drop down.
	* Modified By : Balakrishnan
	*/
	
	private pageReference refreshPHDropDownList()
	{
	
		for(Integer i=(level+3)+1; i<=(prevLevel+3)+1;i++)
		{
			system.debug('&& inside refresh '+i);
			targetDropDown.get(i).clear(); 
			targetSelectedFRB.put(i,null);
			if(i==4){selectedFRB4='';}
			if(i==5){selectedFRB5='';}
			if(i==6){selectedFRB6='';}
			if(i==7){selectedFRB7='';}
			if(i==8){selectedFRB8='';}
			if(i==9){selectedFRB9='';}
			if(i==10){selectedFRB10='';}
			
		}
		return null;
	}
	
	
	/*
	* Author	  : Anand Darshi
	* Method Name : ChooseFRB
	* Parameters  : No parameters
	* Return type : Pagereference
	* Description : This Method concatinate all selected value from drop down in FRB.
	*/
	
	private PageReference ChooseFRB()
	{
		system.debug('&&&& 4 **'+selectedFRB4+'&&&& 5 **'+selectedFRB5+'&&&& 6 **'+selectedFRB6+'&&&& 7 **'+selectedFRB7+'&&&& 8 **'+selectedFRB8
					+'&&&& 9 **'+selectedFRB9+'&&&& 10 **'+selectedFRB10);

		
		if(!string.IsBlank(selectedFRB4))
		{
			filter_FRB=selectedFRB4; 
			heighestFRBLevel=4;
		}
		
		if(!string.IsBlank(selectedFRB5))
		{
			filter_FRB=selectedFRB5;  
			heighestFRBLevel=5;
		}
		
		if(!string.IsBlank(selectedFRB6))
		{
			 filter_FRB=selectedFRB6;
			 heighestFRBLevel=6;
		}
		
		if(!string.IsBlank(selectedFRB7))
		{
			 filter_FRB=selectedFRB7;
			 heighestFRBLevel=7;
		}
		
		if(!string.IsBlank(selectedFRB8))
		{
			 filter_FRB=selectedFRB8;
			 heighestFRBLevel=8;
		}
		
		if(!string.IsBlank(selectedFRB9))
		{
			 filter_FRB=selectedFRB9;
			 heighestFRBLevel=9;
		}
		
	   
		System.debug('*****heighestFRBLevel'+heighestFRBLevel); 
		if(heighestFRBLevel==null || heighestFRBLevel==0)
		{
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, system.label.ProfitCenter_Mandatory_Error); 
			ApexPages.addMessage(myMsg);
			
			selectedFRB4='';
			selectedFRB5='';
			selectedFRB6='';
			selectedFRB7='';
			selectedFRB8='';
			selectedFRB9='';
		}
		else
		{
			displayFRB=false;
		}
		selectedFRB4='';
		selectedFRB5='';
		selectedFRB6='';
		selectedFRB7='';
		selectedFRB8='';
		selectedFRB9='';
		dropDownFRB4 = new List<selectOption>();
		dropDownFRB5 = new List<selectOption>();
		dropDownFRB6 = new List<selectOption>();
		dropDownFRB7 = new List<selectOption>();
		dropDownFRB8 = new List<selectOption>();
		dropDownFRB9 = new List<selectOption>();
		dropDownFRB10 = new List<selectOption>();
		
		return null;
	}
	
	/*
	* Author	  : Anand Darshi
	* Method Name : closeFRBPopUp
	* Parameters  : No parameters
	* Return type : Pagereference
	* Description : This Method closes FRB PopUp.
	*/
	
	private PageReference closeFRBPopUp() 
	{
		displayFRB=false;
		selectedFRB4='';
		selectedFRB5='';
		selectedFRB6='';
		selectedFRB7='';
		selectedFRB8='';
		selectedFRB9='';
		dropDownFRB4 = new List<selectOption>();
		dropDownFRB5 = new List<selectOption>();
		dropDownFRB6 = new List<selectOption>();
		dropDownFRB7 = new List<selectOption>();
		dropDownFRB8 = new List<selectOption>();
		dropDownFRB9 = new List<selectOption>();
		dropDownFRB10 = new List<selectOption>();
		return null;
	}
	
	//<TJ20140519>
	public PageReference helpLink()
  	{
  		PAHelpLinks__c link;
  		link = PAHelpLinks__c.getInstance(label);
  		system.debug('**Link '+link.Help_Link__c);
  		PageReference pref=new PageReference(link.Help_Link__c);
  		pref.setRedirect(false);
  		system.debug('**PREF '+pref);
  		return pref;
	}

}