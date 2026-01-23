/*
 * Name      :   sentPricesToSAP
 * Description  :   This trigger insert the records into Outbound notifier object whenever a price is approved
 * Author      :   Infosys Limited <GT20150220>
 * Created Date :   20 Feb 2015
 *
 * Version   Modified Date     Modified By                Modification
 * 1.1     25-Jan-2018     Mansi Gupta          IS ID-00083874-Enabled prices flow for salesOrgCodes1(custom label)
 * ---------------------------------------------------------------------------------------------------- 
 *
*/

trigger sentPricesToSAP on ERP_Sales_Prices_SAP__c (after insert) {
     public static final Id Task_Pricing_Task_RTYPE = null;
     Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
List<Outbond_Notifier__c> outBondNotifierList = new List<Outbond_Notifier__c>();
//Set<String> salesOrgCodes1 = new Set<String>{'D600', 'D603', 'D618', 'D629', 'D63B', 'D642', 'D643', 'D64A', 'D655', 'D66D', 'D674', 'D680', 'D691', 'A603', 'A618', 'A629', 'A642', 'A64A', 'A674','A64B', 'A680'};
//1.1 <MG25012018>  IS ID-00083874-Enabled prices flow for salesOrgCodes1(Custom Label) - start
    Set<String> salesOrgCodes1 = new Set<String>();
    salesOrgCodes1.addall(Label.salesOrgCodes1.Split(','));
//1.1 <MG25012018> IS ID-00083874-Enabled prices flow for salesOrgCodes1 (Custom Label) - end
    Set<String> salesOrgCodes2 = new Set<String>{'G250','G240'};

    for(ERP_Sales_Prices_SAP__c price: trigger.new)
    {
        System.debug('Iterating prices:'+Price);
        if(price.Pricing_Condition_Code__c!='SPEC' && !price.isPriceHolder__c &&
        ((price.Sales_Price_Type__c =='Permanent')|| (price.Sales_Price_Type__c =='Project')) &&
        (!(price.Pricing_Condition_Code__c=='ZDI1' && salesOrgCodes1.contains(price.Sales_Org_Code__c))) &&
        (!(price.Key_Combination_Code__c=='A821' && salesOrgCodes2.contains(price.Sales_Org_Code__c) && Price.BU__c=='P&IP ECP AP')) &&
        (!(price.Pricing_Condition_Code__c=='XPROJ' && price.BU__c=='DPT NA')) &&
        (!(price.Pricing_Condition_Code__c=='XLIST' && price.BU__c=='CPM EMEA'))&& price.KC_SAP__c != null)
        {
            Outbond_Notifier__c msg = new Outbond_Notifier__c();
            msg.Object_Type__c = 'ERP_Sales_Prices_SAP__c';
            msg.Object_ID__c = price.id;
            msg.Mw_status__c = 'Initial';
            msg.SAP_Status__c  = 'Initial';
            msg.Sent_Timestamp__c = system.now();
            msg.Transaction_Type__c='Insert';
            outBondNotifierList.add(msg);
            System.debug('OUTBOUNDMSG PREPARED:');
        }
    }
    if(outBondNotifierList.size()>0)
    {
        try
        {
            insert outBondNotifierList;
        }
        catch(DMLException e)
        {
            for (ERP_Sales_Prices_SAP__c price : trigger.new) {
            price.addError('There was a problem updating the prices :'+e.getMessage());
            }
        }

    }

}