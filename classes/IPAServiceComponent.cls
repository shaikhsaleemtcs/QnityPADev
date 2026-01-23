/*
 * Name		 :   IPAServiceComponent
 * Description  :   This interface is implemented by all the business components
 * Author	   :   Infosys Limited
 * Created Date :   18-01-2013
 *
 * Version	  Modified Date	   Modified By	 Modification
 * -------------------------------------------------------------
 */
public interface IPAServiceComponent
{
	/*
	 * Author	   : 
	 * Method Name  :   getListBusinessComponents
	 * Parameters   :   No parameters
	 * Return type  :   List<sObject>
	 * Description  :   
	 */
	List<sObject> getListBusinessComponents();
	/*
	 * Author	   : 
	 * Method Name  :   getListOptions
	 * Parameters   :   No parameters
	 * Return type  :   List<selectOption>
	 * Description  :   
	 */
	List<SelectOption> getListOptions();
	/*
	 * Author	   : 
	 * Method Name  :   getListWrappers
	 * Parameters   :   No parameters
	 * Return type  :   List<PARelatedList>
	 * Description  :   
	 */
	List<PARelatedList> getListWrappers();
	/*
	 * Author	   : 
	 * Method Name  :   save
	 * Parameters   :   No parameters
	 * Return type  :   void
	 * Description  :   
	 */
	void save();
	/*
	 * Author	   : 
	 * Method Name  :   deleteRecord
	 * Parameters   :   No parameters
	 * Return type  :   void
	 * Description  :   
	 */	
	void deleteRecord();
	/*
	 * Author	   : 
	 * Method Name  :   validate
	 * Parameters   :   String
	 * Return type  :   String
	 * Description  :   
	 */
	String validate(String desiredAction);
	/*
	 * Author	   : 
	 * Method Name  :   action
	 * Parameters   :   String,String,String
	 * Return type  :   String
	 * Description  :   
	 */
	String action(String newPagelabel,String currentPageLabel, String desiredAction);
	/*
	 * Author	   : 
	 * Method Name  :   getName
	 * Parameters   :   No parameters
	 * Return type  :   String
	 * Description  :   
	 */
	String getName();	
}