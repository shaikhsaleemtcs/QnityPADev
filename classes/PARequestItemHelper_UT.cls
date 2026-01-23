@isTest
public with sharing class PARequestItemHelper_UT{
    static testMethod void requestItemHelperTestMethod(){
    
        String selectedBU1='MCM AP Paste';
        String selectedBU2='CPM NA';
        
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c();
        ph1.PH_Code__c = 'F423';
        insert ph1;
        
        Product_Hierarchy__c ph2 = new Product_Hierarchy__c();
        ph2.PH_Code__c = 'A6';
        insert ph2;
        
        
        Product_Hierarchy__c ph3 = new Product_Hierarchy__c();
        ph3.PH_Code__c = 'F425131311C8';
        insert ph3;
        
        Product_Hierarchy__c ph4 = new Product_Hierarchy__c();
        ph4.PH_Code__c = 'F425131311C7';
        insert ph4;
        
        Orggroup__c og1 = new Orggroup__c();
        og1.business__c = 'MCM AP Paste';
        insert og1;
        
        Orggroup__c og2 = new Orggroup__c();
        og2.business__c = 'CPM NA';
        insert og2;
        
        Set<String> phCodes = new Set<String>();
        phCodes.add('F423');
        phCodes.add('F423DU');
        phCodes.add('F423TF');
        phCodes.add('F4222');
        
        Set<String> phCodes1 = new Set<String>();
        phCodes1.add('F425131311C8');
        phCodes1.add('F425131311C7');
        
      List<BU_PH__c> buPHData=new List<BU_PH__c>();
        
        
        BU_PH__c buph1 = new BU_PH__c();
        
        buph1.Business_Description__c = 'MCM';
        buph1.Default_UOM__c = 'KG';
        buph1.Default_Per__c = 10;
        buph1.Product_Hierarchy__c = ph1.id;
        
        buph1.OrgGroup__c = og1.id;
        insert buph1;    
        
        BU_PH__c buph2 = new BU_PH__c();
        buph2.Business_Description__c = 'CPM NA';
        buph2.Default_UOM__c = 'KG';
        buph2.Default_Per__c = 20;
        buph2.Product_Hierarchy__c = ph3.id;
        buph2.OrgGroup__c = og2.id;
        insert buph2;  
        
        buPHData.add(buph1);
        buPHData.add(buph2);  
        
        //insert buPHData;
        list<BU_PH__c> default_Per=new list<BU_PH__c>();
        //Integer size=buPHData.size();
       
        
        PARequestItemHelper rih1 = new PARequestItemHelper(selectedBU1);
        
        PARequestItemHelper rih2 = new PARequestItemHelper(selectedBU2); 
        //Set<String> phSubStr=new Set<String>(); 
        //list<BU_PH__c> default_UOM=new list<BU_PH__c>();
        //default_UOM.add(buph);
        List<BU_PH__c> allPHList = new List<BU_PH__c>();
        allPHList = rih2.query(phCodes1);
       
       
       // default_UOM=rih.query(phCodes);
       rih2.getDefaultUOM(allPHList);
     // rih.getDefaultUOM(buPHData);            
        //list<BU_PH__c> allPHList1=new list<BU_PH__c>();
        //allPHList1=rih.query(phCodes);
        
        rih2.getDefaultPer(allPHList );
        //  rih.getDefaultPer(buPHData);
        //rih.getDefaultUOM(BUPHList);
        //rih.getDefaultPer(BUPHList);
    }
}