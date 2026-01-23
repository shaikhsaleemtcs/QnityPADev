/***********************************************Modification Log********************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(1.0)
 *************************************************************************************************************
<PP20131111>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   11 November 2013
Description         :   Added logic for new Key Field Ship-To Country - DTT ROLLOUT
 ***********************************************************************************************************************
 <HN04152016>
 Last Modified By    :  Haider Naseem
 Last Modified Date  :  15 April 2016
 Description         :  Added logic to include incoterms2 in PCL if incoterms2 is not null
 
 **********************************************************************************************************************
<SS20230110>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   10 Jan 2023
 Description        :   Added logic to included ZSUB customers in customer list - CRM-2022-08-0227
 ***********************************************************************************************************************/

public class PAPCLComponent implements IPAComponent{    

    public String listofids{get;set;}
    public String typeOfReq {get;set;}
    //<TJ20150619>
    public String custName{get;set;}
    public string onBehalfOfUser {get;set;}
    public list<String> combinedid{get;set;}
    public String addressMessage //to store the message 
    {
        get
        {
            List<ERP_Sales_Prices_SAP__c> sapRecords=[select Record_Id__c from ERP_Sales_Prices_SAP__c where id=:listofids];

            String typeOfObj;
            String splitUName;
            list<string> recordsWithContact=new list<string>();
            list<String> combinedid=new list<String>();
            list<String> reocrdswithfinalList=new list<String>();

            if(sapRecords.size()>0)
                splitUName = sapRecords[0].Record_Id__c;

            if(splitUName.containsIgnoreCase('###'))
            {
                onBehalfOfUser = splitUName.split('###')[1];
                typeOfObj = splitUName.split('###')[0];
            }
            else
            {
                typeOfObj = sapRecords[0].Record_Id__c;
            }

            if(typeOfObj.containsIgnoreCase('FromPricingrequest'))
            {               
                combinedid=typeOfObj.split('#');
                //<TJ20150619>
                custName=typeOfObj.split('#')[0];
                Pricing_Request__c PrReq = [SELECT Id,Project_Id__c,City__c,Country__c,Incoterm__c,Street__c,Sold_To__c,Terms_Of_Payment__c,Approver5__c,Approver5__r.name,createdby.name FROM Pricing_Request__c WHERE Id=:combinedid[1]];

                if(!String.isBlank(PrReq.Project_Id__c))
                {
                    addressMessage = 'Herewith we are pleased to confirm that the below project price has been approved internally. May we kindly ask you to use this ID number reference when placing an order against this project. Thank you for choosing our products and services.';
                    typeOfReq= 'Project';
                }
                else
                {
                    addressMessage = 'Please find herewith the current terms and conditions/prices agreed by DuPont de Nemours International S?rl. Thank you for choosing our products and services.';
                    typeOfReq= 'Cust. Specific';
                }
            }
            else
            {
                combinedid=typeOfObj.split('#'); 
                //<TJ20150619>
                custName=typeOfObj.split('#')[0];
                for(String d:combinedid)
                {
                    reocrdswithfinalList=d.split('/');
                }

                for(String g:reocrdswithfinalList)
                {
                    recordsWithContact.add(g.trim());
                }

                list<ERP_Sales_Prices_SAP__c> listofDynamicTables=new list<ERP_Sales_Prices_SAP__c>();

                if(recordsWithContact.size()>0)
                {
                    listofDynamicTables=[SELECT Id,Name,Project_Id__c FROM ERP_Sales_Prices_SAP__c WHERE id IN:recordsWithContact];
                }


                if(listofDynamicTables.size()>0)
                {
                    for(ERP_Sales_Prices_SAP__c X:listofDynamicTables)
                    {
                        if(!String.isBlank(X.Project_Id__c))
                        {
                            addressMessage = 'Herewith we are pleased to confirm that the below project price has been approved internally. May we kindly ask you to use this ID number reference when placing an order against this project. Thank you for choosing our products and services.';
                            typeOfReq= 'Project';
                            break;
                        }
                        else
                        {
                            addressMessage = 'Please find herewith the current terms and conditions/prices agreed by DuPont de Nemours International S?rl. Thank you for choosing our products and services.';
                            typeOfReq= 'Cust. Specific';
                            break;
                        }
                    }
                }
            }
            return addressMessage;
        }
        set;
    }  

