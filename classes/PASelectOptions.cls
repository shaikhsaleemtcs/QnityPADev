/*
 * Name		 :   PASelectOptions
 * Description  :   This class acts as the Business Component for the Select Options Component
 * Author	   :   Infosys Limited
 * Created Date :   
 *
 * Version	  Modified Date	   Modified By	 Modification
 * -------------------------------------------------------------
 */
public class PASelectOptions 
{
	///set which have the selected options
	private set<string> selectedOptionsSet {get;set;}
	//set which have the unselected options
	private set<string> unSelectedOptionsSet {get;set;}
	//List which holds the records that are selected in the selected options(left side picklist)page
	public list<String> selectedOptions {get;set;}
	//List which holds the records that are selected in the unselected options(right side picklist)page
	public list<String> unSelectedOptions {get;set;}
	//variable that holds the org grp item Id selected for configuring
	private boolean flag {get;set;}
	//list populated from attribute
	public List<String> unSelectedList {get;set;}
	//list populated from attribute
	public List<String> selectedList {get;set;}

	public List<String> selectedListFinal {get;set;}

	public string commandType {get;set;}

	//constructor starts
	public PASelectOptions()
	{
		selectedOptionsSet = new set<string>();
		unSelectedOptionsSet = new set<string>();
		flag = false;
		selectedList = new list<string>();
		unSelectedList = new list<string>();
		selectedListFinal = new list<string>();
	}
	//constructor ends

	/*
	 * Author	   : 
	 * Method Name  :   getListOptionsSelected
	 * Parameters   :   No parameters
	 * Return type  :   List<SelectOption>
	 * Description  :   This method populates the options 
	 */	

	public List<SelectOption> getListOptionsUnselected() 
	{	
		List<SelectOption> unSelectedListOptions = new List<SelectOption>();		
		System.debug('&&&## selectedList --'+selectedList+'&&&## unSelectedList --'+unSelectedList);				
		if(unSelectedOptionsSet.size() == 0 && flag == false)
		{
			for(Integer i=0;i<selectedList.size();i++)
			{
				for(Integer j=0;j<unSelectedList.size();j++)
				{
					if(selectedList[i] == unSelectedList[j])
					{
						unSelectedList.remove(j);
						break;
					}
				}

			}
			for(String X:unSelectedList)
			{
				unSelectedOptionsSet.add(X);
				unSelectedListOptions.add(new SelectOption(X,X));
			}
		}
		else
		{
			for(String X:unSelectedOptionsSet)
			{
				unSelectedListOptions.add(new SelectOption(X,X));
			}
		}
		unSelectedListOptions.sort();
		return unSelectedListOptions;
	}


	/*
	 * Author	   : 
	 * Method Name  :   getListOptionsSelected
	 * Parameters   :   No parameters
	 * Return type  :   List<SelectOption>
	 * Description  :   This method populates the options 
	 */
	public List<SelectOption> getListOptionsSelected() 
	{
		List<SelectOption> selectedListOptions = new List<SelectOption>();
		set<string> selectedListSet = new set<string>();
		selectedListSet.addall(selectedList);

		if(selectedOptionsSet.size() == 0 && flag == false)
		{
			for(String X:selectedListSet)
			{
				selectedOptionsSet.add(X);
				selectedListOptions.add(new SelectOption(X,X));
			}
		}
		else
		{
			for(String X:selectedOptionsSet)
			{
				selectedListOptions.add(new SelectOption(X,X));
			}
		}
		selectedListFinal.clear();
		selectedListFinal.addall(selectedOptionsSet);
		System.debug('&&&## selectedListFinal AFTR --'+selectedListFinal);
		selectedListOptions.sort();
		return selectedListOptions;
	}
	
	/*
	 * Author	   : 
	 * Method Name  :   commandAction
	 * Parameters   :   No parameters
	 * Return type  :   void
	 * Description  :	
	 */	

	public void commandAction()
	{
		System.debug('+++*** In cmd Action commandType - '+commandType);
		if(commandType.equalsIgnoreCase('doSelect'))
		{
			for(String X:selectedOptions)
			{
				selectedOptionsSet.add(X);
				unSelectedOptionsSet.remove(X);
				flag = true;
			}
			System.debug('^^^^ select unSelectedOptionsSet'+unSelectedOptionsSet+'^^^^ select selectedOptionsSet'+selectedOptionsSet);
		}
		else if(commandType.equalsIgnoreCase('doUnselect'))
		{
			for(String X:unSelectedOptions)
			{
				unSelectedOptionsSet.add(X);
				selectedOptionsSet.remove(X);
				flag = true;
			}
			System.debug('^^^^ unselect unSelectedOptionsSet'+unSelectedOptionsSet+'^^^^ unselect selectedOptionsSet'+selectedOptionsSet);
		}
	}	
}