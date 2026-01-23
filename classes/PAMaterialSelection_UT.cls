@isTest
private class PAMaterialSelection_UT {
    static testMethod void paPAMaterialSelectionSAPClusterTestMethod() {
        //PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
        //Recordtype recType = [select id,name from Recordtype where name = 'ERP Material - Extended Data'];        
        
        Id recType = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
        
        OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces');
        OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
        Insert orgGroup1;
        Insert orgGroup2;
        
        
        ERP_Pricing_Procedure__c priProcedure = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DA640',Pricing_Procedure_Description__c='BI EMEA Surfaces',SAP_Cluster__c='Q80');
        Insert priProcedure;
        
        Organizational_Group_Item__c orgGroupItem = new Organizational_Group_Item__c(Business__c=orgGroup1.id,OrgGroup__c=orgGroup2.id,ERP_Pricing_Procedure__c=priProcedure.id,Enable_Variable_Config_Materials__c=false);
        Insert orgGroupItem;
        Product_Hierarchy__c ph = new Product_Hierarchy__c(PH_Code__c='A123',PH_Level__c=2);
        insert ph;
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c(PH_Code__c='A6',PH_Level__c=1);
        insert ph1;
        BU_PH__c buph = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph.id);
        Insert buph;
        BU_PH__c buph1 = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph1.id);
        Insert buph1;
        ERP_Customer_Material_Key__c cmKey1 = new ERP_Customer_Material_Key__c(Code__c='M3',Type__c='Material Group 3');
        insert cmKey1;
        ERP_Customer_Material_Key__c cmKey2 = new ERP_Customer_Material_Key__c(Code__c='M4',Type__c='Material Group 4');
        insert cmKey2;
        ERP_Customer_Material_Key__c cmKey3 = new ERP_Customer_Material_Key__c(Code__c='M5',Type__c='Material Group 5');
        insert cmKey3;
        Org_Group_ERP_Key__c ogKey1 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey1.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey1;
        Org_Group_ERP_Key__c ogKey2 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey2.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey2;
        Org_Group_ERP_Key__c ogKey3 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey3.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey3;
        PAMaterialSelection matSelObj = new PAMaterialSelection();
        matselobj.PHClause='';
        matselobj.q='';
        matselobj.totalRecords=10;
        matselobj.label=''; 
        matSelObj.materialCodeFromPage = 'D123';
        
        
    /*  List<Organizational_Group_Item__c>  buOrgGroup = [SELECT ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,
                                                          Display_Standardized_Rate__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                                          Retroactive_Limit__c,Enable_Variable_Config_Materials__c,Business__r.Business__c FROM
                                                          Organizational_Group_Item__c WHERE OrgGroup__r.Business__c =:'BI EMEA Surfaces'AND
                                                          OrgGroup__r.ERP_Sales_Org_Code__c =:'A640' AND
                                                          OrgGroup__r.ERP_Distribution_Channel_Code__c =:'10' AND
                                                          OrgGroup__r.ERP_Division_Code__c =:'02']; 
                                                          
               System.debug('buOrgGroup'+buOrgGroup);
               
           Insert buOrgGroup; */
           
        
         // matSelObj.enableVarConfigMaterial=true;
           
        //matSelObj.selectedBUFromPage='BI EMEA Surfaces';  
        
        Material__c matObj2 = new Material__c(Name='Corian Sheet',ERP_Material_Code__c='D12345678',ERP_Source_Cluster__c='Q80',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='A6',RecordTypeId=recType);
        insert matObj2;
        
        Material__c matObj1 = new Material__c(Name='Corian Sheet',ERP_Product_Hierarchy_Code__c='A6');
        insert matObj1;
        
        
        matSelObj.salesOrgCode = 'A641';
        matSelObj.distiCode = '10';
        matSelObj.divCode = '02';
        matSelObj.sourceCluster = 'CB1';
        matSelObj.selectedBUFromPage = orgGroup1.id;
        matSelObj = new PAMaterialSelection();
        matselobj.PHClause='';
        matselobj.q='';
        matselobj.totalRecords=10;
        matselobj.label=''; 
        matSelObj.materialCodeFromPage = 'D123';        
        
        matSelObj.salesOrgCode = 'A641';
        matSelObj.distiCode = '10';
        matSelObj.divCode = '02';
        matSelObj.sourceCluster = 'CB1';
        matSelObj.selectedBUFromPage = orgGroup1.id;
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = null;
        matSelObj.displayPopUpWindow();
        
        matSelObj.desiredAction = 'selectAll';
        matSelObj.dosearch();
        matSelObj.filter_materialCode = 'D1';
        matSelObj.dosearch();
        matSelObj.filter_material = 'D';
        matSelObj.from_filter_PH = 'A6################';
        matSelObj.from_filter_FRB = 'A612';
        matSelObj.heighestFRBLevel = 4;
        
        matSelObj.dosearch();
        matSelObj.offsetfromPage= 300;
        matSelObj.dosearchwithOffsetBack();
        matSelObj.dosearchwithOffset();
        PAMaterialSelection.materialWrapper matWrap = new PAMaterialSelection.materialWrapper();
        matWrap.isSelected = true;
        matWrap.materialObj = matObj2;
        matSelObj.materialWrapperList.add(matWrap);
        matSelObj.returnMaterials();
        
        matSelObj.listOfMaterials = new List<Material__c>();
        matSelObj.listOfMaterials.add(matObj1);
        matSelObj.listOfMaterials.add(matObj2);
        matSelObj.noOfRecordsAPage = 1;
    
        matSelObj.closeMaterialPopUpWindow();      
        matSelObj.firstPage();
        matSelObj.nextPage();
        matSelObj.lastPage();
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.incrementer = 4;
        matSelObj.previousPage();
        matSelObj.selectAllFlag =true;
        matSelObj.action();
        matSelObj.selectAllFlag =false;
        matSelObj.action();
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = 'D123';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.saveandClose();
        matSelObj.saveandContinue();
        
        
        List<Material__c> matList = new List<Material__c>();
        for(Integer i=0;i<205;i++) {
            Material__c matObj = new Material__c(Name='Corian Sheet'+i,ERP_Material_Code__c='D123456'+i,ERP_Source_Cluster__c='Q80',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='A6',RecordTypeId=recType);
            matList.add(matObj);
        }
        insert matList;
        matSelObj.materialCodeFromPage = 'D';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.filter_materialCode =null;
        matSelObj.dosearch();
        matSelObj.returnData();
        matSelObj.closeWindow();
        matSelObj.incrementer = 50;
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.nextPage();
        List<SelectOption> a1 = matSelObj.MaterialGroup4;
        a1 = matSelObj.MaterialGroup3;
        /*List<SelectOption> a2 = matSelObj.MaterialGroup5;
        a2 = matSelObj.MaterialGroup5;*/
    }
    
    static testMethod void paPAMaterialSelectionTestMethod() {
        //PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
        //Recordtype recType = [select id,name from Recordtype where name = 'ERP Material - Extended Data'];        
        
        Id recType = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
        
        OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces');
        OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
        Insert orgGroup1;
        Insert orgGroup2;
        
        
        ERP_Pricing_Procedure__c priProcedure = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DA640',Pricing_Procedure_Description__c='BI EMEA Surfaces',SAP_Cluster__c='CB1');
        Insert priProcedure;
        
        Organizational_Group_Item__c orgGroupItem = new Organizational_Group_Item__c(Business__c=orgGroup1.id,OrgGroup__c=orgGroup2.id,ERP_Pricing_Procedure__c=priProcedure.id,Enable_Variable_Config_Materials__c=true);
        Insert orgGroupItem;
        Product_Hierarchy__c ph = new Product_Hierarchy__c(PH_Code__c='A123',PH_Level__c=2);
        insert ph;
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c(PH_Code__c='A6',PH_Level__c=1);
        insert ph1;
        BU_PH__c buph = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph.id);
        Insert buph;
        BU_PH__c buph1 = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph1.id);
        Insert buph1;
        ERP_Customer_Material_Key__c cmKey1 = new ERP_Customer_Material_Key__c(Code__c='M3',Type__c='Material Group 3');
        insert cmKey1;
        ERP_Customer_Material_Key__c cmKey2 = new ERP_Customer_Material_Key__c(Code__c='M4',Type__c='Material Group 4');
        insert cmKey2;
        ERP_Customer_Material_Key__c cmKey3 = new ERP_Customer_Material_Key__c(Code__c='M5',Type__c='Material Group 5');
        insert cmKey3;
        Org_Group_ERP_Key__c ogKey1 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey1.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey1;
        Org_Group_ERP_Key__c ogKey2 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey2.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey2;
        Org_Group_ERP_Key__c ogKey3 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey3.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey3;
        PAMaterialSelection matSelObj = new PAMaterialSelection();
        matselobj.PHClause='';
        matselobj.q='';
        matselobj.totalRecords=10;
        matselobj.label=''; 
        matSelObj.materialCodeFromPage = 'D123';
        
        
    /*  List<Organizational_Group_Item__c>  buOrgGroup = [SELECT ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,
                                                          Display_Standardized_Rate__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                                          Retroactive_Limit__c,Enable_Variable_Config_Materials__c,Business__r.Business__c FROM
                                                          Organizational_Group_Item__c WHERE OrgGroup__r.Business__c =:'BI EMEA Surfaces'AND
                                                          OrgGroup__r.ERP_Sales_Org_Code__c =:'A640' AND
                                                          OrgGroup__r.ERP_Distribution_Channel_Code__c =:'10' AND
                                                          OrgGroup__r.ERP_Division_Code__c =:'02']; 
                                                          
               System.debug('buOrgGroup'+buOrgGroup);
               
           Insert buOrgGroup; */
           
        
         // matSelObj.enableVarConfigMaterial=true;
           
        //matSelObj.selectedBUFromPage='BI EMEA Surfaces';  
        
        Material__c matObj2 = new Material__c(Name='Corian Sheet',ERP_Material_Code__c='D12345678',ERP_Source_Cluster__c='CB1',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='A6',RecordTypeId=recType);
        insert matObj2;
        
        Material__c matObj1 = new Material__c(Name='Corian Sheet',ERP_Product_Hierarchy_Code__c='A6');
        insert matObj1;
        
        
        matSelObj.salesOrgCode = 'A641';
        matSelObj.distiCode = '10';
        matSelObj.divCode = '02';
        matSelObj.sourceCluster = 'CB1';
        matSelObj.selectedBUFromPage = orgGroup1.id;
        matSelObj = new PAMaterialSelection();
        matselobj.PHClause='';
        matselobj.q='';
        matselobj.totalRecords=10;
        matselobj.label=''; 
        matSelObj.materialCodeFromPage = 'D123';        
        
        matSelObj.salesOrgCode = 'A641';
        matSelObj.distiCode = '10';
        matSelObj.divCode = '02';
        matSelObj.sourceCluster = 'CB1';
        matSelObj.selectedBUFromPage = orgGroup1.id;
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = null;
        matSelObj.displayPopUpWindow();
        
        matSelObj.desiredAction = 'selectAll';
        matSelObj.dosearch();
        matSelObj.filter_materialCode = 'D1';
        matSelObj.dosearch();
        matSelObj.filter_material = 'D';
        matSelObj.from_filter_PH = 'A6################';
        matSelObj.from_filter_FRB = 'A612';
        matSelObj.heighestFRBLevel = 4;
        
        matSelObj.dosearch();
        matSelObj.offsetfromPage= 300;
        matSelObj.dosearchwithOffsetBack();
        matSelObj.dosearchwithOffset();
        PAMaterialSelection.materialWrapper matWrap = new PAMaterialSelection.materialWrapper();
        matWrap.isSelected = true;
        matWrap.materialObj = matObj2;
        matSelObj.materialWrapperList.add(matWrap);
        matSelObj.returnMaterials();
        
        matSelObj.listOfMaterials = new List<Material__c>();
        matSelObj.listOfMaterials.add(matObj1);
        matSelObj.listOfMaterials.add(matObj2);
        matSelObj.noOfRecordsAPage = 1;
    
        matSelObj.closeMaterialPopUpWindow();      
        matSelObj.firstPage();
        matSelObj.nextPage();
        matSelObj.lastPage();
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.incrementer = 4;
        matSelObj.previousPage();
        matSelObj.selectAllFlag =true;
        matSelObj.action();
        matSelObj.selectAllFlag =false;
        matSelObj.action();
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = 'D123';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.saveandClose();
        matSelObj.saveandContinue();
        
        
        List<Material__c> matList = new List<Material__c>();
        for(Integer i=0;i<205;i++) {
            Material__c matObj = new Material__c(Name='Corian Sheet'+i,ERP_Material_Code__c='D123456'+i,ERP_Source_Cluster__c='CB1',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='A6',RecordTypeId=recType);
            matList.add(matObj);
        }
        insert matList;
        matSelObj.materialCodeFromPage = 'D';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.filter_materialCode =null;
        matSelObj.dosearch();
        matSelObj.returnData();
        matSelObj.closeWindow();
        matSelObj.incrementer = 50;
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.nextPage();
        List<SelectOption> a1 = matSelObj.MaterialGroup4;
        a1 = matSelObj.MaterialGroup3;
        List<SelectOption> a2 = matSelObj.MaterialGroup5;
        a2 = matSelObj.MaterialGroup5;
    }
    static testMethod void paPAMaterialSelectionTestMethod2() {
        //PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
        //Recordtype recType = [select id,name from Recordtype where name = 'ERP Material - Extended Data'];        
        
        Id recType = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
        PAHelpLinks__c link=new PAHelpLinks__c(name='Test',help_link__c='test.com');
        insert link;
        OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='MCM AP Green Tape');
        OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
        Insert orgGroup1;
        Insert orgGroup2;
        
        
        ERP_Pricing_Procedure__c priProcedure = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DA640',Pricing_Procedure_Description__c='MCM AP Green Tape',SAP_Cluster__c='CB1');
        Insert priProcedure;
        
        Organizational_Group_Item__c orgGroupItem = new Organizational_Group_Item__c(Business__c=orgGroup1.id,OrgGroup__c=orgGroup2.id,ERP_Pricing_Procedure__c=priProcedure.id,Enable_Variable_Config_Materials__c=false);
        Insert orgGroupItem;
        Product_Hierarchy__c ph = new Product_Hierarchy__c(PH_Code__c='A123',PH_Level__c=2);
        insert ph;
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c(PH_Code__c='A6',PH_Level__c=1);
        insert ph1;
        BU_PH__c buph = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph.id);
        Insert buph;
        BU_PH__c buph1 = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph1.id);
        Insert buph1;
        ERP_Customer_Material_Key__c cmKey1 = new ERP_Customer_Material_Key__c(Code__c='M3',Type__c='Material Group 3');
        insert cmKey1;
        ERP_Customer_Material_Key__c cmKey2 = new ERP_Customer_Material_Key__c(Code__c='M4',Type__c='Material Group 4');
        insert cmKey2;
        ERP_Customer_Material_Key__c cmKey3 = new ERP_Customer_Material_Key__c(Code__c='M5',Type__c='Material Group 5');
        insert cmKey3;
        Org_Group_ERP_Key__c ogKey1 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey1.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey1;
        Org_Group_ERP_Key__c ogKey2 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey2.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey2;
        Org_Group_ERP_Key__c ogKey3 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey3.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey3;
        PAMaterialSelection matSelObj = new PAMaterialSelection();
        matselobj.PHClause='';
        matselobj.q='';
        matselobj.totalRecords=10;
        matselobj.label='Test'; 
        matSelObj.materialCodeFromPage = 'D123';
        
        
    /*  List<Organizational_Group_Item__c>  buOrgGroup = [SELECT ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,
                                                          Display_Standardized_Rate__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                                          Retroactive_Limit__c,Enable_Variable_Config_Materials__c,Business__r.Business__c FROM
                                                          Organizational_Group_Item__c WHERE OrgGroup__r.Business__c =:'BI EMEA Surfaces'AND
                                                          OrgGroup__r.ERP_Sales_Org_Code__c =:'A640' AND
                                                          OrgGroup__r.ERP_Distribution_Channel_Code__c =:'10' AND
                                                          OrgGroup__r.ERP_Division_Code__c =:'02']; 
                                                          
               System.debug('buOrgGroup'+buOrgGroup);
               
           Insert buOrgGroup; */
           
        
         // matSelObj.enableVarConfigMaterial=true;
           
        //matSelObj.selectedBUFromPage='BI EMEA Surfaces';  
        
        Material__c matObj2 = new Material__c(Name='Corian Sheet',ERP_Material_Code__c='D12345678',ERP_Source_Cluster__c='CB1',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='F423GT',ERP_Product_Hierarchy_Code__c='A6',RecordTypeId=recType);
        insert matObj2;
        
        Material__c matObj1 = new Material__c(Name='Corian Sheet');
        insert matObj1;
        
        
        matSelObj.salesOrgCode = 'A641';
        matSelObj.distiCode = '10';
        matSelObj.divCode = '02';
        matSelObj.sourceCluster = 'CB1';
        matSelObj.selectedBUFromPage = orgGroup1.id;
        
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = null;
        matSelObj.displayPopUpWindow();
        
        matSelObj.desiredAction = 'SaveAndClose';
        matSelObj.dosearch();
        matSelObj.filter_materialCode = 'D1';
        matSelObj.dosearch();
        matSelObj.filter_material = 'D';
        matSelObj.from_filter_PH = 'A6################';
        matSelObj.from_filter_FRB = 'A612';
        matSelObj.heighestFRBLevel = 4;
        
        matSelObj.dosearch();
        matSelObj.offsetfromPage= 300;
        matSelObj.dosearchwithOffsetBack();
        matSelObj.dosearchwithOffset();
        PAMaterialSelection.materialWrapper matWrap = new PAMaterialSelection.materialWrapper();
        matWrap.isSelected = true;
        matWrap.materialObj = matObj2;
        matSelObj.materialWrapperList.add(matWrap);
        matSelObj.returnMaterials();
        
        matSelObj.listOfMaterials = new List<Material__c>();
        matSelObj.listOfMaterials.add(matObj1);
        matSelObj.listOfMaterials.add(matObj2);
        matSelObj.noOfRecordsAPage = 1;
    
        matSelObj.closeMaterialPopUpWindow();      
        matSelObj.firstPage();
        matSelObj.nextPage();
        matSelObj.lastPage();
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.incrementer = 4;
        matSelObj.previousPage();
        matSelObj.selectAllFlag =true;
        matSelObj.action();
        matSelObj.selectAllFlag =false;
        matSelObj.action();
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = 'D123';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.saveandClose();
        matSelObj.saveandContinue();
        
        
        List<Material__c> matList = new List<Material__c>();
        for(Integer i=0;i<205;i++) {
            Material__c matObj = new Material__c(Name='Corian Sheet'+i,ERP_Material_Code__c='D123456'+i,ERP_Source_Cluster__c='CB1',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='F423GT',RecordTypeId=recType);
            matList.add(matObj);
        }
        insert matList;
        matSelObj.materialCodeFromPage = 'D12';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.filter_materialCode =null;
        matSelObj.dosearch();
        matSelObj.returnData();
        matSelObj.closeWindow();
        matSelObj.incrementer = 50;
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.nextPage();
        List<SelectOption> a1,a2 = matSelObj.MaterialGroup4;
        a1 = matSelObj.MaterialGroup3;
        a2 = a1;
        PageReference pr = new PageReference('');
        pr=matSelObj.helpLink();
    }
    static testMethod void paPAMaterialSelectionTestMethod3() {
        //PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
        //Recordtype recType = [select id,name from Recordtype where name = 'ERP Material - Extended Data'];        
        
        Id recType = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
        
        OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='MCM AP Paste');
        OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
        Insert orgGroup1;
        Insert orgGroup2;
        
        
        ERP_Pricing_Procedure__c priProcedure = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DA640',Pricing_Procedure_Description__c='MCM AP Paste',SAP_Cluster__c='CB1');
        Insert priProcedure;
        
        Organizational_Group_Item__c orgGroupItem = new Organizational_Group_Item__c(Business__c=orgGroup1.id,OrgGroup__c=orgGroup2.id,ERP_Pricing_Procedure__c=priProcedure.id,Enable_Variable_Config_Materials__c=false);
        Insert orgGroupItem;
        Product_Hierarchy__c ph = new Product_Hierarchy__c(PH_Code__c='A123',PH_Level__c=2);
        insert ph;
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c(PH_Code__c='A6',PH_Level__c=1);
        insert ph1;
        BU_PH__c buph = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph.id);
        Insert buph;
        BU_PH__c buph1 = new BU_PH__c(OrgGroup__c=orgGroup1.id,Product_Hierarchy__c=ph1.id);
        Insert buph1;
        ERP_Customer_Material_Key__c cmKey1 = new ERP_Customer_Material_Key__c(Code__c='M3',Type__c='Material Group 3');
        insert cmKey1;
        ERP_Customer_Material_Key__c cmKey2 = new ERP_Customer_Material_Key__c(Code__c='M4',Type__c='Material Group 4');
        insert cmKey2;
        ERP_Customer_Material_Key__c cmKey3 = new ERP_Customer_Material_Key__c(Code__c='M5',Type__c='Material Group 5');
        insert cmKey3;
        Org_Group_ERP_Key__c ogKey1 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey1.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey1;
        Org_Group_ERP_Key__c ogKey2 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey2.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey2;
        Org_Group_ERP_Key__c ogKey3 = new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=cmkey3.Id,Organizational_Group_Item__c=orgGroupItem.Id);
        insert ogKey3;
        PAMaterialSelection matSelObj = new PAMaterialSelection();
        matselobj.PHClause='';
        matselobj.q='';
        matselobj.totalRecords=10;
        matselobj.label=''; 
        matSelObj.materialCodeFromPage = 'D123';
        
        
    /*  List<Organizational_Group_Item__c>  buOrgGroup = [SELECT ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,
                                                          Display_Standardized_Rate__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                                          Retroactive_Limit__c,Enable_Variable_Config_Materials__c,Business__r.Business__c FROM
                                                          Organizational_Group_Item__c WHERE OrgGroup__r.Business__c =:'BI EMEA Surfaces'AND
                                                          OrgGroup__r.ERP_Sales_Org_Code__c =:'A640' AND
                                                          OrgGroup__r.ERP_Distribution_Channel_Code__c =:'10' AND
                                                          OrgGroup__r.ERP_Division_Code__c =:'02']; 
                                                          
               System.debug('buOrgGroup'+buOrgGroup);
               
           Insert buOrgGroup; */
           
        
         // matSelObj.enableVarConfigMaterial=true;
           
        //matSelObj.selectedBUFromPage='BI EMEA Surfaces';  
        
        Material__c matObj2 = new Material__c(Name='Corian Sheet',ERP_Material_Code__c='D12345678',ERP_Source_Cluster__c='CB1',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='F423TF',RecordTypeId=recType);
        insert matObj2;
        
        Material__c matObj1 = new Material__c(Name='Corian Sheet');
        insert matObj1;
        
        
        matSelObj.salesOrgCode = 'A641';
        matSelObj.distiCode = '10';
        matSelObj.divCode = '02';
        matSelObj.sourceCluster = 'CB1';
        matSelObj.selectedBUFromPage = orgGroup1.id;
        
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = null;
        matSelObj.displayPopUpWindow();
        
        matSelObj.desiredAction = 'SaveAndContinue';
        matSelObj.dosearch();
        matSelObj.filter_materialCode = 'D1';
        matSelObj.dosearch();
        matSelObj.filter_material = 'D';
        matSelObj.from_filter_PH = 'A6################';
        matSelObj.from_filter_FRB = 'A612';
        matSelObj.heighestFRBLevel = 4;
        
        matSelObj.dosearch();
        matSelObj.offsetfromPage= 300;
        matSelObj.dosearchwithOffsetBack();
        matSelObj.dosearchwithOffset();
        PAMaterialSelection.materialWrapper matWrap = new PAMaterialSelection.materialWrapper();
        matWrap.isSelected = true;
        matWrap.materialObj = matObj2;
        matSelObj.materialWrapperList.add(matWrap);
        matSelObj.returnMaterials();
        
        matSelObj.listOfMaterials = new List<Material__c>();
        matSelObj.listOfMaterials.add(matObj1);
        matSelObj.listOfMaterials.add(matObj2);
        matSelObj.noOfRecordsAPage = 1;
    
        matSelObj.closeMaterialPopUpWindow();      
        matSelObj.firstPage();
        matSelObj.nextPage();
        matSelObj.lastPage();
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.incrementer = 4;
        matSelObj.previousPage();
        matSelObj.selectAllFlag =true;
        matSelObj.action();
        matSelObj.selectAllFlag =false;
        matSelObj.action();
        matSelObj.displayPopUpWindow();
        matSelObj.materialCodeFromPage = 'D123';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.saveandClose();
        matSelObj.saveandContinue();
        
        
        List<Material__c> matList = new List<Material__c>();
        for(Integer i=0;i<205;i++) {
            Material__c matObj = new Material__c(Name='Corian Sheet'+i,ERP_Material_Code__c='D123456'+i,ERP_Source_Cluster__c='CB1',ERP_Deletion_Flag__c=false,ERP_Sales_Org_Code__c='A641',ERP_Distribution_Channel_Code__c='10',ERP_Profit_Center_4_Code__c='A612',ERP_Product_Hierarchy_Code__c='F423TF',RecordTypeId=recType);
            matList.add(matObj);
        }
        insert matList;
        matSelObj.materialCodeFromPage = 'D';
        matSelObj.displayPopUpWindow();
        matSelObj.dosearch();
        matSelObj.filter_materialCode =null;
        matSelObj.dosearch();
        matSelObj.returnData();
        matSelObj.closeWindow();
        matSelObj.incrementer = 50;
        matSelObj.noOfRecordsAPage = 3;
        matSelObj.nextPage();
        List<SelectOption> a1 = matSelObj.MaterialGroup4;
        a1 = matSelObj.MaterialGroup3;
        List<SelectOption> a2 = matSelObj.MaterialGroup5;
        a2 = a1;
    }
}