/*
 * Name      :   PAPHSelection_UT
 * Description  :   This is the test class for PAPHSelection
 * Author      :   Infosys Limited
 * Created Date :   20-03-2013
 *
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class PAPHSelection_UT
{
    static testMethod void PAPHSelectionTestMethod()
    {
        PAPHSelection paph= new PAPHSelection();
        List<Product_Hierarchy__c> PHList = new List<Product_Hierarchy__c>();
        Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
        PH1.PH_Code__c = 'A6';
        PH1.PH_Level__c = 1;
        PHList.add(PH1);
        Product_Hierarchy__c PH2 = new Product_Hierarchy__c();
        PH2.PH_Code__c = 'A6S1';
        PH2.PH_Level__c = 2;
        PHList.add(PH2);
        
        Product_Hierarchy__c PH3 = new Product_Hierarchy__c();
        PH3.PH_Code__c = 'A6S4';
        PH3.PH_Level__c = 2;
        PHList.add(PH3);
        Product_Hierarchy__c PH4 = new Product_Hierarchy__c();
        PH4.PH_Code__c = 'A6S112';
        PH4.PH_Level__c = 3;
        PHList.add(PH4);
        
        Product_Hierarchy__c PH5 = new Product_Hierarchy__c();
        PH5.PH_Code__c = 'B6';
        PH5.PH_Level__c = 1;
        PHList.add(PH5);
        insert PHList;

        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'Surfaces';
        insert orgGrp;

        paph.selectedBUFromPage = orgGrp.Id;
        List<BU_PH__c> buphList = new List<BU_PH__c>();
        BU_PH__c buph1 = new BU_PH__c();
        buph1.Product_Hierarchy__c = PHList[0].Id;
        buph1.OrgGroup__c = orgGrp.Id;
        buph1.Business_Description__c = 'Test1';
        buphList.add(buph1);
        BU_PH__c buph2 = new BU_PH__c();
        buph2.Product_Hierarchy__c = PHList[1].Id;
        buph2.OrgGroup__c = orgGrp.Id;
        //buph2.Business_Description__c = 'Test2';
        buphList.add(buph2);
        BU_PH__c buph3 = new BU_PH__c();
        buph3.Product_Hierarchy__c = PHList[2].Id;
        buph3.OrgGroup__c = orgGrp.Id;
        buph3.Business_Description__c = 'Test3';
        buphList.add(buph3);
        BU_PH__c buph4 = new BU_PH__c();
        buph4.Product_Hierarchy__c = PHList[3].Id;
        buph4.OrgGroup__c = orgGrp.Id;
        //buph4.Business_Description__c = 'Test4';
        buphList.add(buph4);
        BU_PH__c buph5 = new BU_PH__c();
        buph5.Product_Hierarchy__c = PHList[4].Id;
        buph5.OrgGroup__c = orgGrp.Id;
        buph5.Business_Description__c = 'Test5';
        buphList.add(buph5);
        insert buphList;
        
        paph.displayPopUpWindow();
        paph.KCFromPage = 'PH1/PH2/PH3';
        paph.displayPopUpWindow();
        //paph.
        paph.desiredAction = 'populatePH';
        paph.action();
        paph.desiredAction = 'FetchPH';
        paph.action();
        paph.desiredAction = 'selectAll';
        paph.selectAllFlag = true;
        PAPHSelection.phWrapper p=new PAPHSelection.phWrapper();
        p.isSelected=true;

        paph.action();
        paph.desiredAction = 'selectAll';
        paph.selectAllFlag = false;
        paph.action();

        paph.returnData();
        paph.closeWindow();

        //paph.selectedPH1 = 'A6';
        paph.desiredAction='ChoosePH';
        paph.dosearch();
        
        
        paph.desiredAction='fetchPHChoose';
        paph.dosearch();
        //paph.selectedPH1 = 'A6';
        paph.desiredAction = 'populatePH';
        paph.action();
        paph.desiredAction = 'FetchPH';
        paph.action();
        paph.desiredAction = 'selectAll';
        paph.selectAllFlag = true;
        paph.action();
        
        paph.desiredAction='fetchPHChoose';
        paph.dosearch();
        //paph.selectedPH1 = 'A6';
        paph.desiredAction = 'populatePH';
        paph.action();
        //paph.selectedPH2 = 'A6S1';
        paph.desiredAction = 'populatePH';
        paph.action();
        paph.desiredAction = 'FetchPH';
        paph.action();
        
        String str = paph.populateTempPH();
        
        //15/7/14
        paph.desiredAction='SearchPH';
        paph.action();
        
        //PAPHSelection.phWrapper p1 =new PAPHSelection.phWrapper();
        //p1.isSelected =true;
        
        //paph.phSearchResult.add(p1);
        paph.desiredAction='SaveAndContinue';
        boolean flag=true;
        
        paph.dosearch();
        paph.desiredAction='SearchPH';
        paph.PHCodeInput='D6';
        paph.PHDescInput='TY';
        paph.PHLevelInput.add('2');      
        paph.action();
        
        paph.desiredAction='SearchPH';
        paph.action();
        
        paph.desiredAction='SaveAndClose';
        paph.dosearch();
        //PAPHSelection.phWrapper p =new PAPHSelection.phWrapper();
        //p.isSelected =true;
        //paph.desiredAction='SaveAndContinue';
        //PAPHSelection  s=new PAPHSelection ();
        
        //paph.dosearch();
        //paph.saveandContinue();
        
        //paph.searchPHMethod();
       
        paph.desiredAction=buph1.id;
        paph.singleSelectMethod();
       // paph.phSObjectType='test';
        PAHelpLinks__c paCustSetting = new PAHelpLinks__c();
        paCustSetting.name='testing';
        paCustSetting.Help_Link__c ='https://www.google.com';
        insert paCustSetting;
        paph.helpLink();
        
        String a;
        String b;
        String c;
        a=PAPHSelection.phSObjectType;
        b=PAPHSelection.phFieldsList;
        c=paph.phWhereClause;
        

    }
}