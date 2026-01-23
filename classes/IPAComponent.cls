/*
 * Name		 :   IPAComponent
 * Description  :   This interface is implemented by all the business components
 * Author	   :   Infosys Limited
 * Created Date :   18-01-2013
 *
 * Version	  Modified Date	   Modified By	 Modification
 * -------------------------------------------------------------
 */
public interface IPAComponent
{ 
	/*
	 * Author	   : 
	 * Method Name  :   action
	 * Parameters   :   
	 * Return type  :   PageReference
	 * Description  :   
	 */
	PageReference action(); 
	/*
	 * Author	   : 
	 * Method Name  :   displayPopUpWindowMethod
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	PageReference displayPopUpWindow() ;
	/*
	 * Author	   : 
	 * Method Name  :   searchCustomer
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	PageReference dosearch() ;
	/*
	 * Author	   : 
	 * Method Name  :   returnData
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	PageReference returnData() ;
	/*
	 * Author	   : 
	 * Method Name  :   closeWindow
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	PageReference closeWindow();
}