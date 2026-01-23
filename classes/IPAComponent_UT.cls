@isTest
public class IPAComponent_UT
{
   public static testMethod void ipaComponent_UT()
   {
	 IPAComponent ipa = new PASoldToSelection();
	 ipa.displayPopUpWindow();
	 ipa.dosearch();
	 ipa.returnData();
	 ipa.closeWindow();
   }

}