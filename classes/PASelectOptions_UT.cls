/*
 * Name		 :   PASelectOptions_UT
 * Description  :   This is the test class for PASelectOptions
 * Author	   :   Infosys Limited
 * Created Date :   30-03-2013
 *
 * Version	  Modified Date	   Modified By	 Modification
 * ------------------------------------------------------------------------------
 */
 
@isTest
private class PASelectOptions_UT
{
  static testMethod void paSelectOptionsTestMethod()
  {
  
   PASelectOptions PASelectOptions1 = new PASelectOptions();
   //PASelectOptions1.flag = false;
   PASelectOptions1.selectedOptions = new list<String>();
   PASelectOptions1.unSelectedOptions = new list<String>();
   PASelectOptions1.unSelectedList = new list<String>();
   PASelectOptions1.selectedList = new list<String>();
   PASelectOptions1.selectedListFinal = new list<String>();
   
   PASelectOptions1.getListOptionsUnselected(); 
   PASelectOptions1.getListOptionsSelected(); 
   PASelectOptions1.commandType = 'doSelect';
   PASelectOptions1.commandAction();
   
   PASelectOptions PASelectOptions2 = new PASelectOptions();
   //PASelectOptions1.flag = false;
   PASelectOptions2.selectedOptions = new list<String>();
   PASelectOptions2.unSelectedOptions = new list<String>();
   PASelectOptions2.unSelectedList = new list<String>();
   PASelectOptions2.selectedList = new list<String>();
   PASelectOptions2.selectedListFinal = new list<String>();
   PASelectOptions2.commandType = 'doUnselect';
   PASelectOptions2.commandAction();
   
   PASelectOptions PASelectOptions3 = new PASelectOptions();
   //PASelectOptions1.flag = false;
   PASelectOptions3.selectedOptions = new list<String>();
   PASelectOptions3.selectedOptions.add('A');
   PASelectOptions3.selectedOptions.add('B');
   PASelectOptions3.unSelectedOptions = new list<String>();
   PASelectOptions3.unSelectedOptions.add('A');
   PASelectOptions3.unSelectedOptions.add('B');
   PASelectOptions3.unSelectedList = new list<String>();
   PASelectOptions3.unSelectedList.add('X');
   PASelectOptions3.unSelectedList.add('Y');
   PASelectOptions3.selectedList = new list<String>();
   PASelectOptions3.selectedList.add('A');
   PASelectOptions3.selectedList.add('Y');
   PASelectOptions3.selectedListFinal = new list<String>(); 
   PASelectOptions3.commandType = 'doSelect';
   PASelectOptions3.getListOptionsUnselected(); 
   PASelectOptions3.getListOptionsSelected();
   PASelectOptions3.commandAction();	 

   
   PASelectOptions PASelectOptions4 = new PASelectOptions();
   //PASelectOptions1.flag = false;
   PASelectOptions4.selectedOptions = new list<String>();
   PASelectOptions4.selectedOptions.add('A');
   PASelectOptions4.selectedOptions.add('B');
   PASelectOptions4.unSelectedOptions = new list<String>();
   PASelectOptions4.unSelectedOptions.add('A');
   PASelectOptions4.unSelectedOptions.add('B');
   PASelectOptions4.unSelectedList = new list<String>();
   PASelectOptions4.unSelectedList.add('X');
   PASelectOptions4.unSelectedList.add('Y');
   PASelectOptions4.selectedList = new list<String>();
   PASelectOptions4.selectedList.add('A');
   PASelectOptions4.selectedList.add('Y');
   PASelectOptions4.selectedListFinal = new list<String>();  
   PASelectOptions4.commandType = 'doUnselect';
   PASelectOptions3.getListOptionsUnselected(); 
   PASelectOptions3.getListOptionsSelected();
   PASelectOptions4.commandAction();

   
   PASelectOptions PASelectOptions5 = new PASelectOptions();
   //PASelectOptions1.flag = false;
   PASelectOptions5.selectedOptions = new list<String>();
   PASelectOptions5.selectedOptions.add('A');
   PASelectOptions5.selectedOptions.add('B');
   PASelectOptions5.unSelectedOptions = new list<String>();
   PASelectOptions5.unSelectedOptions.add('A');
   PASelectOptions5.unSelectedOptions.add('B');
   PASelectOptions5.unSelectedList = new list<String>();
   PASelectOptions5.unSelectedList.add('X');
   PASelectOptions5.unSelectedList.add('Y');
   PASelectOptions5.selectedList = new list<String>();
   PASelectOptions5.selectedList.add('A');
   PASelectOptions5.selectedList.add('Y');
   PASelectOptions5.selectedListFinal = new list<String>(); 
   PASelectOptions5.commandType = 'doSelect';
   PASelectOptions5.commandAction();	 
   PASelectOptions5.getListOptionsUnselected(); 
   PASelectOptions5.getListOptionsSelected();
   
   
   
  }
}