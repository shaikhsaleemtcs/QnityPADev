/*
 * Name      :   CtrlSFDCSAPPriceSync
 * Description  :   This class will perform the mass update
 * Author      :   Infosys Limited <GT20150420>
 * Created Date :   20 April 2015
 *
 * Version   Modified Date     Modified By                Modification
 *
 * ---------------------------------------------------------------------------------------------------- 
 *
 */

public with sharing class CtrlSFDCSAPPriceSync {
        public ApexPages.StandardSetController standardController;

    public CtrlSFDCSAPPriceSync(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }
}