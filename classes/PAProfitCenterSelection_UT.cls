@isTest
public class PAProfitCenterSelection_UT{
    
    static testMethod void PAProfitCenterSelectionTestMethod()
    {

        
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c ='Surfaces';
        orgGrp.Owning_Business__c='BUILDING INOVATIONS';
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.Business__c ='Surface';
        orgGrp1.Owning_Business__c='BUILDING INOVATIONS';
        insert orgGrp1;
        Profit_Center__c p1=new  Profit_Center__c();
        p1.ERP_Profit_Center_4__c='BUILDING INOVATIONS';
        p1.ERP_Profit_Center_4_Code__c='c4';
        p1.ERP_Profit_Center_5__c='f';
        p1.ERP_Profit_Center_5_Code__c='c5';
        p1.ERP_Profit_Center_6__c='f';
        p1.ERP_Profit_Center_6_Code__c='c6';
        p1.ERP_Profit_Center_7__c='f';
        p1.ERP_Profit_Center_7_Code__c='c7';
        p1.ERP_Profit_Center_8__c='f';
        p1.ERP_Profit_Center_8_Code__c='c8';
        p1.ERP_Profit_Center_9__c='f';
        p1.ERP_Profit_Center_9_Code__c='c9';
        
        insert p1;
        Profit_Center__c p2=new  Profit_Center__c();
        p2.ERP_Profit_Center_4__c='BUILDING INOVATIONS';
        p2.ERP_Profit_Center_4_Code__c='c4';
        p2.ERP_Profit_Center_5__c='';
        p2.ERP_Profit_Center_5_Code__c='';
        p2.ERP_Profit_Center_6__c='f';
        p2.ERP_Profit_Center_6_Code__c='c6';
        p2.ERP_Profit_Center_7__c='f';
        p2.ERP_Profit_Center_7_Code__c='c7';
        p2.ERP_Profit_Center_8__c='f';
        p2.ERP_Profit_Center_8_Code__c='c8';
        p2.ERP_Profit_Center_9__c='f';
        p2.ERP_Profit_Center_9_Code__c='c9';        
        insert p2;
        Profit_Center__c p3=new  Profit_Center__c();
        p3.ERP_Profit_Center_4__c='BUILDING INOVATIONS';
        p3.ERP_Profit_Center_4_Code__c='c4';
        p3.ERP_Profit_Center_5__c='';
        p3.ERP_Profit_Center_5_Code__c='';
        p3.ERP_Profit_Center_6__c='f';
        p3.ERP_Profit_Center_6_Code__c='c6';
        p3.ERP_Profit_Center_7__c='f';
        p3.ERP_Profit_Center_7_Code__c='c7';
        p3.ERP_Profit_Center_8__c='f';
        p3.ERP_Profit_Center_8_Code__c='c8';
        p3.ERP_Profit_Center_9__c='f';
        p3.ERP_Profit_Center_9_Code__c='c9';        
        insert p3;
        
        PAProfitCenterSelection  profitCenterSelection =new PAProfitCenterSelection ();
        profitCenterSelection.selectedBUFromPage=orgGrp.id;  
        profitCenterSelection.desiredAction='populateFRB';
        profitCenterSelection.action();
        profitCenterSelection.displayPopUpWindow();
        profitCenterSelection.selectedFRB4='C4';
        profitCenterSelection.selectedFRB5='C5';
        profitCenterSelection.selectedFRB6='C6';
        profitCenterSelection.selectedFRB7='C7';
        profitCenterSelection.selectedFRB8='C8';
        profitCenterSelection.selectedFRB9='C9';
        profitCenterSelection.dosearch();
        profitCenterSelection.returnData();
        profitCenterSelection.closeWindow();
        
        //level 1
        PAProfitCenterSelection  profitCenterSelection1 =new PAProfitCenterSelection ();
        profitCenterSelection1.selectedBUFromPage=orgGrp1.id;      
        profitCenterSelection1.desiredAction='populateFRB';
        profitCenterSelection.selectedFRB4='C4';
        profitCenterSelection.selectedFRB5=null;
        profitCenterSelection.selectedFRB6=null;
        profitCenterSelection.selectedFRB7=null;
        profitCenterSelection.selectedFRB8=null;
        profitCenterSelection.selectedFRB9=null;
        profitCenterSelection1.action();
        
        //Level 2
        profitCenterSelection.selectedFRB4='C4';
        profitCenterSelection.selectedFRB4='C5';
        profitCenterSelection1.action();
        
        //Level 3
        profitCenterSelection.selectedFRB4='C4';
        profitCenterSelection.selectedFRB4='C5';
         profitCenterSelection.selectedFRB4='C6';
        profitCenterSelection1.action();
        
        //Level < previousLevel
        profitCenterSelection.selectedFRB4='C4';
        profitCenterSelection.selectedFRB4='C5';
        profitCenterSelection.selectedFRB4=null;
        profitCenterSelection1.action();
        
        profitCenterSelection1.displayPopUpWindow();
        profitCenterSelection1.dosearch();
        profitCenterSelection1.returnData();
        profitCenterSelection1.closeWindow();
    
    }



    
    
    
}