    /*
     * Author      : 
     * Method Name  :   action
     * Parameters   :   
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference action(){
        return null;
    } 


    /*
     * Author      : 
     * Method Name  :   displayPopUpWindowMethod
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference displayPopUpWindow() {
        return null;
    }

    /*
     * Author      : 
     * Method Name  :   searchCustomer
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference dosearch() {
        return null;
    }
    /*
     * Author      : 
     * Method Name  :   returnData
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference returnData() {
        return null;
    }

    /*
     * Author      : 
     * Method Name  :   closeWindow
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference closeWindow(){
        return null;
    }

    public String coloumsDisplay {get;set;}
    public list<PAwrapper> listofwrappertables
    {
        get
        {

            List<ERP_Sales_Prices_SAP__c> sapRecords=[select Record_Id__c from ERP_Sales_Prices_SAP__c where id=:listofids];
            String typeOfObj;
            string splitUName;
            list<string> recordsWithContact=new list<string>();
            list<String> combinedid=new list<String>();
            list<String> reocrdswithfinalList=new list<String>();
            list<string> coloumsList = new list<String>(); //Shiva
            set<String> KCSet = new set<String>(); //Shiva
            set<String> coloumsSet = new set<String>(); //Shiva
            list<String> codetobeused=new list<String>();
            list<String> texttobeused=new list<String>();
            String Sapcluster,SalesOrgCode;

            if(sapRecords.size()>0)
                splitUName = sapRecords[0].Record_Id__c;

            if(splitUName.containsIgnoreCase('###'))
            {
                onBehalfOfUser = splitUName.split('###')[1];
                typeOfObj = splitUName.split('###')[0];
            }
            else
            {
                typeOfObj = sapRecords[0].Record_Id__c;
            }

            if(typeOfObj.containsIgnoreCase('FromPricingrequest'))
            {
                combinedid=typeOfObj.split('#');
                //<TJ20150619>
                custName=typeOfObj.split('#')[0];
                list<Pricing_Request_Item__c> finalreqItemList = new list<Pricing_Request_Item__c>();
                //<BB20130726> --Ver 1.0 Added Inco_terms__c and Incoterms_Code__c in the query
                //<PP20131111>
                //<MS20140515> Added Variant and SalesOrderType fields in the query
                List<Pricing_Request_Item__c> listofReqItem = [SELECT Ship_To_Country_Code__c,Ship_To_Country__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,
                                                               Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,
                                                               Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,
                                                               Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,
                                                               PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,
                                                               Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,
                                                               Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c,
                                                               Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,SAP_Application_Id__c,
                                                               SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,
                                                               ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,PCKC__c,Market_Segment_Code__c,Market_Segment__c,Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,
                                                               ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                                                               New_Per__c,New_Rate__c,New_Unit__c,New_UoM__c,New_Valid_From__c,New_Valid_To__c,Inco_terms__c,Incoterms_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, 
                                                               Disc_Ref_No__c, FixValDate__c, Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c 
                                                               FROM Pricing_Request_Item__c WHERE Pricing_Request__c =:combinedid[1]];
                Decimal separatorCheckPCL = 1.1;
                string separatorPCL = separatorCheckPCL.format().subString(1,2);    
                if(separatorPCL==',' && listofReqItem.size()>0) 
                {
                    for(Pricing_Request_Item__c reqItem : listofReqItem) 
                    {
                        if(reqItem.Rate__c!=null && reqItem.Rate__c.contains('.')) 
                        {
                            reqItem.Rate__c = reqItem.Rate__c.replace('.',',');
                        }
                        if(reqItem.New_Rate__c!=null && reqItem.New_Rate__c.contains('.')) 
                        {
                            reqItem.New_Rate__c = reqItem.New_Rate__c.replace('.',',');
                        }
                    }
                }
                for(Pricing_Request_Item__c reqItem : listofReqItem) 
                {
                    reqItem.Rate__c = reqItem.New_Rate__c;
                    reqItem.Unit__c = reqItem.New_Unit__c;
                    reqItem.Per__c = reqItem.New_Per__c;
                    reqItem.UoM__c = reqItem.New_UoM__c;
                    reqItem.Valid_From__c = reqItem.New_Valid_From__c;
                    reqItem.Valid_To__c = reqItem.New_Valid_To__c;
                    finalreqItemList.add(reqItem);
                    if(typeOfReq!= 'Project')
                    {
                        KCSet.add(reqItem.Key_Combination__c);
                        if(!String.isBlank(reqItem.UoM__c))
                        {
                            coloumsSet.add('UoM');
                            coloumsSet.add('Per');
                        }
                    }
                }
                //<MS20140515> Added Variant and Sales Order Type
                if(KCSet.size() != 0)
                {
                    for(String X:KCSet)
                    {
                        coloumsSet.add('PC');
                        coloumsSet.add('Rate');
                        coloumsSet.add('Unit');
                        String replacedS = X.replace('Material Price Group','');
                        String replacedEU = X.replace('End User','');
                        if(X.containsIgnoreCase('Material') && replacedS.containsIgnoreCase('Material'))
                            coloumsSet.add('Material');
                        if(X.containsIgnoreCase('PH'))
                            coloumsSet.add('PH');
                        if(X.containsIgnoreCase('Ship to'))
                            coloumsSet.add('Ship to');
                        if(X.containsIgnoreCase('Material Price Group'))
                            coloumsSet.add('MPG');
                        if(X.containsIgnoreCase('Customer Price Group'))
                            coloumsSet.add('CPG');  
                        if(X.containsIgnoreCase('Sales office'))
                            coloumsSet.add('SO');
                        if(X.containsIgnoreCase('Sales District'))
                            coloumsSet.add('SD');   
                        if(X.containsIgnoreCase('Price List Type'))
                            coloumsSet.add('PLT');
                        if(X.containsIgnoreCase('Terms of Payment'))
                            coloumsSet.add('ToP');
                        if(X.containsIgnoreCase('Price Ref. Partner'))
                            coloumsSet.add('PRP');
                        if(X.containsIgnoreCase('Country'))
                            coloumsSet.add('Country');
                        if(X.containsIgnoreCase('End Use') && replacedEU.containsIgnoreCase('End Use'))
                            coloumsSet.add('End Use');
                        if(X.containsIgnoreCase('End User'))
                            coloumsSet.add('End User'); 
                        if(X.containsIgnoreCase('Market Segment'))
                            coloumsSet.add('Market Segment');
                        if(X.containsIgnoreCase('Variant'))
                            coloumsSet.add('Variant');  
                        if(X.containsIgnoreCase('Sales Order Type'))
                            coloumsSet.add('Sales Order Type');
                        if(X.containsIgnoreCase('ComPartner'))
                            coloumsSet.add('ComPartner');   
                        //<MS20150213>
                        if(X.containsIgnoreCase('Material Group 5 Key'))
                            coloumsSet.add('Material Group 5 Key'); 
                        if(X.containsIgnoreCase('Plant'))
                            coloumsSet.add('Plant');  
                        if(X.containsIgnoreCase('Shipping Condition'))
                            coloumsSet.add('Shipping Condition');  
                        if(X.containsIgnoreCase('Destination Country'))
                            coloumsSet.add('Destination Country');  
                        if(X.containsIgnoreCase('Kcode'))
                            coloumsSet.add('Kcode'); 
                        if(X.containsIgnoreCase('Kcode'))
                            coloumsSet.add('Kcode'); 
                        if(X.containsIgnoreCase('Material Group 1') || X.containsIgnoreCase('Matl grp1') || X.containsIgnoreCase('Matl grp 1') || X.containsIgnoreCase('MatGrp1'))
                            coloumsSet.add('Material Group 1'); 
                        if(X.containsIgnoreCase('Partner ZF'))
                            coloumsSet.add('Partner ZF'); 
                        if(X.containsIgnoreCase('Payer'))
                            coloumsSet.add('Payer');
                        if(X.containsIgnoreCase('Disc Ref No'))
                            coloumsSet.add('Disc Ref No');
                        if(X.containsIgnoreCase('FixValDate'))
                            coloumsSet.add('FixValDate');
                        if(X.containsIgnoreCase('Campaign'))
                            coloumsSet.add('Campaign');
                        if(X.containsIgnoreCase('Document Currency'))
                            coloumsSet.add('Document Currency');
                        if(X.containsIgnoreCase('State'))
                            coloumsSet.add('State'); 
                    }
                    coloumsList.addall(coloumsSet);
                    system.debug('&*&*& coloumsList'+coloumsList);
                    if(coloumsList.size() > 0)
                    { 
                        coloumsDisplay = '';
                        for(integer i=0; i<coloumsList.size();i++)
                        {
                            if(i == coloumsList.size()-1)
                            {
                                coloumsDisplay = coloumsDisplay+coloumsList[i];
                            }
                            else
                            {
                                coloumsDisplay = coloumsDisplay+coloumsList[i]+'/';
                            }
                        }
                    }
                }
                if(listofReqItem.size()>0)
                {
                    Sapcluster=listofReqItem[0].SAP_Cluster__c;
                    SalesOrgCode = listofReqItem[0].Sales_Org_Code__c;
                }
                listofwrappertables=new list<PAwrapper> ();
                for(Pricing_Request_Item__c sapObj1 : listofReqItem) 
                {
                    String material=sapObj1.Material_Code__c;
                    codetobeused.add(material);
                }
                list<Material_Localization__c> salestext=new list<Material_Localization__c>();
                try
                {
                    salestext=[SELECT Sales_Text__c,Material__r.ERP_Material_code__c FROM Material_Localization__C WHERE Material__r.ERP_Material_code__c IN:codetobeused 
                               AND Material__r.RecordType.name ='ERP Material - Extended Data' AND Language__c ='EN' 
                               AND Material__r.ERP_Source_Cluster__C=:Sapcluster AND Material__r.ERP_Sales_Org_Code__c=:SalesOrgCode];
                }
                catch(exception e)
                {
                    system.debug('&** exception e'+e);
                }
                Map<string,string> matSalesMap = new Map<string,string>();
                for(string ss:codetobeused)
                {
                    for(Material_Localization__c matLocal:salesText)
                    {
                        if(!String.isBlank(ss) && ss.equalsIgnoreCase(matLocal.Material__r.ERP_Material_code__c))
                        {
                            matSalesMap.put(ss,matLocal.sales_Text__c);
                            break;
                        }
                    } 
                }
                for(Pricing_Request_Item__c X:finalreqItemList)
                {
                    PAWrapper PA=new PAWrapper();
                    PA.sobjectRecord = X;
                    PA.stringMap.put('salestext',' ');   
                    if(!String.isBlank(matSalesMap.get(X.Material_Code__C)))
                        PA.stringMap.put('salestext',(String)matSalesMap.get(X.Material_Code__C));
                    listofwrappertables.add(PA);
                }

            }//if end
            else
            {
                combinedid=typeOfObj.split('#');
                //<TJ20150619>
                custName=typeOfObj.split('#')[0];
                for(String d:combinedid)
                {
                    reocrdswithfinalList=d.split('/');
                }
                for(String g:reocrdswithfinalList)
                {
                    recordsWithContact.add(g.trim());
                }
                list<ERP_Sales_Prices_SAP__c> listofDynamicTables=new list<ERP_Sales_Prices_SAP__c>();
                try
                {
                    //<MS20140515> Added Variant and SalesOrderType fields in the query
                    listofDynamicTables=[select Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,
                                         Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,
                                         Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,
                                         Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,
                                         PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,
                                         Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,
                                         Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c,
                                         Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
                                         SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,Project_Id__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,
                                         ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,PCKC__c,Market_Segment_Code__c,Market_Segment__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,
                                         ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Price_Holder__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,
                                         Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c from ERP_Sales_Prices_SAP__c where id in:recordsWithContact];
                }
                catch (exception e)
                {
                    system.debug('&** exception e'+e);
                }
                Decimal separatorCheckPCL = 1.1;
                string separatorPCL = separatorCheckPCL.format().subString(1,2);     
                if(separatorPCL==',' && listofDynamicTables.size()>0) 
                {
                    for(ERP_Sales_Prices_SAP__c sapObj : listofDynamicTables) 
                    {
                        if(sapObj.Rate__c!=null && sapObj.Rate__c.contains('.')) 
                        {
                            sapObj.Rate__c = sapObj.Rate__c.replace('.',',');
                        }
                    }
                }
                if(listofDynamicTables.size()>0)
                {
                    Sapcluster=listofDynamicTables[0].SAP_Cluster__c;
                    SalesOrgCode = listofDynamicTables[0].Sales_Org_Code__c;
                    listofwrappertables=new list<PAwrapper> ();
                    for(ERP_Sales_Prices_SAP__c sapObj1 : listofDynamicTables) 
                    {
                        String material=sapObj1.Material_Code__c;
                        codetobeused.add(material);

                        if(String.isBlank(sapObj1.Project_Id__c))
                        {
                            KCSet.add(sapObj1.Key_Combination__c);
                            if(!String.isBlank(sapObj1.UoM__c))
                            {
                                coloumsSet.add('UoM');
                                coloumsSet.add('Per');
                            }
                        }

                    }
                }
                if(KCSet.size() != 0)
                {
                    for(String X:KCSet)
                    {
                        coloumsSet.add('PC');
                        coloumsSet.add('Rate');
                        coloumsSet.add('Unit');
                        String replacedS = X.replace('Material Price Group','');
                        String replacedEU = X.replace('End User','');
                        //<PP20131111> - LOgic for Ship-To Country - New key Field
                        String replacedSTC = X.replace('Ship-To Country','');
                        if(X.containsIgnoreCase('Material') && replacedS.containsIgnoreCase('Material'))
                            coloumsSet.add('Material');
                        if(X.containsIgnoreCase('PH'))
                            coloumsSet.add('PH');
                        if(X.containsIgnoreCase('Ship to'))
                            coloumsSet.add('Ship to');
                        if(X.containsIgnoreCase('Material Price Group'))
                            coloumsSet.add('MPG');
                        if(X.containsIgnoreCase('Customer Price Group'))
                            coloumsSet.add('CPG'); 
                        //<BB20130726> Ver 1.0 2013-07-26 APAC Rollout2-Adding Logic for Extra field Incoterms 
                        if(X.containsIgnoreCase('Incoterms'))
                            coloumsSet.add('Incoterms');  
                        if(X.containsIgnoreCase('Sales office'))
                            coloumsSet.add('SO');
                        if(X.containsIgnoreCase('Sales District'))
                            coloumsSet.add('SD');   
                        if(X.containsIgnoreCase('Price List Type'))
                            coloumsSet.add('PLT');
                        if(X.containsIgnoreCase('Terms of Payment'))
                            coloumsSet.add('ToP');
                        if(X.containsIgnoreCase('Price Ref. Partner'))
                            coloumsSet.add('PRP');
                        //<PP20131111>
                        if(X.containsIgnoreCase('Country') && replacedSTC.containsIgnoreCase('Country'))
                            coloumsSet.add('Country');
                        if(X.containsIgnoreCase('End Use') && replacedEU.containsIgnoreCase('End Use'))
                            coloumsSet.add('End Use');
                        if(X.containsIgnoreCase('End User'))
                            coloumsSet.add('End User'); 
                        if(X.containsIgnoreCase('Market Segment'))
                            coloumsSet.add('Market Segment');
                        //<MS20140515> Added Variant and Sales Order Type START
                        if(X.containsIgnoreCase('Variant'))
                            coloumsSet.add('Variant');
                        if(X.containsIgnoreCase('Sales Order Type'))
                            coloumsSet.add('Sales Order Type');
                        if(X.containsIgnoreCase('ComPartner'))
                            coloumsSet.add('ComPartner');   
                        //<MS20150213>
                        if(X.containsIgnoreCase('Material Group 5 Key'))
                            coloumsSet.add('Material Group 5 Key');   
                        if(X.containsIgnoreCase('Plant'))
                            coloumsSet.add('Plant');  
                        if(X.containsIgnoreCase('Shipping Condition'))
                            coloumsSet.add('Shipping Condition');  
                        if(X.containsIgnoreCase('Destination Country'))
                            coloumsSet.add('Destination Country');  
                        //<MS20140515> Added Variant and Sales Order Type END
                        //<PP20131111> START
                        if(X.containsIgnoreCase('Ship-To Country'))
                            coloumsSet.add('Ship-To Country');
                        if(X.containsIgnoreCase('Kcode'))
                            coloumsSet.add('Kcode');    
                        if(X.containsIgnoreCase('Material Group 1') || X.containsIgnoreCase('Matl grp1') || X.containsIgnoreCase('Matl grp 1') || X.containsIgnoreCase('MatGrp1'))
                            coloumsSet.add('Material Group 1');
                        if(X.containsIgnoreCase('Partner ZF'))
                            coloumsSet.add('Partner ZF');
                        if(X.containsIgnoreCase('Payer'))
                            coloumsSet.add('Payer');
                        if(X.containsIgnoreCase('Disc Ref No'))
                            coloumsSet.add('Disc Ref No');
                        if(X.containsIgnoreCase('FixValDate'))
                            coloumsSet.add('FixValDate');
                        if(X.containsIgnoreCase('Campaign'))
                            coloumsSet.add('Campaign');
                        if(X.containsIgnoreCase('Document Currency'))
                            coloumsSet.add('Document Currency');
                        if(X.containsIgnoreCase('State'))
                            coloumsSet.add('State'); 
                        //<PP20131111> END
                    }
                    coloumsList.addall(coloumsSet);
                    system.debug('&*&*& coloumsList'+coloumsList);
                    if(coloumsList.size() > 0)
                    { 
                        coloumsDisplay = '';
                        for(integer i=0; i<coloumsList.size();i++)
                        {
                            if(i == coloumsList.size()-1)
                            {
                                coloumsDisplay = coloumsDisplay+coloumsList[i];
                            }
                            else
                            {
                                coloumsDisplay = coloumsDisplay+coloumsList[i]+'/';
                            }
                        }
                    }
                }
                list<Material_Localization__c> salestext=new list<Material_Localization__c>();
                try
                {
                    salestext=[Select Sales_Text__c,Material__r.ERP_Material_code__c from Material_Localization__C Where Material__r.ERP_Material_code__c in:codetobeused 
                               and Material__r.RecordType.name ='ERP Material - Extended Data' and Language__c ='EN' 
                               and Material__r.ERP_Source_Cluster__C=:Sapcluster and Material__r.ERP_Sales_Org_Code__c=:SalesOrgCode];
                }
                catch (exception e)
                {
                    system.debug('&** exception e'+e);
                }
                Map<string,string> matSalesMap = new Map<string,string>();
                for(string ss:codetobeused)
                {
                    for(Material_Localization__c matLocal:salesText)
                    {
                        if(!String.isBlank(ss) && ss.equalsIgnoreCase(matLocal.Material__r.ERP_Material_code__c))
                        {
                            matSalesMap.put(ss,matLocal.sales_Text__c);
                            break;
                        }
                    } 
                }
                Integer i = 0;
                for(string s1:codetobeused)
                {
                    //salestext=[Select Sales_Text__c from Material_Localization__c Where Material__r.ERP_Material_Code__c in:codetobeused and Material__r.RecordType ='ERP Extended Data' and Language ='EN'];
                    PAwrapper s=new PAwrapper();
                    if(listofDynamicTables != null && listofDynamicTables.size() >0) 
                    {
                        s.sobjectRecord = listofDynamicTables[i];
                    }
                    system.debug('inside this'+listofDynamicTables.size());
                    // if(salestext[i].Sales_Text__c <> NULL)

                    s.stringMap.put('salestext',' ');   
                    if(!String.isBlank(matSalesMap.get(s1)))
                        s.stringMap.put('salestext',(String)matSalesMap.get(s1));
                    listofwrappertables.add(s);
                    i++;
                }
            }//else end
            return listofwrappertables;
        }set;
    }
    //1.1 starts
    public list<String> listofCustomerContacts{
        get{
            ERP_Sales_Prices_SAP__c sapRecords=[select Record_Id__c
                                                from ERP_Sales_Prices_SAP__c where id=:listofids];
            list<string> customer=new list<string>();
            customer=sapRecords.Record_Id__c.split('#');
            return customer;
        }set;
    }
    //created for project teplate
    public list<Project_Price__c> listofProjectPrices
    {
        get
        {
            ERP_Sales_Prices_SAP__c sapRecords=[select Record_Id__c from ERP_Sales_Prices_SAP__c where id=:listofids];
            list<string> recordsWithContact=new list<string>();
            list<String> combinedid=new list<String>();
            list<String> reocrdswithfinalList=new list<String>();
            String typeOfObj;
            String splitUName;

            if(sapRecords != null)
                splitUName = sapRecords.Record_Id__c;

            if(splitUName.containsIgnoreCase('###'))
            {
                onBehalfOfUser = splitUName.split('###')[1];
                typeOfObj = splitUName.split('###')[0];
            }
            else
            {
                typeOfObj = sapRecords.Record_Id__c;
            }


            if(typeOfObj.containsIgnoreCase('FromPricingrequest'))
            {
                combinedid=typeOfObj.split('#'); 
                //<TJ20150619>
                custName=typeOfObj.split('#')[0];
                listofProjectPrices = new list<Project_Price__c>();
                Project_Price__c projectprice = new Project_Price__c();
                Pricing_Request__c prireq = [SELECT Id, Project_Id__c FROM Pricing_Request__c WHERE Id=:combinedid[1]];
                if(!String.isBlank(prireq.Project_Id__c))
                    projectprice = [SELECT Project_Id__c,name,Valid_From__c,Valid_To__c,Project_Volume__c,Sold_To_Code__c FROM Project_Price__c WHERE Project_Id__c = :prireq.Project_Id__c ];
                listofProjectPrices.add(projectprice);
            }
            else
            { 
                combinedid=typeOfObj.split('#'); 
                //<TJ20150619>
                custName=typeOfObj.split('#')[0];
                for(String d:combinedid)
                {
                    reocrdswithfinalList=d.split('/');
                    system.debug('used by infy'+reocrdswithfinalList);
                }
                for(String g:reocrdswithfinalList)
                {
                    recordsWithContact.add(g.trim());
                }
                String idOfProject;
                list<String> s=new list<String>();
                list<ERP_Sales_Prices_SAP__c> projectd = new list<ERP_Sales_Prices_SAP__c>();
                if(recordsWithContact.size()>0)
                {   
                    projectd=[select Project_Id__c from ERP_Sales_Prices_SAP__c where id in:recordsWithContact];
                }
                for(ERP_Sales_Prices_SAP__c d:projectd)
                {
                    idOfProject=d.Project_Id__c;
                    s.add(idOfProject);
                }
                listofProjectPrices= new list<Project_Price__c>();
                if(!String.isBlank(idOfProject))
                    listofProjectPrices=[select Project_Id__c,name,Valid_From__c,Valid_To__c,Project_Volume__c,Sold_To_Code__c from Project_Price__c where Project_Id__c = :idOfProject ];
            }//else end
            system.debug('sanjib checking'+listofProjectPrices);
            return listofProjectPrices; 
        }
        set;
    }
    public list<Pricing_Request__c> listrequestdetils
    {
        get
        {
            try
            {
              
                Pricing_Request__c pricingRequest = new Pricing_Request__c();
                ERP_Sales_Prices_SAP__c sapRecords=[select Record_Id__c from ERP_Sales_Prices_SAP__c where id=:listofids];
                list<string> recordsWithContact=new list<string>();             
                list<String> reocrdswithfinalList=new list<String>();
                String typeOfObj;
                String splitUName;
    
                if(sapRecords != null)
                    splitUName = sapRecords.Record_Id__c;
    
                if(splitUName.containsIgnoreCase('###'))
                {
                    onBehalfOfUser = splitUName.split('###')[1];
                    typeOfObj = splitUName.split('###')[0];
                }
                else
                {
                    typeOfObj = sapRecords.Record_Id__c;
                }               
               try{
                if(typeOfObj.containsIgnoreCase('FromPricingrequest'))
                {
                    //<TJ20150619>
                    custName=typeOfObj.split('#')[0];
                    combinedid=typeOfObj.split('#');
                    Pricing_Request__c pricingReq = new Pricing_Request__c(); 
                    pricingReq = [SELECT Id, Dist_Channel_Code__c,Sales_Org_Code__c,SoldTo_Code__c,Sold_To__c,Division_Code__c,End_User__c,End_User_Code__c,Approver5_Date__c,CreatedDate,Name,is_End_User_Rebate__c FROM Pricing_Request__c WHERE Id = :combinedid[1]];
                    listrequestdetils = new list<Pricing_Request__c>();
                    List<Pricing_Request_Item__c> listofReqItem = [SELECT Id,Name,New_Valid_From__c,Division__c,Division_Code__c,Sales_Org__c,Sales_Org_Code__c,SAP_Application_Id__c,
                                                                   SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Terms_of_Payment_Code__c,Dist_Channel_Code__c,Dist_Channel__c 
                                                                   FROM Pricing_Request_Item__c WHERE Pricing_Request__c =:combinedid[1]];
                    Pricing_Request_Item__c PriReqRecord = new Pricing_Request_Item__c();
                    if(listofReqItem.size() > 0)
                        PriReqRecord = listofReqItem[0];
                    ERP_Customer__c Cust = new ERP_Customer__c();
                    try
                    {
                        Cust = [SELECT Id,Name,Incoterms_1_Code__c,Incoterms_1__c,Incoterms_2__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,City__c,Country__c,Street__c FROM ERP_Customer__c WHERE 
                                Customer_Code__c=:pricingReq.SoldTo_Code__c
                                AND Division_Code__c=:pricingReq.Division_Code__c AND Distribution_Channel_Code__c=:pricingReq.Dist_Channel_Code__c
                                AND Account_Group_Code__c IN ('Z001', 'ZSUB') AND Source_Cluster__c=:PriReqRecord.SAP_Cluster__c AND Sales_Org_Code__c=:pricingReq.Sales_Org_Code__c];//<SS20230110> Added ZSUB account group code
                        system.debug('HNDEBUG PRDetails'+pricingReq.SoldTo_Code__c);
                    }
                    catch(exception e)
                    {
                        system.debug('&** exception e'+e);
                        throw new PAException('type Object: '+typeOfObj+', rec id:'+listofids, ApexPages.Severity.Error);
                    } 
                    listrequestdetils=new list<Pricing_Request__c>();
                    pricingRequest = new Pricing_Request__c();
                    if(!pricingReq.is_End_User_Rebate__c){
                        pricingRequest.Incoterms_Code__c = Cust.Incoterms_1_Code__c;
                        pricingRequest.Incoterm__c = Cust.Incoterms_1__c;
                        //<HN04152016> Added Incoterms2 for populating Location in PCL
                        if(Cust.Incoterms_2__c!=null||Cust.Incoterms_2__c!=''){
                            pricingRequest.Incoterm__c = Cust.Incoterms_1__c + ' ' + Cust.Incoterms_2__c;}
                        //END              
                        pricingRequest.Terms_Of_Payment_Code__c= Cust.Terms_of_Payment_Code__c;
                        pricingRequest.Terms_Of_Payment__c= Cust.Terms_of_Payment__c;
                        pricingRequest.Sold_To__c = Cust.Name;
                        pricingRequest.Street__c = Cust.Street__c;
                        pricingRequest.City__c = Cust.City__c;
                        pricingRequest.Country__c =  Cust.Country__c;
                        pricingRequest.Request_Valid_From__c=listofReqItem[0].New_Valid_From__c; 
                        listrequestdetils.add(pricingRequest);
                        system.debug('HNDEBUG Incoterms'+listrequestdetils[0].Incoterm__c);
                    }
                    else{
                        pricingReq.Street__c = Cust.Street__c;
                        pricingReq.City__c = Cust.City__c;
                        pricingReq.Country__c =  Cust.Country__c;
                        system.debug(LoggingLevel.Error,'pricingReq.Sold_To__c is '+pricingReq.Sold_To__c);
                        listrequestdetils.add(pricingReq);
                    }
                }
                else
                {           
                    //<TJ20150619>
                    custName=typeOfObj.split('#')[0];
                    system.debug('HNDEBUG custName[0]'+custName);
              
                    combinedid=typeOfObj.split('#'); 
                    for(String d:combinedid)
                    {
                        reocrdswithfinalList=d.split('/');
                        system.debug('used by infy'+reocrdswithfinalList);
                    }
                    for(String g:reocrdswithfinalList)
                    {
                        recordsWithContact.add(g.trim());
                    }
                    String idOfProject;
                    String soldToCode;
                    list<String> s=new list<String>();
                    list<ERP_Sales_Prices_SAP__c> projectd = new list<ERP_Sales_Prices_SAP__c>();
                    if(recordsWithContact.size()>0)
                    {
                        projectd=[select Id,Valid_From__c,Project_Id__c,SAP_Application_Id__c,Sold_To_Code__c,SAP_Client_ID__c,SAP_Cluster__c,Sales_Org_Code__c,Distribution_Channel_Code__c,Division_Code__c,Pricing_Request__c,Pricing_Request__r.SoldTo_Code__c from ERP_Sales_Prices_SAP__c where id IN:recordsWithContact];
                    }
                    ERP_Sales_Prices_SAP__c SAPRecord = new ERP_Sales_Prices_SAP__c();
                    if(projectd.size()>0)
                        SAPRecord = projectd[0];
                    //<TJ20150619> Fetching Customer Info For PCL
                    PAPCLCustomerData__c custdata = new PAPCLCustomerData__c();
                    if(SAPRecord.Sold_To_Code__c!=null)
                        custdata=PAPCLCustomerData__c.getinstance(SAPRecord.Sold_To_Code__c);
                    else if(SAPRecord.Pricing_Request__c!=null && SAPRecord.Pricing_Request__r.SoldTo_Code__c!=null)
                        custdata=PAPCLCustomerData__c.getinstance(SAPRecord.Pricing_Request__r.SoldTo_Code__c);
                    ERP_Customer__c Cust = new ERP_Customer__c();
                    try
                    {
                        Cust = [SELECT Id,Name,Incoterms_1_Code__c,Incoterms_1__c,Incoterms_2__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,City__c,Country__c,Street__c FROM ERP_Customer__c WHERE 
                                Customer_Code__c=:custdata.Sold_To_Code__c AND Division_Code__c=:custdata.Division_Code__c AND Distribution_Channel_Code__c=:custdata.Dist_Channel_Code__c 
                                AND Account_Group_Code__c IN ('Z001','ZSUB') AND Source_Cluster__c=:SAPRecord.SAP_Cluster__c AND Sales_Org_Code__c=:SAPRecord.Sales_Org_Code__c]; //<SS20230110> Added ZSUB account group code                      
                    }
                    catch(exception e)
                    {
                        throw new PAException('type Object: '+sapRecords.Record_Id__c+', rec id:'+listofids, ApexPages.Severity.Error);
                        //system.debug('&** exception e'+e);
                    }                                               
                    listrequestdetils=new list<Pricing_Request__c>();
                    pricingRequest = new Pricing_Request__c();
                    pricingRequest.Incoterms_Code__c = Cust.Incoterms_1_Code__c;
                    pricingRequest.Incoterm__c = Cust.Incoterms_1__c;
                    //<HN04152016> Added Incoterms2 for populating Location in PCL
                        if(Cust.Incoterms_2__c!=null||Cust.Incoterms_2__c!=''){
                            pricingRequest.Incoterm__c = Cust.Incoterms_1__c + ' ' + Cust.Incoterms_2__c;}
                    //END
                    pricingRequest.Terms_Of_Payment_Code__c= Cust.Terms_of_Payment_Code__c;
                    pricingRequest.Terms_Of_Payment__c= Cust.Terms_of_Payment__c;
                    pricingRequest.Sold_To__c = Cust.Name;
                    pricingRequest.Street__c = Cust.Street__c;
                    pricingRequest.City__c = Cust.City__c;
                    pricingRequest.Country__c =  Cust.Country__c;
                    pricingRequest.Request_Valid_From__c=projectd[0].Valid_From__c; 
                    listrequestdetils.add(pricingRequest);
    
                }//else end
              }
            catch(Exception e)
            {
                //throw new PAException('Error from cls: Line Num'+e.getLineNumber()+', rec id:'+listofids, ApexPages.Severity.Error);
                throw new PAException('type Object: '+sapRecords.Record_Id__c+', rec id:'+listofids, ApexPages.Severity.Error);
            }
            }
            catch(Exception e)
            {
                //throw new PAException('Error from cls: Line Num'+e.getLineNumber()+', rec id:'+listofids, ApexPages.Severity.Error);
                //throw new PAException('type Object: '+sapRecords.Record_Id__c+', rec id:'+listofids, ApexPages.Severity.Error);
            }
            List<PAPCLCustomerData__c> custdataID=new List<PAPCLCustomerData__c>();
            custdataID=[Select id from PAPCLCustomerData__c];
            delete custdataID;
            return listrequestdetils;  
        }
        set;
    }
    //Constructor
    public PAPCLComponent()
    {
    }
}