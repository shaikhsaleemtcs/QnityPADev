public with sharing class PARequestItem implements IPAServiceComponent
{   
    
    
    /*   Ver.                      Developer                           Changes                              Dependencies 
--------------------------------------------------------------------------------------------------------------------------*/
    //  1.2                      Shiva // Test Save                         Added a field to the query                 None
    //  1.3                      Priyanka                       Added a field F_Product_Hierarchy_Code__c
    //                                                            to the query                              None
    //  1.4                      Priyanka                       Changing scale validations                None      
    //  1.5                      Shiva                         Changed eprUoMList method                   None
    //  1.6                      Neeharika                     Changed material code insertion split       None
    //condition          
    //  1.7                      Prachi                       Changed Rebate to Rebate Agreement(line 1741)None                                    
    //  1.8                      Neeharika                     Changed fields bound to Sold To code,Sold To None
    //  1.9                      Vinoth                       Changed uploadrecords method for scaling   None
    //  2.0                      Priyanka                       Changed validation in scale               None
    //  2.1                      Vinoth                       Updated validateImport method             None
    //  2.2                      Bala                           Added call to floor and ref               None
    //  2.3                      Vinoth                       Done modification on Division Validation   None      
    //  2.4                      Prachi                       Added conditions for Currency Test(decimal place)None   
    //  2.5                      Priyanka                       Modified validate method                    None
    //  2.6                      Anand                         Modified AddMaterial                     none
    //  2.7                      Bala                           Modified Flr and ref call                  None 
    //  2.8                      Vinoth                       Populated request.PricingCondition          None  
    //  2.9                      Neeharika                     Changed PCKC field                         None
    //  3.0                      Priyanka                       Changed Plus/Minus validation              None       
    //  3.1                      Neeharika                     Changed field bindings of Gap records       None   
    //  3.2                      Vinoth                       Changed Dynamic column generation         None
    //  3.3                      Neeharika                     Added scale field binding                   None
    //  3.4                      Priyanka                       Added Del link logic in setter            None  
    //  3.5                      Anand                         added try catch for upsert in project       None
    //  3.6                      Priyanka                       modified getListWrappers method to 
    //                                                            populate fieldsets                          None 
    //  3.8                      Vinoth                       modified UploadRecords method            None 
    //  3.9                      Priyanka                       modified getListWrappers method to 
    //                                                            populate fieldsets                          None   
    //  4.0                      Neeharika                     Changed binding of Disti/Div/Sales org     None
    //  4.0                      Priyanka                       Modified sObjectList to sObjectRecord      None 
    //  4.1                      Prachi                       Modified sobjctlist for attachment          None   
    //  4.2                      Neeharika                     Added Key Combination-SFDC                 None   
    //  4.3                      Neeharika                     Added Scale quantity validation           None   
    //  4.4                      Prachi                       Added condition for Pending link on QUIT  None
    //  4.5                      Vinoth                       Edited validateImport method for Issue 458  None
    //  4.6                      Anand                         Added private method to diplay project records None
    //  4.7                      Bala                           split the call between Flr and Reference     
    //  4.8                      Neeharika                     bound scale rate1 to new rate field       None   
    //  4.9                      Prachi                       populating customer for pricing task      None
    //  5.0                      Vinoth                       Inserting SAP Key Combination description   None    
    //  5.1                      Neeharika                     Alert for rounding off                     None                                                             
    
    //  5.3                      prachi                       Commented material code validation          None
    //  5.4                      Bala                           Added OwnerId to ogitems reference        None
    //  5.5                         Brundha                      changed csvstring to dispNCS for ncs      None
    //  5.6                      Neeharika                     Changed Ph description logic             None
    //  5.7                      Prachi/Utkarsh               Added logic to override the view of PR      ctrlPAMain, PAAppwovalWF    
    //  5.8                      Neeharika                     added indicator logic                       None
    //  5.9                      Vinoth                       Import FileType Change                      None
    //  5.10                        Prachi                        Added validation for material look up    None
    //  5.11                        Neeharika                      made ref null in catch                     None
    //  5.12                        Prachi                        Changed the validations for Pricing Task  None
    //  5.13                        Priyanka                        Added additional KC filters logic
    //                                                            Payment terms,Price ref partner,
    //                                                            End use, country, market segment          None
    //  5.14                        Shiva                          UAT Issue# 102 scaling record for 
    //                                                            non-customer pricing the scaled price 
    //                                                            should be defaulted to scale price          None
    //  5.15                        Neeharika                      replaced Gap sorting logic with orderby   None
    //  5.16                        Priyanka                        Added code for insertion of multiple
    //
    //  5.17                        Vinoth                        Modified Import for Scaling Issue         None  
    //  5.18                        Neeharika                      make new per =null in case of pH and mat None  
    //  5.19                        Prachi                          Adding NULL condition(Overriding view)      None     
    //  5.20                        Prachi                          Added method saveTask(Change requirement)   None                      
    //  5.21                        Bala                            Changed the Name of flr ref method          None
    //  5.22                        Prachi                          Showing UoM for Pricing Task                None
    //  5.23                        Prachi                          Changing attachment (code review)           None
    //  5.24                        Bala                            Adding Wrapper variable for NPC             None
    //  5.25                        Neeharika                       Adding a boolean variable for NPC           None
    //  5.26                        Shiva                        Added additional KC filters logic
    //                                                           End user                                       None
    //  5.27                        Bala                        Removing the condition for calling flr and ref  None
    //                                                          even for pricing task
    //  5.28                        Bala                        Added UoM from Material Conversion factor as well None
    //  5.29                        neeha                       Added netPricingFlag for NPC                     None
    //  5.30                        neeha                       rendered condtion-changed for Mat                None
    //  5.31                        Prachi                      populating customer on click of edit             None   
    //  5.32                        Prachi                      enhancement-CSR viewing other tasks              None   
    //  5.39                        Neeharika                   APAC roll out fix- TO make scale type editable when 
    //                                                                                       pricing condition's scale type is null
    //  5.40                        Neeharika                   APAC roll out fix- TO make Stamp prices null      None 
    //  5.41                        Utkarsh                     Added condition to change the case of UOM and Currency
    //  5.42                        Piyush                      Added logic to display Distributor Code in Import as well.  
    //  5.43                        Aman                        Updated IF condition by including 'Reference'  IS SC-00097411.
    //  5.44                        Vinay                        Added null check for Scale UOM field for fixing issue IS SC-00098673.
    //  5.45                        Rajesh                      Updated the code to show an alert in case new Price's Valid To is less than Valid To of existing price IS TI-00092473.
    //  5.46                        Shantanu Sharma             Added logic to populate Sales Order Item fiels values. 
/**********************************************************************************************************************
***********************************************Modification Log********************************************************
<PP20130422>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 Apr 2013
Description         :   1)Defaulting PC and KC on click of 'Add Prices' - APAC ROLLOUT1(5.24)
2)Added 'USD' and 'Per' columns for Approver and USD_Rate__c,Base_UoM__c in
Pricing Request Item query - APAC ROLLOUT1(5.25)
***********************************************************************************************************************
<PP20130423>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   23 Apr 2013
Description         :   Added logic for displaying UoMs present in Sales Area AND Material - APAC ROLLOUT1(5.26)
***********************************************************************************************************************
<PP20130424>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 Apr 2013
Description         :   1)Added logic to pass value to RelatedList if logged in user is Approver - APAC ROLLOUT1(5.27)
2)Added logic for USD Rate and Base UoM conversion - APAC ROLLOUT1(5.28)
***********************************************************************************************************************
<BR20130424>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   24 Apr 2013
Description         :   Added logic for Attachment section - APAC ROLLOUT1(5.29)                    
***********************************************************************************************************************
<PS20130425>
Last Modified By    :   Prachi Sinha
Last Modified Date  :   25 Apr 2013
Description         :   Adding Customer Group 2 in customer queries - APAC ROLLOUT1(5.30)
***********************************************************************************************************************
<PP20130427>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   27 Apr 2013
Description         :   1)Locale code modification - APAC ROLLOUT1(5.31)
2)Added a boolean variable for rendering 'Add Prices'/'Add Material' button on Pricing
Request page - APAC ROLLOUT1(5.32)
***********************************************************************************************************************
<VR20130509>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   09 May 2013
Description         :   1)Added logic for Extra key field Customer Hierarchy - APAC ROLLOUT1(5.33)
***********************************************************************************************************************
<VR20130510>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   10 May 2013
Description         :   1)Modifying Material query to query based on variable config field - APAC ROLLOUT1(5.34)
***********************************************************************************************************************
<VR20130510>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   10 may 2013 
Description         :   1)To display Sold to id as link and navigate to the Customer Master Page - APAC ROLLOUT1(5.35)
***********************************************************************************************************************
<PP20130524>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 May 2013
Description         :   Added logic for Plus/Minus -- If Plus/Minus code is null, sign of the rate remains the 
same as user enters, else sign is in accordance with the Plus/Minus code - APAC ROLLOUT1(5.36)
***********************************************************************************************************************
<PP20130614>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   14 June 2013
Description         :   Added logic to check for NPC Applicability of the access sequence- APAC ROLLOUT1(5.37)
***********************************************************************************************************************
<PP20130621>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   21 June 2013
Description         :   SIT Issue # 113 - To resolve rounding off issue on click of Save- APAC ROLLOUT1(5.38)  
************************************************************************************************************************
<BR20130701>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   01 July 2013
Description         :   SIT Issue  - To resolve onclick of task subjects in reports attachments should get displayed- APAC ROLLOUT1(5.39)  
***********************************************************************************************************************
<UD20130608>
Last Modified By    :   Utkarsh Dixit
Last Modified Date  :   06 August 2013
Description         :   Prod issue - added condition for Scale unit/scale uom  
***********************************************************************************************************************
<BR20130701>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   01 July 2013
Description         :   SIT Issue  - To resolve onclick of task subjects in reports attachments should get displayed- APAC ROLLOUT1(5.39)  
***********************************************************************************************************************
<NS20130821>
Last Modified By    :   Neeharika
Last Modified Date  :   21 Aug 2013
Description         :   1)Added 'Landing_Cost__c' fields to queries
*****************************************************************************************************************/
    
    
    
    //NPC-locale
    //  5.33                        Utkarsh                     Removing the comment at 2085 line
    //  5.34                        Neeha                       Calling relatedlistwrappers after clone buttons-  None
    //APAC roll out issue fix- Issue #165   
    //    5.35                                Neeharika                           APAC roll out fix- TO make scale type editable when 
    //pricing condition's scale type is null
    /***********************************************************************************************************************
<BB20130709>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   09 July 2013
Description         :   Added Standardized_Currency__c,Standardized_UoM__c in query of Pricing Request Item
- APAC ROLLOUT2(5.39)                                                                                           
/***********************************************************************************************************************
<PP20130711>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 July 2013
Description         :   Added 'Request_Class__c' fields to Pricing Request queries - APAC ROLLOUT2(5.40)
************************************************************************************************************************
<BB20130715>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   15 July 2013
Description         :  1) Replaced populateBaseUoM with populateBaseUoMAndAlternateUoM to populate the BaseUoM and
AlternateUoM- APAC ROLLOUT2(5.41)
2) Added a logic to check if the currency Conversion rate is defined for requested currency 
and standardized currency- APAC ROLLOUT2(5.41)
************************************************************************************************************************
<PP20130716>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   16 July 2013
Description         :   Added mandatory validation for Request Class in Import Request Page - APAC ROLLOUT2(5.42)
*****************************************************************************************************************
<BR20130626>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   26 June 2013
Description         :   Pricing Exception- APAC ROLLOUT2(5.43)
***********************************************************************************************************************
<VR20130719>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   19 Jul 2013
Description         :   Adding Logic for Creation of Floor and Reference Prices - APAC ROLLOUT2(5.46)
*****************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(5.47)
***********************************************************************************************************************
<PP20131010>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   10 October 2013
Description         :   SIT Issue FIX - 1. Floor Reference check should be avoided for Expiry - ROLLOUT2(5.48)
2. Hide 'Back' button for NPC click before saving - ROLLOUT2
****************************************************************************************************************
<PP20131022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2013
Description         :   Terms of Payment Key field - ROLLOUT2(4.0)
*****************************************************************************************************************
<PP20131028>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   28 October 2013
Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
***********************************************************************************************************************
<VR20131030>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   30 October 2013
Description         :   Modified the ERP Relationship query to add partner function code in the query - ROLLOUT2
***********************************************************************************************************************
<NE20131108>
Last Modified By    :   Neeharika P
Last Modified Date  :   8 November 2013
Description         :   Added .replace seperator for scale rates to fix prod issue.- IS ID-00037216
*****************************************************************************************************************
<PP20131108>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   8 November 2013
Description         :   Clear PH Filter on click of 'New Price' to avoid populating '#' - USAT Issue - ROLLOUT2
*****************************************************************************************************************
<PP20131115>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 November 2013
Description         :   DTT Rollout Issue - Changing daysbetween/30 to monthsBetween because validation is not working
properly
*****************************************************************************************************************
<PP20131216>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   16 December 2013
Description         :   Unit Testing - To avoid null pointer exception on clearing New Rate and saving it
***********************************************************************************************************************
<VR20131218>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   18 December 2013
Description         :   DTT Rollout Issue - Added the deletion flag
***********************************************************************************************************************
<PP20140101>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   1 January 2014
Description         :   PH Synchronous flow for NPC - ROLLOUT2 ENHANCEMENT
***********************************************************************************************************************
<VR20140109>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   9 January 2014
Description         :   DTT Rollout Issue - Added the logic to include customer currency check
***********************************************************************************************************************
<PP20140110>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   10 January 2014
Description         :   Additional UoM for F26C - 'MP' - DTT ROLLOUT ENHANCEMENT
***********************************************************************************************************************
<NE20140121>
Last Modified By    :   Neeharika P
Last Modified Date  :   21 January 2014
Description         :   Added to ignore empty columns in header - Production Issue
***********************************************************************************************************************
<PP20140305>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   5 March 2014
Description         :   CAPITAL PROJECT - Make 'Non-scale Price' as default
***********************************************************************************************************************
<TJ20140402>
Last Modified By    :   Tarun Jain
Last Modified Date  :   2 April 2014
Description         :   Added Default UOM and Default Per to the Pricing Request Object for both PH Codes and Materials
***********************************************************************************************************************
<BB20140404>
Last Modified By    :  Bisnupriya Budek
Last Modified Date  :  04 Arpril 2014
Description         :  CAPITAL PROJECT - Added Error_Indicator__c  in all the queries of Pricing_Request_Item__c 
*****************************************************************************************************************
<SP20140425> 
Last Modified By    :  Shiva
Last Modified Date  :  25 Apr 2014
Description         :  CAPITAL PROJECT - For Floor Reference Price View 
*****************************************************************************************************************
<SP20140428> 
Last Modified By    :  Shiva
Last Modified Date  :  28 Apr 2014
Description         :  CAPITAL PROJECT - For Config and non config materials
*****************************************************************************************************************
<BB20140429> 
Last Modified By    :  Bisnupriya Budek
Last Modified Date  :  29 Apr 2014
Description         :  CAPITAL PROJECT - Adding Default Currency for thr New Unit of request Item. 
****************************************************************************************************************
<MS20140506>
Last Modified By    :  Mohit Sinha
Last Modified Date  :  06 May 2014
Description         : Adding Link for landing page
***********************************************************************************************************************
<BB20140508>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   08 May 2014
Description         :   CAPITAL PROJECT -1.Added Customer_Order_Block_Code__c,Customer_Order_Block__c in all the ERP_Customer queries. 
2. Added Sales_Type_Code__c,Sales_Type__c  in all the Pricing_request_Item queries.
*****************************************************************************************************************
<SP20140509> 
Last Modified By    :  Shiva
Last Modified Date  :  09 May 2014
Description         :  CAPITAL PROJECT - Payment terms and fixed date
**********************************************************************************************************************
<PP20140512> 
Last Modified By    :  Priyanka
Last Modified Date  :  12 May 2014
Description         :  CAPITAL PROJECT - Adding code for PC KC concatenation on PAEditReqItem page
**********************************************************************************************************************
<AV20140515> 
Last Modified By    :  Abhijeet Vaishnab
Last Modified Date  :  15 May 2014
Description         :  CAPITAL PROJECT - Sales Volume requirement 
**********************************************************************************************************************
<PP20140520>
Last Modified By    :  Priyanka
Last Modified Date  :  20 May 2014
Description         :  CAPITAL PROJECT - Adding code for bulk NPC Calculation
**********************************************************************************************************************
<PP20140522>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 May 2014
Description         :   Added populating applicable variables to store Access Sequence on Import
**********************************************************************************************************************
<PP20140610>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   10 June 2014
Description         :   Populating default UoM on click of New link across a request item
**********************************************************************************************************************
<TJ20140908>
Last Modified By    :   Tarun Jain
Last Modified Date  :   08 September 2014
Description         :   Setting wrappersList for displaying only scale pricing columns
*********************************************************************************************************************<TJ20140908>
Last Modified By    :   Sumita Dabas
Last Modified Date  :   28 Jan 2016
Description         :   added if conditions to populate corresponding fields on PRItem only if parameter for them exists in Key combination, for IS ID-00061597 
*********************************************************************************************************************
Last Modified By    :   Madhurima Daggumati
Last Modified Date  :   29 Feb 2016
Description         :   Updated Query to populate End User Name on PRItem when PR is created through import functionality IS ID-00065371 
*********************************************************************************************************************
Last Modified By    :   Kunal Sharma
Last Modified Date  :   1 Aug 2016
Description         :   Added code to handle the null after adding material while craeting pricing request IS ID-00072189 
*********************************************************************************************************************
<MG20161227>
Last Modified By    :   Mansi gupta
Last Modified Date  :   27 Dec 2016
Description         :   Added validation for Valid from field for project pricing for BI EMEA Surfaces IS ID-00077268 
****************************************************************************************************************************
<PG20202707>
Last Modified By    :   Piyush Gupta
Last Modified Date  :   27 July 2020
Description         :   Added logic for Distributor Code in Import as well.
****************************************************************************************************************************
<AG20210112>
Last Modified By    :   Amandeep Gautam
Last Modified Date  :   12 January 2021
Description         :   Updated IF condition by including 'Reference'  IS SC-00097411.(Increased Version to 50.0 on 15Jan2021)

****************************************************************************************************************************
<Vk20210323>
Last Modified By    :   Vinay Kumar
Last Modified Date  :   23 March 2021
Description         :   Added null check for Scale UOM field for fixing issue IS SC-00098673
****************************************************************************************************************************
<RB20210903>
Last Modified By    :   Rajesh Barda
Last Modified Date  :   03 September 2021
Description         :   Updated the code to show an alert in case new Price's Valid To is less than Valid To of existing price IS TI-00092473.
                        Also updated the API Version from 50.0 to 53.0
****************************************************************************************************************************
<RB20211115>
Last Modified By    :   Rajesh Barda
Last Modified Date  :   15 November 2021
Description         :   Updated the code to avoid parsing the String value of Division Code to an Integer so that Import functionality works for non-integer division codes such as 'AB' (IS TI-00093040).

****************************************************************************************************************************
<RB20211202>
Last Modified By    :   Rajesh Barda
Last Modified Date  :   02 December 2021
Description         :   Updated the SOQL Query to populate End User name having partner function code ZQ when using Import Prices functionality (IS TI-00093173).
****************************************************************************************************************************
<KS20220614>
Last Modified By    :   Kanchan Solanki
Last Modified Date  :   14 June 2022
Description         :   Update the Document currency code in order to avoid duplicate prices(IS EI-00094808).

**********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic to include Sales Order Item and Sales Order Item Code values- CRM-2022-07-0225

**********************************************************************************************************************
<SS20221104>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   4 Nov 2022
 Description        :   Added logic to validate Payer values while importing - IS EI-00096282
 
**********************************************************************************************************************
<SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   05 May 2023
 Description        :   P80 M&M Changes
****************************************************************************************************************************/
    public String seperatorOnPage{get{
        Decimal standardDecimal = 1.1;
        String localeDecimalStr = standardDecimal.format();
        String seperator = localeDecimalStr.subString(1,2);
        return seperator;
    }set;}
    //<BR20130424>  Ver 5.29
    public String taskAttachmentParam{get;set;}
    //sanjib for pcl
    //public boolean floorPricingCheck=false;
    public list<PAwrapper> listofwrappertables{
        get{
            //Brundha Roll out 2 <BR20130626> -- <NS20130821> Added Landing_Cost__c field to query select clause
            //<PP20131028>
            list<Pricing_Request_Item__c> listofDynamicTables=new list<Pricing_Request_Item__c>();
            //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            //<BB20140404> Added Error_Indicator__c  in the query
            //<BB20140508> Added Sales_Type_Code__c,Sales_Type__c  in the query 
            //<MS20140515> Added Variant and SalesOrderType fields in the query
            List<Pricing_Request_Item__c> pricingReqItemObjList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequestItem', 'pricingReqItemObj', ' Pricing_Request__c = \''+request.pricingRequest.Id+'\' ORDER BY PCKC__c,Gap__c');
            for(Pricing_Request_Item__c pricingReqItemObj : pricingReqItemObjList)
            {
                
                listofDynamicTables.add(pricingReqItemObj);
            }
            Decimal separatorCheckPCL = 1.1;
            //if(test.isrunningtest())
            //separatorCheckPCL = 1100.00;
            string separatorPCL = separatorCheckPCL.format().subString(1,2);
            if(separatorPCL==',') {
                for(Pricing_Request_Item__c sapObj : listofDynamicTables) {
                    if(sapObj.Rate__c!=null && sapObj.Rate__c.contains('.')) {
                        sapObj.Rate__c = sapObj.Rate__c.replace('.',',');
                    }
                }
            }
            
            list<String> codetobeused=new list<String>();
            list<String> texttobeused=new list<String>();
            String Sapcluster,SalesOrgCode;
            if(listofDynamicTables.size()>0)
            {
                Sapcluster=listofDynamicTables[0].SAP_Cluster__c;
                SalesOrgCode = listofDynamicTables[0].Sales_Org_Code__c;
            }
            listofwrappertables=new list<PAwrapper> ();
            for(Pricing_Request_Item__c sapObj1 : listofDynamicTables) {
                String material=sapObj1.Material_Code__c;
                codetobeused.add(material);
            }
            
            list<Material_Localization__c> salestext=new list<Material_Localization__c>();
            salestext=[Select Sales_Text__c,Material__r.ERP_Material_code__c from Material_Localization__C Where Material__r.ERP_Material_code__c in:codetobeused 
                       and Material__r.RecordType.name ='ERP Material - Extended Data' and Language__c ='EN' 
                       and Material__r.ERP_Source_Cluster__C=:Sapcluster and Material__r.ERP_Sales_Org_Code__c=:SalesOrgCode];
            
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
            
            //for(Integer i=0; i<codetobeused.size(); i++){
            //}
            Integer i = 0;
            for(string s1:codetobeused){
                //salestext=[Select Sales_Text__c from Material_Localization__c Where Material__r.ERP_Material_Code__c in:codetobeused and Material__r.RecordType ='ERP Extended Data' and Language ='EN'];
                PAwrapper s=new PAwrapper();
                
                if(listofDynamicTables != null && listofDynamicTables.size() >0) {
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
            
            
            return listofwrappertables;
            
        }set;
        
    }
    
    //added for NPC-new req
    public String viewClicked {get;set;}
    public PANetPriceDetail netPriceDetail{get;set;} 
    //emd
    
    //<TJ20140908>
    public boolean scaleFlag
    {
        get
        {
            if(scaleFlag==null)
                scaleFlag=false;
            return scaleFlag;
        }
        set
        {
            scaleFlag=value;
        }
    }
    //<TJ20140908>
    public boolean scale{get;set;}
    //<TJ20140908>
    public boolean scalePrices{get;set;}
    // <SP20140425> - START
    public boolean floorpermissioncheck{ // SS20230501 - permissionset assignment check 
	get{
	PermissionSetAssignment[] psa = [SELECT Id,PermissionSetId FROM PermissionSetAssignment WHERE AssigneeId = :UserInfo.getUserId() AND PermissionSetId IN (SELECT Id FROM PermissionSet WHERE Name ='Floor_section_enabler')];
	 if(psa.size()>0)
	 {
	 floorpermissioncheck = True;
	 }
	 else
	 {
	 floorpermissioncheck = False;
	 }
	 return floorpermissioncheck;
	}
	set{}
	}
    public boolean HideFloorSec{//SS20230501 - Enabling/disabling view floor pricing  
     get{
            List<HideFloorSection__mdt> hfs = HideFloorSection__mdt.getAll().values();
            for(integer i=0; i<hfs.size(); i++){
                if(hfs[i].Label == request.pricingRequest.BU__c && (request.requestServiceState.ogitems.isBUAdmin || floorpermissioncheck == True))
                {               
                    HideFloorSec= false; 
                    break;
                }
                else
                {
                  if(hfs[i].Label != request.pricingRequest.BU__c)
                  {
                     HideFloorSec = False; 
                  }
                  else
                  {
                  HideFloorSec = true;
                  break;
                  }
                }
            } 
            return HideFloorSec;           
        }              
        set{}
    }
    public boolean priceViewClicked 
    {
        get
        {
            if(priceViewClicked == null) 
            {  
                priceViewClicked = false;
            }
            return priceViewClicked;
        }
        set
        {
            priceViewClicked = value;
        }
    }
    
    //<SP20140425> - END
    
    // <SP20140509> - START
    public boolean paytermsClicked 
    {
        get
        {
            if(paytermsClicked == null) 
            {  
                paytermsClicked = false;
            }
            return paytermsClicked;
        }
        set
        {
            paytermsClicked = value;
        }
    }
    //<SP20140509> - END
    
    //<PP20140512> START
    public String actionValue {get; set;}
    public List<SelectOption> pcKCOptionsList {get; set;}
    //<PP20140512> END
    
    
    public static final Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
    //<PP20140326> START
    public static String materialSObjectType
    {
        get
        {
            return  String.valueOf(Material__c.sObjectType);
        }
        set;
    }
    public static String materialFieldsList
    {
        get
        {
            return 'Name';
        }
        set;
    }
    public String materialWhereClause
    {
        get
        {
            return 'RecordType.Name=\'ERP Material - Extended Data\' AND ERP_Sales_Org_Code__c = \''+ request.pricingRequest.Sales_Org_Code__c + '\' AND ERP_Deletion_Flag__c = false AND ERP_Distribution_Channel_Code__c = \'' + request.pricingRequest.Dist_Channel_Code__c + '\' AND ERP_Source_Cluster__c = \'' + request.pricingCondition.pricingCondition.SAP_Cluster__c +'\'';  
        }
        set;
    }
    public static String phSObjectType
    {
        get
        {
            return  String.valueOf(BU_PH__c.sObjectType);
        }
        set;
    }
    public static String phFieldsList
    {
        get
        {
            return 'Business_Description__c';
        }
        set;
    }
    public String phWhereClause
    {
        get
        {
            OrgGroup__c BU = [SELECT ID,Owning_Business__c FROM OrgGroup__c where Business__c = :request.pricingRequest.BU__c AND RecordType.Name = 'Business'];
            String BUId = BU.Id;
            
            return 'OrgGroup__c = \''+BUId+'\'';    
        }
        set;
    }
    public static String frbSObjectType
    {
        get
        {
            return  String.valueOf(Profit_Center__c.sObjectType);
        }
        set;
    }
    public static String frbFieldsList
    {
        get
        {
            return 'ERP_Profit_Center__c';
        }
        set;
    }
    public String frbWhereClause
    {
        get
        {
            OrgGroup__c BU = [SELECT ID,Owning_Business__c FROM OrgGroup__c where Business__c = :request.pricingRequest.BU__c AND RecordType.Name = 'Business'];
            string frbCode4 = BU.Owning_Business__c;
            frbCode4.toUpperCase();
            
            return 'ERP_Profit_Center__c = \''+ frbCode4+'\'';  
        }
        set;
    }
    
    //<PP20140326> END
    //<TJ20141230> Added variable to capture Task ID
    public Task taskID{get
    {
        if(request.pricingRequest.Request_Approval_Status__c=='Approved')
            //[AJ20151223] Changes related to archival task issue by adding all rows.
            taskID=[Select id from Task where whatId=:request.pricingRequest.Id and status!='Cancelled' limit 1 all rows];
        return taskID;
    }
                       set;}
    //public static final Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
    //added for NPC
    public boolean netPricingFlag{get;set;} //to mandate NetPricing button click
    public PACalculateNetPrice calNetPrice{get;set;} //UD  for NPC
    public Boolean isRequestItemSaved{get;set;} //neeha for NPC
    public Boolean showFloorRefSection{get;set;} //neeha for NPC
    private Date pricingReqItemVFrom{get;set;}
    private Date pricingReqItemVTo{get;set;}
    private List<String> pricingReqItemScaleRateList{get;set;}
    private List<String> pricingReqItemScaleQuantityList{get;set;}
    private Boolean isScaledRateSaved{get;set;}
    private Pricing_Request_item__c pricingReqItemIsChanged{get;set;}
    //NPC end
    
    //<PP20130614> -- Added for NPC Applicable check -- Ver 5.37
    public boolean isNPCApplicableFlag {get;set;}
    
    //<PP20140101>
    public boolean isPHSynchronousFlag {get;set;}
    
    public PARequest request{get;set;}
    public Pricing_Request_Item__c pricingReqItem{get;set{
        pricingReqItem = value;
        if(pricingReqItem!=null && pricingReqItem.FixValDate__c != null){
            //request.fixValDateFilter =(string)pricingReqItem.FixValDate__c;
        }else{
            request.fixValDateFilter = '';
        }
    }   
                                                 } //added on jan 7th
    /*used for rendering error messages */
    //addded for attachment
    public List<PAWrapper> attachPAWrapperList{get;set;}
    public boolean selectAllAttachments{get;set;}
    public Attachment document {
        get {
            if (document == null)
                document = new Attachment();
            return document;
        }
        set;
    }
    
    public String enableScale {get;set;}
    
    public List<PARelatedList> relatedWrappersList{get;set;}
    public PAApprovalWF approvalWF{get;set;}
    /*used for rendering error messages */
    public  String gapCheck{get;set;}        //todecide vch gap record has to be created
    //added on jan 9th required for security
    public Boolean showApproverPermission{get;set;}
    //To display the header dynamically
    public String headerTitle{get;set;}
    
    //Ver 5.31 adding a string to display Generate PCL button
    public String pclDisplayString{get;set;}
    //<TJ20150202>
    public Integer offsets{get;set;}
    public boolean nextFlag{get;set;}
    public boolean prevFlag{get;set;}
    public boolean prevPage{get;set;}
    public boolean nextPage{get;set;}
    public Integer fromSet{get;set;}
    public Integer toSet{get;set;}
    public Integer totalRecrds{get;set;}
    //<TJ20150511>
    public boolean prItemExp{get;set;}
    public integer scalevalsold{get;set;}
    public integer scalevalsnew{get;set;}
    public boolean impExp{get;set;}
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT id FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :request.pricingRequest.Id ORDER BY PCKC__c,Gap__c limit 400])); 
                con.setPageSize(5);                      
            }
            return con;
        }
        set;
    }
    
    public List<Pricing_Request_Item__c> getlistMember(){
        return (List<Pricing_Request_Item__c>)con.getRecords();
    }
    
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
    
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
    
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
    
    public void first() {
        con.first();
    }
    
    public void last() {
        con.last();
    }
    
    public void previous() {
        con.previous();
    }
    
    public void next() {
        con.next();
    }
    
    public void cancel() {
        con.cancel();
    }
    //Flag used to display pop up
    public String popUpFlag {get;set{
        System.debug('Value popup flag:'+value);
        popUpFlag = value;
        //UPdate the view state 
        if(request.requestServiceState.currentRequest.pricingRequest.id!=null) 
        {
            Pricing_Request__c updatedReq = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+request.requestServiceState.currentRequest.pricingRequest.id+'\''))[0];
            request.requestServiceState.currentRequest.pricingRequest = updatedReq;
            /*request.requestServiceState.currentRequest.pricingCondition.pricingCondition.Pricing_Condition_Code__c = request.requestServiceState.currentRequest.pricingRequest.Pricing_Condition__c;
request.requestServiceState.currentRequest.keyCombination.erpKeyCombination.Key_Combination_Code__c = request.requestServiceState.currentRequest.pricingRequest.Key_Combination__c;
*/
            relatedWrappersList=getListWrappers();
            System.debug('PC, kc:'+updatedReq.Pricing_Condition__c+'-'+updatedReq.Key_Combination__c);
        }
        else
            system.debug('Request Id is null!');     
    }}
    //Used to hold the csv file to be imported
    public Blob contentFile {get;set;}
    //Used to hold the Log for Import
    private List<PAWrapper> rejectedRecordsList {get;set;}
    //Used to display the Record Count
    public Integer recordCount {get;set;}
    //<VR20130510> Used to hold the Sold to Id (5.35)
    public string soldToId {get;set;}
    /* added on jan 19th
It holds the instance of ERP_Sales_Prices SAP record to which the pricing request item is linked to */
    public  ERP_Sales_Prices_SAP__c relatedERPSAPPrice{get;set;}
    public  Sales_Prices__c relatedNonSAPPrice{get;set;}
    //It holds whether scale or non scale is selected in the page.. TO BE removed once flow is done
    public String scaleOrNonScale {get;set;}
    /* end*/
    /*to display cuurency list */
    /* 21 jan */
    public Pricing_Request_Item__c perm_leftGapPricingReqItem {get;set;}
    public Pricing_Request_Item__c perm_rightGapPricingReqItem {get;set;}
    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
    private List<Sobject> appHolderList{get;set;}
    public boolean showExpireMsg {get;set;}
    public boolean showPriceCheck {get;set;}
    public boolean showPriceTail {get;set;} //<RB20210903> new variable added as a part of the update.
    public boolean showGapError{get;set;}
    public String clickOk{get;set;}
    
    //Decimal separator according to locale
    private String separator ;
    //Decimal separator according to locale
    private String nonLocaleSeparator ;
    /* 21 jan end */
    /*For Project price*/
    public PAProjectPrice paProjectPrice{get;set;}
    //for Pricing Task Rebate
    public boolean displaySubmitButton{get;set;}
    
    /*end*/
    //popuating KC SFDC description
    //<PP20130422> - Ver 5.24 - Changed Id to String
    private Map<String,String> kcIdandKcDescMap{get;set;}
    
    //to show rounf off alert
    public boolean showRoundOffPopUp{get;set;}
    /*to display scale Unit list*/
    
    //adding variables for overriding
    public String recordTypeName{get;set;}
    public Task taskRecord{get;set;}
    
    //Ver 5.32
    public TaskReassign taskReassignCall{get;set;}
    
    //<MS20140926>
    public boolean continueFlag{get;set;}
    
    public List<PARelatedList> relatedListProjectTaskRecords {get;set;}
    public String currentPageId{get;set;}
    public Pricing_Request__c pricingRequest{get;set;}
    public Project_Price__c projectprice{get;set;}
    public PAServiceState requestServiceState{get;set;}
    public PAPricingCondition PricingConditionState{get;set;}
    public PASalesPriceSAP salesPriceSAP{get;set;}
    //<AV20140515>
    public boolean volumeFlag{
        get
        {
            if(volumeFlag == null) 
            {  
                volumeFlag = false;
            }
            return volumeFlag;
        }
        set
        {
            volumeFlag = value;
        }}
    public String newVolume{get;set;}
    public String newUOM{get;set;}
    //<TJ20150610>
    public String popupValue{get;set;}
    //Shiva-LandingCost Commenting fr landing cost deployement
    //public static boolean fixForBlankField=false;
    //public PAERPCustomer customer{get;set;}
    //public ERP_Key_Combination__c ERPKeyCombination{get;set;}
    //public ERP_Pricing_Condition__c pricingCondition{get;set;}
    
    //<PP20130427> -- Ver 5.32 START
    //To display 'Add Prices'/'Add Material' button on Pricing Request page
    //<PP20140522> START
    //<TJ20141106> START
    public boolean displayAddPricesButton
    {
        set;
        get
        {
            this.displayAddPricesButton = true;
            if(request != null && request.pricingRequest != null && request.pricingRequest.Id != null)
            {
                List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
                priList = [SELECT Id, Pricing_Request__r.Request_Type__c, Pricing_Request__r.Pricing_Request_Type__c FROM Pricing_Request_Item__c
                           WHERE Pricing_Request__c = :request.pricingRequest.Id LIMIT 1];
                if(priList.size() > 0)
                {
                    this.displayAddPricesButton = false;
                }
                if(priList.size() > 0 && ((priList[0].Pricing_Request__r.Request_Type__c == 'Customer Specific'
                                           && (priList[0].Pricing_Request__r.Pricing_Request_Type__c == 'Permanent'|| priList[0].Pricing_Request__r.Pricing_Request_Type__c == 'Pricing Task')) || priList[0].Pricing_Request__r.Request_Type__c == 'Non Customer Specific' || priList[0].Pricing_Request__r.Request_Type__c == 'Massive'))
                {
                    this.displayAddPricesButton = true;
                }
                System.debug('***prankyget'+this.displayAddPricesButton);           
            }
            return this.displayAddPricesButton;
        }
    }   
    public boolean displayAddMaterialButton
    {
        set;
        get
        {
            this.displayAddMaterialButton = true;
            if(request != null && request.pricingRequest != null && request.pricingRequest.Id != null)
            {
                List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
                priList = [SELECT Id, Pricing_Request__r.Request_Type__c, Pricing_Request__r.Pricing_Request_Type__c FROM Pricing_Request_Item__c
                           WHERE Pricing_Request__c = :request.pricingRequest.Id LIMIT 1];
                if(priList.size() > 0 && ((priList[0].Pricing_Request__r.Request_Type__c == 'Customer Specific'
                                           && (priList[0].Pricing_Request__r.Pricing_Request_Type__c == 'Permanent' || priList[0].Pricing_Request__r.Pricing_Request_Type__c == 'Pricing Task')) || priList[0].Pricing_Request__r.Request_Type__c == 'Non Customer Specific' || priList[0].Pricing_Request__r.Request_Type__c == 'Massive'))
                {
                    this.displayAddMaterialButton = false;
                }
            }
            return this.displayAddMaterialButton;
        }
    }
    //<TJ20141106> END
    //<PP20140522> END
    //<PP20130427> -- Ver 5.32 END
    
    //<MS20140514> Populating Variant and Sales Order Type START
    public void populateNewKeyFields(String PICK_SELECT)
    {   
        //For populating Variant
        List<string> splitVariantValueList = new List<string>();
        if(request.variantFilter!=null && request.variantFilter!=PICK_SELECT   && request.variantFilter!='')
        {
            splitVariantValueList = request.variantFilter.split('-',2);
            if(splitVariantValueList.size()!=0)
            {
                //added if condition to populate Variant on PRItem only if Variant exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Variant'))
                {
                    pricingReqItem.Variant_Code__c = splitVariantValueList[0];
                    pricingReqItem.Variant__c=splitVariantValueList[1];
                }
                //added if condition to populate Variant on PRItem only if Variant exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
            }
        }
        //For populating Contract
        List<string> splitContractValueList = new List<string>();
        if(request.contractFilter!=null && request.contractFilter!=PICK_SELECT   && request.contractFilter!='')
        {
            splitContractValueList = request.contractFilter.split('-',2);
            if(splitContractValueList.size()!=0)
            {
                //added if condition to populate Contract No. on PRItem only if Contract No. exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Contract No.'))
                {
                    pricingReqItem.Contract_Code__c = splitContractValueList[0];
                    pricingReqItem.Contract__c=splitContractValueList[1];
                }
                //added if condition to populate Contract No. on PRItem only if Contract No. exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
            }
        }
        //For populating Sales Order Type
        List<string> splitSOTValueList = new List<string>();
        if(request.salesOrderTypeFilter!=null && request.salesOrderTypeFilter!=PICK_SELECT   && request.salesOrderTypeFilter!='')
        {
            splitSOTValueList = request.salesOrderTypeFilter.split('-',2);
            if(splitSOTValueList.size()!=0)
            {
                //added if condition to populate Sales Order Type on PRItem only if Sales Order Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales Order Type'))
                {
                    pricingReqItem.Sales_Order_Type_Code__c = splitSOTValueList[0];
                    pricingReqItem.Sales_Order_Type__c=splitSOTValueList[1];
                }
                //added if condition to populate Sales Order Type on PRItem only if Sales Order Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
            }
        }
        //For populating Sales Order Item
        List<string> splitSOIValueList = new List<string>();
        if(request.salesOrderItemFilter!=null && request.salesOrderItemFilter!=PICK_SELECT   && request.salesOrderItemFilter!='')
        {
            splitSOIValueList = request.salesOrderItemFilter.split('-',2);
            if(splitSOIValueList.size()!=0)
            {
                //<SS20220826> Added if condition to populate Sales Order Item on PRItem only if Sales Order Item exists in Key combination START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales Order Item'))
                {
                    pricingReqItem.Sales_Order_Item_Code__c = splitSOIValueList[0];
                    pricingReqItem.Sales_Order_Item__c=splitSOIValueList[1];
                }
                //<SS20220826> Added if condition to populate Sales Order Item on PRItem only if Sales Order Item exists in Key combination END
            }
        }
        //For populating Value Center
        List<string> splitVCValueList = new List<string>();
        if(request.valueCenterFilter!=null && request.valueCenterFilter!=PICK_SELECT   && request.valueCenterFilter!='')
        {
            splitVCValueList = request.valueCenterFilter.split('-',2);
            if(splitVCValueList.size()!=0)
            {
                //<SS20230501> Added if condition to populate Value Center on PRItem only if Value Center exists in Key combination START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Value Center'))
                {
                    pricingReqItem.Value_Center_Code__c = splitVCValueList[0];
                    pricingReqItem.Value_Center__c=splitVCValueList[1]; 
                }
                //<SS20230501> Added if condition to populate Value Center on PRItem only if Sales Order Item exists in Key combination END
            }
        }
        //For populating Material Group 2
        List<string> splitMG2ValueList = new List<string>();
        if(request.materialGroup2Filter!=null && request.materialGroup2Filter!=PICK_SELECT   && request.materialGroup2Filter!='')
        {
            splitMG2ValueList = request.materialGroup2Filter.split('-',2);
            if(splitMG2ValueList.size()!=0)
            {
                //<SS20230501> Added if condition to populate MG2 on PRItem only if Material Group 2 exists in Key combination START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Group 2'))
                {
                    pricingReqItem.Material_Group_2_Code__c = splitMG2ValueList[0];
                    pricingReqItem.Material_Group_2__c=splitMG2ValueList[1]; 
                }
                //<SS20230501> Added if condition to populate MG2 on PRItem only if Sales Order Item exists in Key combination END
            }
        } 
        //For populating External Material Group 
        List<string> splitEMGValueList = new List<string>();
        if(request.extMaterialGroupFilter!=null && request.extMaterialGroupFilter!=PICK_SELECT   && request.extMaterialGroupFilter!='')
        {
            splitEMGValueList = request.extMaterialGroupFilter.split('-',2);
            if(splitEMGValueList.size()!=0)
            {
                //<SS20230501> Added if condition to populate External Material Group  on PRItem only if External Material Group  exists in Key combination START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Ext Matl Grp'))
                {
                    pricingReqItem.Ext_Matl_Grp_Code__c = splitEMGValueList[0];
                    pricingReqItem.Ext_Matl_Grp__c =splitEMGValueList[1];
                }
                //<SS20230501> Added if condition to populate External Material Group on PRItem only if External Material Group  exists in Key combination END
            }
        }
        //<SS20230501> For populating shipping condition 
        List<string> splitSHPValueList = new List<string>();
        if(request.ShippingConditionFilter!=null && request.ShippingConditionFilter!=PICK_SELECT   && request.ShippingConditionFilter!='')
        {  
            splitSHPValueList = request.ShippingConditionFilter.split('-',2);
            if(splitSHPValueList.size()!=0)
            {
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Shipping Condition'))
                {
                    pricingReqItem.Shipping_Condition_Code__c = splitSHPValueList[0];
                    pricingReqItem.Shipping_Condition__c = splitSHPValueList[1];
                }    
            }
        }  
        //For populating Price Zone
        List<string> splitPZValueList = new List<string>();
        if(request.prizeZoneFilter!=null && request.prizeZoneFilter!=PICK_SELECT   && request.prizeZoneFilter!='')
        {
            splitPZValueList = request.prizeZoneFilter.split('-',2);
            if(splitPZValueList.size()!=0)
            {
                //<SS20230501> Added if condition to populate Price Zone on PRItem only if Price Zone exists in Key combination START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Price Zone'))
                {
                    pricingReqItem.Price_Zone_Code__c = splitPZValueList[0];
                    pricingReqItem.Price_Zone__c =splitPZValueList[1];
                }
                //<SS20230501> Added if condition to populate Price Zone on PRItem only if Price Zone exists in Key combination END
            }
        }                       
        List<string> splitComPartnerValueList = new List<string>();
        if(!String.isBlank(request.comPartnerFilter)){           
            pricingReqItem.ComPartner_Code__c = request.comPartnerFilter;
            pricingReqItem.ComPartner__c = request.comPartnerNameFilter;
        }
        List<string> splitMaterialGroup5KeyValueList = new List<string>();
        if(request.materialGroup5KeyFilter!=null && request.materialGroup5KeyFilter!=PICK_SELECT   && request.materialGroup5KeyFilter!='')
        {
            splitMaterialGroup5KeyValueList = request.materialGroup5KeyFilter.split('-',2);
            if(splitMaterialGroup5KeyValueList.size()!=0)
            {
                //added if condition to populate Material Group 5 Key on PRItem only if Material Group 5 Key exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Group 5 Key'))
                {
                    pricingReqItem.Material_Group_5_Key_Code__c = splitMaterialGroup5KeyValueList[0];
                    pricingReqItem.Material_Group_5_Key__c=splitMaterialGroup5KeyValueList[1];
                }
                //added if condition to populate Material Group 5 Key on PRItem only if Material Group 5 Key exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
            }
        }
        List<string> splitPlantValueList = new List<string>();
        if(request.PlantFilter!=null && request.PlantFilter!=PICK_SELECT   && request.PlantFilter!='')
        {
            splitPlantValueList = request.PlantFilter.split('-',2);
            if(splitPlantValueList.size()!=0)
            {
                pricingReqItem.Plant_Code__c = splitPlantValueList[0];
                pricingReqItem.Plant__c=splitPlantValueList[1];
            }
        }
       /* List<string> splitShippingConditionValueList = new List<string>();
        if(request.ShippingConditionFilter!=null && request.ShippingConditionFilter!=PICK_SELECT   && request.ShippingConditionFilter!='')
        {
            splitShippingConditionValueList = request.ShippingConditionFilter.split('-',2);
            if(splitShippingConditionValueList.size()!=0)
            {
                pricingReqItem.ComPartner_Code__c = splitShippingConditionValueList[0];
                pricingReqItem.ComPartner__c=splitShippingConditionValueList[1];
            }
        } */
        List<string> splitDestinationCountryValueList = new List<string>();
        if(request.DestinationCountryFilter!=null && request.DestinationCountryFilter!=PICK_SELECT   && request.DestinationCountryFilter!='')
        {
            splitDestinationCountryValueList = request.DestinationCountryFilter.split('-',2);
            if(splitDestinationCountryValueList.size()!=0)
            {
                pricingReqItem.ComPartner_Code__c = splitDestinationCountryValueList[0];
                pricingReqItem.ComPartner__c=splitDestinationCountryValueList[1];
            }
        }
        List<string> splitPartnerZFValueList = new List<string>();
        if(!String.isBlank(request.partnerZFFilter)){           
            pricingReqItem.Partner_ZF_Code__c = request.partnerZFFilter;
            pricingReqItem.Partner_ZF__c = request.partnerZFNameFilter;
        }
        List<string> splitPayerValueList = new List<string>();
        if(!String.isBlank(request.payerFilter)){           
            pricingReqItem.Payer_Code__c = request.payerFilter;
            pricingReqItem.Payer__c = request.payerNameFilter;
        }
        if(!String.isBlank(request.discRefNoFilter)){
            pricingReqItem.Disc_Ref_No__c = request.discRefNoFilter;
        }
        /*if(!String.isBlank(request.fixValDateFilter)){
pricingReqItem.FixValDate__c = Date.valueOf(request.fixValDateFilter);
}*/
        
        if(pricingReqItem.FixValDate__c!=null ){
            pricingReqItem.FixValDate__c = Date.valueOf(pricingReqItem.FixValDate__c);
        }
    }
    //<MS20140514> Populating Variant and Sales Order Type END
    public List<SelectOption> erpScaleCurrencyList{
        get
        {
            system.debug('***erpScaleCurrencyList : '+erpScaleCurrencyList);
            
            if(erpScaleCurrencyList==null)
            {
                list<selectOption> erpScaleCurrencyList = new list<selectOption>();
                system.debug('************');
                List<String> curr = new List<String>();
                if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null &&request.requestServiceState.ogItems.orgGroupItems.ERP_Currency__c!=null)
                {
                    curr = request.requestServiceState.ogItems.orgGroupItems.ERP_Currency__c.split(';');
                }
                system.debug('^#### curr ^'+curr);
                for(String X:curr)
                {
                    erpScaleCurrencyList.add(new SelectOption(X,X));
                }
                return erpScaleCurrencyList;
            }
            if(request.pricingCondition.pricingCondition.Scale_Base__c=='Value Scale' && request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency' && pricingReqItem.Scaled_Price_Flag__c==true && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
            {
                pricingReqItem.Scale_UoM_Scale_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
            }                
            else if(request.pricingCondition.pricingCondition.Scale_Base__c=='Value Scale' && request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency' && pricingReqItem.Scaled_Price_Flag__c==true && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
            {
                pricingReqItem.Scale_UoM_Scale_Unit__c=request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c;
            }
            system.debug('++++++'+erpScaleCurrencyList);
            
            return erpScaleCurrencyList;
        }
        set;
    }
    
    public List<selectOption> erpCurrencyList{
        get
        {
            //sanjib
            if(erpCurrencyList==null)
            {
                list<selectOption> erpCurrencyList = new list<selectOption>();
                Set<SelectOption> erpCurrencySet = new Set<SelectOption>();
                system.debug('************');
                if(request.pricingCondition.pricingCondition.Calculation_Type__c!=null && request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))
                {
                    system.debug('@@@@@@@@@@@');
                    erpCurrencyList.add(new SelectOption('%','%'));
                }
                else
                {
                    List<String> curr = new List<String>();
                    
                    if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null &&request.requestServiceState.ogItems.orgGroupItems.ERP_Currency__c!=null)
                    {
                        curr = request.requestServiceState.ogItems.orgGroupItems.ERP_Currency__c.split(';');
                    }
                    
                    system.debug('^#### curr ^'+curr);
                    
                    for(String X:curr)
                    {
                        //erpCurrencyList.add(new SelectOption(X,X));
                        erpCurrencySet.add(new SelectOption(X,X));
                    }
                    if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null &&request.requestServiceState.ogItems.orgGroupItems.Include_Customer_Currency__c && (request.pricingRequest.Request_Type__c == 'Customer Specific' || request.pricingRequest.Request_Type__c == 'Massive')&&request.requestServiceState.erpCustomer!=null&&request.requestServiceState.erpCustomer.paERPCustomer!=null && request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c!=null)
                    {
                        erpCurrencySet.add(new SelectOption(request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c,request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c));
                    }
                    //<PP20140610> START
                    if(request.pricingRequest.Default_Currency__c != null)
                    {
                        erpCurrencySet.add(new SelectOption(request.pricingRequest.Default_Currency__c,request.pricingRequest.Default_Currency__c));
                    }
                    if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null && request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency')
                    {
                        if(request.pricingRequest.Request_Type__c=='Customer Specific')
                            erpCurrencySet.add(new SelectOption(request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c,request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c));
                    }
                    system.debug('&&***'+erpCurrencySet);
                    erpCurrencyList.addAll(erpCurrencySet);
                    if(erpCurrencyList.size()>1 )
                    {
                        erpCurrencyList.add(0,new SelectOption('--Select--','--Select--'));
                    }
                    if(request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency' && pricingReqItem.New_Unit__c==null && request.pricingRequest.Pricing_Request_Type__c!='Pricing Task')
                    {
                        pricingReqItem.New_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
                    }                
                    else if(request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency' && pricingReqItem.New_Unit__c==null && request.pricingRequest.Pricing_Request_Type__c!='Pricing Task')
                    {
                        pricingReqItem.New_Unit__c=request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c;
                    }
                }
                return erpCurrencyList;
                
            }
            system.debug('++++++'+erpCurrencyList);
            return erpCurrencyList;
        }
        set;
    }
    
    /*to display UOM list */
    public List<selectOption> erpUoMList{
        
        get{
            
            if(erpUoMList==null)
            {
                list<selectOption> erpUoMList = new list<selectOption>();
                Set<SelectOption> erpUoMSet = new Set<SelectOption>();
                system.debug('************');
                
                List<String> UoM = new List<String>();
                
                if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null &&request.requestServiceState.ogItems.orgGroupItems.ERP_UoM__c!=null)
                {
                    UoM = request.requestServiceState.ogItems.orgGroupItems.ERP_UoM__c.split(';');
                    
                }
                
                system.debug('^#### UoM ^'+UoM);
                //Bala - adding condition for non commercial product as well //neeha  String.isBlank(pricingReqItem.material_code__c || pricingReqItem.Non_Commercial_Products__c
                if( (request.pricingRequest.Pricing_Request_Type__c!='Pricing Task' && String.isBlank(pricingReqItem.material_code__c)) || (request.pricingRequest.Pricing_Request_Type__c=='Pricing Task')) 
                    for(String X:UoM)
                {         System.debug('Uom set*** sales area');
                 //erpCurrencyList.add(new SelectOption(X,X));
                 erpUoMSet.add(new SelectOption(X,X));
                }
                system.debug(Logginglevel.Error,'request.pricingRequest.Pricing_Request_Type__c is '+request.pricingRequest.Pricing_Request_Type__c);
                //return erpUoMList;
                //Adding for UoM requirement - bala 5.28 UAT requirement
                //added request.pricingRequest.Pricing_Request_Type__c!='Pricing Task' -neeha
                if(pricingReqItem!=null && pricingReqItem.id!=null && request.pricingRequest.Pricing_Request_Type__c!='Pricing Task' )
                {
                    System.debug('***in mater conv');
                    if(pricingReqItem.material_code__c!=null)
                    {
                        //Added by George to fix issue#IS ID-00043256, Added filter on UOM based on SAP cluster
                        system.debug(pricingReqItem.material_code__c+' '+UoM+' '+pricingReqItem.SAP_Cluster__c);
                        List<ERP_Material_Conversion_Factor__c> mcfList = [SELECT Alternative_UoM__c FROM ERP_Material_Conversion_Factor__c WHERE 
                                                                           Material__r.ERP_Material_code__c=:pricingReqItem.material_code__c AND Alternative_UoM__c IN:UoM AND Material__r.ERP_Source_Cluster__c=:pricingReqItem.SAP_Cluster__c];
                        for(ERP_Material_Conversion_Factor__c ermcf:mcfList)
                        {
                            erpUoMSet.add(new SelectOption(ermcf.Alternative_UoM__c,ermcf.Alternative_UoM__c)); 
                        }
                    }
                }
                System.debug('Uom set1***'+erpUoMSet);
                //<PP20140610> START
                if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null
                   && request.requestServiceState.ogItems.orgGroupItems.Default_Per_UoM_Setup__c != null)
                {
                    if(request.requestServiceState.ogItems.orgGroupItems.Default_Per_UoM_Setup__c == 'Sales Area Config'
                       && request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c != null)
                    {   
                        System.debug('Uom set122***'+erpUoMSet);
                        erpUoMSet.add(new SelectOption(request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c,
                                                       request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c));
                        System.debug('Uom set1112***'+erpUoMSet);
                        if(request.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && pricingReqItem.Scaled_Price_Flag__c==true && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
                        {
                            pricingReqItem.Scale_UoM_Scale_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c;
                        }
                    }
                    else if(request.requestServiceState.ogItems.orgGroupItems.Default_Per_UoM_Setup__c == 'Product Hierarchy Config')
                    {
                        if(pricingReqItem.Material_Code__c != null)
                        {
                            List<Material__c> matList = new List<Material__c>();
                            if(request.requestServiceState.ogItems.orgGroupItems.Enable_Variable_Config_Materials__c)
                            {
                                
                                matList=[SELECT Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                                         ERP_Material_Code__c = :pricingReqItem.Material_Code__c  AND RecordTypeId = :Material_RTYPE_Id AND
                                         ERP_Material_General_Data__r.ERP_IsConfigurable__c = :request.requestServiceState.ogItems.orgGroupItems.Enable_Variable_Config_Materials__c
                                         AND ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c AND
                                         OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c];
                            }
                            else
                            { 
                                matList=[SELECT Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                                         ERP_Material_Code__c = :pricingReqItem.Material_Code__c  AND RecordTypeId = :Material_RTYPE_Id AND
                                         ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c AND
                                         OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c];
                            }
                            Material__c m = new Material__c();
                            System.debug('Uom set123***'+erpUoMSet);
                            if(matList.size() > 0)
                            {
                                System.debug('Uom set2***'+erpUoMSet);
                                m = matList[0];
                                reqitem2 = new PARequestItemHelper(request.requestServiceState.ogItems.selectedBU);
                                Set<String> phSet = new Set<String>();
                                phSet.add(m.ERP_Product_Hierarchy_Code__c);
                                List<BU_PH__c> allPHList = reqitem2.query(phSet);
                                Map<String,String> pH_UOM = new Map<String,String>();
                                pH_UOM = reqitem2.getDefaultUOM(allPHList);
                                if(pH_UOM.containsKey(m.ERP_Product_Hierarchy_Code__c) && pH_UOM.get(m.ERP_Product_Hierarchy_Code__c) != null)
                                {
                                    System.debug('Uom set3***'+erpUoMSet);
                                    erpUoMSet.add(new SelectOption(pH_UOM.get(m.ERP_Product_Hierarchy_Code__c),pH_UOM.get(m.ERP_Product_Hierarchy_Code__c)));
                                    if(request.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && pricingReqItem.Scaled_Price_Flag__c==true && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
                                    {
                                        pricingReqItem.Scale_UoM_Scale_Unit__c=pH_UOM.get(m.ERP_Product_Hierarchy_Code__c);
                                    }
                                }
                            }
                        }
                        else if(pricingReqItem.F_Product_Hierarchy_Code__c != null)
                        {
                            System.debug('Uom set4***'+erpUoMSet);
                            reqitem2 = new PARequestItemHelper(request.requestServiceState.ogItems.selectedBU);
                            Set<String> phSet = new Set<String>();
                            phSet.add(pricingReqItem.F_Product_Hierarchy_Code__c);
                            List<BU_PH__c> allPHList = reqitem2.query(phSet);
                            Map<String,String> pH_UOM = new Map<String,String>();
                            pH_UOM = reqitem2.getDefaultUOM(allPHList);
                            if(pH_UOM.containsKey(pricingReqItem.F_Product_Hierarchy_Code__c) && pH_UOM.get(pricingReqItem.F_Product_Hierarchy_Code__c) != null)
                            {
                                System.debug('Uom set5***'+erpUoMSet);
                                erpUoMSet.add(new SelectOption(pH_UOM.get(pricingReqItem.F_Product_Hierarchy_Code__c),pH_UOM.get(pricingReqItem.F_Product_Hierarchy_Code__c)));
                                if(request.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && pricingReqItem.Scaled_Price_Flag__c==true && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
                                {
                                    pricingReqItem.Scale_UoM_Scale_Unit__c=pH_UOM.get(pricingReqItem.F_Product_Hierarchy_Code__c);
                                }
                            }                         
                        }
                    }                    
                }
                //<PP20140610> END
                System.debug('Uom set6***'+erpUoMSet);
                erpUoMList.addAll(erpUoMSet);
                //<PP20140110> START
                String buSO = request.pricingRequest.BU__c+'-'+request.pricingRequest.Sales_Org_Code__c;
                if(PABUSalesOrgUoMMapping__c.getAll().containsKey(buSO))
                {
                    erpUoMList.add(0,new SelectOption(PABUSalesOrgUoMMapping__c.getInstance(buSO).UoM__c,PABUSalesOrgUoMMapping__c.getInstance(buSO).UoM__c));
                }
                //<PP20140110> END
                if(erpUoMList.size()>1)
                {
                    erpUoMList.add(0,new SelectOption('--Select--','--Select--'));
                }
                system.debug('^#### UoM 1^'+erpUoMList);
                return erpUoMList;
            }
            system.debug('^#### UoM 2 ^'+erpUoMList);
            return erpUoMList;
        }
        set;
    }
    
    //<SP20140509> START
    public boolean enablePaymentTerms {get;set;}
    public boolean enableFixedDate {get;set;}
    
    private final set<String> payTermsSet = new set<String>();
    private final set<String> payTermsFixedDateSet = new set<String>();
    
    public List<selectOption> getpaymentTermsList()
    {
        
        list<selectOption> paymentTermsList = new list<selectOption>();
        Set<SelectOption> paymentTermsSet = new Set<SelectOption>();
        
        if(enablePaymentTerms)
        {
            list<String> payTermsList = new list<String>();
            list<String> payTermsFixedDateList = new list<String>();
            
            if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null &&request.requestServiceState.ogItems.orgGroupItems.Customer_Price_Payment_Terms__c!=null)
            {
                payTermsList = request.requestServiceState.ogItems.orgGroupItems.Customer_Price_Payment_Terms__c.split(';');
                payTermsSet.addall(payTermsList);
            }
            
            if(request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems!=null &&request.requestServiceState.ogItems.orgGroupItems.Customer_Price_Fixed_Date_Payment_Terms__c!=null)
            {
                payTermsFixedDateList = request.requestServiceState.ogItems.orgGroupItems.Customer_Price_Fixed_Date_Payment_Terms__c.split(';');
                payTermsFixedDateSet.addall(payTermsFixedDateList);
            }
            
            for(String X:payTermsList)
            {
                paymentTermsSet.add(new SelectOption(X,X));
            }
            
            paymentTermsList.addAll(paymentTermsSet);
            if(paymentTermsList.size()>1 )
            {
                paymentTermsList.add(0,new SelectOption(' ','--Select--'));
                enableFixedDate = false;
            }
            else if(paymentTermsList.size() == 1)
            {
                if(payTermsFixedDateSet.contains(payTermsList[0]))
                {
                    enableFixedDate = true;
                }
            }
        }
        if(paytermsclicked == false)
        {
            enableFixedDateMethod();
        }
        return paymentTermsList;
        
    }
    
    public void enableFixedDateMethod()
    {
        String selectedPayTerm = pricingReqItem.New_Customer_Price_Payment_Terms__c;
        System.debug('****selectedPayTerm'+selectedPayTerm);
        if(!string.isBlank(selectedPayTerm) && payTermsFixedDateSet.contains(selectedPayTerm))
        {
            enableFixedDate = true;
        }
        else
        {
            enableFixedDate = false;
        }
    }
    //<SP20140509> END
    
    
    //<TJ20140402> -- Added Object of PARequestItemHelper for Default UOM & Default Per
    public PARequestItemHelper reqitem2{get;set;}
    public String pCond;
    public String kCond;
    //<TJ20140908> Added call to action method for scale pricing(desiredaction=sclpricing)
    public String pricingRequestItemId{set
    {
        System.debug('&&&&& in setter'+value);
        String action='';
        string dupAccSeqId='';
        Id priId;
        if(value!=null){
            
            //<PP20130422> -- Ver 5.24 START
            if(value.contains('~')){
                system.debug('98765'+value);
                //Split Action and (Pricing Condition+Key Combination)
                List<String> splitActionPCKCList = new List<String>();
                splitActionPCKCList = value.split('~');
                List<String> splitPCKCList = new List<String>();
                List<String> splitPCCodeDescList = new List<String>();
                List<String> splitKCCodeDescList = new List<String>();
                String pc,kc,pckc,pcCode,kcCode,sapClusterId,sapClientId,sapApplicationId;                  
                if(splitActionPCKCList != null && splitActionPCKCList.size() != 0)
                {
                    pckc = splitActionPCKCList[1];
                    //Split Pricing Condition and Key Combination
                    if(pckc != null)
                    {
                        splitPCKCList = pckc.split(':');
                        if(splitPCKCList != null && splitPCKCList.size() != 0)
                        {
                            pc = splitPCKCList[0];
                            kc = splitPCKCList[1];
                            //Split Pricing Condition to get its code
                            if(pc != null)
                            {
                                splitPCCodeDescList = pc.split('-');
                                if(splitPCCodeDescList != null && splitPCCodeDescList.size() != 0)
                                {
                                    pcCode = splitPCCodeDescList[0];
                                    pcCode = pcCode.trim();
                                }
                            }
                            //Split Key Combination to get its code
                            if(kc != null)
                            {
                                splitKCCodeDescList = kc.split('-');
                                if(splitKCCodeDescList != null && splitKCCodeDescList.size() != 0)
                                {
                                    kcCode = splitKCCodeDescList[0];
                                    kcCode = kcCode.trim();
                                }
                            }
                        }
                    }                       
                }
                pCond=pcCode;
                kCond=kcCode;
                //Fetching SAPClusterId,SAPApplicationId,SAPClientId from ERP Pricing Procedure
                String erpPricingProcedureId = request.customer.ogItems.orgGroupItems.ERP_Pricing_Procedure__c;
                ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
                List<ERP_Pricing_Procedure__c> erpProcList = new List<ERP_Pricing_Procedure__c>();
                erpProcList = [SELECT Id,SAP_Cluster__c,SAP_Client_Id__c,SAP_Application_Id__c FROM ERP_Pricing_Procedure__c WHERE
                               Id = :erpPricingProcedureId];
                if(erpProcList != null && erpProcList.size() != 0)
                {
                    erpPricingProcedure = erpProcList[0];
                    if(erpPricingProcedure != null)
                    {
                        sapClusterId = erpPricingProcedure.SAP_Cluster__c;
                        sapClientId = erpPricingProcedure.SAP_Client_Id__c;
                        sapApplicationId = erpPricingProcedure.SAP_Application_Id__c;
                    }
                }
                //Fetching corresponding PricingCondition and KeyCombination
                if(pcCode != null && kcCode != null && sapClusterId != null && sapClientId != null && sapApplicationId != null)
                {
                    request.pricingCondition.getPCFromCodeAndSAPCluster(pcCode,sapClusterId,sapApplicationId,sapClientId);
                    System.debug('******sapClusterId in setter'+sapClusterId);
                    System.debug('******sapApplicationId in setter'+sapApplicationId);
                    System.debug('******sapClientId in setter'+sapClientId);
                    System.debug('******kcCode in setter'+kcCode);
                    request.keyCombination.getKCFromCodeAndSAPCluster(kcCode,sapClusterId,sapApplicationId,sapClientId);
                    System.debug('******keyCombination in setter'+request.keyCombination.keyCombinationID);                      
                    System.debug('******request.pricingCondition.selectedPricingCondition'+request.pricingCondition.selectedPricingCondition);     
                    System.debug('******erpPricingProcedure'+erpPricingProcedure.id);
                    
                    //<PP20140515>
                    List<ERP_Access_Sequence__c> accSeqList = new List<ERP_Access_Sequence__c>();
                    ERP_Access_Sequence__c accSeq = new ERP_Access_Sequence__c();
                    accSeqList = [SELECT Id FROM ERP_Access_Sequence__c WHERE Pricing_Key_Combination__c = :request.keyCombination.keyCombinationID
                                  AND Pricing_Condition__c = :request.pricingCondition.selectedPricingCondition AND Sales_Pricing_Procedure__c =
                                  :erpPricingProcedure.Id];
                    if(accSeqList !=null && accSeqList.size() >0)
                        accSeq = accSeqList[0];
                    
                    
                    if(accSeq != null)
                        accSeqId = accSeq.Id;
                    dupAccSeqId = accSeqId;
                }
                
                if(value.containsIgnoreCase('NewAddPricesPCKC'))
                {
                    //Adding logic for Customer Specific, NCS and Project
                    if(request.pricingRequest.Customer_Specific__c == false)
                    {
                        System.debug('******in NCS of setter');
                        action('PAEditReqItem','PAPricingRequest','AddPricesNCS');
                    }
                    else
                    {
                        system.debug('prachiiiiiiiii'+request.pricingRequest.Pricing_Request_Type__c);
                        if(request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing')
                        {
                            system.debug('chck'+request.requestServiceState.currentProjectPrice);
                            request.requestServiceState.currentProjectPrice.selectedProjectId = 'Edit-'+request.pricingRequest.Project_Price__c;
                            action('PAAddProjectRequest','PAPricingRequest','AddMaterial');
                        }
                        else if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
                        {
                            
                            pckcOptionsList = getListOptions();
                            accSeqId = dupAccSeqId;
                            pcKcChange();
                            action('PAAddProjectRequest','PAPricingRequest','AddPrices');
                        }
                        //<KJ20150701>-For massive change filter criteria -IS ID-00056223-production issue
                        //else if(request.pricingRequest.Request_Type__c != 'Massive')
                        else
                        {
                            system.debug('chck123');
                            pcKcChange();
                            action('PAEditReqItem','PAPricingRequest','NewPricingReqItem');
                            System.debug('End calling newrequestAction');
                        }
                        
                    }
                    
                    request.requestServiceState.currentRequest.salesPriceSAP.relatedWrappersList=new List<PARelatedList>();
                    request.requestServiceState.currentRequest.relatedWrappersList = new List<PARelatedList>();
                    relatedWrappersList = new List<PARelatedList>();
                } 
                //<PP20130422> -- Ver 5.24 END
                //<TJ20140908> Added call to action method for scale pricing(desiredaction=sclpricing)
                else if(value.containsIgnoreCase('sclPricing'))
                {
                    scalePrices = true;
                    action('PAPricingRequestView','PAPricingRequest','sclPricing');
                }
            }
            else{
                List<string> splitvalueList = new List<string>();
                splitvalueList = value.split('-');
                System.debug('&&&&& in setter value'+value);
                System.debug('&&&&& in setter splitvalueList'+splitvalueList);
                if(splitvalueList.size()!=0){
                    action=splitvalueList[0];
                    priId=splitvalueList[1];
                }
                //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query   
                //Brundha Roll out 2 <BR20130626> -- <NS20130821> Added Landing_Cost__c field to query select clause
                //<PP20131028>
                //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
                //<PP20140101>
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                //<BB20140404> Added Error_Indicator__c  in the query
                //<BB20140508> Added Sales_Type_Code__c,Sales_Type__c  in the query 
                //<MS20140515> Added Variant and SalesOrderType fields in the query
                //<Av20140515>-Added isVolumeApplicable__c,Volume__c,Volume_UoM__c,New_Volume__c,New_Volume_UoM__c in the query
                List<Pricing_Request_Item__c> pricingReqItemList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequestItem','pricingReqItem',' Id = \''+priId+'\'');
                pricingReqItem =  pricingReqItemList[0];
                //System.Debug('pricingReqItemList-KC :'+pricingReqItemList);
                
                if(pricingReqItem.New_Valid_From__c==null && pricingReqItem.New_Valid_To__c==null){
                    pricingReqItem.New_Valid_From__c = pricingReqItem.Pricing_Request__r.Request_Valid_From__c;
                    pricingReqItem.New_Valid_To__c = pricingReqItem.Pricing_Request__r.Request_Valid_To__c;
                }
                System.debug('****in setter neeha');
                
                //<SP20140509> START
                
                system.debug('**** Req Item Setter called*** ');
                system.debug('**** pricingReqItem.isPaymentTermsApplicable__cd*** '+pricingReqItem.isPaymentTermsApplicable__c);
                
                if(pricingReqItem.isPaymentTermsApplicable__c)
                {
                    enablePaymentTerms = true;
                }
                else
                {
                    enablePaymentTerms = false;
                    enableFixedDate = false;
                }
                
                if(!String.isBlank(pricingReqItem.New_Customer_Price_Payment_Terms__c))
                {
                    getpaymentTermsList();
                }
                system.debug('**** enableFixedDateMethod called *** '+enableFixedDate);
                
                //<SP20140509> END
                
                List<Organizational_Group_Item__c> ogi=new List<Organizational_Group_Item__c>();
                ogi=[SELECT Default_Value_for_Scaled_Prices__c, Default_Per_UoM_Setup__c, Default_SalesArea_UoM__c FROM Organizational_Group_Item__c WHERE Business__c = 
                     :request.requestServiceState.ogItems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c =
                     :request.pricingRequest.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c =
                     :request.pricingRequest.Dist_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
                if(pricingReqItem.Scaled_Price_Flag__c && ogi[0].Default_Per_UoM_Setup__c=='Sales Area Config' && String.isBlank(pricingReqItem.Scale_UoM_Scale_Unit__c))
                {
                    pricingReqItem.Scale_UoM_Scale_Unit__c=ogi[0].Default_SalesArea_UoM__c;
                }
                /*check for import*/
                System.debug('****pricingReqItem.SAP_Cluster__c'+pricingReqItem.SAP_Cluster__c);
                System.debug('***pricingReqItem.SAP_'+pricingReqItem.SAP_Application_Id__c);
                System.debug('***pricingReqItem.SAP_'+pricingReqItem.SAP_Client_Id__c);
                System.debug('***pricingReqItem.Pricing_Condition_Code__c'+pricingReqItem.Pricing_Condition_Code__c);
                //end //after this pricing condition of request is set
                request.pricingCondition.getPCFromCodeAndSAPCluster(pricingReqItem.Pricing_Condition_Code__c,pricingReqItem.SAP_Cluster__c,pricingReqItem.SAP_Application_Id__c,pricingReqItem.SAP_Client_Id__c);
                
                //added for getting Scale from ERP Procedure-Conditions
                ERP_Procedure_Conditions__c erpProCond = new ERP_Procedure_Conditions__c();
                
                /*
if(action != null && action.equalsIgnoreCase('View'))
{
if(pricingReqItem.Scaled_Price_Flag__c)
{
enableScale = 'true';
}
else
{
enableScale = 'false';
}
}
else
{*/
                
                System.debug('****request.pricingCondition.pricingCondition.Id'+request.pricingCondition.selectedPricingCondition);
                System.debug('***request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c'+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c);
                
                List<ERP_Procedure_Conditions__c> erpProConList = [SELECT Id,Sales_Pricing_Procedure_Condition_Config__c FROM ERP_Procedure_Conditions__c WHERE Pricing_Condition__c = :request.pricingCondition.pricingCondition.Id
                                                                   AND Sales_Pricing_Procedure__c =:request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c];
                
                if(erpProConList!=null && erpProConList.size()!=0)
                {
                    erpProCond = erpProConList[0];
                }
                
                if(erpProCond!=null && erpProCond.Sales_Pricing_Procedure_Condition_Config__c!=null && erpProCond.Sales_Pricing_Procedure_Condition_Config__c.containsIgnoreCase('Enable Scale'))
                {
                    enableScale = 'true';
                }
                else
                {
                    enableScale = 'false';
                }
                // }
                
                
                if(pricingReqItem.Pricing_Request__r.Pricing_Request_Type__c <> 'Pricing Task' &&  pricingReqItem.New_Rate__c==null && pricingReqItem.New_UOM__c==null && pricingReqItem.New_Unit__c==null && pricingReqItem.New_Rate__c==null){
                    pricingReqItem.New_Rate__c= pricingReqItem.Rate__c;
                    
                    pricingReqItem.New_Unit__c= pricingReqItem.Unit__c;
                    if(!(request.pricingCondition.pricingCondition.Calculation_Type__c!=null && request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')&& request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount'))){
                        pricingReqItem.New_UOM__c= pricingReqItem.UOM__c;
                        pricingReqItem.New_Per__c= pricingReqItem.Per__c;
                    }
                }
                
                //details of Pricing record---scaling,also to link reqitem to sales price SAP record
                if(pricingReqItem.ERP_Sales_Prices_SAP__c != null)
                {   List<ERP_Sales_Prices_SAP__c> relatedSAPRecordsList;//=new List<ERP_Sales_Prices_SAP__c>();
                 //<AV20140515>-Added Quantity__c field to display old volume
                 relatedSAPRecordsList = (List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PARequestItem','relatedSAPRecordsList',' Id = \''+pricingReqItem.ERP_Sales_Prices_SAP__c+'\'');
                 
                 if(relatedSAPRecordsList!=null && relatedSAPRecordsList.size()!=0)
                     relatedERPSAPPrice =relatedSAPRecordsList.get(0);
                }
                if(request.pricingRequest.Pricing_Request_Type__c.containsIgnoreCase('Floor')||request.pricingRequest.Pricing_Request_Type__c.containsIgnoreCase('Reference'))
                {   List<Sales_Prices__c> relatedNonSAPRecordsList;//=new List<ERP_Sales_Prices_SAP__c>();
                 //<AV20140515>-Added Quantity__c field to display old volume
                 relatedNonSAPRecordsList = (List<Sales_Prices__c>)PAQueryUtil.query('PARequestItem','relatedNonSAPRecordsList',pricingReqItem.ERP_Sales_Prices_SAP__c!=null?' Id = \''+pricingReqItem.ERP_Sales_Prices_SAP__c+'\'':'Id=\'\'');
                 
                 if(relatedNonSAPRecordsList!=null && relatedNonSAPRecordsList.size()!=0)
                     relatedNonSAPPrice =relatedNonSAPRecordsList.get(0);
                }
                System.debug('*****relatedERPSAPPrice'+relatedERPSAPPrice);
                System.debug('*****relatedNonSAPPrice'+relatedNonSAPPrice);
                //in case of expire
                if(action.equalsIgnoreCase('Exp')){
                    //disableOnExpiry =true;
                    pricingReqItem.New_Valid_From__c= pricingReqItem.Valid_From__c;
                    if(pricingReqItem.New_Valid_To__c!=null)
                        pricingReqItem.New_Valid_To__c = pricingReqItem.New_Valid_To__c;
                    else{
                        pricingReqItem.New_Valid_To__c = pricingReqItem.Valid_To__c;
                    }
                    //<PP20140704>
                    pricingReqItem.New_Volume__c = pricingReqItem.Volume__c;
                    pricingReqItem.New_Volume_UoM__c = pricingReqItem.Volume_UoM__c;
                    pricingReqItem.New_Customer_Price_Payment_Terms__c   = pricingReqItem.Customer_Price_Payment_Terms__c;
                    pricingReqItem.New_Payment_Terms_Fixed_Date__c   = pricingReqItem.Payment_Terms_Fixed_Date__c;
                    if(pricingReqItem.Scaled_Price_Flag__c && relatedERPSAPPrice!=null ){
                        pricingReqItem.Scale_Quantity_Scale_Value1__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value1__c;
                        pricingReqItem.Scale_Quantity_Scale_Value2__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value2__c;
                        pricingReqItem.Scale_Quantity_Scale_Value3__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value3__c;
                        pricingReqItem.Scale_Quantity_Scale_Value4__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value4__c;
                        pricingReqItem.Scale_Quantity_Scale_Value5__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value5__c;
                        pricingReqItem.Scale_Quantity_Scale_Value6__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value6__c;
                        pricingReqItem.Scale_Quantity_Scale_Value7__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value7__c;
                        pricingReqItem.Scale_Quantity_Scale_Value8__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value8__c;
                        pricingReqItem.Scale_Quantity_Scale_Value9__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value9__c;
                        pricingReqItem.Scale_Quantity_Scale_Value10__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value10__c;
                        
                        pricingReqItem.Scale_UoM_Scale_Unit__c=relatedERPSAPPrice.Scale_UoM_Scale_Unit__c;
                        
                        pricingReqItem.ScaleRate1__c=relatedERPSAPPrice.ScaleRate1__c;
                        pricingReqItem.ScaleRate2__c=relatedERPSAPPrice.ScaleRate2__c;
                        pricingReqItem.ScaleRate3__c=relatedERPSAPPrice.ScaleRate3__c;
                        pricingReqItem.ScaleRate4__c=relatedERPSAPPrice.ScaleRate4__c;
                        pricingReqItem.ScaleRate5__c=relatedERPSAPPrice.ScaleRate5__c;
                        pricingReqItem.ScaleRate6__c=relatedERPSAPPrice.ScaleRate6__c;
                        pricingReqItem.ScaleRate7__c=relatedERPSAPPrice.ScaleRate7__c;
                        pricingReqItem.ScaleRate8__c=relatedERPSAPPrice.ScaleRate8__c;
                        pricingReqItem.ScaleRate9__c=relatedERPSAPPrice.ScaleRate9__c;
                        pricingReqItem.ScaleRate10__c=relatedERPSAPPrice.ScaleRate10__c;
                    }
                    else if(pricingReqItem.Scaled_Price_Flag__c && relatedNonSAPPrice!=null ){
                        relatedNonSAPScaleList();
                    }        
                }
                
                
                System.debug('***in setter'+pricingReqItem.Pricing_Request__c);
                clickOk=''; //imp
                showGapError=false;
                showPriceCheck=false;
                showPriceTail=false;
                showExpireMsg=false;
                gapCheck=null;
                showRoundOffPopUp=false;
                isRequestItemSaved=false; //added for NPC-neeha
                netPricingFlag=false;//added for NPC-neeha
                showFloorRefSection=false;//added for NPC
                
                //<PP20130614> -- Added for NPC Applicable check -- Ver 5.37
                isNPCApplicableFlag = checkNPCApplicability();
                
                //Code to show Rate Values based on localle
                Decimal standardDecimal = 1.1;
                string decimalSeparator = standardDecimal.format().substring(1,2);
                if(decimalSeparator == ',') {
                    if(!String.isBlank(pricingReqItem.Rate__c) && pricingReqItem.Rate__c.contains('.')) {
                        pricingReqItem.Rate__c = pricingReqItem.Rate__c.replace('.',decimalSeparator);
                    }
                    if(!String.isBlank(pricingReqItem.New_Rate__c) && pricingReqItem.New_Rate__c.contains('.')) {
                        pricingReqItem.New_Rate__c = pricingReqItem.New_Rate__c.replace('.',decimalSeparator);
                    }
                    if(!String.isBlank(pricingReqItem.Quantity__c) && pricingReqItem.Quantity__c.contains('.')) {
                        pricingReqItem.Quantity__c = pricingReqItem.Quantity__c.replace('.',decimalSeparator);
                    }
                    if(enableScale=='true')
                    {
                        pricingReqItem.ScaleRate1__c=(pricingReqItem.ScaleRate1__c==null ? null : (pricingReqItem.ScaleRate1__c.contains('.') ? pricingReqItem.ScaleRate1__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate1__c));
                        pricingReqItem.ScaleRate2__c=(pricingReqItem.ScaleRate2__c==null ? null : (pricingReqItem.ScaleRate2__c.contains('.') ? pricingReqItem.ScaleRate2__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate2__c));
                        pricingReqItem.ScaleRate3__c=(pricingReqItem.ScaleRate3__c==null ? null : (pricingReqItem.ScaleRate3__c.contains('.') ? pricingReqItem.ScaleRate3__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate3__c));
                        pricingReqItem.ScaleRate4__c=(pricingReqItem.ScaleRate4__c==null ? null : (pricingReqItem.ScaleRate4__c.contains('.') ? pricingReqItem.ScaleRate4__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate4__c));
                        pricingReqItem.ScaleRate5__c=(pricingReqItem.ScaleRate5__c==null ? null : (pricingReqItem.ScaleRate5__c.contains('.') ? pricingReqItem.ScaleRate5__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate5__c));
                        pricingReqItem.ScaleRate6__c=(pricingReqItem.ScaleRate6__c==null ? null : (pricingReqItem.ScaleRate6__c.contains('.') ? pricingReqItem.ScaleRate6__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate6__c));
                        pricingReqItem.ScaleRate7__c=(pricingReqItem.ScaleRate7__c==null ? null : (pricingReqItem.ScaleRate7__c.contains('.') ? pricingReqItem.ScaleRate7__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate7__c));
                        pricingReqItem.ScaleRate8__c=(pricingReqItem.ScaleRate8__c==null ? null : (pricingReqItem.ScaleRate8__c.contains('.') ? pricingReqItem.ScaleRate8__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate8__c));
                        pricingReqItem.ScaleRate9__c=(pricingReqItem.ScaleRate9__c==null ? null : (pricingReqItem.ScaleRate9__c.contains('.') ? pricingReqItem.ScaleRate9__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate9__c));
                        pricingReqItem.ScaleRate10__c=(pricingReqItem.ScaleRate10__c==null ? null : (pricingReqItem.ScaleRate10__c.contains('.') ? pricingReqItem.ScaleRate10__c.replace('.',decimalSeparator) : pricingReqItem.ScaleRate10__c));
                        if(relatedERPSAPPrice!=null)
                        {
                            relatedERPSAPPrice.ScaleRate1__c=(relatedERPSAPPrice.ScaleRate1__c==null ? null : (relatedERPSAPPrice.ScaleRate1__c.contains('.') ? relatedERPSAPPrice.ScaleRate1__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate1__c));
                            relatedERPSAPPrice.ScaleRate2__c=(relatedERPSAPPrice.ScaleRate2__c==null ? null : (relatedERPSAPPrice.ScaleRate2__c.contains('.') ? relatedERPSAPPrice.ScaleRate2__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate2__c));
                            relatedERPSAPPrice.ScaleRate3__c=(relatedERPSAPPrice.ScaleRate3__c==null ? null : (relatedERPSAPPrice.ScaleRate3__c.contains('.') ? relatedERPSAPPrice.ScaleRate3__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate3__c));
                            relatedERPSAPPrice.ScaleRate4__c=(relatedERPSAPPrice.ScaleRate4__c==null ? null : (relatedERPSAPPrice.ScaleRate4__c.contains('.') ? relatedERPSAPPrice.ScaleRate4__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate4__c));
                            relatedERPSAPPrice.ScaleRate5__c=(relatedERPSAPPrice.ScaleRate5__c==null ? null : (relatedERPSAPPrice.ScaleRate5__c.contains('.') ? relatedERPSAPPrice.ScaleRate5__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate5__c));
                            relatedERPSAPPrice.ScaleRate6__c=(relatedERPSAPPrice.ScaleRate6__c==null ? null : (relatedERPSAPPrice.ScaleRate6__c.contains('.') ? relatedERPSAPPrice.ScaleRate6__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate6__c));
                            relatedERPSAPPrice.ScaleRate7__c=(relatedERPSAPPrice.ScaleRate7__c==null ? null : (relatedERPSAPPrice.ScaleRate7__c.contains('.') ? relatedERPSAPPrice.ScaleRate7__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate7__c));
                            relatedERPSAPPrice.ScaleRate8__c=(relatedERPSAPPrice.ScaleRate8__c==null ? null : (relatedERPSAPPrice.ScaleRate8__c.contains('.') ? relatedERPSAPPrice.ScaleRate8__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate8__c));
                            relatedERPSAPPrice.ScaleRate9__c=(relatedERPSAPPrice.ScaleRate9__c==null ? null : (relatedERPSAPPrice.ScaleRate9__c.contains('.') ? relatedERPSAPPrice.ScaleRate9__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate9__c));
                            relatedERPSAPPrice.ScaleRate10__c=(relatedERPSAPPrice.ScaleRate10__c==null ? null : (relatedERPSAPPrice.ScaleRate10__c.contains('.') ? relatedERPSAPPrice.ScaleRate10__c.replace('.',decimalSeparator) : relatedERPSAPPrice.ScaleRate10__c));
                        }
                        else if(relatedNonSAPPrice!=null)
                        {
                            relatedNonSAPScaleList1(decimalseparator);
                        }
                    }
                }
                //<PP20140101> START
                isPHSynchronousFlag = false;
                if(action != null && action.equalsIgnoreCase('View'))
                {
                    List<NPC_Request__c> npCReqList = [SELECT Id FROM NPC_Request__c where Pricing_request_Item__c=:pricingReqItem.Id AND
                                                       isSynchronous__c=true AND Status__c='Active'];
                    if(npCReqList != null && npCReqList.size() > 0)
                        isPHSynchronousFlag = true;
                    if(priceViewClicked && pricingReqItem.Net_Price_Status__c=='Net Price Received')
                    {
                        action('PAMaterialNet','PAPricingRequestView','ViewNetPriceDetails');
                    }
                }
                else
                {
                    List<Pricing_Request_Item__c> pReqItemList =new List<Pricing_Request_Item__c>();
                    pReqItemList.add(pricingReqItem);
                    Map<String, String> phToRepMaterialMap = new Map<String, String>();
                    if(pricingReqItem.Key_Combination__c.replace('Material Price Group','').contains('Material'))
                        isPHSynchronousFlag = true;
                    else if(pricingReqItem.Key_Combination__c.contains('PH') && !pricingReqItem.Key_Combination__c.replace('Material Price Group','').containsIgnoreCase('Material'))
                    {
                        phToRepMaterialMap = PAUtil.checkForSynchronousPH(pReqItemList);
                        if(phToRepMaterialMap.containsKey(pricingReqItem.F_Product_Hierarchy_Code__c)
                           && !String.isBlank(phToRepMaterialMap.get(pricingReqItem.F_Product_Hierarchy_Code__c)))
                            isPHSynchronousFlag = true;
                    }
                }               
                /*List<Pricing_Request_Item__c> pReqItemList =new List<Pricing_Request_Item__c>();
pReqItemList.add(pricingReqItem);
Map<String, String> phToRepMaterialMap = new Map<String, String>();
if(pricingReqItem.Key_Combination__c.contains('PH') && !pricingReqItem.Key_Combination__c.replace('Material Price Group','').containsIgnoreCase('Material'))
phToRepMaterialMap = PAUtil.checkForSynchronousPH(pReqItemList);
if(phToRepMaterialMap.containsKey(pricingReqItem.F_Product_Hierarchy_Code__c)
&& !String.isBlank(phToRepMaterialMap.get(pricingReqItem.F_Product_Hierarchy_Code__c)))
isPHSynchronousFlag = true;*/
                //<PP20140101> END
                //System.debug('***isPHSynchronousFlag'+isPHSynchronousFlag);
                System.debug('*****relatedERPSAPPrice'+relatedERPSAPPrice);
            }
        }
    }
                                       
                                       get;
                                      }
    
    public PARequestItem( PAServiceState paServiceState)
    {
        if(paServiceState.currentRequest!=null)
        {
            //<BR20130701>--5.39 Ver
            taskRecord=new task();
            selectAllAttachments = false;
            //<MS20140926
            continueFlag=false;
            enablePaymentTerms = false;
            //Shiva-LandingCost
            //System.debug('****fixForBlankField'+fixForBlankField);
            
            
            //------- adding for task view overriding page - 12th march (Prachi)
            if(ApexPages.currentPage().getParameters().get('id')!=null  /*&& fixForBlankField==false*/)
            {   
                currentPageId = ApexPages.currentPage().getParameters().get('id');
                // The method populates the view state whenever the request id is present in URL
                //Shiva-LandingCostfixForBlankField = true;
                populateViewState(ApexPages.currentPage().getParameters().get('id'),paServiceState);
                
                
            }
            
            //ending overriding code (12th march)
            
            else
            {
                //instantiating the request 
                
                
                System.debug('****in constructor of req item');
                System.debug('****request'+this.request);
                this.request = (PARequest) paServiceState.currentRequest;
                approvalWF = new PAApprovalWF(paServiceState);
                request.approvalWF = approvalWF;
                if(request.pricingRequest.Request_Type__c == 'Customer Specific' && request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && !String.isBlank(request.pricingRequest.Spot_Type__c) && request.pricingRequest.Spot_Type__c == 'Rebate Agreement')
                {
                    pricingRequest=new Pricing_Request__c();
                }
                //Shiva-LandingCost
                /*
if(ApexPages.currentPage().getParameters().get('id')!=null && paservicestate!=null && paservicestate.currentprojectprice != null && paservicestate.currentprojectprice.currentrequest!=null
&& paservicestate.currentprojectprice.currentrequest.customer !=null && paservicestate.currentprojectprice.currentrequest.customer.requestitem !=null 
&& paservicestate.currentprojectprice.currentrequest.customer.requestitem.request !=null && paservicestate.currentprojectprice.currentrequest.customer.requestitem.request.keycombination !=null)
{
System.debug('**keyCombID123'+paservicestate.currentprojectprice.currentrequest.customer.requestitem.request.keycombination.keycombinationid);
request.keyCombination = paservicestate.currentprojectprice.currentrequest.customer.requestitem.request.keycombination;
if(paservicestate.currentprojectprice.currentrequest.customer.requestitem.request.keycombination != null)
{
request.pricingCondition = paservicestate.currentprojectprice.currentrequest.customer.requestitem.request.keycombination.pc;
}
}
*/
                
                
                this.paProjectPrice=(PAProjectPrice)paServiceState.currentProjectPrice; //to fetch the project details from the service state
            }
            
            
            
            
            //added on jan 18th-- to display header on PricingRequestPA page dynamically.
            if(request.pricingRequest.Pricing_Request_Type__c == 'Permanent')
            {
                if(request.pricingRequest.Request_Type__c == 'Customer Specific')
                {
                    headerTitle = request.pricingRequest.Request_Type__c;
                }
                else if(request.pricingRequest.Request_Type__c == 'Massive')
                {
                    headerTitle = request.pricingRequest.Request_Type__c + ' Change';
                }
                else if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
                {
                    headerTitle = request.pricingRequest.Request_Type__c;
                }
            }
            else if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && request.pricingRequest.Request_Type__c == 'Customer Specific')
            {
                headerTitle = 'Pricing Tasks';
            }
            else if(request.pricingRequest.Pricing_Request_Type__c=='Floor') {
                headerTitle = 'Floor Pricing';
            }
            else if(request.pricingRequest.Pricing_Request_Type__c=='Reference') {
                headerTitle = 'Reference Pricing';
            }
            
            System.debug('****pa service state'+paServiceState);
            
            
            //System.debug('****pa service state'+paServiceState);
            if(paServiceState.currentRequestItem!=null){
                
                if(paServiceState.currentRequestItem.pricingReqItem!=null){
                    
                    pricingReqItem= paServiceState.currentRequestItem.pricingReqItem;
                    if(pricingReqItem.Id != null){
                        System.debug('****in pricingreq item id not null');
                        //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query   
                        //Brundha Roll out 2 <BR20130626> -- <NS20130821> Added Landing_Cost__c field to query select clause
                        //<PP20131028>
                        //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
                        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                        //<BB20140404> Added Error_Indicator__c  in the query
                        //<BB20140508> Added Sales_Type_Code__c,Sales_Type__c  in the query 
                        //<MS20140515> Added Variant and SalesOrderType fields in the query
                        /*pricingReqItem = [SELECT isNPCApplicable__c,Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Scale_UoM_Scale_Unit__c,Key_Combination_SFDC__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Disc_Ref__c,
Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,
Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,
ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,
ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,
Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,
Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,
PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,
PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,
Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,
Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,
Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById,  Below_Reference_Flag__c, Below_Floor_Flag__c,
Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c,
Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c,
Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c, 
Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c,Total_Materials__c,Integration_Error_Message__c,Net_Price_Status__c,
Number_of_Material_with_Gross_Price__c,Pricing_Request__r.Request_Type__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,
Error_Indicator__c, Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c,ComPartner__c,ComPartner_Code__c  FROM Pricing_Request_Item__c WHERE
Id = :pricingReqItem.id];*/
                        
                        pricingReqItem = ((List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequestItem', 'pricingReqItem', ' Id = \''+pricingReqItem.id+'\''))[0];
                        
                    }
                }
            }
            else if (paServiceState.currentRequestItem==null){
                pricingReqItem=new Pricing_Request_Item__c();
            }
            
            //For UAT issue#102- Shiva ver 5.14 strt
            if(request.pricingCondition!=null && request.pricingCondition.pricingCondition!=null && request.requestServiceState.ogItems!=null && request.requestServiceState.ogItems.orgGroupItems != null && request.pricingCondition.pricingCondition.Id!=null &&request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c!=null)
            {
                ERP_Procedure_Conditions__c erpProCond = new ERP_Procedure_Conditions__c();
                List<ERP_Procedure_Conditions__c> erpProConList = [SELECT Id,Sales_Pricing_Procedure_Condition_Config__c FROM ERP_Procedure_Conditions__c WHERE Pricing_Condition__c = :request.pricingCondition.pricingCondition.Id
                                                                   AND Sales_Pricing_Procedure__c =:request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c];
                
                if(erpProConList!=null && erpProConList.size()!=0)
                {
                    erpProCond = erpProConList[0];
                }
                
                if(erpProCond!=null && erpProCond.Sales_Pricing_Procedure_Condition_Config__c!=null && erpProCond.Sales_Pricing_Procedure_Condition_Config__c.containsIgnoreCase('Enable Scale'))
                {
                    enableScale = 'true';
                }
                else
                {
                    enableScale = 'false';
                }
            }
            //End
            if(request!=null && pricingReqItem.Id==null){
                
                System.debug('***in else of constructor');
                if(request!=null){
                    populateReqItem(request); //This method will populate the request Item ,Also populates Customer,
                }
                
            }
            
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
            
            
            clickOk=''; //VIMP
            
            rejectedRecordsList = new List<PAWrapper>();
            System.debug('*****related Wrapperrs List'+relatedWrappersList);
            request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
            //<AG20210112> Start - added 'Reference' in if condition
            if(request!=null && request.pricingRequest!=null && request.pricingRequest.id!=null && (request.pricingRequest.Request_Type__c == 'Import'||request.pricingRequest.Request_Type__c == 'Mass Import') && (request.pricingRequest.Pricing_Request_Type__c=='Import' || request.pricingRequest.Pricing_Request_Type__c=='Floor' || request.pricingRequest.Pricing_Request_Type__c=='Permanent'|| request.pricingRequest.Pricing_Request_Type__c=='Reference')) {
            //<AG20210112> End    
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                if(request.pricingRequest.Request_Approval_Status__c!='Draft' || relatedWrappersList.size()==0) {
                    popUpFlag='validate';
                }
                else {
                    popUpFlag='details';
                }
                
                if(request.pricingRequest.Request_Type__c == 'Mass Import' && (request.pricingRequest.Request_Approval_Status__c!='Submitted'||request.pricingRequest.Request_Approval_Status__c!='Approved'))
                {
                    popUpFlag='details';
                }
                else if(request.pricingRequest.Request_Type__c == 'Mass Import' && (request.pricingRequest.Request_Approval_Status__c=='Approved'))
                {
                    popUpFlag='';   
                }
                request.onBehalfOf = request.pricingRequest.On_Behalf_Of__c;
                request.requestServiceState.ogItems.selectedUser = request.pricingRequest.On_Behalf_Of__c;
                if(!string.isBlank(request.pricingRequest.On_Behalf_Of__c)) {
                    request.requestServiceState.ogItems.userName = request.pricingRequest.On_Behalf_Of__r.Name;
                }
                if(request.customer!=null && request.customer.paERPCustomer!=null) {
                    request.customer.SalesArea = request.pricingRequest.Sales_Org_Code__c+'-'+request.pricingRequest.Sales_Org__c+'<br>'+request.pricingRequest.Dist_Channel_Code__c+'-'+request.pricingRequest.Dist_Channel__c+'<br>'+request.pricingRequest.Division_Code__c+'-'+request.pricingRequest.Division__c;
                }
                if(request.pricingCondition==null) {
                    request.pricingCondition = new PAPricingCondition(paServiceState);
                }
                if(request.keyCombination==null) {
                    request.keyCombination = new PAKeyCombination(paServiceState);
                }
                //<NS20130821> Added Landing_Cost__c field to query select clause
                //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
                //<BB20140404> Added Error_Indicator__c  in the query
                List<Pricing_Request_Item__c> priReqItemList = [SELECT F_Product_Hierarchy_Code__c,SAP_Cluster__c,SAP_Client_Id__c,SAP_Application_Id__c,Pricing_Condition_Code__c,Pricing_Condition__c,Key_Combination_Code__c,Key_Combination__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c 
                                                                FROM Pricing_Request_Item__c WHERE Pricing_Request__c=:request.pricingRequest.id limit 1];
                if(priReqItemList.size()>0) {
                    if(request.pricingCondition.pricingCondition==null) {
                        request.pricingCondition.pricingCondition = new ERP_Pricing_Condition__c();
                    }
                    /*ERP_Pricing_Condition__c priCondObj = [SELECT  SystemModstamp, Status__c,   Scale_Type__c,
Scale_Type_Code__c, Scale_Basis_Code__c, Scale_Base__c, SAP_Condition_Type__c, SAP_Cluster__c, SAP_Client_Id__c,
SAP_Application_Id__c, Pricing_Condition__c, Pricing_Condition_Description__c, Pricing_Condition_Code__c, Price_Types__c,
Plus_Minus__c, Plus_Minus_Code__c, OwnerId, Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted,
Id, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c FROM ERP_Pricing_Condition__c 
WHERE Pricing_Condition_Code__c=:priReqItemList[0].Pricing_Condition_Code__c 
AND SAP_Cluster__c=:priReqItemList[0].SAP_Cluster__c 
AND SAP_Client_Id__c=:priReqItemList[0].SAP_Client_Id__c 
AND SAP_Application_Id__c=:priReqItemList[0].SAP_Application_Id__c limit 1];*/
                    
                    ERP_Pricing_Condition__c priCondObj = ((List<ERP_Pricing_Condition__c>)PAQueryUtil.query('PARequestItem', 'priCondObj', ' Pricing_Condition_Code__c = \''+priReqItemList[0].Pricing_Condition_Code__c+'\' AND SAP_Cluster__c=\''+priReqItemList[0].SAP_Cluster__c+'\' AND SAP_Client_Id__c=\''+priReqItemList[0].SAP_Client_Id__c+'\' AND SAP_Application_Id__c=\''+priReqItemList[0].SAP_Application_Id__c+'\' limit 1'))[0];                                       
                    request.pricingCondition.pricingCondition = priCondObj;
                    //<PP20131231>
                    Organizational_Group_Item__c ogItemObj = [SELECT Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,ERP_Pricing_Procedure__c, ERP_Pricing_Procedure__r.SAP_Cluster__c,
                                                              ERP_Pricing_Procedure__r.SAP_Client_Id__c, ERP_Pricing_Procedure__r.SAP_Application_Id__c,
                                                              Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c 
                                                              WHERE Business__c=:request.requestServiceState.ogItems.selectedBU 
                                                              AND OrgGroup__r.ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c 
                                                              AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c 
                                                              AND OrgGroup__r.ERP_Division_Code__c=:request.pricingRequest.Division_Code__c limit 1];
                    //<PP20140522>
                    /*ERP_Access_Sequence__c accessSeqObj = [SELECT Id,isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c,
Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c,
Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE
Pricing_Condition__c=:priCondObj.id AND
Sales_Pricing_Procedure__c=:ogItemObj.ERP_Pricing_Procedure__c AND
Pricing_Key_Combination__r.Key_Combination_Code__c=:priReqItemList[0].Key_Combination_Code__c];*/
                    ERP_Access_Sequence__c accessSeqObj = ((List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Pricing_Condition__c=\''+priCondObj.id+'\' AND Sales_Pricing_Procedure__c=\''+ogItemObj.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Key_Combination_Code__c=\''+priReqItemList[0].Key_Combination_Code__c+'\''))[0];                                      
                    request.keyCombination.erpKeyCombination = new ERP_Key_Combination__c();
                    request.keyCombination.erpKeyCombination.Key_Combination_Code__c = priReqItemList[0].Key_Combination_Code__c;
                    //<VR20130827> RollOut2 Issue fix
                    request.keyCombination.KeyCombinationName = accessSeqObj.Key_Combination__c;
                    request.keyCombination.accSequence = accessSeqObj;
                    ERP_Procedure_Conditions__c proCondObj = [select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__r.Calculation_Type__c from ERP_Procedure_Conditions__c 
                                                              WHERE Sales_Pricing_Procedure__c=:ogItemObj.ERP_Pricing_Procedure__c AND 
                                                              Pricing_Condition__r.Pricing_Condition_Code__c=:request.pricingCondition.pricingCondition.Pricing_Condition_Code__c limit 1];
                    if(proCondObj!=null && proCondObj.Sales_Pricing_Procedure_Condition_Config__c!=null && proCondObj.Sales_Pricing_Procedure_Condition_Config__c.contains('Enable Scale')) {
                        enableScale = 'true';
                    }
                    else {
                        enableScale = 'false';
                    }
                }
            }
            recordCount = 0;
            //<BR20130424> Ver 5.29
            //<TJ20150610>
            if(((request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' || request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing' || request.pricingRequest.Pricing_Request_Type__c == 'Permanent') && request.pricingRequest.Request_Type__c=='Customer Specific')||request.pricingRequest.Request_Type__c.containsIgnoreCase('Import'))
            {
                //added for pricing task
                
                list<Attachment> displayAttachments = new list<Attachment>();
                if(request.pricingRequest.Id!=null){
                    displayAttachments = [SELECT id,Name,OwnerId,Description,CreatedDate,CreatedBy.Name  from  Attachment where parentid=:request.pricingRequest.Id];
                    
                }
                
                //<BR20130701>--5.39 Ver
                if(taskRecord.id!=null){
                    displayAttachments = [SELECT id,Name,OwnerId,Description,CreatedDate,CreatedBy.Name  from  Attachment where parentid=:taskRecord.Id];
                    
                }
                attachPAWrapperList = new List<PAWrapper>();    
                system.debug('Notes Constructor'); 
                notesAttachment(displayAttachments);
            }
            
            
            //<VR20130510> Ver 5.35 VR 2013-05-10 APAC Rollout1-Querying to get the Salesforce id of Customer
            if(request!=null && request.pricingRequest!=null && request.pricingRequest.SoldTo_Code__c!=null) {
                Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
                List<ERP_Customer__c> cusObj = [SELECT id from ERP_Customer__c WHERE Customer_Code__c=:request.pricingRequest.SoldTo_Code__c AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND RecordTypeId = :Customer_RTYPE_Id limit 1];
                if(cusObj!=null && cusObj.size()>0) {
                    soldToId = cusObj[0].id;
                }
            }      
            
            //Ver 5.32 calling without sharing TaskReassing class
            taskReassignCall = new TaskReassign(); 
            //taskRecord=taskReassignCall.TaskReassignRecord(this);                     
            System.debug('***actionValue'+actionValue);
            //pcKCOptionsList = getListOptions();
            pcKCOptionsList = new List<SelectOption>();
        }
        
        System.debug('---popUpFlag:'+popUpFlag);
    }
    
    public List<SObject> getListBusinessComponents() {
        // TODO Auto-generated method stub
        return null;
    }
    //<PP20140512> START
    public Map<Id,ERP_Access_Sequence__c> erpAccSeqIdToRecMap;
    private Map<Id,boolean> erpPriCondIdToScaleMap;
    public String accSeqId {get; set;}
    // <SS20230501> - START
    public boolean Hidefloorref{ //  Checking the business is in custom meta data for hiding floor and reference field
     get{
     List<HideFloorSection__mdt> hfs = HideFloorSection__mdt.getAll().values(); 
     for(integer i=0; i<hfs.size(); i++){
     if(hfs[i].Label == request.pricingRequest.BU__c && hfs[i].Hidecolour__c && (request.requestServiceState.ogitems.isBUAdmin ||floorpermissioncheck == True))
     {
      Hidefloorref = False;
      break;
     }
     else
     {
     if(hfs[i].Label != request.pricingRequest.BU__c || (hfs[i].Label == request.pricingRequest.BU__c && hfs[i].Hidecolour__c ==FALSE))
      {
      Hidefloorref = False; 
      }
      else
      {
      Hidefloorref = true;
      break;
      }
     }
     } 
     return Hidefloorref;
     }
     set{}
    } // <SS20230501> - END
     //<PP20140512> END
    public List<SelectOption> getListOptions()
    {   
        boolean PCKCviewerpermission;  // <SS20230501> - Checking permission set access "Price Approval - Enable All PCKC"
        PermissionSetAssignment[] psn = [SELECT ID From PermissionSetAssignment WHERE PermissionSet.Name ='PCKC_Viewer' AND AssigneeId = :UserInfo.getUserId()];
        PCKCviewerpermission = psn.size() > 0 ? true : false; 
        //<PP20140512> START
        List<SelectOption> selOptionsList = new List<SelectOption>();
        if(actionValue != null && ('addNewMaterial').equalsIgnoreCase(actionValue))
        {
            List<ERP_Access_Sequence__c> erpAccSeqList = new List<ERP_Access_Sequence__c>();
            List<ERP_Procedure_Conditions__c> erpProcList = new List<ERP_Procedure_Conditions__c>();
            erpAccSeqIdToRecMap = new Map<Id,ERP_Access_Sequence__c>();
            erpPriCondIdToScaleMap = new Map<Id,boolean>();
            erpProcList = [SELECT Id,Pricing_Condition__c,Sales_Pricing_Procedure_Condition_Config__c FROM ERP_Procedure_Conditions__c WHERE
                           Sales_Pricing_Procedure__c = :request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c
                           ORDER BY Step__c ASC NULLS LAST];
            if(request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing')
            {
                /*erpAccSeqList = [SELECT Id, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c,
Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
Sales_Pricing_Procedure__c = :request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c AND
Pricing_Key_Combination__r.Customer_Specific__c = :true AND Pricing_Key_Combination__r.Key_Combination_type__c
includes('Project')  AND Pricing_Condition__r.SAP_Condition_Type__c = true AND
Pricing_Condition__r.Price_Types__c includes ('Project') AND Pricing_Condition__r.Condition_class__c = 'Discount' ORDER BY Sequence_Number__c];*/
                erpAccSeqList = (List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Sales_Pricing_Procedure__c = \''+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Customer_Specific__c = true AND Pricing_Key_Combination__r.Key_Combination_type__c = \'Project\' AND Pricing_Condition__r.SAP_Condition_Type__c = true AND Pricing_Condition__r.Price_Types__c = \'Project\' AND Pricing_Condition__r.Condition_class__c = \'Discount\' AND Is_End_User_Rebate__c=false ORDER BY Sequence_Number__c');                 
            }
            else if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
            {
                system.debug('\n\n\n in pricing task '+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c);
                String priceType;
                if(request.pricingRequest.Spot_Type__c == 'Spot Price')
                {
                    priceType='Pricing Task-Spot';
                }
                else if(request.pricingRequest.Spot_Type__c == 'Free of Charge')
                {
                    priceType='Pricing Task-FOC';
                }
                else if(request.pricingRequest.Spot_Type__c == 'Display')
                {
                    priceType='Pricing Task-Display';
                }
                system.debug('\n\n\n testing'+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c);
                /*erpAccSeqList = [SELECT Id, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c,
Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
Sales_Pricing_Procedure__c = :request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c AND
Pricing_Key_Combination__r.Customer_Specific__c = :true AND Pricing_Key_Combination__r.Key_Combination_type__c
includes('Spot') AND Pricing_Condition__r.Price_Types__c includes (:priceType) ORDER BY Sequence_Number__c];*/
                
                //<TJ20141222> Changed whereCondition
                erpAccSeqList = (List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Sales_Pricing_Procedure__c = \''+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Customer_Specific__c = true AND Pricing_Key_Combination__r.Key_Combination_type__c includes(\'Spot\') AND Pricing_Condition__r.Price_Types__c includes(\''+priceType+'\') AND Is_End_User_Rebate__c=false ORDER BY Sequence_Number__c');               
            }
            else if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
            {
                List<Pricing_Request_Item__c> priList = [SELECT Id, Pricing_Condition_Code__c, Key_Combination_Code__c FROM Pricing_Request_Item__c
                                                         WHERE Pricing_Request__c =:request.pricingRequest.Id limit 1];
                if(priList != null && priList.size() > 0)
                {
                    /*erpAccSeqList = [SELECT Id, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c, isVolumeApplicable__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
Sales_Pricing_Procedure__c = :request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c AND
Pricing_Key_Combination__r.Customer_Specific__c = :false AND
Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard','Floor','Reference') AND
Pricing_Condition__r.Pricing_Condition_Code__c = :priList[0].Pricing_Condition_Code__c AND
Pricing_Key_Combination__r.Key_Combination_Code__c = :priList[0].Key_Combination_Code__c];*/
                    erpAccSeqList =  (List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Sales_Pricing_Procedure__c = \''+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Customer_Specific__c = false AND Pricing_Key_Combination__r.Key_Combination_type__c includes(\'Standard\',\'Floor\',\'Reference\') AND Pricing_Condition__r.Pricing_Condition_Code__c = \''+priList[0].Pricing_Condition_Code__c+'\' AND Pricing_Key_Combination__r.Key_Combination_Code__c = \''+priList[0].Key_Combination_Code__c+'\' AND Is_End_User_Rebate__c=false');                
                }
                else
                {
                    /*erpAccSeqList = [SELECT Id, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c,
Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
Sales_Pricing_Procedure__c = :request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c AND
Pricing_Key_Combination__r.Customer_Specific__c = :false AND
Pricing_Key_Combination__r.Key_Combination_type__c includes('Floor','Reference','Net Floor','Net Reference','Standard') AND
Pricing_Condition__r.Price_Types__c includes ('Floor','Reference','Net Floor','Net Reference','Standard') ORDER BY Sequence_Number__c];*/
                    erpAccSeqList = (List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Sales_Pricing_Procedure__c = \''+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Customer_Specific__c = false AND Pricing_Key_Combination__r.Key_Combination_type__c includes(\'Floor\',\'Reference\',\'Net Floor\',\'Net Reference\',\'Standard\') AND Pricing_Condition__r.Price_Types__c includes (\'Floor\',\'Reference\',\'Net Floor\',\'Net Reference\',\'Standard\') AND Is_End_User_Rebate__c=false ORDER BY Sequence_Number__c');              
                }
            }
            else
            {
                //<AV20140515>-Added isVolumeApplicable__c field
                /*erpAccSeqList = [SELECT Id, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE
Sales_Pricing_Procedure__c = :request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c AND
Pricing_Key_Combination__r.Customer_Specific__c = :true AND
Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard') AND
Pricing_Condition__r.SAP_Condition_Type__c = true AND Pricing_Condition__r.Price_Types__c includes
('Standard') AND Pricing_Condition__r.Condition_class__c like '%' ORDER BY Sequence_Number__c];*/
                if(request.requestServiceState.ogItems.isEndUserRebate)
                    erpAccSeqList =  (List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Sales_Pricing_Procedure__c = \''+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Customer_Specific__c = true AND Pricing_Key_Combination__r.Key_Combination_type__c includes(\'Standard\') AND Pricing_Condition__r.SAP_Condition_Type__c = true AND Pricing_Condition__r.Price_Types__c includes (\'Standard\') AND Pricing_Condition__r.Condition_class__c like \'%\' AND Is_End_User_Rebate__c=true ORDER BY Sequence_Number__c');               
                else
                    erpAccSeqList =  (List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Sales_Pricing_Procedure__c = \''+request.requestServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Customer_Specific__c = true AND Pricing_Key_Combination__r.Key_Combination_type__c includes(\'Standard\') AND Pricing_Condition__r.SAP_Condition_Type__c = true AND Pricing_Condition__r.Price_Types__c includes (\'Standard\') AND Pricing_Condition__r.Condition_class__c like \'%\' AND Is_End_User_Rebate__c=false ORDER BY Sequence_Number__c');               
            }
            Map<Id,List<ERP_Access_Sequence__c>> pcIdToAccSeqListMap = new Map<Id,List<ERP_Access_Sequence__c>>();
            for(ERP_Access_Sequence__c ac : erpAccSeqList)
            {
                if(pcIdToAccSeqListMap.containsKey(ac.Pricing_Condition__c))
                {
                    List<ERP_Access_Sequence__c> l1 = pcIdToAccSeqListMap.get(ac.Pricing_Condition__c);
                    l1.add(ac);
                    pcIdToAccSeqListMap.put(ac.Pricing_Condition__c,l1);
                }
                else
                {
                    List<ERP_Access_Sequence__c> l2 = new List<ERP_Access_Sequence__c>();
                    l2.add(ac);
                    pcIdToAccSeqListMap.put(ac.Pricing_Condition__c,l2);
                }
            }
            for(ERP_Procedure_Conditions__c erpProCon : erpProcList)
            {
                erpPriCondIdToScaleMap.put(erpProCon.Pricing_Condition__c,false);
                if(erpProCon.Sales_Pricing_Procedure_Condition_Config__c != null && erpProCon.Sales_Pricing_Procedure_Condition_Config__c.contains('Enable Scale'))
                {
                    erpPriCondIdToScaleMap.put(erpProCon.Pricing_Condition__c,true);
                }
                if(pcIdToAccSeqListMap.containsKey(erpProCon.Pricing_Condition__c))
                {   
                    for(ERP_Access_Sequence__c erpAccSeq : pcIdToAccSeqListMap.get(erpProCon.Pricing_Condition__c))
                    {
                        if(erpAccSeq.Hide_for_Price_Requester__c == True && PCKCviewerpermission == false){}  //SS20230501 - Enable PCKC condition
                        else
                        selOptionsList.add(new SelectOption(erpAccSeq.Id,erpAccSeq.Pricing_Condition__r.Pricing_Condition_Code__c + '-'
                                                            + erpAccSeq.Pricing_Condition__r.Pricing_Condition__c + ' : '
                                                            + erpAccSeq.Pricing_Key_Combination__r.Key_Combination_Code__c + '-'
                                                            + erpAccSeq.Key_Combination__c));
                        erpAccSeqIdToRecMap.put(erpAccSeq.Id, erpAccSeq);
                    }
                }
            }
            if(selOptionsList.size() > 1)
            {
                selOptionsList.add(0,new SelectOption('--Select--','--Select--'));
                accSeqId = '--Select--';
            }
            else if(selOptionsList.size() == 1)
            {
                accSeqId = selOptionsList[0].getValue();
                pcKcChange();
            }
        }
        else
        {
            System.debug('***in list options');
            for(OrgGroup__c p : [select id,Business__c,RecordType.Name, ERP_Distribution_Channel_Code__c, ERP_Distribution_Channel__c, ERP_Division__c, ERP_Division_Code__c, ERP_Sales_Org__c ,ERP_Sales_Org_Code__c FROM OrgGroup__c WHERE RecordType.Name = 'Business']){
                selOptionsList.add(new SelectOption(p.Business__c,p.Business__c));
            }
        }
        return selOptionsList;
        //<PP20140512> END        
        // TODO Auto-generated method stub
    }
    public Integer noOfTables {get;set;}
    public List<PARelatedList> getListWrappers() {
        System.debug('****in list of wrappers req item request :'+this.request);
        noOfTables = 0;
        String concatPCKC;
        //<PP20130427> -- Ver 5.31
        separator = PAUtil.determineLocaleSeparator();
        
        Map<String, List<Pricing_Request_Item__c>> priceCondToReqItemMap = new Map<String, List<Pricing_Request_Item__c>>();
        List<Pricing_Request_Item__c> gapRecordsList =new List<Pricing_Request_Item__c>();
        List<Pricing_Request_Item__c> nongapRecordsList =new List<Pricing_Request_Item__c>();
        Map<Id,List<Pricing_Request_Item__c>> nonGapRecordsMap =new Map<Id,List<Pricing_Request_Item__c>>();
        Map<Id,List<Pricing_Request_Item__c>> gapRecordsMap =new Map<Id,List<Pricing_Request_Item__c>>();
        List<Pricing_Request_Item__c> finalSortedList=new List<Pricing_Request_Item__c>();
        Map<string,List<Pricing_Request_Item__c>> pckcreqItemMap = new Map<string,List<Pricing_Request_Item__c>>();
        //<PP20130422> -- Ver 5.25
        //<BR20130424> -- Ver 5.29 -- added Pricing_Request__r.Attachments_on_Customer_Prices__c
        //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
        //Brundha Roll out 2 <BR20130626> -- <NS20130821> Added Landing_Cost__c field to query select clause
        //<PP20131028>
        //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
        //<BB20140404> Added Error_Indicator__c  in the query
        //<BB20140508> Added Sales_Type_Code__c,Sales_Type__c  in the query 
        //<MS20140515> Added Variant and SalesOrderType fields in the query
        //<AV20140515>-Added isVolumeApplicable__c,Volume__c,Volume_UoM__c,New_Volume__c,New_Volume_UoM__c fields int the query
        //<MS20140923> Added Material Group 5 fileds to query
        List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
        /*priList=[SELECT isNPCApplicable__c,Ship_To_Country__c,Ship_To_Country_Code__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Attachments_on_Customer_Prices__c,Price_Ref_Partner_Code__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c, ERP_Pricing_Procedure__r.Pricing_Procedure__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,BU__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c,Valid_To__c,Pricing_Request__r.Request_Type__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,
Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,
Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,
ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,
ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,
Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c,Pricing_Request__r.Pricing_Request_Type__c,  Pricing_Request_Type__c, Pricing_Condition__c,
Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,
PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,
PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,
Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,
Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,
Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById,  Below_Reference_Flag__c, Below_Floor_Flag__c,
Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,
Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,
Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,
Net_Price_Calculated_Materials__c,Total_Materials__c,Pricing_Request__r.Landing_Cost__c,Integration_Error_Message__c,Net_Price_Status__c,
Number_of_Material_with_Gross_Price__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Pricing_exception__c,
Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c,
Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c,
isVolumeApplicable__c,Volume__c,Volume_UoM__c,New_Volume__c,New_Volume_UoM__c,Material_Group_5__c,Material_Group_5_Code__c,Project__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :request.pricingRequest.Id ORDER BY PCKC__c,Gap__c];

*/
        //<TJ20141222>
        String priId;
        if(request.pricingRequest.Id==null)
        {
            priId=null;
        }
        else
        {
            priId='\''+request.pricingRequest.Id+'\'';
        }
        
        //<TJ20150202>
        priList = (List<Pricing_Request_Item__c> )PAQueryUtil.query('PARequestItem','priList', 'Pricing_Request__c = '+priId+' ORDER BY PCKC__c,Gap__c');
        
        for(Pricing_Request_Item__c pricingReqItemObj : priList)
            
            //<BB20140404>
            if(pricingReqItemObj.Rate__c != null && pricingReqItemObj.Valid_From__c != null){
                
                finalSortedList.add(pricingReqItemObj);
                System.debug('****@@@Valid from in if '+pricingReqItemObj.Valid_From__c);
                
            }
        else{
            finalSortedList.add(pricingReqItemObj);
        }
        //request.salesPriceSAP.cloneValidation(finalSortedList);
        //NPC-VIMP
        //dont uncomment or remove PAUtil.checkGrossFloorRefApplicable(finalSortedList);
        //END 
        //<TJ20140908>
        map<String,Pricing_Request_Item__c> reqID=new map<String,Pricing_Request_Item__c>();
        //<PP20141024> START
        Map<Pricing_Request_Item__c,sObject> reqSAP = new Map<Pricing_Request_Item__c,sObject>();
        Map<Pricing_Request_Item__c,sObject> reqNonSAP = new Map<Pricing_Request_Item__c,sObject>();
        //<PP20141024> END
        List<ERP_Sales_Prices_SAP__c> relatedSAPRecordsList1=new List<ERP_Sales_Prices_SAP__c>();
        List<Sales_Prices__c> relatedNonSAPRecordsList1=new List<Sales_Prices__c>();
        List<String> priReqItem=new List<String>();
        String priReqItemQry='';
        for(Pricing_Request_Item__c pr:priList)
        {
            priReqItem.add(pr.ERP_Sales_Prices_SAP__c);
            if(pr.ERP_Sales_Prices_SAP__c!=null)
            {
                priReqItemQry=priReqItemQry+'\''+pr.ERP_Sales_Prices_SAP__c+'\'';
                priReqItemQry=priReqItemQry+',';
            }
            reqID.put(pr.ERP_Sales_Prices_SAP__c,pr);
        }
        if(priReqItemQry!='')
        {
            priReqItemQry=priReqItemQry.substring(0,priReqItemQry.length()-1);          
            priReqItemQry='('+priReqItemQry+')';
        }
        else
        {
            priReqItemQry='(\''+'\')';
        }
        if(priReqItem.size() != 0)
        {
            /*relatedSAPRecordsList1   = [SELECT Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Plus_Minus_Code__c,Scale_Basis__c,Scale_Basis_Code__c, Id,Unit__c,Scaled_Price_Flag__c ,UoM__c,Per__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,
Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,
ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Plus_Minus__c,Scale_Type__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,Quantity__c
FROM ERP_Sales_Prices_SAP__c WHERE Id = :priReqItem];
*/
            relatedSAPRecordsList1 = (List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PARequestItem','relatedSAPRecordsList1',' id in '+(priReqItemQry));
            
            if(request.pricingRequest.Pricing_Request_Type__c.containsIgnoreCase('Floor')||request.pricingRequest.Pricing_Request_Type__c.containsIgnoreCase('Reference'))
            {
                /*relatedNonSAPRecordsList1   = [SELECT Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Plus_Minus_Code__c,Scale_Basis__c,Scale_Basis_Code__c, Id,Unit__c,Scaled_Price_Flag__c ,UoM__c,Per__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,
Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,
ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Plus_Minus__c,Scale_Type__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c
FROM Sales_Prices__c WHERE Id = :priReqItem];
*/
                relatedNonSAPRecordsList1 = (List<Sales_Prices__c>)PAQueryUtil.query('PARequestItem','relatedNonSAPRecordsList1',' id in '+(priReqItemQry));                                   
            }
        }
        system.debug(relatedSAPRecordsList1.size()+'  '+relatedSAPRecordsList1.size());
        for(String str:priReqItem)
        {
            if(relatedSAPRecordsList1.size()>0)
            {
                for(ERP_Sales_Prices_SAP__c sapID : relatedSAPRecordsList1)
                {
                    if(str==(String)sapID.id)
                    {
                        reqSAP.put(reqID.get(str),sapID);
                        break;
                    }
                    
                }
            }
            if(relatedNonSAPRecordsList1.size()>0)
            {
                for(Sales_Prices__c nonSapID : relatedNonSAPRecordsList1)
                {
                    if(str==(String)nonSapID.id)
                    {
                        reqNonSAP.put(reqID.get(str),nonSapID);
                        break;
                    }
                    
                }
            }
        }
        if(priList.size()>0)
            system.debug(priList[0].ERP_Pricing_Procedure__c+' '+priList[0].Pricing_Condition_Code__c+' '+priList[0].SAP_Cluster__c);
        if(priList.size()>0)
        {
            ERP_Procedure_Conditions__c proCond=[Select Sales_Pricing_Procedure_Condition_Config__c FROM ERP_Procedure_Conditions__c where Sales_Pricing_Procedure__c=:priList[0].ERP_Pricing_Procedure__c AND Pricing_Condition__c IN (SELECT ID from ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c=:priList[0].Pricing_Condition_Code__c AND SAP_Cluster__c=:priList[0].SAP_Cluster__c) LIMIT 1];
            if(proCond!=null && proCond.Sales_Pricing_Procedure_Condition_Config__c!=null && proCond.Sales_Pricing_Procedure_Condition_Config__c.contains('Enable Scale'))
            {
                enableScale='true';
            }
            else
            {
                enableScale='false';
            }
        }
        
        System.debug('****final sorted list size'+finalSortedList.size());
        Map<String,String> pcToCalculationTypeMap = new Map<String,String>();
        Map<String,String> concatPCKCToSAPPCKCMap = new Map<String,String>();
        
        Map<String,Boolean> concatPCKCToPaymentTermsMap = new Map<String,Boolean>(); //<SP20140509>
        
        Map<String,Boolean> concatPCKCToVolumeMap = new Map<String,Boolean>();//<AV20140515>
        for(Pricing_Request_Item__c sortRec:finalSortedList)
        {
            concatPCKC = sortRec.Pricing_Condition_Code__c + '-' + sortRec.Pricing_Condition__c +
                ' : ' + sortRec.Key_Combination_Code__c+ '-' + sortRec.Key_Combination__c;
            String concatSAPPCKC = sortRec.Pricing_Condition_Code__c + '-' + sortRec.Pricing_Condition__c +
                ' : ' + sortRec.Key_Combination_Code__c+ '-' + sortRec.Key_Combination_SFDC__c;
            concatPCKCToSAPPCKCMap.put(concatPCKC,concatSAPPCKC); 
            pcToCalculationTypeMap.put(concatPCKC,sortRec.Calculation_Type__c);
            
            concatPCKCToPaymentTermsMap.put(concatPCKC,sortRec.isPaymentTermsApplicable__c); //<SP20140509>
            concatPCKCToVolumeMap.put(concatPCKC,sortRec.isVolumeApplicable__c);//<AV20140515>
            
            if(priceCondToReqItemMap.containsKey(concatPCKC))
            {
                List<Pricing_Request_Item__c> l1 = new List<Pricing_Request_Item__c>();
                l1= priceCondToReqItemMap.get(concatPCKC);
                l1.add(sortRec);
                priceCondToReqItemMap.put(concatPCKC,l1);
            }
            else
            {
                List<Pricing_Request_Item__c> l1 = new List<Pricing_Request_Item__c>();
                l1.add(sortRec);
                priceCondToReqItemMap.put(concatPCKC,l1);
            }
            
        }
        
        System.debug(' ***priceCondToReqItemMap '+priceCondToReqItemMap.size());
        
        
        List<PARelatedList> relatedListRequestItemsList = new List<PARelatedList>();
        Set<String> relatedListKeySet = new Set<String>();
        relatedListKeySet = priceCondToReqItemMap.keySet();
        String sObjectName = Pricing_Request_Item__c.sObjectType.getDescribe().getName().toLowerCase();
        Map<String,Schema.FieldSet> fieldSetMap = Schema.SObjectType.Pricing_Request_Item__c.fieldSets.getMap();
        
        List<Schema.FieldSetMember> kcFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> commonFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> soldToFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> taskFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> floorFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> commonNewFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> flagFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> dateFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> newDateFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> floorRefViewFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> PaymentTermsFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> VolumeFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> RPQFields = new List<Schema.FieldSetMember>();
        List<Schema.FieldSetMember> RPQApproverFields = new List<Schema.FieldSetMember>();
        //<IM20150122>
        if(request.requestServiceState.ogitems.isEndUserRebate){
            RPQFields = fieldSetMap.get('PAPriceRequestItemRPQFields').getFields();  
            RPQApproverFields = fieldSetMap.get('PAPriceRequestItemRPQApproverFields').getFields();  
            
        }
        else{
            kcFields = fieldSetMap.get('PricingRequestItemKCFields').getFields(); 
            commonFields = fieldSetMap.get('PAPricingReqItemCommonFields').getFields();
            soldToFields = fieldSetMap.get('PAPricingReqItemSoldToFields').getFields();
            taskFields = fieldSetMap.get('PAPricingReqItemTaskFields').getFields();
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            floorFields = fieldSetMap.get('PAPricingReqItemFloorFields').getFields();       
            commonNewFields = fieldSetMap.get('PAPricingReqItemCommonNewFields').getFields();
            flagFields = fieldSetMap.get('PAPricingReqItemFlagFields').getFields();
            dateFields = fieldSetMap.get('PAPricingReqItemDateFields').getFields();
            newDateFields = fieldSetMap.get('PAPricingReqItemNewDateFields').getFields();
            floorRefViewFields = fieldSetMap.get('PAPricingReqItemFloorRefViewFields').getFields();
            PaymentTermsFields = fieldSetMap.get('PaymentTermsFields').getFields();
            VolumeFields = fieldSetMap.get('SalesVolumeFields').getFields();
        }
        
        //<PP20130424> -- Ver 5.27
        boolean hasApproverPermissionFlag = PAUtil.hasApproverPermissionSet().get('Price_Approval_Approver');
        boolean hasSalesAdminPermissionSet = false;
        if(request.requestServiceState.ogitems.isEndUserRebate){
            hasSalesAdminPermissionSet = PAUtil.hasSalesAdminPermissionSet();
        }
        
        //Ver 3.6 START
        System.debug(' ***relatedListKeySet '+relatedListKeySet.size()+relatedListKeySet);
        for(String s : relatedListKeySet){
            PARelatedList c = new PARelatedList();
            noOfTables += 1;
            c.priceType = s;
            
            System.debug('@@@concatPCKC'+s);
            //<PP20130424> -- Ver 5.27 START
            if(hasApproverPermissionFlag)
            {
                c.hasApproverPermissionFlag = true;
            }
            else
            {
                c.hasApproverPermissionFlag = false;
            }
            //<PP20130424> -- Ver 5.27 END
            c.wrapperList = new List<PAWrapper>();
            List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
            List<Schema.FieldSetMember> soldToSet = new List<Schema.FieldSetMember>();
            List<Schema.FieldSetMember> commonSet = new List<Schema.FieldSetMember>();
            List<Schema.FieldSetMember> newSet = new List<Schema.FieldSetMember>();
            List<Schema.FieldSetMember> flagSet = new List<Schema.FieldSetMember>();
            List<Schema.FieldSetMember> volumeSet = new List<Schema.FieldSetMember>();//<AV20140515>
            List<Schema.FieldSetMember> RPQSet = new List<Schema.FieldSetMember>();
            List<Schema.FieldSetMember> RPQApproverSet = new List<Schema.FieldSetMember>();
            // IM20150119 - add rpq fields to wrapper
            if(request.requestServiceState.ogitems.isEndUserRebate){
                RPQSet.addAll(RPQFields);
                if(hasApproverPermissionFlag || hasSalesAdminPermissionSet || request.requestServiceState.ogitems.isBUAdmin){
                    RPQApproverSet.addAll(RPQApproverFields);
                    c.showApproverColumns = true;
                }
                c.rateChange = String.valueOf(request.pricingRequest.Default_Discount__c);
                system.debug('ratechange for component is '+c.rateChange);
            }
            c.RPQColumns = RPQSet;
            c.RPQApproverColumns = RPQApproverSet;
            //Ver 3.9 START
            for(Schema.FieldSetMember sTSet : soldToFields)
            {
                String sTLabel = sTSet.getLabel();
                if((request.pricingRequest.Request_Type__c == 'Massive' || request.pricingRequest.Request_Type__c == 'Import')&& (s.remove(' ').toLowerCase().contains(sTLabel.remove(' ').toLowerCase()) || s.remove(' ').toLowerCase().contains(sTLabel.replace(' Code','').remove(' ').toLowerCase())))
                {
                    kcSet.add(sTSet);
                    
                }
                
            }
            for(Schema.FieldSetMember fSet : kcFields)
            {
                String fLabel = fSet.getLabel();
                System.debug('flablel&&'+fLabel);
                String kc = s.split(':',2)[1].split('-',2)[1];
                String replacedS = kc.replace('Material Price Group','');
                String replacedG = kc.replace('Material Group 5 key','');
                String replacedM = kc.replace('Material Group','');
                //Ver 5.26 START
                String replacedEU = kc.replace('End User','');
                //<PP20131028>
                String replacedSTC = kc.replace('Ship-To Country','');
                if(fLabel.contains('Material') &&(replacedG.contains('Material'))&&(!fLabel.contains('Price'))&&(replacedS.contains('Material')) &&(!fLabel.contains('Group')))
                {
                    kcSet.add(fSet);   
                }
                if(fLabel.contains('Material Price Group') &&(kc.contains('Material Price Group')))
                {
                    kcSet.add(fSet);  
                }
                 if(fLabel.contains('Material Group 2') &&(kc.contains('Material Group 2'))) 
                {
                    kcSet.add(fSet);  
                } 
                //<MS20150105>
                if(fLabel.equals('Contract') &&(kc.contains('Contract No.')))
                {
                    kcSet.add(fSet);                    
                }
                if(fLabel.equals('Contract Number') &&(kc.contains('Contract No.')))
                {
                    kcSet.add(fSet);                    
                }
                if(fLabel.contains('End User') &&(kc.contains('End User')))
                {
                    kcSet.add(fSet);                    
                }
                if(fLabel.contains('End Use') && (!fLabel.contains('End User')) && (replacedEU.contains('End Use')))
                {
                    kcSet.add(fSet);
                    
                }
                
                
                //<PP20131028> START
                if(fLabel.contains('Ship-To Country') &&(kc.contains('Ship-To Country')))
                {
                    kcSet.add(fSet);                    
                }
                if(fLabel.contains('Country') && (!fLabel.contains('Ship-To Country')) && (replacedSTC.contains('Country')))
                {
                    kcSet.add(fSet);
                    
                }
                
                if(!fLabel.contains('Material') && !fLabel.contains('End Use') && !fLabel.contains('Country') &&(kc.remove(' ').toLowerCase().contains(fLabel.remove(' ').toLowerCase()) || kc.remove(' ').toLowerCase().contains(fLabel.replace(' Code','').remove(' ').toLowerCase())))
                    //<PP20131028> END
                {
                    //Ver 5.26 END
                    kcSet.add(fSet);
                }
                //<PG20202707>
                if(flabel.contains('Distributor Name') && (kc.contains('Distributor')))
                {
                    kcSet.add(fSet);
                }   
                if(fLabel.contains('Product Hierarchy') &&(kc.contains('PH')))
                {
                    if(replacedS.contains('Material'))
                    {
                        if(fLabel != 'Product Hierarchy')
                            kcSet.add(fSet);
                    }
                    else
                        kcSet.add(fSet);
                }
                //Added extra key field profit center
                if(fLabel.contains('Profit Center') &&(kc.contains('FRB')))
                {
                    kcSet.add(fSet);
                    
                }
                //<HL20141113>Added extra key field Incoterms Code
                if(fLabel.contains('Incoterms code') &&(kc.contains('Incoterms code')))
                {
                    kcSet.add(fSet);
                }
                if(fLabel.contains('ComPartner_Code') && (kc.contains('ComPartner'))){
                    kcSet.add(fSet);
                }  
                if(fLabel.containsIgnoreCase('Material Group 5 key') && (kc.containsIgnoreCase('Material Group 5 key'))){
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Char Name') && (kc.contains('Kcode'))){
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Fix Value Date') && (kc.containsIgnoreCase('FixValDate'))){
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Material Group 1') &&((kc.contains('Material Group 1') | kc.contains('Matl grp1')
                                                           || kc.contains('Matl grp 1') || kc.contains('MatGrp1'))))
                {
                    kcSet.add(fSet);
                }   
            }
            if(request.pricingRequest.Request_Type__c=='Import' && request.pricingRequest.Pricing_Request_Type__c == 'Floor' && priceViewClicked == false && paytermsClicked == false)  //<SP20140425> && <SP20140509>- added priceviewclicked condition
            {
                for(FieldSetMember cSet : floorFields)
                {
                    kcSet.add(cSet);
                }
            }            
            
            if(paytermsClicked == false && volumeFlag != true)
            {
                for(FieldSetMember cSet : commonFields)
                {
                    String cLabel = cSet.getLabel();
                    if(priceViewClicked == false)  //<SP20140425> - added priceviewclicked condition
                    {
                        //<TJ20150602>
                        if(!(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && cLabel.contains('Valid')) && !((request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing' || (pcToCalculationTypeMap.containsKey(s) && (s.containsIgnoreCase('Percentage') || s.containsIgnoreCase('Fixed Amount')))) /*&& (cLabel.contains('Per') || cLabel.contains('UoM'))*/))
                        {
                            commonSet.add(cSet);
                            
                        }
                    }
                    else if(priceViewClicked == true)  //<SP20140425> - added priceviewclicked condition
                    {
                        if(cLabel.contains('Rate'))
                        {
                            commonSet.add(cSet);
                        }
                    }
                }
            }
            
            
            /*
if(priceViewClicked == true)
{
for(FieldSetMember frSet :floorRefViewFields)
{
kcSet.add(frSet);
}
}
*/
            c.keyCombinationColumns = kcSet;
            c.commonColumns = commonSet;
            //Ver 3.9 END
            
            if(request.pricingRequest.Pricing_Request_Type__c != 'Pricing Task' && priceViewClicked == false && paytermsClicked == false)  //<SP20140425> - added priceviewclicked condition
            {
                c.dateColumns = dateFields;
            }
            
            if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
            {
                c.newValueColumns = taskFields;
                
            }
            else
            {
                for(FieldSetMember cNSet : commonNewFields)
                {
                    String cNLabel = cNSet.getLabel();
                    system.debug('#2');
                    //<TJ20150602>
                    if(((/*request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing' ||*/ (pcToCalculationTypeMap.containsKey(s)  && pcToCalculationTypeMap.get(s)!=null))/*&&(cNLabel.contains('New Per') || cNLabel.contains('New UoM'))*/))
                    {
                        if(!(pcToCalculationTypeMap.get(s).containsIgnoreCase('Percentage') || pcToCalculationTypeMap.get(s).containsIgnoreCase('Fixed Amount')))
                            //system.debug('#1'+pcToCalculationTypeMap.get(s));
                            newSet.add(cNSet);
                        
                    }
                }
                if(priceViewClicked == true || paytermsClicked == true)   //<SP20140425> - START
                {
                    c.newValueColumns = newSet;
                }
                else if(priceViewClicked == false && paytermsClicked == false)
                {
                    c.newValueColumns = newSet;
                    c.newDateColumns = newDateFields;
                }  //<SP20140425> - END
                
            }
            
            
            //<AV20140515>-added condition to check that scaled price and expire field should not display in sales volume screen
         //   {
            if(priceViewClicked == false && paytermsClicked == false && volumeFlag != true && scaleFlag != true) //<SP20140425> - added priceviewclicked condition
            {
                for(FieldSetMember flSet : flagFields)
                {
                    String flLabel = flSet.getLabel();
                    //5.27 bala removed != pricing Task request.pricingRequest.Pricing_Request_Type__c != 'Pricing Task' &&
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    //Exclude fields : 1) Expiry & Scale in case of Import & Project 2)Expiry in case of Massive
                    //3)Number of Material with Gross Price in case of Import,Pricing Task,NCS,Massive
                    //<TJ20141106> START
                    if(!((request.pricingRequest.Pricing_Request_Type__c == 'Import'
                          || request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing') && (flLabel.contains('Exp')
                                                                                                      || flLabel.contains('Scale'))
                         || ((request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task'
                              ||  request.pricingRequest.Request_Type__c == 'Massive'
                              || request.pricingRequest.Request_Type__c=='Non Customer Specific' || request.pricingRequest.Pricing_Request_Type__c=='Floor'
                              || request.pricingRequest.Pricing_Request_Type__c=='Reference') && (flLabel.contains('Number of Material with Gross Price')))))
                    {
                        if(request.pricingRequest.Pricing_Request_Type__c =='Pricing Task' && (flLabel.contains('Exp') || flLabel.contains('Scale'))){}
                        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                        else if((request.pricingRequest.Pricing_Request_Type__c =='Floor' || request.pricingRequest.Pricing_Request_Type__c =='Reference') && (flLabel.contains('Scale') || flLabel.contains('Floor') || flLabel.contains('Reference'))){}
                        else
                        {     
                            if(Hidefloorref == TRUE)    // <SS20230501> START- To hide floor and ref fields
                            {
                              if(flLabel == 'Below Current Flag' || flLabel =='Number of Material with Gross Price' || flLabel =='Expire')
                              {
                               flagSet.add(flSet);
                              }
                            }  // <SS20230501> - END
                            else
                            {
                              flagSet.add(flSet); 
                            }     
                        }
                    }
                    //<TJ20141106> END
                }
            }
        //    }
            
            else if(priceViewClicked == true) //<SP20140425> - added priceviewclicked condition
            { 
                for(FieldSetMember flSet :floorRefViewFields )
                {
                    flagSet.add(flSet);
                }   
            }
      
            else if(paytermsClicked == true)
            {
                for(FieldSetMember flSet :paymentTermsFields )
                {
                    flagSet.add(flSet);
                }
            }
            
            //<AV20140515>-start-added volume fields in related wrapper list object
            for(FieldSetMember flSet : VolumeFields)
            {
                volumeSet.add(flSet);
            }
            c.volumeColumns = volumeSet;
            
            //<AV20140515>-end
            
            
            c.scaleColumns = flagSet;
            //Ver 3.6 END
            
            c.sObjectTypeName = sObjectName;
            if(request.pricingRequest!=null && request.pricingRequest.Request_Type__c!='Import' && request.pricingRequest.Default_Currency__c!=null)
            {
                c.defReqCur=request.pricingRequest.Default_Currency__c;
                system.debug(c.defReqCur+' '+request.pricingRequest.Default_Currency__c);
            }
            else
            {
                c.defReqCur=null;
            }
            
            
            List<Pricing_Request_Item__c> pareqItem = priceCondToReqItemMap.get(s); //neeha
            c.wrapperList = new List<PAWrapper>();
            scalevalsold=0;
            scalevalsnew=0;
            scale=false;
            for(Pricing_Request_Item__c pri: pareqItem)
            {               
                if(priceViewClicked != true && paytermsClicked!= true && volumeFlag != true && scaleFlag !=true) //<SP20140425> && <SP20140509> - added priceviewclicked condition
                {   //<TJ20150511>
                    PAWrapper rw = new PAWrapper();
                    rw.sObjectRecord = pri;
                    rw.isSelected = false;
                    rw.stringMap.put('showEditLink','true');
                    rw.stringMap.put('showNewLink','true');
                    rw.stringMap.put('showExpLink','true');
                    rw.stringMap.put('showDelLink','true');
                    rw.stringMap.put('showViewLink','false');
                    rw.stringMap.put('disableCheckBox','false');
                    rw.stringMap.put('rateLocale','');
                    rw.stringMap.put('newRateLocale','');
                    rw.stringMap.put('quantityLocale','');  
                    rw.stringMap.put('usdRateLocale','');
                    rw.stringMap.put('Scale_Quantity1_SAP','');
                    rw.stringMap.put('Scale_Quantity2_SAP','');
                    rw.stringMap.put('Scale_Quantity3_SAP','');
                    rw.stringMap.put('Scale_Quantity4_SAP','');
                    rw.stringMap.put('Scale_Quantity5_SAP','');
                    rw.stringMap.put('Scale_Quantity6_SAP','');
                    rw.stringMap.put('Scale_Quantity7_SAP','');
                    rw.stringMap.put('Scale_Quantity8_SAP','');
                    rw.stringMap.put('Scale_Quantity9_SAP','');
                    rw.stringMap.put('Scale_Quantity10_SAP','');
                    rw.stringMap.put('Scale_Rate1_SAP','');
                    rw.stringMap.put('Scale_Rate2_SAP','');
                    rw.stringMap.put('Scale_Rate3_SAP','');
                    rw.stringMap.put('Scale_Rate4_SAP','');
                    rw.stringMap.put('Scale_Rate5_SAP','');
                    rw.stringMap.put('Scale_Rate6_SAP','');
                    rw.stringMap.put('Scale_Rate7_SAP','');
                    rw.stringMap.put('Scale_Rate8_SAP','');
                    rw.stringMap.put('Scale_Rate9_SAP','');
                    rw.stringMap.put('Scale_Rate10_SAP','');
                    c.hasScaledRecordFlag = true;
                    if(relatedSAPRecordsList1.size()>0 && reqSAP.get(pri)!=null)
                    {
                        //<PP20141024> START
                        for(Integer x = 1; x <= 10; x++)
                        {
                            if(!String.isBlank((String)reqSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c')))
                                rw.stringMap.put('Scale_Quantity'+ x +'_SAP',(String)reqSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c'));
                            if(!String.isBlank((String)reqSAP.get(pri).get('ScaleRate'+ x +'__c')))
                            {
                                rw.stringMap.put('Scale_Rate'+ x +'_SAP',(String)reqSAP.get(pri).get('ScaleRate'+ x +'__c'));
                                if(scalevalsold<=x)
                                    scalevalsold=x;
                            }
                        }
                        //<PP20141024> END
                    }
                    else if(relatedNonSAPRecordsList1.size()>0 && reqNonSAP.get(pri)!=null)
                    {
                        //<PP20141024> START
                        for(Integer x = 1; x <= 10; x++)
                        {
                            if(!String.isBlank((String)reqNonSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c')))
                                rw.stringMap.put('Scale_Quantity'+ x +'_SAP',(String)reqNonSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c'));
                            if(!String.isBlank((String)reqNonSAP.get(pri).get('ScaleRate'+ x +'__c')))
                            {
                                rw.stringMap.put('Scale_Rate'+ x +'_SAP',(String)reqNonSAP.get(pri).get('ScaleRate'+ x +'__c'));
                                if(scalevalsold<=x)
                                    scalevalsold=x;
                            }
                        }
                        //<PP20141024> END                              
                    }
                    for(Integer x=10;x>=1;x--)
                    {
                        if(!String.isBlank((String)pri.get('Scale_Quantity_Scale_Value'+x+'__c')))
                        {
                            if(scalevalsnew<=x)
                                scalevalsnew=x;
                            break;
                        }
                    }                   
                    if(!String.isBlank(pri.Rate__c))
                    {
                        rw.stringMap.put('rateLocale',pri.Rate__c.replace('.',separator));
                    }
                    if(!String.isBlank(pri.New_Rate__c))
                    {
                        rw.stringMap.put('newRateLocale',pri.New_Rate__c.replace('.',separator));
                    }
                    
                    if(!String.isBlank(pri.Quantity__c))
                    {
                        rw.stringMap.put('quantityLocale',pri.Quantity__c.replace('.',separator));
                    }
                    //<PP20130422> -- Ver 5.25 START
                    if(!String.isBlank(pri.USD_Rate__c))
                    {
                        rw.stringMap.put('usdRateLocale',pri.USD_Rate__c.replace('.',separator));
                    }
                    //<PP20130422>,<PP20130427> -- Ver 5.25,5.31 END
                    //rw.stringMap.put('floorApplicable','true');//neeha-NPC -dont remove
                    //rw.stringMap.put('refApplicable','true');//neeha-NPC -dont remove
                    //System.debug('*****PAUtil.priFloorApplicableCheckMap'+PAUtil.priFloorApplicableCheckMap);
                    /*if(PAUtil.priFloorApplicableCheckMap!=null && PAUtil.priFloorApplicableCheckMap.get(pri)==false)
{   System.debug('*****'+PAUtil.priFloorApplicableCheckMap.get(pri));
rw.stringMap.put('floorApplicable','false');
}
if(PAUtil.priRefApplicableCheckMap!=null && PAUtil.priRefApplicableCheckMap.get(pri)==false)
{
rw.stringMap.put('refApplicable','false');
}  FOR NPC-not used -dont remove*/
                    if(request.requestServiceState.ogitems.isEndUserRebate){
                        rw.stringMap.put('disableCheckBox','false');
                        rw.stringMap.put('showDelLink','true');
                    }
                    if(request.pricingRequest.Request_Approval_Status__c == 'Submitted' || request.pricingRequest.NPC_Status__c == 'Waiting For Net Price' || request.pricingRequest.Request_Approval_Status__c == 'Approved'|| pri.Gap__c)
                    {
                        rw.stringMap.put('showDelLink','false');
                    }
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    if(request.pricingRequest.Request_Approval_Status__c == 'Submitted' || request.pricingRequest.NPC_Status__c == 'Waiting For Net Price' || request.pricingRequest.Request_Approval_Status__c == 'Approved' ||(pri.New__c || pri.Expire__c) || (request.pricingRequest.Pricing_Request_Type__c !=null && request.pricingRequest.Request_Type__c!='Import' &&(request.pricingRequest.Pricing_Request_Type__c.contains('Floor') || request.pricingRequest.Pricing_Request_Type__c.contains('Reference'))))
                    {
                        rw.stringMap.put('showEditLink','false');
                    }
                    
                    if(request.pricingRequest.Request_Approval_Status__c == 'Submitted' || request.pricingRequest.NPC_Status__c == 'Waiting For Net Price' ||  request.pricingRequest.Request_Approval_Status__c == 'Approved' || (pri.Edit__c || pri.Expire__c ||request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task'||request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing'||request.pricingRequest.Pricing_Request_Type__c == 'Import'))
                    {
                        rw.stringMap.put('showNewLink','false');
                    }
                    // Added - Priyanka ver.5.20 Start
                    //removing for NPC pri.Scaled_Price_Flag__c &&
                    if( (request.pricingRequest.Request_Approval_Status__c == 'Submitted' || request.pricingRequest.NPC_Status__c == 'Waiting For Net Price' || request.pricingRequest.Request_Approval_Status__c == 'Approved'))
                    {
                        c.hasScaledRecordFlag = true;
                        rw.stringMap.put('showViewLink','true');
                    }
                    //Priyanka ver.5.20 End
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    if(request.pricingRequest.Request_Approval_Status__c == 'Submitted' || request.pricingRequest.Is_End_User_Rebate__c || request.pricingRequest.NPC_Status__c == 'Waiting For Net Price' || request.pricingRequest.Request_Approval_Status__c == 'Approved' || (pri.New__c || pri.Edit__c || pri.Gap__c || pri.Rate__c == null ||request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' ||request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing'||request.pricingRequest.Request_Type__c == 'Import'))
                    {
                        rw.stringMap.put('showExpLink','false');
                    }
                    //<PP20140620> - Allowing editing of New Prices in case of NCS
                    if(pri.Gap__c || ((request.pricingRequest.Request_Type__c=='Non Customer Specific' || request.pricingRequest.Pricing_Request_Type__c == 'Floor' || request.pricingRequest.Request_Type__c == 'Reference' || (request.pricingRequest.Request_Type__c == 'Customer Specific' && request.pricingRequest.Pricing_Request_Type__c == 'Permanent'))&& (pri.Expire__c/* || pri.Edit__c || pri.New__c || !String.isBlank(pri.New_Rate__c) ||  pri.New_Valid_From__c!=null || pri.New_Valid_To__c!=null*/)))
                    {
                        rw.stringMap.put('disableCheckBox','true');
                    }
                    
                    if(rw.stringMap.containsKey('showNewLink') && rw.stringMap.get('showNewLink') == 'true')
                    {
                        rw.stringList.add('New');
                    }
                    if(rw.stringMap.containsKey('showEditLink') && rw.stringMap.get('showEditLink') == 'true')
                    {
                        rw.stringList.add('Edit');
                    }
                    if(rw.stringMap.containsKey('showDelLink') && rw.stringMap.get('showDelLink') == 'true')
                    {
                        rw.stringList.add('Del');
                    }
                    if(rw.stringMap.containsKey('showExpLink') && rw.stringMap.get('showExpLink') == 'true')
                    {
                        rw.stringList.add('Exp');
                    }
                    
                    c.wrapperList.add(rw);
                }
                else if(priceViewClicked == true && paytermsClicked!= true) //<SP20140425> && <SP20140509>- START
                {
                    system.debug('$%$%$ In priceViewClicked - '+priceViewClicked);
                    PAWrapper rw = new PAWrapper();
                    rw.sObjectRecord = pri;
                    rw.stringMap.put('rateLocale','');
                    rw.stringMap.put('newRateLocale','');
                    
                    rw.stringMap.put('currentNet','');
                    rw.stringMap.put('newNet','');
                    rw.stringMap.put('netFloor','');
                    rw.stringMap.put('netRef','');
                    rw.stringMap.put('usdRateLocale','');
                    rw.stringMap.put('quantityLocale','');
                    rw.stringMap.put('showEditLink','false');
                    rw.stringMap.put('showNewLink','false');
                    rw.stringMap.put('showExpLink','false');
                    rw.stringMap.put('showDelLink','false');
                    rw.stringMap.put('disableCheckBox','true');
                    //<TJ20140907>
                    c.hasScaledRecordFlag = true;
                    rw.stringMap.put('showViewLink','true');
                    if(!String.isBlank(pri.New_Rate__c))
                    {
                        rw.stringMap.put('newRateLocale',pri.New_Rate__c.replace('.',separator));
                    }
                    
                    if(!String.isBlank(pri.Stamp_Converted_Current_Price__c))
                    {
                        rw.stringMap.put('rateLocale',pri.Stamp_Converted_Current_Price__c.replace('.',separator));
                    }
                    else if(pri.Per__c == pri.New_Per__c && pri.Unit__c == pri.New_Unit__c && pri.New_UoM__c == pri.UoM__c && !String.isBlank(pri.Rate__c))
                    {
                        rw.stringMap.put('rateLocale',pri.Rate__c.replace('.',separator));
                    }
                    if(!String.isBlank(pri.Quantity__c))
                    {
                        rw.stringMap.put('quantityLocale',pri.Quantity__c.replace('.',separator));
                    }
                    
                    if(pri.Net_Price_Status__c == 'Waiting for Net Price')
                    {
                        rw.stringMap.put('currentNet','W');
                        rw.stringMap.put('newNet','W');
                        rw.stringMap.put('netFloor','W');
                        rw.stringMap.put('netRef','W');
                    }
                    else if(pri.Net_Price_Status__c == 'Net Price Received' && pri.Total_Materials__c > 1 && pri.Net_Price_Calculated_Materials__c > 1 )
                    {
                        rw.stringMap.put('currentNet','#'+String.valueOf(pri.Materials_Below_Net_Current__c));
                        rw.stringMap.put('newNet','#'+String.valueOf(pri.Net_Price_Calculated_Materials__c));
                        rw.stringMap.put('netFloor','#'+String.valueOf(pri.Materials_Below_Net_Floor__c));
                        rw.stringMap.put('netRef','#'+String.valueOf(pri.Materials_Below_Net_Reference__c));
                    }
                    else if(pri.Net_Price_Status__c == 'Error')
                    {
                        rw.stringMap.put('currentNet','E');
                        rw.stringMap.put('newNet','E');
                        rw.stringMap.put('netFloor','E');
                        rw.stringMap.put('netRef','E');
                    }
                    else if(pri.Net_Price_Status__c == 'Net Price Received' && pri.Total_Materials__c != null && pri.Total_Materials__c != pri.Number_of_Material_with_Gross_Price__c)
                    {
                        rw.stringMap.put('currentNet','G');
                        rw.stringMap.put('newNet','G');
                        rw.stringMap.put('netFloor','G');
                        rw.stringMap.put('netRef','G');
                    }
                    else 
                    {
                        if(!String.isBlank(pri.Stamp_Current_Net_Price__c))
                            rw.stringMap.put('currentNet',pri.Stamp_Current_Net_Price__c.replace('.',separator));
                        if(!String.isBlank(pri.Stamp_New_Net_Price__c))
                            rw.stringMap.put('newNet',pri.Stamp_New_Net_Price__c.replace('.',separator));
                        if(!String.isBlank(pri.Stamp_Floor_Net_Price__c) && request.isNetFloorVisible)
                            rw.stringMap.put('netFloor',pri.Stamp_Floor_Net_Price__c.replace('.',separator));
                        //<TJ20150703>
                        if(!String.isBlank(pri.Stamp_Reference_Net_Price__c ) && request.isNetFloorVisible)
                            rw.stringMap.put('netRef',pri.Stamp_Reference_Net_Price__c.replace('.',separator));
                    }
                    if(request.requestServiceState.ogitems.isEndUserRebate){
                        rw.stringMap.put('disableCheckBox','false');
                        rw.stringMap.put('showDelLink','false');
                    }
                    c.wrapperList.add(rw);
                    
                }
                //<SP20140425> - END
                //<SP20140509> - START
                else if(paytermsClicked == true && concatPCKCToPaymentTermsMap.get(s))
                {
                    PAWrapper rw = new PAWrapper();
                    rw.sObjectRecord = pri;
                    list<selectoption> PToption = new list<selectoption>();
                    rw.stringMap.put('newRateLocale','');
                    
                    c.isPayTermsApplicableBoolean = concatPCKCToPaymentTermsMap.get(s);
                    enablePaymentTerms = true;
                    PToption = getpaymentTermsList();
                    c.isFixedDateApplicable = enableFixedDate;
                    rw.stringMapSelectoptions.put('payTerms',PToption);
                    rw.stringMap.put('disableCheckBox','false');
                    
                    if(!String.isBlank(pri.New_Rate__c))
                    {
                        rw.stringMap.put('newRateLocale',pri.New_Rate__c.replace('.',separator));
                    }
                    
                    if(request.requestServiceState.ogitems.isEndUserRebate){
                        rw.stringMap.put('disableCheckBox','false');
                        rw.stringMap.put('showDelLink','false');
                    }
                    c.wrapperList.add(rw);
                }
                // <SP20140509> - END
                else if(volumeFlag && pri.isVolumeApplicable__c)
                {
                    PAWrapper rw = new PAWrapper();
                    rw.sObjectRecord = pri;                    
                    rw.stringMap.put('newRateLocale','');
                    
                    if(!String.isBlank(pri.New_Rate__c))
                    {
                        rw.stringMap.put('newRateLocale',pri.New_Rate__c.replace('.',separator));
                    }
                    
                    c.isVolumeApplicable = true;
                    if(request.requestServiceState.ogitems.isEndUserRebate){
                        rw.stringMap.put('disableCheckBox','false');
                        rw.stringMap.put('showDelLink','false');
                    }
                    c.wrapperList.add(rw);
                }
                
                //<TJ20140908>
                //<TJ20150511>
                if(scaleFlag)
                {
                    scale=true;
                    if(pri.scaled_Price_Flag__c == true)
                    {
                        PAWrapper rw = new PAWrapper();
                        if(pri.Pricing_Condition_Code__c == pCond && pri.Key_Combination_Code__c == kCond)
                        {
                            rw.sObjectRecord = pri;
                            rw.stringMap.put('showEditLink','false');
                            rw.stringMap.put('showNewLink','true');
                            rw.stringMap.put('showExpLink','false');
                            rw.stringMap.put('showDelLink','true');
                            rw.stringMap.put('showViewLink','false');
                            rw.stringMap.put('disableCheckBox','false');
                            rw.stringMap.put('rateLocale','');
                            rw.stringMap.put('newRateLocale','');
                            
                            rw.stringMap.put('quantityLocale','');
                            rw.stringMap.put('usdRateLocale','');
                            rw.stringMap.put('Scale_Quantity1_SAP','');
                            rw.stringMap.put('Scale_Quantity2_SAP','');
                            rw.stringMap.put('Scale_Quantity3_SAP','');
                            rw.stringMap.put('Scale_Quantity4_SAP','');
                            rw.stringMap.put('Scale_Quantity5_SAP','');
                            rw.stringMap.put('Scale_Quantity6_SAP','');
                            rw.stringMap.put('Scale_Quantity7_SAP','');
                            rw.stringMap.put('Scale_Quantity8_SAP','');
                            rw.stringMap.put('Scale_Quantity9_SAP','');
                            rw.stringMap.put('Scale_Quantity10_SAP','');
                            rw.stringMap.put('Scale_Rate1_SAP','');
                            rw.stringMap.put('Scale_Rate2_SAP','');
                            rw.stringMap.put('Scale_Rate3_SAP','');
                            rw.stringMap.put('Scale_Rate4_SAP','');
                            rw.stringMap.put('Scale_Rate5_SAP','');
                            rw.stringMap.put('Scale_Rate6_SAP','');
                            rw.stringMap.put('Scale_Rate7_SAP','');
                            rw.stringMap.put('Scale_Rate8_SAP','');
                            rw.stringMap.put('Scale_Rate9_SAP','');
                            rw.stringMap.put('Scale_Rate10_SAP','');
                            c.hasScaledRecordFlag = true;
                            if(!String.isBlank(pri.Rate__c))
                            {
                                rw.stringMap.put('rateLocale',pri.Rate__c.replace('.',separator));
                            }
                            if(!String.isBlank(pri.New_Rate__c))
                            {
                                rw.stringMap.put('newRateLocale',pri.New_Rate__c.replace('.',separator));
                            }
                            
                            if(relatedSAPRecordsList1.size()>0 && reqSAP.get(pri)!=null)
                            {
                                //<PP20141024> START
                                for(Integer x = 1; x <= 10; x++)
                                {
                                    if(!String.isBlank((String)reqSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c')))
                                        rw.stringMap.put('Scale_Quantity'+ x +'_SAP',(String)reqSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c'));
                                    if(!String.isBlank((String)reqSAP.get(pri).get('ScaleRate'+ x +'__c')))
                                        rw.stringMap.put('Scale_Rate'+ x +'_SAP',(String)reqSAP.get(pri).get('ScaleRate'+ x +'__c'));
                                }
                                //<PP20141024> END
                            }
                            else if(relatedNonSAPRecordsList1.size()>0 && reqNonSAP.get(pri)!=null)
                            {
                                //<PP20141024> START
                                for(Integer x = 1; x <= 10; x++)
                                {
                                    if(!String.isBlank((String)reqNonSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c')))
                                        rw.stringMap.put('Scale_Quantity'+ x +'_SAP',(String)reqNonSAP.get(pri).get('Scale_Quantity_Scale_Value'+ x +'__c'));
                                    if(!String.isBlank((String)reqNonSAP.get(pri).get('ScaleRate'+ x +'__c')))
                                        rw.stringMap.put('Scale_Rate'+ x +'_SAP',(String)reqNonSAP.get(pri).get('ScaleRate'+ x +'__c'));
                                }
                                //<PP20141024> END                              
                            }
                            for(Integer x=10;x>=1;x--)
                            {
                                if(!String.isBlank(rw.stringMap.get('Scale_Quantity'+ x +'_SAP')))
                                {
                                    rw.quantity=rw.stringMap.get('Scale_Quantity'+ x +'_SAP');
                                    if(scalevalsold<=x)
                                        scalevalsold=x;
                                    break;
                                }
                            }   
                            for(Integer x=10;x>=1;x--)
                            {
                                if(!String.isBlank((String)pri.get('Scale_Quantity_Scale_Value'+x+'__c')))
                                {
                                    rw.nQuantity=(String)pri.get('Scale_Quantity_Scale_Value'+x+'__c');
                                    if(scalevalsnew<=x)
                                        scalevalsnew=x;
                                    break;
                                }
                            }
                            if(request.requestServiceState.ogitems.isEndUserRebate){
                                rw.stringMap.put('disableCheckBox','false');
                                rw.stringMap.put('showDelLink','false');
                            }
                            c.wrapperList.add(rw);
                        }
                    }
                }
                
                System.debug('*****concatPCKCToSAPPCKCMap'+concatPCKCToSAPPCKCMap);
                if(concatPCKCToSAPPCKCMap.containsKey(s)){
                    c.priceType=concatPCKCToSAPPCKCMap.get(s);
                }
                if(pri.Project__c!=null && !string.isBlank(pri.Project__c))
                    c.projectPC=true;
                else
                    c.projectPC=false;
                
            }
            //<TJ20140908>
            if(scale==true)
            {
                c.isScalePrice=true;
            }
            else
                c.isScalePrice=false;
            System.debug('****** PARelatedList'+c);
            //c.runQueryFlag = true;
            
            //<AV20140515>-START-added logic to populate wrapper list with only that PCKC for which volume is configured
            //if(volumeFlag)
            //{
            //system.debug('*@@@@@volume flag:'+volumeFlag);
            //if(concatPCKCToVolumeMap.get(s))
            //{
            relatedListRequestItemsList.add(c);
            //}
            // }
            ///else
            //{
            //system.debug('*@@@@@volume flag in else:'+volumeFlag);
            //relatedListRequestItemsList.add(c);
            //}
            //<AV20140515>-END
        }
        return relatedListRequestItemsList;
        
    }
    public void add()
    {
    }
    
    public void save() {
        // TODO Auto-generated method stub
    }
    
    public void deleteRecord() {
        
    }
    
    public String getName() {
        
        return PAService.NAME_REQUESTITEMS;
        
    }
    
    public String getType() {
        return null;
    }
    
    public String validate(String desiredAction) {
        final String LINE_BREAK = '<br/>';
        
        System.debug('****in validate request'+request.pricingRequest);
        Organizational_Group_Item__c buOrgGroup ;//=new Organizational_Group_Item__c();
        buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                      Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                      Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c
                      WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND
                                            RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c
                      AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c AND
                      OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
        
        string errorMessage = '';
        
        if(desiredAction.equalsIgnoreCase('CancelTask'))
        {
            if(request.pricingRequest.Due_Date__c < system.today())
            {
                errorMessage+= LINE_BREAK +System.Label.Task_Due_Date;
            }
            return errorMessage.trim();
        }
        
        /*if(desiredAction.equalsIgnoreCase('GapCheckImport')) {
List<ERP_Sales_Prices_SAP__c> erpSAPList = new List<ERP_Sales_Prices_SAP__c>();
erpSAPList = [SELECT Valid_To__c FROM ERP_Sales_Prices_SAP__c WHERE PCKC__c=:pricingReqItem.PCKC__c AND isPriceHolder__c=true];
if(erpSAPList.size()>0) {
if(request.pricingRequest.Request_Valid_From__c!=null && (pricingReqItem.New_Valid_From__c.addDays(1)> erpSAPList[0].Valid_To__c)) {
errorMessage+= LINE_BREAK+ Label.Gap_in_pricing_Record_Error;
}
}
}*/
        if(desiredAction.equalsIgnoreCase('PricingTaskSaveReqItem') && ((pricingReqItem.Non_Commercial_Products__c == false && String.isBlank(request.materialFilter) && pricingReqItem.Id==null) || (pricingReqItem.Non_Commercial_Products__c && String.isBlank(pricingReqItem.Material__c) && pricingReqItem.Id==null) || (String.isBlank(pricingReqItem.Quantity__c)) || (!String.isBlank(pricingReqItem.Quantity__c)) || ((String.isBlank(pricingReqItem.New_UoM__c) || pricingReqItem.New_UoM__c == '--Select--') && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')) 
                                                                        || (request.pricingRequest.Spot_Type__c <> 'Free of Charge' && String.isBlank(pricingReqItem.New_Rate__c)) || (request.pricingRequest.Spot_Type__c <> 'Free of Charge' && !String.isBlank(pricingReqItem.New_Rate__c)) || ( request.pricingRequest.Spot_Type__c <> 'Free of Charge' && (String.isBlank(pricingReqItem.Pricing_Task_UoM__c) || pricingReqItem.Pricing_Task_UoM__c == '--Select--')))){
                                                                            System.debug('***chck id'+pricingReqItem.Id);
                                                                            System.debug('***** mpgFilter'+request.mpgFilter+','+pricingReqItem.New_Rate__c+','+pricingReqItem.New_Per__c+','+pricingReqItem.Pricing_Task_UoM__c+','+pricingReqItem.New_UoM__c+','+pricingReqItem.Quantity__c+','+pricingReqItem.New_Unit__c);
                                                                            //<VR20130925> DTT Rollout 
                                                                            if(pricingReqItem.Non_Commercial_Products__c == false && String.isBlank(request.materialFilter) && pricingReqItem.Id==null && (pricingReqItem.Key_Combination__c.contains('Material') && !pricingReqItem.Key_Combination__c.contains('Material Price Group'))){
                                                                                errorMessage+= LINE_BREAK+ System.Label.Material_Code_Select;
                                                                                return errorMessage.trim();
                                                                            }
                                                                            //<VR20130925> DTT Rollout 
                                                                            if(pricingReqItem.Non_Commercial_Products__c && String.isBlank(pricingReqItem.Material__c) && pricingReqItem.Id==null && (pricingReqItem.Key_Combination__c.contains('Material') && !pricingReqItem.Key_Combination__c.contains('Material Price Group') && !pricingReqItem.Key_Combination__c.contains('Material Group'))){
                                                                                errorMessage+= LINE_BREAK+ System.Label.Material_Select;
                                                                                return errorMessage.trim();
                                                                            }
                                                                            if(String.isBlank(pricingReqItem.Quantity__c)){
                                                                                errorMessage+= LINE_BREAK+ System.Label.Quantity_Mandatory_Error;
                                                                                return errorMessage.trim();
                                                                            }
                                                                            else if(!String.isBlank(pricingReqItem.Quantity__c))
                                                                            {
                                                                                try{
                                                                                    Decimal.ValueOf(pricingReqItem.Quantity__c);
                                                                                }
                                                                                catch(exception e){
                                                                                    errorMessage+=LINE_BREAK+System.Label.Invalid_Quantity_Error+LINE_BREAK;
                                                                                }
                                                                            }
                                                                            if((String.isBlank(pricingReqItem.Pricing_Task_UoM__c) || pricingReqItem.New_UoM__c == '--Select--') && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')) {
                                                                                //system.debug('----New Uom 1----'+pricingReqItem.New_UoM__c);
                                                                                //system.debug('----New Uom 2----'+pricingReqItem.Pricing_Task_UoM__c);
                                                                                errorMessage+= LINE_BREAK+ System.Label.UoM_Mandatory_Error;
                                                                                return errorMessage.trim();
                                                                            }
                                                                            if( request.pricingRequest.Spot_Type__c <> 'Free of Charge' && String.isBlank(pricingReqItem.New_Rate__c)){
                                                                                system.debug('new rate'+pricingReqItem.New_Rate__c);
                                                                                errorMessage+= LINE_BREAK+System.Label.Rate_Mandatory_Error;
                                                                                return errorMessage.trim();
                                                                            }
                                                                            else if(request.pricingRequest.Spot_Type__c <> 'Free of Charge' && !String.isBlank(pricingReqItem.New_Rate__c))
                                                                            {
                                                                                try{
                                                                                    Decimal.ValueOf(pricingReqItem.New_Rate__c);
                                                                                }
                                                                                catch(exception e){
                                                                                    errorMessage+=LINE_BREAK+System.Label.Invalid_Rate_Error+LINE_BREAK;
                                                                                }
                                                                            }
                                                                            if( request.pricingRequest.Spot_Type__c <> 'Free of Charge' ) {
                                                                                if (String.isBlank(pricingReqItem.New_Unit__c) || pricingReqItem.New_Unit__c == '--Select--'){
                                                                                    errorMessage+= LINE_BREAK+ System.Label.Unit_Mandatory_Error;
                                                                                    return errorMessage.trim();
                                                                                }
                                                                                if(pricingReqItem.New_Per__c == NULL && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')){
                                                                                    errorMessage+= LINE_BREAK+ System.Label.Per_Mandatory_Error;
                                                                                    return errorMessage.trim();
                                                                                }
                                                                                if(String.isBlank(pricingReqItem.Pricing_Task_UoM__c) || pricingReqItem.Pricing_Task_UoM__c == '--Select--'){
                                                                                    errorMessage+= LINE_BREAK+ System.Label.UoM_Mandatory_Error;
                                                                                    return errorMessage.trim();
                                                                                }
                                                                                if(pricingReqItem.New_Per__c!=null && (pricingReqItem.New_Per__c-pricingReqItem.New_Per__c.intValue()>0))
                                                                                {
                                                                                    errorMessage+=LINE_BREAK+System.Label.Per_Cannot_Be_Decimal_Error;
                                                                                    return errorMessage.trim();
                                                                                }
                                                                                
                                                                            }
                                                                            
                                                                        }
        
        //click on save without attaching any file in Pricing Task -prachi
        if(desiredAction.containsIgnoreCase('saveReqItem') || desiredAction.containsIgnoreCase('NewReqItem') || desiredAction.containsIgnoreCase('PricingTaskSaveReqItem'))
        {      
            String replacedKC='';
            String replacedEndUserKC = '';
            String replacedShipToCountryKC = '';
            final String PICK_SELECT = '--Select--';
            system.debug('pricingReqItem.Key_Combination__c is '+pricingReqItem.Key_Combination__c);
            String actualKC = pricingReqItem.Key_Combination__c;
            replacedKC=actualKC.replace('Material Price Group','');
            replacedKC=replacedKC.replace('Material Group','');
            system.debug('replacedKC is '+replacedKC);
            //Ver 5.26
            replacedEndUserKC = actualKC.replace('End User','');
            //<PP20131028>
            replacedShipToCountryKC = actualKC.replace('Ship-To Country','');
            //try-Keycombination.replace end
            
            
            
            if(pricingReqItem.Id ==null){
                
                //Ver 5.13,5.26
                //<BB20130726> --Ver 5.47 Added Incoterms in the condition
                //<PP20131028>
                if(replacedKC.containsIgnoreCase('Material') || (pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') && !replacedKC.containsIgnoreCase('Material'))|| pricingReqItem.Key_Combination__c.containsIgnoreCase('S Office') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Office') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Off.')|| pricingReqItem.Key_Combination__c.containsIgnoreCase('PriceListType')|| pricingReqItem.Key_Combination__c.containsIgnoreCase('Price List Type')|| pricingReqItem.Key_Combination__c.containsIgnoreCase('Customer Price Group') || pricingReqItem.Key_Combination__c.containsIgnoreCase('FRB') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Incoterms')|| pricingReqItem.Key_Combination__c.containsIgnoreCase('Profit Center')  || pricingReqItem.Key_Combination__c.containsIgnoreCase('Ship to') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Price Group') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Market Segment') || pricingReqItem.Pricing_Condition_Code__c.containsIgnoreCase('XPROJ') || pricingReqItem.Pricing_Condition_Code__c.containsIgnoreCase('Contract No.') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Variant') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Order Type') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Price Ref. Partner') || replacedEndUserKC.containsIgnoreCase('End Use') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Terms Of Payment') || replacedShipToCountryKC.containsIgnoreCase('Country') || pricingReqItem.Key_Combination__c.containsIgnoreCase('End User') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Ship-To Country')
                   || pricingReqItem.Key_Combination__c.containsIgnoreCase('ComPartner') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Group 5 Key') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Kcode') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Group 1') 
                   || pricingReqItem.Key_Combination__c.containsIgnoreCase('Matl grp1') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Matl grp 1') || pricingReqItem.Key_Combination__c.containsIgnoreCase('MatGrp1') || 
                   pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales District') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Partner ZF') || 
                   pricingReqItem.Key_Combination__c.containsIgnoreCase('Payer') || pricingReqItem.Key_Combination__c.containsIgnoreCase('FixValDate') || 
                   pricingReqItem.Key_Combination__c.containsIgnoreCase('Disc Ref No') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Campaign') || 
                   pricingReqItem.Key_Combination__c.containsIgnoreCase('Document Currency') || pricingReqItem.Key_Combination__c.containsIgnoreCase('State')|| pricingReqItem.Key_Combination__c.containsIgnoreCase('Sold to'))
                {   
                    if(replacedKC.containsIgnoreCase('Material') &&  pricingReqItem.Pricing_Request_Type__c!='Pricing Task')
                    {
                        if( String.isBlank(request.materialFilter))
                        {
                            System.debug('****in mat check'+request.materialFilter);
                            errorMessage+=LINE_BREAK+System.Label.Material_Select;
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') && !replacedKC.containsIgnoreCase('Material'))
                    {
                        if(String.isBlank(request.phFilter))
                        {
                            errorMessage+=LINE_BREAK+System.Label.PH_Select;
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('FRB') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Profit Center'))
                    {
                        if(String.isBlank(request.profitCenterFilter))
                        {
                            errorMessage+=LINE_BREAK+'Please provide Profit Center';
                            
                        }
                    }
                    //<PP20131028> - Removed Ship-to
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Ship to'))
                    {
                        if( String.isBlank(request.shipToFilter) )
                        {
                            
                            errorMessage+=LINE_BREAK+System.Label.ShipTo_Mandatory_Error;
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Price Group'))
                    {
                        if(String.isBlank(request.mpgFilter) || request.mpgFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.MPG_Mandatory_Error;
                            
                        }
                    }
                    //Ver 5.13 START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Market Segment'))
                    {
                        if(String.isBlank(request.marketSegmentFilter) || request.marketSegmentFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Market_Segment_Mandatory_Error;
                            
                        }
                    }
                    //<MS20140514>- Adding conditions for Variant and Sales order type START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Variant'))
                    {
                        if(String.isBlank(request.variantFilter) || request.variantFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Variant_Mandatory_Error;
                            
                        }
                    }
                    //<MS20140514>- Adding conditions for Contrac
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Contract No.'))
                    {
                        if(String.isBlank(request.contractFilter) || request.contractFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Contract_Mandatory_Error;
                            
                        }
                    }
                    //<MS20141114>
                    if(pricingReqItem.Pricing_Condition_Code__c.containsIgnoreCase('XPROJ'))
                    {
                        if(String.isBlank(request.projectFilter))
                        {
                            errorMessage+=LINE_BREAK+System.Label.Project_Mandatory_Error;
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('ComPartner'))
                    {
                        if(String.isBlank(request.comPartnerFilter) || request.comPartnerFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.ComPartner_Mandatory_Error;
                            
                        }
                    }
                    //<MS20150213>
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Group 5 Key'))
                    {
                        if(String.isBlank(request.materialGroup5KeyFilter) || request.materialGroup5KeyFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.MG5_Mandatory_Error;
                            
                        }
                    }
                    
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Order Type'))
                    {
                        if(String.isBlank(request.salesOrderTypeFilter) || request.salesOrderTypeFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Sales_Order_Type_Mandatory_Error;
                            
                        }
                    }
                    //<SS20220826> Added if condition to check Sales Order Item value is selected or not if Sales Order Item exists in Key combination START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Order Item'))
                    {
                        if(String.isBlank(request.salesOrderItemFilter) || request.salesOrderItemFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Sales_Order_Item_Mandatory_Error;
                            
                        }
                        }//<SS20220826> Added if condition to check Sales Order Item value is selected or not if Sales Order Item exists in Key combination END
                    //<SS20230501> Added if condition to check Value Center value is selected or not if Value Center exists in Key combination START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Value Center'))
                    {    
                        if(String.isBlank(request.valuecenterFilter) || request.valuecenterFilter==PICK_SELECT)
                        {  
                            errorMessage+=LINE_BREAK+System.Label.Value_Center_Mandatory_Error;
                            
                        }
                        }//<SS20230501> Added if condition to check Value Center value is selected or not if Value Center exists in Key combination END   
                    //<SS20230501> Added if condition to check Material Group 2 value is selected or not if Material Group 2 exists in Key combination START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Group 2'))
                    {
                        if(String.isBlank(request.materialGroup2Filter) || request.materialGroup2Filter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Material_Group_2_Mandatory_Error;
                            
                        }
                        }//<SS20230501> Added if condition to check Material Group 2 value is selected or not if Material Group 2 exists in Key combination END
                    //<SS20230501> Added if condition to check Ext Matl Grp value is selected or not if Ext Matl Grp exists in Key combination START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Ext Matl Grp'))
                    {
                        if(String.isBlank(request.extMaterialGroupFilter) || request.extMaterialGroupFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.External_Matl_Grp_Mandatory_Error;
                            
                        }
                        }//<SS20230501> Added if condition to check Ext Matl Grp value is selected or not if Ext Matl Grp exists in Key combination END
                    //<SS20230501> Added if condition to check Shipping Condition value is selected or not if Shipping Condition exists in Key combination START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Shipping Condition'))
                    {
                        if(String.isBlank(request.ShippingConditionFilter) || request.ShippingConditionFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Shipping_Condition_Mandatory_Error;
                        }
                    } //<SS20230501> Added if condition to check Shipping Condition value is selected or not if Shipping Condition exists in Key combination END 
                    //<SS20230501> Added if condition to check Price Zone value is selected or not if Price Zone exists in Key combination START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Price Zone'))
                    {   
                        if(String.isBlank(request.prizeZoneFilter) || request.prizeZoneFilter==PICK_SELECT)
                        {    
                            errorMessage+=LINE_BREAK+System.Label.Price_Zone_Mandatory_Error;
                            
                        }
                        }//<SS20230501> Added if condition to check Price Zone value is selected or not if Sales Order Item exists in Key combination END                                                                                         
                    //<MS20140514>END
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Price Ref. Partner'))
                    {
                        if( String.isBlank(request.priceRefPartnerFilter) )
                        {
                            errorMessage+=LINE_BREAK+System.Label.Price_Ref_Partner_Mandatory_Error;
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Terms Of Payment'))
                    {
                        if(String.isBlank(request.paymentTermsFilter) || request.paymentTermsFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Payment_Term_Error;
                            
                        }
                    }
                    if(replacedEndUserKC.containsIgnoreCase('End Use'))
                    {
                        if( String.isBlank(request.endUseFilter) || request.endUseFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.End_Use_Mandatory_Error;
                            
                        }
                    }
                    if(replacedShipToCountryKC.containsIgnoreCase('Country'))
                    {
                        if( String.isBlank(request.countryFilter) || request.countryFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Country_Mandatory_Error;
                            
                        }
                    }
                    //Ver 5.13 END
                    
                    //<PP20131028> START
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Ship-To Country'))
                    {
                        if( String.isBlank(request.shipToCountryFilter) || request.shipToCountryFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.Country_Mandatory_Error;
                            
                        }
                    }
                    //<PP20131028> END
                    //Ver 5.26 START
                    
                    
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('End User'))
                    {
                        if( String.isBlank(request.endUserFilter) )
                        {
                            errorMessage+=LINE_BREAK+System.Label.End_User_Mandatory_Error;
                            
                        }
                    }
                    
                    //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Customer Hierarchy'))
                    {
                        if( String.isBlank(request.customerHierarchyFilter) )
                        {
                            errorMessage+=LINE_BREAK+System.Label.Customer_Hierarchy_Mandatory_Error;
                            
                        }
                    }
                    //<BB20130726> Ver 5.47 2013-07-25 APAC Rollout2-Adding Logic for Extra field Incoterms
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Incoterms'))
                    {
                        if( String.isBlank(request.incotermsFilter) || request.incotermsFilter==PICK_SELECT )
                        {
                            errorMessage+=LINE_BREAK+System.Label.Incoterms_Mandatory_Error;
                            
                        }
                    }
                    //Ver 5.26 END
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Customer Price Group'))
                    {
                        if(String.isBlank(request.cpgFilter) || request.cpgFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.CPG_Mandatory_Error;
                        }
                    }
                    //Piyush <PG20202707>
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Distributor'))
                    {
                        if(String.isBlank(request.distFilter) || request.distFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.CPG_Mandatory_Error;
                        }
                    }
                    
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('PriceListType') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Price List Type'))
                    {
                        if( String.isBlank(request.priceListTypeFilter)  || request.priceListTypeFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.PriceListType_Mandatory_Error;
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('S Office') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Office') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Off.'))
                    {
                        if(String.isBlank(request.salesofficeFilter)    || request.salesofficeFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+System.Label.SalesOffice_Mandatory_Error;
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Kcode'))
                    {
                        if(String.isBlank(request.kcodeFilter))
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Kcode';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Material Group 1') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Matl grp1') 
                       || pricingReqItem.Key_Combination__c.containsIgnoreCase('Matl grp 1') || pricingReqItem.Key_Combination__c.containsIgnoreCase('MatGrp1'))
                    {
                        if(String.isBlank(request.materialGroup1Filter) || request.materialGroup1Filter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Material Group 1';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('S District') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales District') || pricingReqItem.Key_Combination__c.containsIgnoreCase('Sales Dis.'))
                    {
                        if(String.isBlank(request.salesDistrictFilter)    || request.salesDistrictFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Sales District';
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Partner ZF'))
                    {
                        if(String.isBlank(request.partnerZFFilter) || request.partnerZFFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Partner ZF';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Payer'))
                    {
                        if(String.isBlank(request.payerFilter) || request.payerFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Payer';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('FixValDate'))
                    {
                        system.debug('pricingReqItem.FixValDate__c'+pricingReqItem.FixValDate__c+' '+errorMessage);
                        system.debug(request.fixValDateFilter+' '+errorMessage);
                        /*if(String.isBlank(request.fixValDateFilter))
{
errorMessage+=LINE_BREAK+'Please enter value for mandatory field FixValDate';
system.debug(request.fixValDateFilter+' '+errorMessage);
}*/
                        
                        if(pricingReqItem.FixValDate__c==null )
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field FixValDate';
                            system.debug(pricingReqItem.FixValDate__c+' '+errorMessage);
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Disc Ref No'))
                    {
                        if(String.isBlank(request.discRefNoFilter))
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Disc Ref No';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Campaign'))
                    {
                        if(String.isBlank(request.campaignFilter) || request.campaignFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Campaign';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Document Currency'))
                    {
                        if(String.isBlank(request.documentCurrencyFilter) || request.documentCurrencyFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field Document Currency';
                            
                        }
                    }
                    if(pricingReqItem.Key_Combination__c.containsIgnoreCase('State'))
                    {
                        if(String.isBlank(request.stateFilter) || request.stateFilter==PICK_SELECT)
                        {
                            errorMessage+=LINE_BREAK+'Please enter value for mandatory field State';
                            
                        }
                    }
                    
                }
                
                
                String redefinedPH=request.phFilter;
                if(request.phFilter!=null && ! string.isBlank(request.phFilter))
                    request.phFilter=request.phFilter.toUpperCase();//added by hema
                if(!String.Isblank(request.phFilter)) 
                {
                    String s1= request.phFilter.trim();
                    request.phFilter=s1;
                    List<String> splitSelectedPHList = new List<String>();
                    
                    if(request.phFilter != null )
                    {
                        splitSelectedPHList = request.phFilter.split(',');
                    }
                    List<String> tempPHList =new List<String>();
                    String s;
                    for(integer i=0;i<splitSelectedPHList.size();i++)
                    {
                        s= splitSelectedPHList[i].trim();
                        if(!String.IsBlank(s))
                        {
                            tempPHList.add(s);
                        }
                    }
                    splitSelectedPHList.clear();
                    splitSelectedPHList.addAll(tempPHList);
                    System.debug('***splitSelectedPHList:'+splitSelectedPHList);
                    System.debug('*****pricingReqItem.BU__c'+request.pricingRequest.BU__c);
                    List<BU_PH__c> phList  =new List<BU_PH__c>();
                    phList = [SELECT Id,Business_Description__c,Product_Hierarchy__c,Product_Hierarchy__r.Description__c,
                              Product_Hierarchy__r.PH_Code__c FROM BU_PH__c WHERE Product_Hierarchy__r.PH_Code__c IN :splitSelectedPHList AND
                              OrgGroup__c=:request.requestServiceState.ogItems.selectedBU];
                    if(phList.size() != splitSelectedPHList.size())
                    {
                        errorMessage+=System.Label.Invalid_Product_Hierarchy_Error+LINE_BREAK;
                    }
                }
                
                
                
                
                //Ver 5.16 END - Commenting as this is no more required for multiple PH selection
                System.debug('***request.materialFilter'+request.materialFilter);
                if(!String.Isblank(request.materialFilter)) 
                {
                    String s1= request.materialFilter.trim();
                    request.materialFilter=s1;
                    List<String> splitSelectedMaterialList = new List<String>();
                    
                    //To add multiple records On 'Add To request' version no 1.3 start
                    if(request.materialFilter != null )
                    {
                        System.debug('***currentRequest.materialFilter'+request.materialFilter);
                        splitSelectedMaterialList = request.materialFilter.split(',');
                        System.debug('***splitSelectedMaterialList:'+splitSelectedMaterialList);
                    }
                    List<String> tempList =new List<String>();
                    for(integer i=0;i<splitSelectedMaterialList.size();i++)
                    {
                        String s= splitSelectedMaterialList[i].trim();
                        if(!String.IsBlank(S))
                        {
                            tempList.add(s);
                        }
                    }
                    splitSelectedMaterialList.clear();
                    splitSelectedMaterialList.addAll(tempList);
                    System.debug('***splitSelectedMaterialList:'+splitSelectedMaterialList);
                    
                    //<VR20130510> Ver 5.34 VR 2013-05-10 APAC Rollout1-Getting the value of configurable field from org group item
                    boolean enableVarConfigMaterial=false;
                    if(buOrgGroup!=null){
                        enableVarConfigMaterial = buOrgGroup.Enable_Variable_Config_Materials__c;                
                    }
                    
                    //adding source cluster end
                    //newly added code
                    //<VR20130510> Ver 5.34 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                    List<Material__c> materialList  =new List<Material__c>();
                    System.debug('***request.pricingRequest.Sales_Org_Code__c'+request.pricingRequest.Sales_Org_Code__c+'**request.pricingCondition.pricingCondition.SAP_Cluster__c'+request.pricingCondition.pricingCondition.SAP_Cluster__c
                                 +'**Material_RTYPE_Id'+Material_RTYPE_Id+'**enableVarConfigMaterial'+enableVarConfigMaterial);
                    //<SP20140428> - START
                    if(enableVarConfigMaterial)
                    {           
                        materialList = [SELECT Id, ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :splitSelectedMaterialList
                                        AND ERP_Sales_Org_Code__c =:request.pricingRequest.Sales_Org_Code__c AND
                                        ERP_Distribution_Channel_Code__c =:request.pricingRequest.Dist_Channel_Code__c AND
                                        ERP_Source_Cluster__c=:request.pricingCondition.pricingCondition.SAP_Cluster__c AND
                                        ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial];
                    }
                    else
                    {
                        materialList = [SELECT Id, ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :splitSelectedMaterialList
                                        AND ERP_Sales_Org_Code__c =:request.pricingRequest.Sales_Org_Code__c AND
                                        ERP_Distribution_Channel_Code__c =:request.pricingRequest.Dist_Channel_Code__c AND
                                        ERP_Source_Cluster__c=:request.pricingCondition.pricingCondition.SAP_Cluster__c AND
                                        ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id];
                    }
                    //<SP20140428> END
                    System.debug('materialList:-'+materialList);
                    System.debug('splitSelectedMaterialList:-'+splitSelectedMaterialList);
                    if(materialList.size() != splitSelectedMaterialList.size())
                    {
                        errorMessage+=System.Label.Material_Code_Invalid+LINE_BREAK;
                    }
                    //deleting material code from view state 
                    //request.materialFilter ='';
                }
                
            }
            
            /* Ver1.4 START*/
            System.debug('***enablePaymentTerms'+enablePaymentTerms+'***'+enableFixedDate+pricingReqItem.New_Payment_Terms_Fixed_Date__c);
            //<AV20140515>-START-added validation for New volume not to be blank and zero
            if(pricingReqItem!=null && !string.isBlank(pricingReqItem.id) && pricingReqItem.Pricing_Request_Type__c!=null && desiredAction.containsIgnoreCase('expire') != true && pricingReqItem.isVolumeApplicable__c == true) 
            {
                System.debug('New Volume with thousand saperator----1');
                if(pricingReqItem.New_Volume__c==null||pricingReqItem.New_Volume__c==0)
                {
                    System.debug('New Volume is blank----'+pricingReqItem.New_Volume__c);                   
                    throw new  PAException('<html>'+'Please enter value for mandatory field "Volume"'+'</html>',ApexPages.Severity.ERROR);
                }
                else if(pricingReqItem.New_Volume__c<0)
                {
                    System.debug('New Volume is less than 0----'+pricingReqItem.New_Volume__c);                   
                    throw new  PAException('<html>'+'Please enter valid value for field "Volume"'+'</html>',ApexPages.Severity.ERROR);
                } 
                else //if(pricingReqItem.New_Volume__c>0)
                {
                    System.debug('New Volume with thousand saperator----2');
                    if(pricingReqItem.New_Volume__c>=10)
                    {
                        String str = getDynamicFormatString(pricingReqItem.New_Volume__c);
                        //pricingReqItem.New_Volume__c = str;
                        System.debug('New Volume with thousand saperator----'+str);
                    }
                }
            }
            //<AV20140515>-END
            //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
            if((((pricingReqItem.Id==null) && !replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH')) || (pricingReqItem.Id!=null)) && (String.valueOf(pricingReqItem.New_Valid_From__c) == '' || String.valueOf(pricingReqItem.New_Valid_To__c) == ''||pricingReqItem.New_Unit__c == null || pricingReqItem.New_Unit__c == PICK_SELECT||(pricingReqItem.New_UoM__c == null&& request.pricingCondition.pricingCondition.Calculation_Type__c!=null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')&& !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount')) || (pricingReqItem.New_UoM__c == PICK_SELECT&&request.pricingCondition.pricingCondition.Calculation_Type__c!=null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')&& !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount'))||pricingReqItem.New_Valid_From__c == null||pricingReqItem.New_Valid_To__c == null||(String.isBlank(pricingReqItem.New_Rate__c)&&!pricingReqItem.Scaled_Price_Flag__c)||(pricingReqItem.New_Per__c == null &&request.pricingCondition.pricingCondition.Calculation_Type__c!=null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')&& !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount'))|| ((pricingReqItem.Scaled_Price_Flag__c==true && (String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value1__c) ||pricingReqItem.Scale_UoM_Scale_Unit__c == null || pricingReqItem.Scale_UoM_Scale_Unit__c == PICK_SELECT || String.IsBlank(pricingReqItem.ScaleRate1__c))) || ((!desiredAction.containsIgnoreCase('expire') && enablePaymentTerms != null && enablePaymentTerms && String.isBlank(pricingReqItem.New_Customer_Price_Payment_Terms__c)) || (!desiredAction.containsIgnoreCase('expire') && enableFixedDate != null && enableFixedDate && pricingReqItem.New_Payment_Terms_Fixed_Date__c == null) || (!desiredAction.containsIgnoreCase('expire') && enableFixedDate != null && enableFixedDate && pricingReqItem.New_Payment_Terms_Fixed_Date__c != null && pricingReqItem.New_Payment_Terms_Fixed_Date__c < system.today())))))
            {
                if(pricingReqItem.New_Valid_From__c == null && (pricingReqItem.Pricing_Request_Type__c != 'Project' &&  pricingReqItem.Pricing_Request_Type__c!='Pricing Task'))
                {
                    errorMessage+=LINE_BREAK+System.Label.Valid_From_Mandatory_Error;
                }
                if(pricingReqItem.New_Valid_To__c == null && (pricingReqItem.Pricing_Request_Type__c != 'Project' &&  pricingReqItem.Pricing_Request_Type__c!='Pricing Task'))
                {
                    errorMessage+=LINE_BREAK+System.Label.Valid_To_Mandatory_Error;
                }
                //end
                System.debug('****scaled price flag'+pricingReqItem.Scaled_Price_Flag__c);
                
                //Commented by Shiva -- Currency test start
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if(String.isBlank(pricingReqItem.New_Rate__c) &&  !pricingReqItem.Scaled_Price_Flag__c && ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH')) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge')
                {
                    errorMessage+=LINE_BREAK+System.Label.Rate_Mandatory_Error;
                }
                //Commented by Shiva -- Currency test end
                
                //validations for rate when scaled price flag is checked
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if((String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value1__c)) &&  pricingReqItem.Scaled_Price_Flag__c && ( (pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge' ){
                    errorMessage+=LINE_BREAK+System.Label.Scale_Quantity_Value_Mandatory_Error;
                }
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if((pricingReqItem.Scale_UoM_Scale_Unit__c == null || pricingReqItem.Scale_UoM_Scale_Unit__c == PICK_SELECT) &&  pricingReqItem.Scaled_Price_Flag__c && ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge' ){
                    errorMessage+=LINE_BREAK+System.Label.Scale_Unit_UoM_Mandatory_Error;
                }
                System.debug('***scale rate1'+ pricingReqItem.ScaleRate1__c);
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if((String.IsBlank(pricingReqItem.ScaleRate1__c)) &&  pricingReqItem.Scaled_Price_Flag__c && ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge'){
                    errorMessage+=LINE_BREAK+System.Label.Rate_Mandatory_Error;
                }
                //&& kcFiltersMap.get('Material') == false removed
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if((pricingReqItem.New_Unit__c == null || pricingReqItem.New_Unit__c == PICK_SELECT) && ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge')
                {
                    errorMessage+=LINE_BREAK+System.Label.Unit_Mandatory_Error;
                }
                //&& kcFiltersMap.get('Material') == false removed
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if(pricingReqItem.New_Per__c == null&&request.pricingCondition.pricingCondition.Calculation_Type__c!=null&& !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')&& !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount') && ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material')&& !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH')) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge' && pricingReqItem.Pricing_Request_Type__c != 'Project')
                {
                    errorMessage+=LINE_BREAK+System.Label.Per_Mandatory_Error;
                }
                if(pricingReqItem.New_Per__c!=null && (pricingReqItem.New_Per__c-pricingReqItem.New_Per__c.intValue()>0))
                {
                    errorMessage+=LINE_BREAK+System.Label.Per_Cannot_Be_Decimal_Error;
                    return errorMessage.trim();
                }
                //&& kcFiltersMap.get('Material') == false removed
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                if((pricingReqItem.New_UoM__c == null || pricingReqItem.New_UoM__c == PICK_SELECT)&&request.pricingCondition.pricingCondition.Calculation_Type__c!=null&& !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage') && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount')&& ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null)) && request.pricingRequest.Spot_Type__c <> 'Free of Charge' && pricingReqItem.Pricing_Request_Type__c != 'Project')
                {
                    errorMessage+=LINE_BREAK+System.Label.UoM_Mandatory_Error;
                }
                
                //<SP20140509> START
                /*if(!desiredAction.containsIgnoreCase('expire') && (enablePaymentTerms != null && enablePaymentTerms) && String.isBlank(pricingReqItem.New_Customer_Price_Payment_Terms__c))
{
errorMessage+=LINE_BREAK+System.Label.Customer_Payment_Terms_Mandatory;
}
if(!desiredAction.containsIgnoreCase('expire') && (enableFixedDate != null && enableFixedDate) && pricingReqItem.New_Payment_Terms_Fixed_Date__c == null)
{
errorMessage+=LINE_BREAK+System.Label.Fixed_Date_Payment_Terms_Mandatory;
}
if(!desiredAction.containsIgnoreCase('expire') && (enableFixedDate != null && enableFixedDate) && pricingReqItem.New_Payment_Terms_Fixed_Date__c != null && pricingReqItem.New_Payment_Terms_Fixed_Date__c < system.today())
{
errorMessage+=LINE_BREAK+System.Label.Fixed_Date_Past_Error;
}*/
                
                //<SP20140509> END
                if(desiredAction.containsIgnoreCase('PricingTaskSaveReqItem'))
                {
                    if((String.isBlank(pricingReqItem.Pricing_Task_UoM__c) || pricingReqItem.Pricing_Task_UoM__c == PICK_SELECT)){
                        //system.debug('----New Uom 4----'+pricingReqItem.New_UoM__c);
                        errorMessage+=LINE_BREAK+System.Label.UoM_Mandatory_Error;
                    }
                }
                return errorMessage.trim();
            }
            System.debug('**null check'+pricingReqItem  );
            //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price 
            if(((pricingReqItem.Id==null) && !replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null))
            {
                //<TJ20150106> Removed '=' condition
                if(pricingReqItem.Gap__c!=true && pricingReqItem.New_Valid_To__c<pricingReqItem.New_Valid_From__c &&  (pricingReqItem.Pricing_Request_Type__c!='Pricing Task' && pricingReqItem.Pricing_Request_Type__c != 'Project' ) )
                {
                    errorMessage+=LINE_BREAK+System.Label.Valid_To_Date_Out_Of_Range_Error;
                    return errorMessage.trim();
                }
                //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
                /* if(pricingReqItem.New_Valid_To__c<System.now() && (pricingReqItem.Pricing_Request_Type__c!='Pricing Task' && pricingReqItem.Pricing_Request_Type__c != 'Project' ) && (( (pricingReqItem.Id==null) && !replacedKC.containsIgnoreCase('Material')&& !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH')) || (pricingReqItem.Id!=null)))
{
errorMessage+=LINE_BREAK+System.Label.Valid_To_Date_Out_Of_Range_Error;
return errorMessage.trim();
}*/
                //<TJ20150106> Changed System.Now() to System.today()
                if(desiredAction.containsIgnoreCase('expire')!=true && pricingReqItem.New_Valid_To__c<System.today() && (pricingReqItem.Pricing_Request_Type__c!='Pricing Task' && pricingReqItem.Pricing_Request_Type__c != 'Project' ) && (( (pricingReqItem.Id==null) && !replacedKC.containsIgnoreCase('Material')&& !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH')) || (pricingReqItem.Id!=null)))
                {
                    errorMessage+=LINE_BREAK+System.Label.Valid_To_Date_Out_Of_Range_Error;
                    return errorMessage.trim();
                }
                // <MG20161227>-- Start -- Added validation for Valid from condition for Project prices for BI EMEA Surfaces
                if(pricingReqItem.Pricing_Request_Type__c=='Project' && pricingReqItem.BU__C==String.valueof(Business_Unit__c.getInstance('BI EMEA Surfaces').BUList__c))
                {
                    if(pricingReqItem.New_Valid_From__c > pricingReqItem.New_Valid_To__c || pricingReqItem.New_Valid_From__c < system.today() )
                    {
                        system.debug(system.logginglevel.error,'mansi iff condition');
                        errorMessage+=LINE_BREAK+System.Label.Valid_From_Date_Out_Of_Range_Error;  //custom settings
                        return errorMessage.trim();
                    }
                }
                //<MG20161227> -- End
                if(pricingReqItem.Gap__c!=true && desiredAction.containsIgnoreCase('expire')!=true && pricingReqItem.Pricing_Request_Type__c!='Pricing Task' && pricingReqItem.Pricing_Request_Type__c != 'Project' ){
                    if(pricingReqItem.Customer_Specific__c){
                        if(pricingReqItem.New_Valid_From__c.daysBetween(System.today())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(pricingReqItem.New_Valid_From__c)>buOrgGroup.Max_Valid_From_Offset_Cust_Spec__c){
                            errorMessage+=LINE_BREAK+System.Label.Valid_From_Date_Out_Of_Range_Error;  //custom settings
                            return errorMessage.trim();
                        }
                        
                        
                        System.debug('***diff'+pricingReqItem.New_Valid_From__c.daysBetween(pricingReqItem.New_Valid_To__c));
                        //<PP20131115>
                        if( (pricingReqItem.New_Valid_From__c.monthsBetween(pricingReqItem.New_Valid_To__c)) >buOrgGroup.Latest_Valid_To_Offset_Cust_Spec__c){
                            errorMessage+=LINE_BREAK+System.Label.Valid_To_Date_Out_Of_Range_Error;
                            return errorMessage.trim();
                        }
                    }
                    else{   
                        //added for Non customer specific
                        if(pricingReqItem.New_Valid_From__c.daysBetween(System.now().date())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(pricingReqItem.New_Valid_From__c)>buOrgGroup.Latest_Valid_From_Offset_Non_Cust_Spec__c){
                            errorMessage+=LINE_BREAK+System.Label.Valid_From_Date_Out_Of_Range_Error;   //custom settings
                            return errorMessage.trim();
                        }
                        
                        
                        System.debug('***diff'+pricingReqItem.New_Valid_From__c.daysBetween(pricingReqItem.New_Valid_To__c));
                        //<PP20131115>
                        if( (pricingReqItem.New_Valid_From__c.monthsBetween(pricingReqItem.New_Valid_To__c)) >buOrgGroup.Latest_Valid_To_Offset_Non_Cust_Spec__c){
                            errorMessage+=LINE_BREAK+System.Label.Valid_To_Date_Out_Of_Range_Error;
                            return errorMessage.trim();
                        }
                        
                    }
                }
                if(pricingReqItem.New_Per__c!=null && (pricingReqItem.New_Per__c-pricingReqItem.New_Per__c.intValue()>0))
                {
                    errorMessage+=LINE_BREAK+System.Label.Per_Cannot_Be_Decimal_Error;
                    return errorMessage.trim();
                }
            }
            //Fix for IS ID-00046797 - <PP20140926>
            //<VK20210323> START Added null check for scale uom field
            if(request.pricingRequest.Request_Type__c != 'Import' && pricingReqItem.Scale_UoM_Scale_Unit__c == null && pricingReqItem.Valid_From__c!=null && pricingReqItem.Valid_To__c!=null && !String.isBlank(pricingReqItem.Rate__c) && pricingReqItem.UoM__c!=null && pricingReqItem.Unit__c!=null && pricingReqItem.Per__c!=null)
            {
                if(pricingReqItem.New_Valid_From__c==pricingReqItem.Valid_From__c && pricingReqItem.New_Valid_To__c==pricingReqItem.Valid_To__c  && pricingReqItem.Rate__c==pricingReqItem.New_Rate__c  && pricingReqItem.Unit__c==pricingReqItem.New_Unit__c  && pricingReqItem.Per__c==pricingReqItem.New_Per__c  && pricingReqItem.UoM__c==pricingReqItem.New_UoM__c)
                {
                    errorMessage+=LINE_BREAK+System.Label.Invalid_Pricing_Values_Error;
                    return errorMessage.trim();
                }
            }
            //<VK20210323> END
            /** validation for expiry start **/
            if(desiredAction.containsIgnoreCase('expire'))
            {
                
                if(pricingReqItem.New_Valid_To__c>=pricingReqItem.Valid_To__c)
                {
                    errorMessage+=LINE_BREAK+System.Label.Valid_To_Date_Out_Of_Range_Error;
                    return errorMessage.trim();
                }
            }
            /** validation for expiry end **/
            //Plus-Minus validation
            /* Ver2.5 START*/
            
            //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
            if(((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null))&&pricingReqItem.Scaled_Price_Flag__c && desiredAction.containsIgnoreCase('expire')!=true)
            {
                /* Ver2.5 END*/
                /*adding Scale_Quantity_Scale_Value1__c negative validation Ver 4.3*/
                if((!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value1__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value1__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value2__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value2__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value3__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value3__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value4__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value4__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value5__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value5__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value6__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value6__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value7__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value7__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value8__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value8__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value9__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value9__c)<0)
                   || (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value10__c) && Decimal.ValueOf(pricingReqItem.Scale_Quantity_Scale_Value10__c)<0))
                {
                    errorMessage+=LINE_BREAK+System.Label.Quantity_Cannot_Be_Negative_Error;
                    return errorMessage.trim();
                }
                /*end ver 4.3*/
                List<Decimal> scaleList;
                List<Decimal> scaleQuantityValueList = new List<Decimal>();
                boolean sqFlag = false;
                boolean rFlag = false;
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value1__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value1__c));
                    if(String.isBlank(pricingReqItem.ScaleRate1__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate1__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value2__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value2__c));
                    if(String.isBlank(pricingReqItem.ScaleRate2__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate2__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value3__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value3__c));
                    if(String.isBlank(pricingReqItem.ScaleRate3__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate3__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value4__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value4__c));
                    if(String.isBlank(pricingReqItem.ScaleRate4__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate4__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value5__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value5__c));
                    if(String.isBlank(pricingReqItem.ScaleRate5__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate5__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value6__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value6__c));
                    if(String.isBlank(pricingReqItem.ScaleRate6__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate6__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value7__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value7__c));
                    if(String.isBlank(pricingReqItem.ScaleRate7__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate7__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value8__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value8__c));
                    if(String.isBlank(pricingReqItem.ScaleRate8__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate8__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value9__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value9__c));
                    if(String.isBlank(pricingReqItem.ScaleRate9__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate9__c))
                        sqFlag = true;
                }
                if(!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value10__c)){
                    scaleQuantityValueList.add(Decimal.valueOf(pricingReqItem.Scale_Quantity_Scale_Value10__c));
                    if(String.isBlank(pricingReqItem.ScaleRate10__c))
                        rFlag = true;
                }else{
                    scaleQuantityValueList.add(0);
                    if(!String.isBlank(pricingReqItem.ScaleRate10__c))
                        sqFlag = true;
                }
                //Sequential Quantity logic
                boolean qFlag = false;
                for(Integer i=0; i<scaleQuantityValueList.size()-1; i++)
                {
                    if( ((i == 0 && scaleQuantityValueList[i]==null) || (i != 0 && (scaleQuantityValueList[i]==null || scaleQuantityValueList[i]==0))) && (scaleQuantityValueList[i+1]!=null && scaleQuantityValueList[i+1]!=0) && !(((i == 0 && scaleQuantityValueList[i]==null) || (i != 0 && (scaleQuantityValueList[i]==null || scaleQuantityValueList[i]==0)))&& (scaleQuantityValueList[i+1]==null || scaleQuantityValueList[i+1]==0)))
                    {
                        System.debug('***scaleList--->'+scaleQuantityValueList[i]+scaleQuantityValueList[i+1]);
                        qFlag = true;
                        break;
                    }
                }
                if(qFlag==true)
                {
                    errorMessage+=LINE_BREAK+System.Label.Sequential_Quantity_Error;
                    return errorMessage.trim();
                }
                if(sqFlag==true)
                {
                    errorMessage+=LINE_BREAK+'Please enter Quantity for non empty rate';
                    return errorMessage.trim();
                }
                if(rFlag==true)
                {
                    errorMessage+=LINE_BREAK+'Please enter Rate for non empty quantity';
                    return errorMessage.trim();
                }
                //Ascending Quantity logic
                System.debug('****scaleQuantityValueList'+scaleQuantityValueList);
                for(Integer j=1; j<scaleQuantityValueList.size(); j++)
                {
                    if(scaleQuantityValueList[j] == 0 || scaleQuantityValueList[j] == null)
                    {
                        scaleQuantityValueList.remove(j);
                        j--;
                    }
                }
                System.debug('****scaleQuantityValueList'+scaleQuantityValueList);
                List<Decimal> l1 = new List<Decimal>();
                l1.addAll(scaleQuantityValueList);
                
                List<Decimal> qSortedList = new List<Decimal>();
                qSortedList = PAUtil.sortRateList(l1,'asc');
                System.debug('****sorted list before'+scaleQuantityValueList);
                System.debug('****sorted list'+qSortedList);
                if(qSortedList != scaleQuantityValueList)
                {   
                    errorMessage+=LINE_BREAK+System.Label.Quantity_Value_Ascending_Error;
                    return errorMessage.trim();
                }
                /*added for checking duplciates in the list*/
                else{
                    for(Integer j=1; j<qSortedList.size(); j++)
                    {
                        if(qSortedList[j] ==qSortedList[j-1] )
                        {
                            errorMessage+=LINE_BREAK+System.Label.Quantity_Value_Ascending_Error;
                            return errorMessage.trim();
                        }
                    }
                }
                /*end*/
                //Sequential
                /*boolean flag = false;
for(Integer i=0; i<scaleList.size()-1; i++)
{
if((scaleList[i]==null || scaleList[i]==0) && (scaleList[i+1]!=null && scaleList[i+1]!=0) && !((scaleList[i]==null || scaleList[i]==0) && (scaleList[i+1]==null || scaleList[i+1]==0)))
{
System.debug('***scaleList--->'+scaleList[i]+scaleList[i+1]);
flag = true;
break;
}
}
if(flag==true)
{
errorMessage+=LINE_BREAK+System.Label.Sequential_Rate_Error;
return errorMessage.trim();
}*/
                //Sequential Rate
                boolean flag = false;
                for(Integer i=1; i<=9; i++)
                {
                    Integer j = i+1;
                    if(String.isBlank((String)pricingReqItem.get('ScaleRate'+i+'__c')) && !String.isBlank((String)pricingReqItem.get('ScaleRate'+j+'__c'))&& !(String.isBlank((String)pricingReqItem.get('ScaleRate'+i+'__c')) && String.isBlank((String)pricingReqItem.get('ScaleRate'+j+'__c'))))
                    {
                        
                        flag = true;
                        break;
                    }
                }
                if(flag==true)
                {
                    errorMessage+=LINE_BREAK+System.Label.Sequential_Rate_Error;
                    return errorMessage.trim();
                }
                //Ascending order
                
                scaleList = new List<Decimal>();
                for(Integer j=1; j<=10; j++)
                {
                    if(!String.isBlank((String)pricingReqItem.get('ScaleRate'+j+'__c')))
                        scaleList.add(Decimal.valueOf((String)pricingReqItem.get('ScaleRate'+j+'__c')));
                }
                List<Decimal> l2 = new List<Decimal>();
                l2.addAll(scaleList);
                if(request.pricingCondition!=null && request.pricingCondition.pricingCondition!=null && request.pricingCondition.pricingCondition.Check_Scale__c != null &&request.pricingCondition.pricingCondition.Check_Scale__c == 'Ascending')
                {
                    List<Decimal> sortedList = new List<Decimal>();
                    sortedList = PAUtil.sortRateList(l2,'asc');
                    if(sortedList != scaleList)
                    {
                        errorMessage+=LINE_BREAK+System.Label.Scale_Rates_Ascending_Error;
                        return errorMessage.trim();
                    }
                    else
                    {
                        for(Integer j=1; j<sortedList.size(); j++)
                        {
                            if(sortedList[j] ==sortedList[j-1] )
                            {
                                errorMessage+=LINE_BREAK+System.Label.Scale_Rates_Ascending_Error;
                                return errorMessage.trim();
                            }
                        }
                    }
                }
                
                //Descending order
                else if (request.pricingCondition!=null && request.pricingCondition.pricingCondition!=null && request.pricingCondition.pricingCondition.Check_Scale__c != null &&request.pricingCondition.pricingCondition.Check_Scale__c == 'Descending')
                {
                    List<Decimal> sortedList = new List<Decimal>();
                    sortedList = PAUtil.sortRateList(l2,'desc');
                    System.debug('****sorted list before'+scaleList);
                    System.debug('****sorted list'+sortedList);
                    if(sortedList != scaleList)
                    {
                        errorMessage+=LINE_BREAK+System.Label.Scale_Rates_Descending_Error;
                        return errorMessage.trim();
                    }
                    else
                    {
                        for(Integer j=1; j<sortedList.size(); j++)
                        {
                            if( sortedList[j] ==sortedList[j-1] )
                            {
                                errorMessage+=LINE_BREAK+System.Label.Scale_Rates_Descending_Error;
                                return errorMessage.trim();
                            }
                        }
                    }
                }
            }
            
            /* Ver1.4 END*/
            //<IM20150123>
            
            //Ver 5.16 -- Added condition for not throwing error if PH is present in KC and if it is a New Price
            if(!request.requestServiceState.ogitems.IsEndUserRebate && pricingReqItem.Pricing_Request_Type__c != 'Project' && pricingReqItem.Pricing_Request_Type__c != 'Pricing Task' && ((pricingReqItem.Id==null) && (!replacedKC.containsIgnoreCase('Material') && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH') ) || (pricingReqItem.Id!=null)))
            {
                //expiry holder check
                //query all the holders for the particular KC
                System.debug('***check');
                List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                Sobject recentexpiredHolder;
                List<String> PHSplit = new List<String>();
                String s=null;
                system.debug('***pricingReqItem.Id : '+pricingReqItem.Id);
                if(pricingReqItem.Id!=null){
                  //System.Debug('pricingReqItemList-KC :'+pricingReqItem);
                    s= pricingReqItem.PCKC__c;
                }
                else{
                    //if pricingReqItem.Id==null
                    ERP_Pricing_Condition__c presentPCDesc = [select Pricing_Condition_Code__c,Pricing_Condition_Description__c,
                                                              Scale_Base__c,Scale_Type__c,Check_Scale__c,SAP_Client_Id__c,SAP_Application_Id__c,
                                                              SAP_Cluster__c from ERP_Pricing_Condition__c where
                                                              id = :request.pricingCondition.selectedPricingCondition];
                    //needs to be modified.
                    
                    String finalPH;
                    if(request.phFilter!=null){
                        finalPH=request.phFilter;
                    }
                    s = presentPCDesc.Pricing_Condition_Code__c + request.pricingRequest.Sales_Org_Code__c+ request.pricingRequest.Dist_Channel_Code__c + request.pricingRequest.Division_Code__c+request.customer.customerCode+request.materialFilter+finalPH+ request.shipToFilter;
                    if(request.salesOfficeFilter!=null && request.salesOfficeFilter<> ''){
                        s=s+request.salesOfficeFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.cpgFilter!=null && request.cpgFilter<> ''){
                        s=s+request.cpgFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    //Piyush <PG20202707>
                    if(request.distFilter!=null && request.distFilter<> ''){
                        s=s+request.distFilter.split('-',2)[0];
                    }
                    if(request.mpgFilter!=null && request.mpgFilter<> ''){
                        s=s+request.mpgFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.priceListTypeFilter!=null && request.priceListTypeFilter<> ''){
                        s=s+request.priceListTypeFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    //Ver 5.13 START
                    //<PP20131022> START
                    //s=s+request.paymentTermsFilter;
                    if(!String.isBlank(request.paymentTermsFilter)){
                        s=s+request.paymentTermsFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    //<PP20131022> END
                    //remove when disc ref filter is completed
                    s=s+request.discRefFilter;
                    
                    if(request.endUseFilter!=null && request.endUseFilter<> ''){
                        s=s+request.endUseFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.marketSegmentFilter!=null && request.marketSegmentFilter<> ''){
                        s=s+request.marketSegmentFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    //<MS20140514>- Adding conditions for Variant and Sales Order Tyope START
                    if(request.variantFilter!=null && request.variantFilter<> ''){
                        s=s+request.variantFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.contractFilter!=null && request.contractFilter<> ''){
                        s=s+request.contractFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.salesOrderTypeFilter!=null && request.salesOrderTypeFilter<> ''){
                        s=s+request.salesOrderTypeFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(!String.isBlank(request.comPartnerFilter))
                        s=s+request.comPartnerFilter;
                    
                    //<MS20140514> END
                    if(request.materialGroup5KeyFilter!=null && request.materialGroup5KeyFilter<> ''){
                        s=s+request.materialGroup5KeyFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    /*price ref partner*/
                    if(!String.isBlank(request.priceRefPartnerFilter))
                        s=s+request.priceRefPartnerFilter;
                    
                    if(request.countryFilter!=null && request.countryFilter<> ''){
                        s=s+request.countryFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    //Ver 5.13 END
                    //Ver 5.26 START
                    if(!String.isBlank(request.endUserFilter))
                        s=s+request.endUserFilter;                
                    //Ver 5.26 END
                    
                    //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy,FRB
                    if(!String.isBlank(request.customerHierarchyFilter))
                        s=s+request.customerHierarchyFilter;
                    if(!String.isBlank(request.profitCenterFilter))
                        s=s+request.profitCenterFilter;
                    //<BB20130726> Ver 5.47 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Incoterms
                    if(!String.isBlank(request.incotermsFilter)){
                        s=s+request.incotermsFilter.split('-',2)[0];
                    }
                    //<PP20131028> START
                    if(!String.isBlank(request.shipToCountryFilter))
                    {
                        s = s+request.shipToCountryFilter.split('-',2)[0];
                    }
                    if(!String.isBlank(request.kcodeFilter))
                        s=s+request.kcodeFilter;
                    if(request.materialGroup1Filter!=null && request.materialGroup1Filter<> ''){
                        s=s+request.materialGroup1Filter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.salesDistrictFilter!=null && request.salesDistrictFilter<> ''){
                        s=s+request.salesDistrictFilter.split('-',2)[0];
                    }   
                    if(!String.isBlank(request.partnerZFFilter))
                        s=s+request.partnerZFFilter;
                    if(!String.isBlank(request.payerFilter))
                        s=s+request.payerFilter;
                    /*if(!String.isBlank(request.fixValDateFilter))
s=s+request.fixValDateFilter;
*/
                    if( pricingReqItem.FixValDate__c!=null )
                        s=s+pricingReqItem.FixValDate__c;
                    
                    if(!String.isBlank(request.discRefNoFilter))
                        s=s+request.discRefNoFilter;
                    if(request.campaignFilter!=null && request.campaignFilter<> ''){
                        s=s+request.campaignFilter.split('-',2)[0];
                    }
                    if(request.documentCurrencyFilter!=null && request.documentCurrencyFilter<> ''){
                        s=s+request.documentCurrencyFilter.split('-',2)[0];
                    }
                    if(request.stateFilter!=null && request.stateFilter<> ''){
                        s=s+request.stateFilter.split('-',2)[0];
                    }               
                    //<PP20131028> END
                    //need to modify once the filters are completed
                    //s = presentPCDesc.Pricing_Condition_Code__c + request.pricingRequest.Sales_Org_Code__c+ request.pricingRequest.Division_Code__c+request.pricingRequest.Dist_Channel_Code__c + request.customer.customerCode+request.materialFilter+request.PHFilter+request.profitCenterFilter+request.shipToFilter+request.salesOfficeFilter+request.cpgFilter+request.mpgFilter+request.priceListTypeFilter;
                    
                }
                if(s!=null)
                {
                    s= s.remove('null');
                }
                System.debug('****s value'+s);
                appHolderList =new List<Sobject>();
                //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                List<Sobject> holList= new List<Sobject>();
                if(request.pricingRequest.Pricing_Request_Type__c!=null && (request.pricingRequest.Pricing_Request_Type__c.contains('Floor') || request.pricingRequest.Pricing_Request_Type__c.contains('Reference'))) {
                    /*holList= [SELECT Ship_To_Country_Code__c,Ship_To_Country__c,ShipTo__c, ShipTo_Code__c, Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,
Division_Code__c,End_Use_Code__c,End_Use__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,
PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,
PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
SAP_Client_ID__c,Sold_To_Code__c,Sold_To__c,
PCKC__c,Terms_of_Payment_Code__c,Approved_Date__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,ComPartner__c,ComPartner_Code__c FROM  Sales_Prices__c WHERE PCKC__c =:s  AND Price_Holder__c=null ORDER BY Valid_To__c desc];*/
                    
                    holList = (List<Sales_Prices__c>)PAQueryUtil.query('PARequestItem','holList',' PCKC__c =\''+s+'\' AND Price_Holder__c=null ORDER BY Valid_To__c desc');          
                }
                else {
                    /*holList= [SELECT Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,   End_User__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,
PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,
PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
SAP_Client_ID__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,
ShipTo__c,ShipTo_Code__c,PCKC__c,Terms_of_Payment_Code__c,Approved_Date__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,
ComPartner__c,ComPartner_Code__c 
FROM  ERP_Sales_Prices_SAP__c WHERE PCKC__c =:s  AND Price_Holder__c=null ORDER BY Valid_To__c desc];*/
                    holList = (List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PARequestItem','holList1',' PCKC__c =\''+s+'\' AND Price_Holder__c=null ORDER BY Valid_To__c desc');       
                }
                for(Sobject e: holList){
                    //VIMp***e.Valid_To__c+1
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    if((pricingReqItem.New_Valid_From__c>= ((Date)e.get('Valid_From__c')) && pricingReqItem.New_Valid_From__c<=(((Date)e.get('Valid_To__c'))+1)) ||(pricingReqItem.New_Valid_To__c >= (((Date)e.get('Valid_From__c')) -1) && pricingReqItem.New_Valid_To__c<=((Date)e.get('Valid_To__c')))
                       || (((Date)e.get('Valid_From__c')) >=pricingReqItem.New_Valid_From__c && ((Date)e.get('Valid_From__c')) <=pricingReqItem.New_Valid_To__c) || (((Date)e.get('Valid_To__c'))>=pricingReqItem.New_Valid_From__c && ((Date)e.get('Valid_From__c')) <= pricingReqItem.New_Valid_To__c) ){
                           appHolderList.add(e);
                           break;
                       }
                }
                if(appHolderList!=null && appHolderList.size()==0)
                {
                    //no app holder
                    System.debug('*****no app holder');
                    if(holList.size()!=0)
                    {
                        recentexpiredHolder= holList.get(0);
                        System.debug('*****recentexpiredHolder'+recentexpiredHolder);
                    }
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    if(recentexpiredHolder!=null && (System.now()<=((Date)recentexpiredHolder.get('Valid_To__c'))) )
                    {
                        errorMessage+=LINE_BREAK+System.Label.Review_Pricing_Timeline_Error; //custom settings
                        
                        return errorMessage.trim();
                    }
                }
            }
        }
        
        if(desiredAction.equalsIgnoreCase('generatePCL'))
        {
            if(String.isBlank(request.customerContact) || String.isBlank(request.pclDisplayPopUp)) 
            {
                if(String.isBlank(request.customerContact))
                    errorMessage+= LINE_BREAK +System.Label.Customer_contact;
                if(String.isBlank(request.pclDisplayPopUp))
                    errorMessage+= LINE_BREAK +System.Label.Select_template;
            }
            return errorMessage.trim();
        }
        return errorMessage.trim();
    } 
    /*
* Author      :   Neeharika
* Method Name  :   closePopUp
* Parameters   :   -
* Return type  :   void
* Description  :   This method is used to close the error pop up window
*/
    private void closePopUp(){
        showGapError=false;
        showExpireMsg =false;
        showPriceCheck=false;
        showPriceTail=false;
        showRoundOffPopUp=false;
    }
    /*
* Author      :   
* Method Name  :   action
* Parameters   :   -
* Return type  :   string
* Description  :   This method implements the interface method.
*/
    public string action(String newPagelabel,String currentPageLabel, String desiredAction) {
        final String PICK_SELECT = '--Select--';
        final String PERCENT='%';
        //System.debug('PC Code at the start of action method'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
        System.debug('****In action method of Request Item'+desiredAction);
        Decimal standardDecimal = 1.1;
        String localeDecimalStr = standardDecimal.format();
        separator = localeDecimalStr.subString(1,2);
        if(separator == ',')
        {
            nonLocaleSeparator = '.';
        }
        else if(separator == '.')
        {
            nonLocaleSeparator = ',';
        }
        
        //<SP20140425> - START
        if(desiredAction.equalsIgnoreCase('PriceView'))
        {
            priceViewClicked = true;
            system.debug('*&*&* Price View Clicked %$% '+priceViewClicked);
            relatedWrappersList=getListWrappers();
            /*List<Pricing_Request_Item__c> prViewList=[SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Disc_Ref__c,
Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c,
Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,
ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,
ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,
Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,
Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,
PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,
PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,
Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,
Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,
Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById,  Below_Reference_Flag__c, Below_Floor_Flag__c,
Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c,
Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c,
Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,USD_Rate__c,Base_UoM__c,
Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,
Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,
Net_Price_Calculated_Materials__c,Total_Materials__c ,Integration_Error_Message__c,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,Pricing_Request__r.Request_Type__c,Pricing_Request__r.Current_Approver__c,
Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c,
Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c ,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request_Item__c WHERE Pricing_Request__c =:request.pricingRequest.Id];*/
            List<Pricing_Request_Item__c> prViewList=(List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequestItem','requestItemList',' Pricing_Request__c =\''+request.pricingRequest.Id+'\'');
            if(calNetPrice == NULL) 
                calNetPrice =new PACalculateNetPrice();
            //calNetPrice.viewNetPrice(prViewList,priceViewClicked);
            
        }
        if(desiredAction.equalsIgnoreCase('PriceViewPayTermsDone'))
        {
            priceViewClicked = false;
            paytermsClicked = false;
            system.debug('*&*&* Price View Clicked %$% '+priceViewClicked);
            system.debug('*&*&* Price View Clicked %$% '+paytermsClicked);
            relatedWrappersList=getListWrappers();
        }
        //<SP20140425> - END
        //<MS20140926>
        if(desiredAction.equalsIgnoreCase('TaskContinue')||desiredAction.equalsIgnoreCase('CSPContinue'))
        {
            return newpagelabel;
        }
        //<PP20140512> START
        if(desiredAction.containsIgnoreCase('PCKCChange'))
        {
            pcKcChange();
            
        }
        //<PP20140512> END
        
        //<PP20140520> START
        if(desiredAction.equalsIgnoreCase('bulkNPCCal'))
        {
            system.debug('N*****BULK NPC CALL'+request.pricingRequest.Id);
            PACalculateNetPrice calNetPrice1 = new PACalculateNetPrice();
            calNetPrice1.bulkNetPriceCalculation(request.pricingRequest.Id);
            relatedWrappersList = getListWrappers();
            /*request.requestServiceState.currentRequest.pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,
Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c,
Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c,
Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c,
Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c,
Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name,
On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate,
LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, 
Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c,
Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,
CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, 
Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c, 
Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c,
On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, 
Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, 
Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, 
NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, 
Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c,
Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c,
Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,Delegation_Comments__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request__c WHERE Id = :request.pricingRequest.Id];*/
            request.requestServiceState.currentRequest.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','request.requestServiceState.currentRequest.pricingRequest',' Id = \''+request.pricingRequest.Id+'\''))[0];                                                             
            return newPageLabel;
        }
        //<PP20140520> END
        //<SP20140509> - START
        if(desiredAction.equalsIgnoreCase('PayTermsView'))
        {
            paytermsClicked = true;
            system.debug('*&*&* Price View Clicked %$% '+paytermsClicked);
            relatedWrappersList=getListWrappers();
        }
        //<SP20140509> - START
        
        //5.33 Remvoving the comment: below code was commented.
        if(desiredAction.equalsIgnoreCase('markCompleted')){
            //system.debug('check&&&&'+taskRecord.TaskCompletionComment__c);
            //system.debug('check&&&&'+popUpFlag);
            popUpFlag='TaskComment';
            return newPagelabel;    
        }
        if(desiredAction.equalsIgnoreCase('markCompleted')){
            //popUpFlag='TaskComment';
            //system.debug('@@@@@@@@select task'+taskrecord);
            
            //Ver 5.32 commenting
            //TaskReassign taskReassign = new TaskReassign();
            //taskReassign.reassignTask2(request);
            if(request.requestServiceState <> NULL)         
                taskReassignCall.reassignTask1(request.requestServiceState.currentRequestItem);         
            return newPagelabel;    
        }
        //<MS20140506> Adding Landing page link condition
        if(desiredAction.containsIgnoreCase('landingpage'))
        {
            return newpagelabel;
            
        }
        
        if(desiredAction.equalsIgnoreCase('saveTask')){ 
            //Ver 5.32 commenting       
            //TaskReassign taskReassign = new TaskReassign();
            //taskReassign.reassignTask2(request);
            if(request.requestServiceState <> NULL) 
                taskReassignCall.reassignTask2(request.requestServiceState.currentRequestItem);
            return newPagelabel;    
        }
        
        
        //Ver 5.20 Ends
        
        //for pricing task added by sanjib
        if(desiredAction.equalsIgnoreCase('selectAttachment')){
            //request.pricingRequest = pricingRequest;
            //<TJ20150610>
            popupValue=popupFlag;
            popupFlag='attachPopUp';
            if(request.pricingRequest.Request_Type__c=='Import' && newPagelabel==null)
                newPagelabel = 'PAImportReqItems';
            if(request.pricingRequest.Request_Type__c!='Mass Import' && request.pricingRequest.Request_Type__c!='Import')
                popUpFlag='Pricingtask';
            return newPagelabel;
        }
        
        
        //for pcl new requirement- START
        
        if(desiredAction.equalsIgnoreCase('Closewindow'))
        {
            request.pclDisplayPopUp='';
            request.pclShowSelectionTable = false;
            //return 'PAPclTemplateSelectionPCO';
        }
        
        if(desiredAction.equalsIgnoreCase('generatePcl'))
        {
            String validateChk;
            validateChk = validate('generatePcl');
            //system.debug('***&* validateChk *** '+validateChk);
            
            if(!String.isBlank(validateChk))
            {
                validateChk=validateChk.remove('null');
                //value = null;
                throw new PAException('<html>'+validateChk+'</html>', ApexPages.Severity.ERROR);
            }
            else
            {
                request.action('','','PCLGenerationPriReq');
            }   
            //return 'PAPCLCustomerSpecific';
        }
        
        //calling the selectTemplate action from request class
        if(desiredAction.equalsIgnoreCase('selectTemplateForPcl')){
            
            request.action('PAPricingRequest', 'PAPricingRequest', 'selectTemplate');
        }
        
        //calling the PCLSEARCH action from request class
        if(desiredAction.equalsIgnoreCase('searchForPCLSEARCH')){
            system.debug('***check'+request.email);
            //if(request.email==null || request.email.size()==0) {
            request.email = new Map<string,string>();
            request.email.put('Type','');
            request.email.put('Language','');
            request.email.put('Description','');
            //}
            request.action('PAPricingRequest', 'PAPricingRequest', 'PCLSEARCH');
        }
        //PCL End
        if(desiredAction.equalsIgnoreCase('CancelAddtoAttachment')){
            //<TJ20150610>
            if(popupvalue==null)
                popupvalue='';
            popUpFlag=popupvalue;
            return newPagelabel;
        }
        //add attachment
        if(desiredAction.equalsIgnoreCase('AddtoAttachment'))
        {          
            if(document.body == NULL)
            {
                throw new  PAException(System.Label.select_file,ApexPages.Severity.ERROR);
            }
            
            if(String.isBlank(document.Description))
            {
                document = NULL;
                throw new  PAException(System.Label.Enter_Description,ApexPages.Severity.ERROR);
                
            }
            //<BR20130424> Ver 5.29 --starts
            else
            {
                //<TJ20150610> START
                popUpFlag=(request.pricingRequest.Request_Type__c.equalsIgnoreCase('Import'))?popupvalue:'';
                //system.debug('check here');
                Attachment myAttachment; 
                system.debug('taskAttachmentParam'+taskAttachmentParam);
                myAttachment = new Attachment();                   
                myAttachment.Body = document.body;
                myAttachment.name = document.name;
                myAttachment.Description = document.Description;
                myAttachment.parentid = (taskAttachmentParam!=null && taskAttachmentParam.equalsIgnoreCase('TaskAttachment'))?taskRecord.Id:request.pricingRequest.Id;
                insert myAttachment;
                //<TJ20150610> END
                list<Attachment> attachments = new list<Attachment>();
                
                attachments = [select id,Name,OwnerId,Description,CreatedDate,CreatedBy.Name from  Attachment where id=:myAttachment.id ];
                document = null;
                
                notesAttachment(attachments);
            }
            ////<BR20130424> Ver 5.29 ends
            return newPagelabel;
        }
        
        //delete the selected attachment
        if(desiredAction == 'deleteSelectedAttachment'){
            list<PAWrapper> DisplayAttachmentList = new list<PAWrapper>();
            List<sObject> deleteAttachmentList = new List<sObject>();
            //PAWrapper wrapToBeDeleted = null;
            //system.debug('size of the list'+attachPAWrapperList.size());
            for(PAWrapper wrapToBeDeleted :  attachPAWrapperList){
                if(wrapToBeDeleted.isSelected == true)
                {
                    deleteAttachmentList.add(wrapToBeDeleted.sObjectRecord);
                }
                
                else {
                    DisplayAttachmentList.add(wrapToBeDeleted);
                    
                }
            }
            attachPAWrapperList.clear();
            attachPAWrapperList = DisplayAttachmentList;
            //system.debug('####delete'+deleteAttachmentList.size());
            delete deleteAttachmentList;
            selectAllAttachments = false;
            //system.debug('delete'+deleteAttachmentList);
            return newPagelabel;
            
        }
        //checkbox to delete all attachments
        if(desiredAction == 'selectAttachmentToDelete'){
            if(selectAllAttachments == true)
            {
                for(PAWrapper selectallWrapper : attachPAWrapperList)
                {
                    selectallWrapper.isSelected = true;
                }
            }
            else
            {
                for(PAWrapper selectallWrapper : attachPAWrapperList)
                {
                    selectallWrapper.isSelected = false;
                }
            }
            return newPagelabel;
        }
        if(desiredAction=='selectFile') {
            if(string.isBlank(request.pricingRequest.Request_Name__c)) {
                throw new PAException(Label.Please_Enter_Request_Name_Error,ApexPages.severity.Error);
            }
            //<PP20130716> START
            if(request.requestServiceState != null && request.requestServiceState.ogItems != null && request.requestServiceState.ogItems.orgGroupItems != null && request.requestServiceState.ogItems.orgGroupItems.Enable_Request_Class__c && (request.pricingRequest.Request_Class__c==null || request.pricingRequest.Request_Class__c=='--Select--'))
            {
                throw new PAException(Label.Request_Class_Mandatory_Error);
            }
            //<PP20130716> END
            if(request.pricingRequest.Request_Reason__c==PICK_SELECT || string.isBlank(request.pricingRequest.Request_Reason__c)) {
                throw new PAException(Label.Select_a_value_in_Request_Reason_Error,ApexPages.severity.Error);
            }
            popUpFlag='Import';
            return newPagelabel;
        }
        if(desiredAction=='import') {
            //popUpFlag='details';
            system.debug(request.pricingRequest.id+' '+request.pricingRequest.name+' '+request.pricingRequest.Request_Name__c);
            uploadRecords();            
            system.debug(request.pricingRequest.id+' '+request.pricingRequest.name+' '+request.pricingRequest.Request_Name__c);
            //System.debug('PC Code at the end of upload call'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
            return newPagelabel;
        }
        if(desiredAction=='viewLog') {
            errorLog();
            return newPagelabel;
        }
        if(desiredAction=='deleteSelectedImport') {
            deleteSelectedImport();
            return newPagelabel;
        }
        if(desiredAction=='validateImport') {
            validateImport();
            return newPagelabel;
        }
        if(desiredAction=='reImport') {
            popUpFlag='ReImport';
            //System.debug('PC Code at the end of reimport call'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
            return newPagelabel;
        }
        if(desiredAction=='flagCheck') {
            flagCheck();
            return newPagelabel;
        }
        if(desiredAction=='abandonImport') {
            request.pricingRequest.Request_Approval_Status__c='Abandoned';
            update request.pricingRequest;
            request.requestServiceState.currentRequest = null;
            request.requestServiceState.currentRequestItem = null;
            request.requestServiceState.ogItems.value = null;
            return newPagelabel;
        }
        if(desiredAction=='quitImport') {
            return newPagelabel;
        }
        
        //Ver 5.31 (15th May - Prachi - to display Generate PCL button on click of PCL for approver requests)
        if(desiredAction.equalsIgnoreCase('showPCL'))
        {
            system.debug('***check'+request.email);
            request.email = new Map<string,string>();
            request.email.put('Type','');
            request.email.put('Language','');
            request.email.put('Description','');
            
            pclDisplayString='PCLDisplay';
        }
        
        if(desiredAction.equalsIgnoreCase('cancelPCL'))
        {
            pclDisplayString=null;
        }
        //ends Ver 5.31
        
        
        /*
* Description  :   This method re-directs to Customer Requests Page on click of 'Quit' button, leaving the status of the Pricing Request unmodified
*/
        if(desiredAction.equalsIgnoreCase('Quit'))
        {
            //checking if csvString is 'Pending' - for QUIT button in case of Pending Approval
            if(request.csvString <> 'Pending' && request.csvString <> 'Submitted' && request.csvString <> 'Draft' && request.csvString <> 'Approved' && request.csvString <> 'Rejected' && request.csvString <> 'Recalled')
            {
                
                if(request.pricingRequest.Request_Type__c =='Massive')
                {
                    request.requestServiceState.ogItems.value='Massive'; 
                    request.requestServiceState.ogItems.userName=null;
                }
                else if(request.pricingRequest.Request_Type__c =='Non Customer Specific')
                {
                    request.requestServiceState.ogItems.value='NonCustomerSpecific';
                    
                }
                else
                    request.requestServiceState.ogItems.value=null;
            }
            
            
            relatedWrappersList = request.getListWrappers();
            //system.debug(logginglevel.error,'relatedWrappersList'+relatedWrappersList.size());
            //** **//  adding to make request= null on click of Quit button
            
            //if(currentPageId !=null)
            //{
            newPageLabel = 'PAStatus';
            //}
            System.debug('Service state:'+request.requestServiceState);
            request.pricingRequest.id=null; 
            request.requestServiceState.currentRequestItem=null;
            request.requestServiceState.currentRequest=null;
            return newPageLabel;
        }
        /*

* Description  :   This method re-directs to Customer Requests Page on click of 'Abandon' button, changing the status of the Pricing Request to
'Abandoned'
*/
        if(desiredAction.equalsIgnoreCase('Abandon'))
        {   
            /*added to set  ogItems.value so that massive related list is rendered-START*/
            if(request.csvString <> 'Pending' && request.csvString <> 'Submitted' && request.csvString <> 'Draft' && request.csvString <> 'Approved' && request.csvString <> 'Rejected' && request.csvString <> 'Recalled')
            {
                
                /*if(request.pricingRequest.Request_Type__c =='Massive')
{
request.requestServiceState.ogItems.value='Massive';  

}
else if(request.pricingRequest.Request_Type__c =='Non Customer Specific')
{
request.requestServiceState.ogItems.value='NonCustomerSpecific';

}*/
                request.requestServiceState.ogItems.value = null;
            }
            /*END*/
            request.pricingRequest.Request_Approval_Status__c ='Abandoned';
            update request.pricingRequest;
            return newpageLabel;
        }
        if(desiredAction.equalsIgnoreCase('AddPricesReqCreated')){
            relatedWrappersList=getListWrappers();
        }
        /*
* Description  :   This method re-directs to AddPricingRequestItem Page on click of 'Add Material' button

*/
        if(desiredAction.containsIgnoreCase('AddMaterial')|| desiredAction.equalsIgnoreCase('AddPrices') || desiredAction.containsIgnoreCase('AddProjectMaterial'))
        {
            system.debug('*** in projectSelection'+paProjectPrice.projectSelection);
            //Added Bala - 8th March 5.4
            request.customer.ogitems.selectedUser =request.pricingRequest.ownerId;
            system.debug('*** AddPrices OwnerId'+request.pricingRequest.ownerId);
            if(desiredAction.containsIgnoreCase('AddProjectMaterial') && (paProjectPrice.projectSelection=='clone' || paProjectPrice.projectAction=='clone'))
            {
                system.debug('*** in side clone'+paProjectPrice.projectSelection);
                //Added Bala - 8th March 5.4
                paProjectPrice.currentRequest.customer.ogitems.selectedUser =paProjectPrice.currentRequest.pricingRequest.ownerId; 
                paProjectPrice.projectSelection='clone';
                paProjectPrice.dispDoneButton ='dipsDoneSAP';
                toGetSapRecordsOfProject();
            }
            if(desiredAction.containsIgnoreCase('AddProjectMaterial') && paProjectPrice.dispRecordsFromSAP=='IdApprovedProject' )
            {
                system.debug('*** in side Id'+paProjectPrice.projectSelection);
                //Added Bala - 8th March 5.4
                paProjectPrice.currentRequest.customer.ogitems.selectedUser =paProjectPrice.currentRequest.pricingRequest.ownerId;
                paProjectPrice.projectSelection='projectId';
                paProjectPrice.dispRecordsFromSAP='IdApprovedProject';
                paProjectPrice.dispDoneButton ='dipsDoneSAP';
                toGetSapRecordsOfProject();
            }
            else if(desiredAction.containsIgnoreCase('AddProjectMaterial') && paProjectPrice.dispRecordsFromSAP=='editApprovedProject')
            {   
                system.debug('*** in side edit'+paProjectPrice.projectSelection);
                //Added Bala - 8th March 5.4
                paProjectPrice.currentRequest.customer.ogitems.selectedUser =paProjectPrice.currentRequest.pricingRequest.ownerId;
                paProjectPrice.projectSelection='editApproved';
                paProjectPrice.dispRecordsFromSAP='editApprovedProject';
                paProjectPrice.dispDoneButton ='dipsDoneSAP';
                toGetSapRecordsOfProject();
            }
            else if(desiredAction.containsIgnoreCase('AddMaterial') )
            {
                //paProjectPrice.dispDoneButton ='dipsDone';  
                request.pricingRequest.pricing_Request_type__c='Project Pricing';
                //Added Bala - 8th March 5.4
                request.customer.ogitems.selectedUser =paProjectPrice.currentRequest.pricingRequest.ownerId;
                if(paProjectPrice.projectPrice.PricingCondition_Id__c != null)
                {
                    request.pricingCondition.selectedPricingCondition=paProjectPrice.projectPrice.PricingCondition_Id__c;
                    paProjectPrice.kcListOptions=request.keyCombination.getListOptions();
                }
            }
            return newpageLabel;
        }
        
        /*
* Description  :   This method re-directs to PAAddReqItem Page on click of 'Add Prices' button
*/
        //changed to dispNCS from csvstring by brundha
        if(desiredAction.containsIgnoreCase('AddPricesNCS'))
        {
            //request.requestServiceState.ogItems.selectedUser = request.pricingRequest.OwnerId;
            //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
            List<Pricing_Request_Item__c> priList = [SELECT F_Product_Hierarchy_Code__c,Id,Pricing_Condition_Code__c,Pricing_Condition__c,Key_Combination__c,Key_Combination_Code__c,SAP_Cluster__c,SAP_Application_Id__c,
                                                     SAP_Client_Id__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c =:request.pricingRequest.Id limit 1];
            //request.pricingCondition.selectedPricingConditionName = priList[0].Pricing_Condition_Code__c + '-' + priList[0].Pricing_Condition__c;
            //request.keyCombination.keyCombinationName = priList[0].Key_Combination_Code__c + '-' + priList[0].Key_Combination__c;
            request.dispNCS ='';
            if(priList != null && priList.size() != 0)
            {
                request.dispNCS = 'dispNCS';
                request.pricingCondition.getPCFromCodeAndSAPCluster(priList[0].Pricing_Condition_Code__c,priList[0].SAP_Cluster__c,priList[0].SAP_Application_Id__c,priList[0].SAP_Client_Id__c);
                request.keyCombination.getKCFromCodeAndSAPCluster(priList[0].Key_Combination_Code__c,priList[0].SAP_Cluster__c,priList[0].SAP_Application_Id__c,priList[0].SAP_Client_Id__c);
                request.keyCombination.getPCKCFromCodeAndSAPCluster(priList[0].Pricing_Condition_Code__c,priList[0].Key_Combination_Code__c,priList[0].SAP_Cluster__c,priList[0].SAP_Application_Id__c,priList[0].SAP_Client_Id__c);
                
            }   
            /*populating SFDC KC descrpiton*/
            Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
            //  Map<Id,String> kcIdandKcDescMap=new Map<Id,String>();
            List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
            orgGroupItemsList = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                 Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                                 Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c
                                 WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND
                                                       RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c
                                 AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c AND
                                 OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
            //<PP20130422> - Ver 5.24 - Changed Id to String
            kcIdandKcDescMap=new Map<String,String>();
            if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0){
                buOrgGroup  =   orgGroupItemsList[0];  
            }            
            List<ERP_Access_Sequence__c>    accSqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c FROM ERP_Access_Sequence__c
                                                         WHERE Pricing_Condition__c = :request.pricingCondition.selectedPricingCondition
                                                         AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
            String finalKC='';
            for(ERP_Access_Sequence__c ac:accSqList)
            {
                
                kcIdandKcDescMap.put(ac.Pricing_Key_Combination__c,ac.Key_Combination__c);
            }
            if(kcIdandKcDescMap.containsKey(request.keyCombination.keyCombinationID)){
                finalKC=kcIdandKcDescMap.get(request.keyCombination.keyCombinationID);
                System.debug('***finalKC'+finalKC);
            }
            request.SFDCKCDesc=finalKC;
            
            
            /*added - for clean up logic*/
            
            request.relatedWrappersList=new List<PARelatedList>();
            //relatedWrappersList=getListWrappers(); 
            request.mpgFilter=null;
            request.pricingRequest.Due_Date__c  =null; 
            System.debug('**after clean up'+request.relatedWrappersList);
            
        }
        
        /*
* Description  :   This method re-directs to New Request Page on click of 'Edit Header' button, enabling edit of Pricing Request
*/
        
        if(desiredAction.equalsIgnoreCase('EditHeader')){
            return newpageLabel;
        }
        /*
* Description  :   cancel the task and changes the status of the request to 'Cancelled' and remains in the same page
*/
        if(desiredAction.equalsIgnoreCase('CancelTask'))
        {
            String retErrorMsg=validate('CancelTask');
            if(!string.isBlank(retErrorMsg))
            {
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            }
            else
            {
                TaskReassign taskReassign = new TaskReassign();
                boolean isSuccess = taskReassign.reassignTask(request);
                if(!isSuccess)
                {
                    throw new  PAException('<html>'+System.Label.Task_Completed+'</html>',ApexPages.Severity.ERROR);
                }
            }
            return newPageLabel;
        }
        /*
* Description  :   clones the pricing request and navigates to the PricingRequestPANewPoc page of the new Request
*/
        if(desiredAction.equalsIgnoreCase('CloneRequest')){   
            List<Pricing_Request_Item__c> requestItemCloneList =new List<Pricing_Request_Item__c>();
            Pricing_Request__c priceReqClone = new Pricing_Request__c();
            
            priceReqClone = request.pricingRequest.clone(false,true);
            priceReqClone.Request_Approval_Status__c = 'Draft';
            insert priceReqClone;
            
            //if spot type is not Rebate Agreement, then clone the items
            if(request.pricingRequest.Spot_Type__c <> 'Rebate Agreement'){
                //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
                //Brundha Roll out 2 <BR20130626> -- <NS20130821> Added Landing_Cost__c field to query select clause
                //<PP20131028>
                //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                //<BB20140404> Added Error_Indicator__c  in the query
                //<BB20140508> Added Sales_Type_Code__c,Sales_Type__c  in the query 
                //<MS20140515> Added Variant and SalesOrderType fields in the query
                /*List<Pricing_Request_Item__c>   requestItemList = [SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Disc_Ref__c,
Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,
Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,
ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,
ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,
Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,
Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,
PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,
PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,
Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,
Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,
Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById,  Below_Reference_Flag__c, Below_Floor_Flag__c,
Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c,
Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c,
Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,USD_Rate__c,Base_UoM__c,
Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,
Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,
Net_Price_Calculated_Materials__c,Total_Materials__c ,Integration_Error_Message__c,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,Pricing_Request__r.Request_Type__c,Pricing_Request__r.Current_Approver__c,
Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c,
Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c ,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request_Item__c WHERE Pricing_Request__c =:request.pricingRequest.Id];*/
                
                List<Pricing_Request_Item__c>   requestItemList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequestItem','requestItemList',' Pricing_Request__c =\''+request.pricingRequest.Id+'\'');
                
                for(Pricing_Request_Item__c pItem : requestItemList)
                {
                    Pricing_Request_Item__c priceItem = new Pricing_Request_Item__c();
                    priceItem = pItem.clone(false,true);
                    // priceItem.Pricing_Request__c = priceReqClone.id;
                    requestItemCloneList.add(priceItem);
                }
                insert requestItemCloneList;
            }
            //<BB20140404> Commeting to check if cloning is working.. -- TO DO remove commenting to insert reqitem
            
            request.pricingRequestId=priceReqClone.id; //to display the new request details on the page.
            //calling getListWrappers -neeha VER 5.34 -start
            relatedWrappersList=getListWrappers();
            //end-ver .5.34
            return newPageLabel;
        }
        
        /*
* Description  :   This method saves the pricing request for rebate
*/
        if(desiredAction.equalsIgnoreCase('SaveRebate'))
        {
            String retErrorMsg=validate('SaveRebate');
            if(!string.isBlank(retErrorMsg))
            {
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            }
            else
            {
                upsert request.pricingRequest;
                displaySubmitButton = true;
            }
            return newPageLabel;
        }
        /**
To Close pop up

**/
        Map<String,String> tempStorageMap = new Map<String,String>();
        Map<String,String> tempScaleRateMap = new Map<String,String>();
        tempStorageMap.put('newRate',pricingReqItem.New_Rate__c);
        //tempStorageMap.put('newBaseFloor',(string.isBlank(pricingReqItem.New_Base_Floor__c) ? '' : pricingReqItem.New_Base_Floor__c ));
        //tempStorageMap.put('newMarkup',(pricingReqItem.New_Markup_Percentage__c==null ? '' : string.valueOf(pricingReqItem.New_Markup_Percentage__c)));
        tempStorageMap.put('rate',pricingReqItem.Rate__c);
        tempStorageMap.put('quantity',pricingReqItem.Quantity__c);
        
        if(pricingReqItem.Scaled_Price_Flag__c)
        {
            tempStorageMap.put('ScaleRate1',pricingReqItem.ScaleRate1__c);
            tempStorageMap.put('ScaleRate2',pricingReqItem.ScaleRate2__c);
            tempStorageMap.put('ScaleRate3',pricingReqItem.ScaleRate3__c);
            tempStorageMap.put('ScaleRate4',pricingReqItem.ScaleRate4__c);
            tempStorageMap.put('ScaleRate5',pricingReqItem.ScaleRate5__c);
            tempStorageMap.put('ScaleRate6',pricingReqItem.ScaleRate6__c);
            tempStorageMap.put('ScaleRate7',pricingReqItem.ScaleRate7__c);
            tempStorageMap.put('ScaleRate8',pricingReqItem.ScaleRate8__c);
            tempStorageMap.put('ScaleRate9',pricingReqItem.ScaleRate9__c);
            tempStorageMap.put('ScaleRate10',pricingReqItem.ScaleRate10__c);
            if(relatedERPSAPPrice != null)
            {
                tempStorageMap.put('erpScaleRate1',relatedERPSAPPrice.ScaleRate1__c);
                tempStorageMap.put('erpScaleRate2',relatedERPSAPPrice.ScaleRate2__c);
                tempStorageMap.put('erpScaleRate3',relatedERPSAPPrice.ScaleRate3__c);
                tempStorageMap.put('erpScaleRate4',relatedERPSAPPrice.ScaleRate4__c);
                tempStorageMap.put('erpScaleRate5',relatedERPSAPPrice.ScaleRate5__c);
                tempStorageMap.put('erpScaleRate6',relatedERPSAPPrice.ScaleRate6__c);
                tempStorageMap.put('erpScaleRate7',relatedERPSAPPrice.ScaleRate7__c);
                tempStorageMap.put('erpScaleRate8',relatedERPSAPPrice.ScaleRate8__c);
                tempStorageMap.put('erpScaleRate9',relatedERPSAPPrice.ScaleRate9__c);
                tempStorageMap.put('erpScaleRate10',relatedERPSAPPrice.ScaleRate10__c);
            }
            else if(relatedERPSAPPrice != null)
            {
                relatedNonSAPScaleList2(tempStorageMap);
            }
            tempScaleRateMap.put('ScaleRate1','');
            tempScaleRateMap.put('ScaleRate2','');
            tempScaleRateMap.put('ScaleRate3','');
            tempScaleRateMap.put('ScaleRate4','');
            tempScaleRateMap.put('ScaleRate5','');
            tempScaleRateMap.put('ScaleRate6','');
            tempScaleRateMap.put('ScaleRate7','');
            tempScaleRateMap.put('ScaleRate8','');
            tempScaleRateMap.put('ScaleRate9','');
            tempScaleRateMap.put('ScaleRate10','');
            tempScaleRateMap.put('erpScaleRate1','');
            tempScaleRateMap.put('erpScaleRate2','');
            tempScaleRateMap.put('erpScaleRate3','');
            tempScaleRateMap.put('erpScaleRate4','');
            tempScaleRateMap.put('erpScaleRate5','');
            tempScaleRateMap.put('erpScaleRate6','');
            tempScaleRateMap.put('erpScaleRate7','');
            tempScaleRateMap.put('erpScaleRate8','');
            tempScaleRateMap.put('erpScaleRate9','');
            tempScaleRateMap.put('erpScaleRate10','');
        }
        
        
        
        
        
        
        if(desiredAction.containsIgnoreCase('closePopup')){
            
            closePopup();
            pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
            //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
            //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
            pricingReqItem.Rate__c = tempStorageMap.get('rate');
            if(pricingReqItem.Scaled_Price_Flag__c)
            {
                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                relatedNonSAPList(tempStorageMap);              
            }
            pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
            
            return currentPageLabel;
        }
        
        //method separated by sumita dabas to avoid "A method was found with too much code" error under IS ID-00061597 on 28 Jan 2016 START
        if(desiredAction.containsIgnoreCase('SaveReqItem'))
        {
            newPagelabel = saveReqItemAction(newPagelabel,currentPageLabel, desiredAction,tempStorageMap,tempScaleRateMap);
        }
        //method separated by sumita dabas to avoid "A method was found with too much code" error under IS ID-00061597 on 28 Jan 2016 END
        
        /*
* Description  :   This method calculates the net price for the newly entered rate
*/
        if(desiredAction.equalsIgnoreCase('calculateNetPrice')){
            System.debug('***calculateNet');
            
            if(calNetPrice == NULL)
                calNetPrice=new PACalculateNetPrice();
            calNetPrice.recalculate(); 
            newpageLabel = 'PAMaterialNet';
        }
        
        /*
* Description  :   This method to open a pop up with NPC requests -5.32 -neeha
*/
        if(desiredAction.equalsIgnoreCase('NPCRequests')){
            //netPriceDetail= new PANetPriceDetail();
            //netPriceDetail.pricingReqItem= this.pricingReqItem; 
            System.debug('***calNetPrice in NPCRequests'+calNetPrice);
            calNetPrice = new PACalculateNetPrice();
            
            /*
netPriceDetail.calNet=calNetPrice;
System.debug('***NPCRequests'+netPriceDetail.calNet);  
//PANetPriceDetail netprice=new PANetPriceDetail(requestServiceState);
//netprice.findAllMaterials(pricingReqItem);  */ 
            return newPageLabel;
        }
        
        
        /*

* Description  :   This method cancels the creation/updation of a Pricing Request Item thereby, re-directing to PricingRequestPA/AddReqItemPA
respectively
*/
        //<AV20140515>-moved this cancel action to another method cancelAction() due to max no of opcodes exceeded 
        if(desiredAction.containsIgnoreCase('cancel')) {
            return cancelAction(newpageLabel,desiredAction,tempStorageMap);
        }
        if(desiredAction.contains('Back')){
            if(calNetPrice == NULL)
                calNetPrice =new PACalculateNetPrice();
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
            return newPageLabel;
        }
        
        
        if(desiredAction.contains('approve')){
            return approvalWF.action(newpageLAbel, currentPageLabel, 'approve');
        }
        if(desiredAction.contains('submitCalculation')){
            //system.debug('request.pricingRequest is '+request.pricingRequest);
            //system.debug('pricingRequest is '+pricingRequest);
            //system.debug('pricingRequest### is '+pricingRequest.Spot_Type__c);
            if(!String.isBlank(request.pricingRequest.Spot_Type__c) && request.pricingRequest.Spot_Type__c == 'Rebate Agreement'){
                //system.debug('pricingRequest.Request_Valid_To__c is '+pricingRequest.Request_Valid_To__c);
                //system.debug('pricingRequest.Request_Valid_To__c is '+pricingRequest.Request_Valid_From__c);
                request.pricingRequest.Request_Valid_To__c = pricingRequest.Request_Valid_To__c;
                request.pricingRequest.Request_Valid_From__c = pricingRequest.Request_Valid_From__c;
                
            }
            
            //system.debug('***Incompud'+ approvalWF.request.pricingRequest.Request_Valid_From__c);
            return approvalWF.action(newpageLAbel, currentPageLabel, 'submitCalculation');
            
            
        }
        
        if(desiredAction.contains('submitContinue')){
            
            String statusReturn = approvalWF.action(newpageLAbel, currentPageLabel, 'submitContinue');
            if(request.pricingRequest.Request_Type__c == 'Import')
            {
                relatedWrappersList=getListWrappers();
            }
            return statusReturn;
        }
        if(desiredAction.contains('closeApproverPopup')){
            return approvalWF.action(newpageLAbel, currentPageLabel, 'closeApproverPopup');
        }
        if(desiredAction.contains('reject'))
        {
            String statusReturn =approvalWF.action(newpageLAbel, currentPageLabel, 'reject');
            if(request.pricingRequest.Request_Type__c == 'Import')
            {
                relatedWrappersList = getListWrappers();
            }
            return statusReturn;
        }
        if(desiredAction.contains('recall')){
            
            String statusReturn = approvalWF.action(newpageLAbel, currentPageLabel, 'recall');
            relatedWrappersList = getListWrappers();
            
            return statusReturn;
        }
        if(desiredAction.contains('popupreassign')){
            return approvalWF.action(newpageLAbel, currentPageLabel, 'popupreassign');
        }
        if(desiredAction.contains('closereassignpopup')){
            return approvalWF.action(newpageLAbel, currentPageLabel, 'closereassignpopup');
        }
        if(desiredAction.contains('reassignLookup')){
            return approvalWF.action(newpageLAbel, currentPageLabel, 'reassignLookup');
        }
        if(desiredAction.contains('closeUserLookup')){
            return approvalWF.action(newpageLAbel, currentPageLabel, 'closeUserLookup');
        }
        if(desiredAction.equalsIgnoreCase('saveReassignedUser')){
            //system.debug('in savereassigneduser');
            if(request.pricingRequest!=null)
                request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+request.pricingRequest.id+'\''))[0];
            return approvalWF.action(newpageLAbel, currentPageLabel, 'saveReassignedUser');
        }
        // TODO Auto-generated method stub
        /*For NPC -Start*/
        if(desiredAction.containsIgnoreCase('NetPricing')){
            netPricingFlag=true;
            replaceSeparator(tempStorageMap, tempScaleRateMap);
            System.debug('****pricingReqItem'+pricingReqItem.New_Valid_From__c);
            System.debug('****pricingReqItem is changed'+pricingReqItemVFrom);
            List<Decimal> scaleRateList=new List<Decimal>();
            List<Decimal> scaleRateListisChanged=new List<Decimal>();
            List<String> scaleQuantityValueList=new List<String>();
            List<String> scaleQuantityValueListisChanged=new List<String>();
            sObject sObj = (sObject)pricingReqItem;
            sObject sObjisChanged = (sObject)pricingReqItemIsChanged;
            if(pricingReqItem.Scaled_Price_Flag__c){ 
                for(Integer i=1;i<=10;i++){ 
                    if(sobj!=null && sobj.get('ScaleRate'+i+'__c')!=null && !String.isBlank(String.valueOf(sobj.get('ScaleRate'+i+'__c')))) {
                        Decimal tempRate=   Decimal.valueOf(String.valueOf(sobj.get('ScaleRate'+i+'__c')));
                        if(pricingReqItem.New_Unit__c!='%'){
                            tempRate=   tempRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.Roundingmode.HALF_EVEN);
                        }
                        else{
                            tempRate=   tempRate.setScale(3,System.Roundingmode.HALF_EVEN);
                        }
                        scaleRateList.add(tempRate);
                    }
                    if(sObjisChanged!=null && sObjisChanged.get('ScaleRate'+i+'__c')!=null && !String.isBlank(String.valueOf(sObjisChanged.get('ScaleRate'+i+'__c')))) {
                        Decimal tempRate=   Decimal.valueOf(String.valueOf(sObjisChanged.get('ScaleRate'+i+'__c')));
                        if(pricingReqItemIsChanged.New_Unit__c!='%'){
                            tempRate=   tempRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItemIsChanged.New_Unit__c),System.Roundingmode.HALF_EVEN);
                        }
                        else{
                            tempRate=   tempRate.setScale(3,System.Roundingmode.HALF_EVEN);
                        }
                        scaleRateListisChanged.add(tempRate);
                    }
                    if(sObj!=null &&  sobj.get('Scale_Quantity_Scale_Value'+i+'__c')!=null && !String.isBlank(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+i+'__c')))) 
                        scaleQuantityValueList.add(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+i+'__c')));
                    if(sObjisChanged!=null && !String.isBlank(String.valueOf(sObjisChanged.get('Scale_Quantity_Scale_Value'+i+'__c')))) 
                        scaleQuantityValueListisChanged.add(String.valueOf(sObjisChanged.get('Scale_Quantity_Scale_Value'+i+'__c')));
                }
            } 
            Decimal tempNewRate;
            Decimal tempRate;
            if(!String.isBlank(pricingReqItem.New_Rate__c)){
                if(pricingReqItem.New_Unit__c!='%'){
                    pricingReqItem.New_Rate__c= String.valueoF(Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.Roundingmode.HALF_EVEN));
                    // System.debug('****rate  in if'+pricingReqItem.New_Rate__c);
                }
                else{
                    pricingReqItem.New_Rate__c= String.valueoF(Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(3,System.Roundingmode.HALF_EVEN));
                    //  System.debug('****rate in else'+pricingReqItem.New_Rate__c);
                }
                tempNewRate= Decimal.valueof(pricingReqItem.New_Rate__c).abs();
            }
            if(pricingReqItemIsChanged!=null && !String.isBlank(pricingReqItemIsChanged.New_Rate__c)){
                if(pricingReqItemIsChanged.New_Unit__c!='%'){ 
                    pricingReqItemIsChanged.New_Rate__c=String.valueoF(Decimal.valueOf(pricingReqItemIsChanged.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItemIsChanged.New_Unit__c),System.Roundingmode.HALF_EVEN));
                    //  System.debug('****rate cahnged in if'+pricingReqItemIsChanged.New_Rate__c);
                }
                else if(pricingReqItemIsChanged!=null){
                    pricingReqItemIsChanged.New_Rate__c=String.valueoF(Decimal.valueOf(pricingReqItemIsChanged.New_Rate__c).setScale(3,System.Roundingmode.HALF_EVEN));
                    // System.debug('****rate changed in else'+pricingReqItemIsChanged.New_Rate__c);
                }
                tempRate= Decimal.valueOf(pricingReqItemIsChanged.New_Rate__c).abs();
            }
            
            // System.debug('****scael rate list old'+pricingReqItem.New_Rate__c+'**'+tempNewRate);
            // System.debug('****scael rate list cahnged'+pricingReqItemIsChanged.New_rate__c+'**'+tempRate ); 
            /*if(pricingReqItem.New_Valid_From__c!=pricingReqItemVFrom || pricingReqItem.New_Valid_To__c!=  || (pricingReqItem.Scaled_Price_Flag__c && (scaleRateList!=pricingReqItemScaleRateList))){
throw new  PAException('Please save the Pricing Request Item before proceeding with net price calculation',ApexPages.Severity.ERROR); 
}  pricingReqItem.New_Rate__c!=pricingReqItemIsChanged.New_rate__c*/
            if(pricingReqItemIsChanged != null && (pricingReqItem.New_Valid_From__c!=pricingReqItemIsChanged.New_Valid_From__c || pricingReqItem.New_Valid_To__c!=pricingReqItemIsChanged.New_Valid_To__c ||
                                                   tempNewRate!=tempRate || pricingReqItem.New_Unit__c!=pricingReqItemIsChanged.New_Unit__c ||
                                                   pricingReqItem.New_Per__c!=pricingReqItemIsChanged.New_Per__c || pricingReqItem.New_Uom__c!=pricingReqItemIsChanged.New_Uom__c  || 
                                                   (pricingReqItem.Scaled_Price_Flag__c && ( pricingReqItem.Scale_UoM_Scale_Unit__c!= pricingReqItemIsChanged.Scale_UoM_Scale_Unit__c ||scaleQuantityValueList!=scaleQuantityValueListisChanged || scaleRateList!=scaleRateListisChanged))) ){
                                                       changeRateBasedOnLocale(tempStorageMap);
                                                       //<PP20131010>
                                                       netPricingFlag = false;
                                                       throw new  PAException('Please save the Pricing Request Item before proceeding with net price calculation',ApexPages.Severity.ERROR);  
                                                       
                                                   }
            //locale    
            //pricingReqItem.New_Rate__c
            
            
            //VIMP- 
            if(pricingReqItem.Scaled_Price_Flag__c){
                pricingReqItem.New_Rate__c=calculateBestScaleRate(pricingReqItem);
            }
            
            //for -ve values ,NPC should be on -ve value based on plus minus. This will hadle scenaio if user clicks on net pricing before save
            //<PP20130524> -- Ver 5.36
            calculateNewRateWithPlusMinus();
            /*<PP20130524> -- Ver 5.36 -- Comment as method is added
if(!String.isBlank(pricingReqItem.New_Rate__c)){
//<PP20130524> -- Ver 5.36 START
Decimal roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c);
if(!String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c))
{
roundOfRate = roundOfRate.abs();
}
//<PP20130524> -- Ver 5.36 END
//bala--UAT # 82

//<PP20130524> -- Ver 5.36 -- Added !String.isBlank condition
if(!String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c)
&& request.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X')
{
roundOfRate= (-1) * roundOfRate;
} 
pricingReqItem.New_Rate__c = String.valueOf(roundOfRate);
}*/
            //System.debug('**pricing req item.rate'+pricingReqItem.Rate__c);
            //System.debug('**pricing req item.rate'+pricingReqItem.New_Rate__c);
            calNetPrice=new PACalculateNetPrice();
            System.debug('***pricing'+pricingReqItem+'Scale rate'+pricingReqItem.ScaleRate1__c);
            calNetPrice.populateMap(pricingReqItem); 
            //calNetPrice.testIntegration();
            //System.debug('**after exception');
            //neeha
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
            
        }
        
        if(desiredAction.ContainsIgnoreCase('saveNetPrice')){
            //System.debug('***saveNet');
            if(calNetPrice == NULL)
                calNetPrice=new PACalculateNetPrice();
            calNetPrice.save();
            //neeha
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
        }
        System.debug('****desiredAction'+desiredAction);
        
        if(desiredAction.containsIgnoreCase('ViewNetPriceDetails')){
            //System.debug('****In View Net Price'+pricingReqItem.New_Rate__c);
            replaceSeparator(tempStorageMap, tempScaleRateMap);//adding to change teh seperator 
            if(calNetPrice == NULL) 
                calNetPrice =new PACalculateNetPrice();
            calNetPrice.viewNetPrice(pricingReqItem,priceViewClicked);
            isNPCApplicableFlag = pricingReqItem.isNPCApplicable__c;
            
            System.debug('****In View Net Price1'+pricingReqItem.New_Rate__c);
            return newPageLabel;
        }
        if(desiredAction.containsIgnoreCase('ViewDone')){
            System.debug('****In View Net Price Done'+pricingReqItem.New_Rate__c);
            if(calNetPrice == NULL) 
                calNetPrice =new PACalculateNetPrice();
            System.debug('****In View Net Price Done1'+pricingReqItem.New_Rate__c);
            return newPageLabel;
        }
        //<AV20140515>-START-setting the volume flag true when user clicks on salesvolume button
        if(desiredAction.containsIgnoreCase('volumeView'))
        {
            volumeFlag=true;
            system.debug('*@@@@volume view action:'+volumeFlag);
            relatedWrappersList=getListWrappers();
            return newpageLabel;
        }
        //<AV20140515>-END 
        //<AV20140515>-START-setting the volume flag false and getting the related list when user clicks on Done button on pricingreqview page
        if(desiredAction.containsIgnoreCase('VolumeChangesDone'))
        {
            volumeFlag=false;
            scaleFlag=false;
            relatedWrappersList=getListWrappers();
            return newpageLabel;
        } 
        //<AV20140515>-END
        //<TJ20140908>
        if(desiredAction.containsIgnoreCase('sclPricing'))
        {
            scaleFlag=true;
            system.debug('*@@@@volume view action:'+scaleFlag);
            relatedWrappersList=getListWrappers();
            if(relatedWrappersList.size()==0)
            {
                throw new  PAException('<html>You Need To Have Atleast 1 Scale Price To Proceed</html>',ApexPages.Severity.ERROR);
            }
            return newpageLabel;
        }
        //System.debug('PC Code at the end of Action method'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
        /*for NPC end*/
        return newPageLabel;
    }
    
    //method separated by sumita dabas to avoid "A method was found with too much code" error for IS ID-00061597 on 28 Jan 2016 START
    /*
* Description  :   This method upserts a Pricing Request Item on click of 'Save' and re-directs to Pricing Request Page
*/
    public String saveReqItemAction(String newPagelabel,String currentPageLabel, String desiredAction,Map<String,String> tempStorageMap,Map<String,String> tempScaleRateMap)
    {
        
        
        //<PP20130614> -- Added for NPC Applicable check -- Ver 5.37
        isNPCApplicableFlag = checkNPCApplicability();
        String PERCENT='%';
        String PICK_SELECT = '--Select--';
        System.debug('****desired action in saveReqItem'+desiredAction);
        showGapError=false;
        showPriceCheck=false;
        showPriceTail=false;
        showExpireMsg=false;
        showRoundOffPopUp=false;
        isRequestItemSaved=false;//for NPC
        showFloorRefSection=false;
        Map<String,Boolean> kcFiltersMap =new   Map<String,Boolean>();
        Organizational_Group_Item__c buOrgGroup =new Organizational_Group_Item__c();
        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
        List<Sobject> childofHolder= new List<Sobject>();
        Integer flag=0;
        // Pricing_Request__c pricingRequest=new Pricing_Request__c();
        System.debug('in save'+request.pricingRequest.Id + '***'+pricingReqItem.New_Rate__c);
        //<PP20130524> -- Ver 5.36
        replaceSeparator(tempStorageMap, tempScaleRateMap);            
        
        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
        if(pricingReqItem!=null && !string.isBlank(pricingReqItem.id) && pricingReqItem.Pricing_Request_Type__c!=null && desiredAction.containsIgnoreCase('expire') != true && (pricingReqItem.Pricing_Request_Type__c.contains('Floor') || pricingReqItem.Pricing_Request_Type__c.contains('Reference') || pricingReqItem.Pricing_Request_Type__c.contains('Net Floor') || pricingReqItem.Pricing_Request_Type__c.contains('Net Reference'))) {                    
            if(pricingReqItem.New_Per__c==null || pricingReqItem.New_Per__c==0)
            {
                pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                pricingReqItem.Rate__c = tempStorageMap.get('rate');                        
                throw new  PAException('<html>'+'Please enter value for mandatory field "Per"'+'</html>',ApexPages.Severity.ERROR);
            }
        }
        
        
        //<SP20140509> START
        if(enableFixedDate != null && !enableFixedDate)
        {
            pricingReqItem.New_Payment_Terms_Fixed_Date__c = null;  
        }
        //<SP20140509> END
        
        
        //<TJ20141106> START
        if(request.pricingRequest.Request_Type__c=='Massive')
        {
            ERP_Customer__c custname=[Select name from ERP_Customer__c where customer_code__c=:pricingReqItem.Sold_To_Code__c limit 1];
            if(custname!=null)
                pricingReqItem.Sold_To__c=custname.name;
            system.debug(pricingReqItem.Sold_To__c+' '+custname.name);
        }
        //<TJ20141106> END
        //System.debug('***pricingRequest b4 exception'+pricingRequest);
        System.debug('****pricingReqItem fr import'+pricingReqItem);
        //<AV20141129>-Start-Production issue-Added condition to make Scaled_Price_Flag__c false for Pricing task request 
        if(pricingReqItem.Pricing_Request_Type__c.containsIgnoreCase('Pricing Task'))
        {
            pricingReqItem.Scaled_Price_Flag__c = false;
            system.debug('#%^#^'+pricingReqItem.Scaled_Price_Flag__c);
        }
        //<AV20141129>-End
        //Assigning ScaleRate1 to New Rate in case of import scaling
        if(pricingReqItem.Scaled_Price_Flag__c)
        {
            pricingReqItem.New_Rate__c=calculateBestScaleRate(pricingReqItem);
            System.debug('*****New rate after computation'+pricingReqItem.New_Rate__c);
            // pricingReqItem.New_Rate__c = pricingReqItem.ScaleRate1__c;  commenting -as it new rate should be teh best scale rate calculateBestScaleRate 
        }
        String retErrorMsg=validate(desiredAction);//all the mandatory validations
        system.debug('Hello@^@%^'+retErrorMsg);
        if(!string.isBlank(retErrorMsg)){
            //throw exception
            pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
            //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
            //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
            pricingReqItem.Rate__c = tempStorageMap.get('rate');
            pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
            if(pricingReqItem.Scaled_Price_Flag__c)
            {
                
                
                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                relatedNonSAPList(tempStorageMap);                  
            }
            throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
        }
        else{
            
            
            
            
            /*alert for rounding off for UAT defect*/ // Added - Bala Decimal places for Unit % && pricingReqItem.New_Unit__c !=null
            if(!String.isBlank(pricingReqItem.New_Rate__c) && pricingReqItem.New_Unit__c !=null && pricingReqItem.Expire__c!=true && !(clickOK.containsIgnoreCase('RoundOffOK') || clickOK.containsIgnoreCase('GapCheckOK') || clickOK.containsIgnoreCase('PriceCheckOK')) ){
                Integer numOfDecimalPlacesAllowed;
                if(pricingReqItem.New_Unit__c != PERCENT)
                    numOfDecimalPlacesAllowed= PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c);
                else if(pricingReqItem.New_Unit__c == PERCENT)
                    numOfDecimalPlacesAllowed= 3;
                //Neeharika - For UAT Issue #95
                Integer numofDecimalPlaces = Decimal.valueOf(pricingReqItem.New_Rate__c).scale();
                if(pricingReqItem.Scaled_Price_Flag__c)
                {
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate2__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate2__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate3__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate3__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate4__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate4__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate5__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate5__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate6__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate6__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate7__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate7__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate8__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate8__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate9__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate9__c).scale();
                    }
                    if(numofDecimalPlaces<=numOfDecimalPlacesAllowed && !String.isBlank(pricingReqItem.ScaleRate10__c))
                    {
                        numofDecimalPlaces = Decimal.valueOf(pricingReqItem.ScaleRate10__c).scale();
                    }
                }
                //String rateSplit='';
                
                //System.debug('****numofDecimalPlaces'+numofDecimalPlaces);
                //System.debug('****numOfDecimalPlacesAllowed'+numOfDecimalPlacesAllowed);
                if(numofDecimalPlaces>numOfDecimalPlacesAllowed){
                    //throw an alert message
                    showRoundOffPopUp=true;
                    
                    pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                    //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                    //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                    pricingReqItem.Rate__c = tempStorageMap.get('rate');
                    pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                    if(pricingReqItem.Scaled_Price_Flag__c)
                    {
                        pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                        pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                        pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                        pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                        pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                        pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                        pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                        pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                        pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                        pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                        relatedNonSAPList(tempStorageMap);                          
                    }
                    return currentPageLabel;
                }
            }
            /*end*/
            
            
            if(desiredAction.containsIgnoreCase('edit'))
            {
                
                if((pricingReqItem.Pricing_Request_Type__c != 'Pricing Task' && pricingReqItem.Pricing_Request_Type__c != 'Import' && pricingReqItem.Pricing_Request_Type__c != 'Project') && pricingReqItem.Gap__c!=true)
                {
                    
                    if(!(clickOK.containsIgnoreCase('GapCheckOK') || clickOK.containsIgnoreCase('PriceCheckOK') ) )
                    {
                        //check for GAP
                        System.debug('**** in error check');
                        if(desiredAction.containsIgnoreCase('expire') != true && pricingReqItem.Valid_To__c>=System.now() )
                        {
                            //system.debug('****in if of check for gap');
                            gapCheck=checkForGap(); //has to be a public variable
                            
                            if(gapCheck!=null || showGapError==true)
                            {
                                pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                                //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                                //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                                pricingReqItem.Rate__c = tempStorageMap.get('rate');
                                if(pricingReqItem.Scaled_Price_Flag__c)
                                {
                                    pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                                    pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                                    pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                                    pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                                    pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                                    pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                                    pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                                    pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                                    pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                                    pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                                    relatedNonSAPList(tempStorageMap);
                                }
                                return currentPageLabel;
                            }
                        }
                    }
                }
            }
            
            if((desiredAction.containsIgnoreCase('edit') || desiredAction.containsIgnoreCase('new') ) && (request.pricingRequest.Request_Type__c != 'Import' && pricingReqItem.Pricing_Request_Type__c != 'Project'))
            {
                if(appHolderList!=null && appHolderList.size()!=0)
                {
                    //System.debug('*****appHolderList'+appHolderList);
                    //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    if(pricingReqItem.Pricing_Request_Type__c!=null && (pricingReqItem.Pricing_Request_Type__c.contains('Floor') || pricingReqItem.Pricing_Request_Type__c.contains('Reference') || pricingReqItem.Pricing_Request_Type__c.contains('Net Reference') || pricingReqItem.Pricing_Request_Type__c.contains('Net Floor'))) {
                        /*childofHolder= [SELECT Ship_To_Country_Code__c,Ship_To_Country__c,ShipTo__c,ShipTo_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,
Division_Code__c,End_Use_Code__c,End_Use__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,
PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,
PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
SAP_Client_ID__c,Sold_To_Code__c,Sold_To__c,
PCKC__c,Terms_of_Payment_Code__c,Approved_Date__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,ComPartner__c,ComPartner_Code__c FROM  Sales_Prices__c WHERE  Price_Holder__c=:((id)appHolderList.get(0).get('Id'))];*/
                        childofHolder = (List<Sales_Prices__c>)PAQueryUtil.query('PARequestItem','holList',' Price_Holder__c=\''+((id)appHolderList.get(0).get('Id'))+'\'');                    
                    }
                    else {
                        
                        
                        /*childofHolder= [SELECT Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,
Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,   End_User__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,
PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,
PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
SAP_Client_ID__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
ShipTo__c,ShipTo_Code__c,PCKC__c,Terms_of_Payment_Code__c,Approved_Date__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,ComPartner__c,ComPartner_Code__c FROM  ERP_Sales_Prices_SAP__c WHERE  Price_Holder__c=:appHolderList.get(0).Id];*/
                        childofHolder = (List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PARequestItem','holList1',' Price_Holder__c=\''+appHolderList.get(0).Id+'\'');               
                    }
                    //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                    if(pricingReqItem.New_Valid_To__c >=((Date)appHolderList.get(0).get('Valid_From__c')) && pricingReqItem.New_Valid_From__c<=((Date)appHolderList.get(0).get('Valid_To__c')) && !clickOK.containsIgnoreCase('PriceCheckOk') )
                    {
                        //<RB20210903> Start
                        if(pricingReqItem.New_Valid_To__c <((Date)appHolderList.get(0).get('Valid_To__c')) && !clickOK.containsIgnoreCase('PriceCheckOk1') ) {
                             showPriceTail=true;
                        } else {
                            showPriceCheck=true; 
                        }
                        //<RB20210903> End
                        pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                        //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                        //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                        pricingReqItem.Rate__c = tempStorageMap.get('rate'); 
                        pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                        if(pricingReqItem.Scaled_Price_Flag__c)
                        {
                            pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                            pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                            pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                            pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                            pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                            pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                            pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                            pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                            pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                            pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                            relatedNonSAPList(tempStorageMap);
                        }
                        return currentPageLabel;
                    }
                }
            }
            List<String> PHSplit = new List<String>();
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            if(pricingReqItem.Pricing_Request_Type__c == 'Permanent' || pricingReqItem.Pricing_Request_Type__c=='Pricing Task' || (request.pricingRequest.Request_Type__c!='Import' && (pricingReqItem.Pricing_Request_Type__c.contains('Floor') || pricingReqItem.Pricing_Request_Type__c.contains('Reference')))) //still needs to be changed
            {
                //System.debug('new page label'+newPageLabel);
                //System.debug('***desired Action'+desiredAction+'****click ok'+clickOK);
                /*To display Expire pop up*/
                if(desiredAction.containsIgnoreCase('expire')==true && !clickOK.containsIgnoreCase('ExpOk') && pricingReqItem.Pricing_Request_Type__c!='Pricing Task' )
                {
                    //System.debug('****in expire');
                    showExpireMsg=true;
                    pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                    //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                    //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                    pricingReqItem.Rate__c = tempStorageMap.get('rate');
                    pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                    if(pricingReqItem.Scaled_Price_Flag__c)
                    {
                        pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                        pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                        pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                        pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                        pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                        pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                        pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                        pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                        pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                        pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                        relatedNonSAPList(tempStorageMap);
                    }
                    return currentPageLabel;
                }
                
                System.debug('===============2==='+pricingReqItem.Id);
                if(pricingReqItem.Id == null )
                {
                    buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                  Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c  FROM Organizational_Group_Item__c
                                  WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND
                                                        RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c
                                  AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c AND
                                  OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
                    //also used in validate method
                    
                    
                    //pricingReqItem.Customer_Price_Group_Code__c =request.cpgFilter;
                    pricingReqItem.Disc_Ref__c =request.discRefFilter;
                    pricingReqItem.ERP_Pricing_Procedure__c= buOrgGroup.ERP_Pricing_Procedure__c;
                    
                    //For populating MPG
                    List<string> splitMPGvalueList = new List<string>();
                    if(request.mpgFilter!=null && request.mpgFilter!=PICK_SELECT && request.mpgFilter!=''){
                        splitMPGvalueList = request.mpgFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitMPGvalueList.size()!=0){
                            //added if condition to populate Material Price Group on PRItem only if Material Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Price Group'))
                            {
                                pricingReqItem.Material_Price_Group_Code__c = splitMPGvalueList[0];
                                pricingReqItem.Material_Price_Group__c=splitMPGvalueList[1];    
                            }
                            //added if condition to populate Material Price Group on PRItem only if Material Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                            
                            
                        }
                    }
                    //For populating CPG
                    List<string> splitCPGvalueList = new List<string>();
                    if(request.cpgFilter!=null && request.cpgFilter!=PICK_SELECT && request.cpgFilter!=''){
                        splitCPGvalueList = request.cpgFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitCPGvalueList.size()!=0){
                            //added if condition to populate Customer Price Group on PRItem only if Customer Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Customer Price Group'))
                            {
                                pricingReqItem.Customer_Price_Group_Code__c = splitCPGvalueList[0];
                                pricingReqItem.Customer_Price_Group__c=splitCPGvalueList[1];
                            }
                            //added if condition to populate Customer Price Group on PRItem only if Customer Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                            
                            
                        }
                    }
                    
                    //Piyush For populating Distributor Code <PG20202707>
                    List<string> splitdistvalueList = new List<string>();
                    if(request.distFilter!=null && request.distFilter!=PICK_SELECT && request.distFilter!='')
                    {
                        splitdistvalueList = request.distFilter.split('-',2);
                        if(splitdistvalueList.size()!=0)
                        {
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Distributor'))
                            {
                                pricingReqItem.Distributor_Code__c = splitdistvalueList[0];
                                pricingReqItem.Distributor_Name__c = splitdistvalueList[1];  
                            }  
                        }
                    }
                    
                    //<PP20131022> START - For populating Terms Of Payment
                    List<string> splitTOPList = new List<string>();
                    if(!String.isBlank(request.paymentTermsFilter) && request.paymentTermsFilter!=PICK_SELECT){
                        splitTOPList = request.paymentTermsFilter.split('-',2);
                        if(splitTOPList.size()!=0){
                            //added if condition to populate Terms of Payment on PRItem only if Terms of Payment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Terms of Payment'))
                            {
                                pricingReqItem.Terms_Of_Payment_Code__c = splitTOPList[0];
                                pricingReqItem.Terms_Of_Payment__c = splitTOPList[1];
                                
                            }
                            //added if condition to populate Terms of Payment on PRItem only if Terms of Payment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                            
                            
                        }
                    }
                    //<PP20131022> END
                    
                    //<BB20130726> --Ver4.47 APAC Rollout2-Adding Logic for Key field Incoterm
                    List<string> splitIncotermValueList = new List<string>();
                    if(request.incotermsFilter!=null && request.incotermsFilter!=PICK_SELECT && request.incotermsFilter!=''){
                        splitIncotermValueList = request.incotermsFilter.split('-',2);
                        if(splitIncotermValueList.size()!=0){
                            //added if condition to populate Incoterms on PRItem only if Incoterms exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Incoterms'))
                            {
                                pricingReqItem.Incoterms_Code__c = splitIncotermValueList[0];
                                pricingReqItem.Inco_terms__c=splitIncotermValueList[1];
                            }
                            //added if condition to populate Incoterms on PRItem only if Incoterms exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    //For populating Price list type
                    List<string> splitPriceListvalueList = new List<string>();
                    if(request.priceListTypeFilter!=null && request.priceListTypeFilter!=PICK_SELECT && request.priceListTypeFilter!=''){
                        splitPriceListvalueList = request.priceListTypeFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitPriceListvalueList.size()!=0){
                            //added if condition to populate Price List Type on PRItem only if Price List Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Price List Type'))
                            {
                                pricingReqItem.Price_List_Type_Code__c = splitPriceListvalueList[0];
                                pricingReqItem.Price_List_Type__c=splitPriceListvalueList[1];
                            }
                            //added if condition to populate Price List Type on PRItem only if Price List Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    pricingReqItem.Pricing_Request__c = request.pricingRequest.Id;
                    
                    //For populating Sales office
                    List<string> splitSalesOfficevalueList = new List<string>();
                    if(request.salesofficeFilter!=null && request.salesofficeFilter!=PICK_SELECT   && request.salesOfficeFilter!=''){
                        splitSalesOfficevalueList = request.salesofficeFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitSalesOfficevalueList.size()!=0){
                            //added if condition to populate Sales office on PRItem only if Sales office exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales office'))
                            {
                                pricingReqItem.Sales_Office_Code__c = splitSalesOfficevalueList[0];
                                pricingReqItem.Sales_Office__c=splitSalesOfficevalueList[1];
                            }
                            //added if condition to populate Sales office on PRItem only if Sales office exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    //For populating Sales District
                    List<string> splitSalesDistrictvalueList = new List<string>();
                    if(request.salesDistrictFilter!=null && request.salesDistrictFilter!=PICK_SELECT   && request.salesDistrictFilter!=''){
                        splitSalesDistrictvalueList = request.salesDistrictFilter.split('-',2);
                        if(splitSalesDistrictvalueList.size()!=0){
                            //added if condition to populate Sales District on PRItem only if Sales District exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales District'))
                            {
                                pricingReqItem.Sales_District_Code__c = splitSalesDistrictvalueList[0];
                                pricingReqItem.Sales_District__c=splitSalesDistrictvalueList[1];
                            }
                            //added if condition to populate Sales District on PRItem only if Sales District exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    //Ver 5.13 START
                    //For populating Country
                    List<string> splitCountryValueList = new List<string>();
                    if(request.countryFilter!=null && request.countryFilter!=PICK_SELECT   && request.countryFilter!=''){
                        splitCountryValueList = request.countryFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitCountryValueList.size()!=0){
                            pricingReqItem.Country_Code__c = splitCountryValueList[0];
                            pricingReqItem.Country__c=splitCountryValueList[1];
                        }
                    }
                    
                    //<PP20131028> START
                    //For populating Ship To Country
                    List<string> splitShipToCountryValueList = new List<string>();
                    if(!String.isBlank(request.shipToCountryFilter) && request.shipToCountryFilter!=PICK_SELECT){
                        splitShipToCountryValueList = request.shipToCountryFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitShipToCountryValueList.size()!=0){
                            pricingReqItem.Ship_To_Country_Code__c = splitShipToCountryValueList[0];
                            pricingReqItem.Ship_To_Country__c=splitShipToCountryValueList[1];
                        }
                    }
                    //<PP20131028> END
                    //To be removed
                    //<PP20131022>
                    //pricingReqItem.Terms_Of_Payment_Code__c =request.paymentTermsFilter;
                    
                    //For populating Market Segment
                    List<string> splitMSValueList = new List<string>();
                    if(request.marketSegmentFilter!=null && request.marketSegmentFilter!=PICK_SELECT   && request.marketSegmentFilter!=''){
                        splitMSValueList = request.marketSegmentFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitMSValueList.size()!=0){
                            //added if condition to populate Market Segment on PRItem only if Market Segment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Market Segment'))
                            {
                                pricingReqItem.Market_Segment_Code__c = splitMSValueList[0];
                                pricingReqItem.Market_Segment__c=splitMSValueList[1];
                            }
                            //added if condition to populate Market Segment on PRItem only if Market Segment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    
                    //<MS20140514> Populating Variant and Sales Order Type START
                    populateNewKeyFields(PICK_SELECT);
                    //<MS20140514> Populating Variant and Sales Order Type END
                    
                    //<MS20150213>
                    
                    List<string> splitMG5KeyValueList = new List<string>();
                    if(request.materialGroup5KeyFilter!=null && request.materialGroup5KeyFilter!=PICK_SELECT   && request.materialGroup5KeyFilter!=''){
                        splitMG5KeyValueList = request.materialGroup5KeyFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitMG5KeyValueList.size()!=0){
                            pricingReqItem.Material_Group_5_Key_Code__c = splitMG5KeyValueList[0];
                            pricingReqItem.Material_Group_5_Key__c=splitMG5KeyValueList[1];
                        }
                    }
                    
                    
                    //For populating End Use
                    List<string> splitEUValueList = new List<string>();
                    if(request.endUseFilter!=null && request.endUseFilter!=PICK_SELECT   && request.endUseFilter!=''){
                        splitEUValueList = request.endUseFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
                        if(splitEUValueList.size()!=0){
                            //added if condition to populate End Use on PRItem only if End Use exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('End Use'))
                            {
                                pricingReqItem.End_Use_Code__c = splitEUValueList[0];
                                pricingReqItem.End_Use__c=splitEUValueList[1];
                            }
                            //added if condition to populate End Use on PRItem only if End Use exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                            
                            
                        }
                    }
                    //For populating Price Ref. Partner
                    //added if condition to populate Price Ref. Partner on PRItem only if Price Ref. Partner exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Price Ref. Partner'))
                    {
                        pricingReqItem.Price_Ref_Partner_Code__c = request.priceRefPartnerFilter;
                        pricingReqItem.Price_Ref_Partner__c = request.priceRefPartnerNameFilter;
                    }
                    //added if condition to populate Price Ref. Partner on PRItem only if Price Ref. Partner exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    
                    
                    
                    if(!String.isBlank(request.comPartnerFilter)){
                        pricingReqItem.ComPartner_Code__c = request.comPartnerFilter;
                        pricingReqItem.ComPartner__c = request.comPartnerNameFilter;
                    }
                    //<MS20141114>
                    //added if condition to populate Project Id on PRItem only if Project Id exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Project Id'))
                    {
                        pricingReqItem.Project__c = request.projectFilter;
                    }
                    //added if condition to populate Project Id on PRItem only if Project Id exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    
                    //added if condition to populate Kcode on PRItem only if Kcode exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Kcode'))
                    {
                        pricingReqItem.Kcode__c = request.kcodeFilter;
                    }
                    //added if condition to populate Kcode on PRItem only if Kcode exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    
                    if(!String.isBlank(request.partnerZFFilter)){
                        pricingReqItem.Partner_ZF_Code__c = request.partnerZFFilter;
                        pricingReqItem.Partner_ZF__c = request.partnerZFNameFilter;
                        pricingReqItem.Sold_To__c ='/';   
                    }
                    if(!String.isBlank(request.payerFilter)){
                        pricingReqItem.Payer_Code__c = request.payerFilter;
                        pricingReqItem.Payer__c = request.payerNameFilter;
                    }
                    if(!String.isBlank(request.discRefNoFilter)){
                        pricingReqItem.Disc_Ref_No__c = request.discRefNoFilter;
                    }
                    /*if(!String.isBlank(request.fixValDateFilter)){
pricingReqItem.FixValDate__c = Date.valueOf(request.fixValDateFilter);
}*/
                    if(pricingReqItem.FixValDate__c!=null ){
                        pricingReqItem.FixValDate__c = Date.valueOf(pricingReqItem.FixValDate__c);
                    }
                    
                    List<string> splitCampaignValueList = new List<string>();
                    if(request.campaignFilter!=null && request.campaignFilter!=PICK_SELECT   && request.campaignFilter!=''){
                        splitCampaignValueList = request.campaignFilter.split('-',2);
                        if(splitCampaignValueList.size()!=0){
                            //added if condition to populate Campaign on PRItem only if Campaign exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Campaign'))
                            {
                                pricingReqItem.Campaign_Code__c = splitCampaignValueList[0];
                                pricingReqItem.Campaign__c=splitCampaignValueList[1];
                            }
                            //added if condition to populate Campaign on PRItem only if Campaign exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    List<string> splitDocumentCurrencyValueList = new List<string>();
                    if(request.documentCurrencyFilter!=null && request.documentCurrencyFilter!=PICK_SELECT   && request.documentCurrencyFilter!=''){
                        splitDocumentCurrencyValueList = request.documentCurrencyFilter.split('-',2);
                        if(splitDocumentCurrencyValueList.size()!=0){
                            pricingReqItem.Document_Currency_Code__c = splitDocumentCurrencyValueList[0];
                            pricingReqItem.Document_Currency__c=splitDocumentCurrencyValueList[1];
                        }
                    }
                    List<string> splitStateValueList = new List<string>();
                    List<String> stateCountry = new List<String>();                        
                    if(request.stateFilter!=null && request.stateFilter!=PICK_SELECT   && request.stateFilter!=''){
                        if(request.stateFilter.contains(','))
                        {
                            stateCountry=request.stateFilter.split(',',2);
                            pricingReqItem.Country_Code__c=stateCountry[1];
                        }
                        else
                        {
                            stateCountry.add(request.stateFilter);
                        }
                        splitStateValueList = stateCountry[0].split('-',2);
                        if(splitStateValueList.size()!=0){
                            //added if condition to populate State on PRItem only if State exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('State'))
                            {
                                pricingReqItem.State_Code__c = splitStateValueList[0];
                                pricingReqItem.State__c=splitStateValueList[1];
                            }
                            //added if condition to populate State on PRItem only if State exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    
                    //Ver 5.13 END
                    
                    //For populating Profit Center                    
                    try {
                        Sobject profitCenterObj = new Profit_Center__c();   
                        profitCenterObj = Database.query('SELECT ERP_Profit_Center_'+request.profitCenterLevel+'__c FROM Profit_Center__c limit 1');
                        //added size check to avoid List has no rows to Sobject assignment by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 
                        if(profitCenterObj != null)
                        {
                            pricingReqItem.Profit_Center__c = (string)profitCenterObj.get('ERP_Profit_Center_'+request.profitCenterLevel+'__c');
                        }
                    }
                    catch(Exception e) {                        
                    }
                    //added if condition to populate Profit Center on PRItem only if Profit Center exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Profit Center'))
                    {
                        pricingReqItem.Profit_Center_Code__c = request.profitCenterFilter;
                    }
                    //added if condition to populate Profit Center on PRItem only if Profit Center exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    
                    //Ver 5.26 START
                    //For populating End User
                    //added if condition to populate End User on PRItem only if End User exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('End User'))
                    {
                        pricingReqItem.End_User_Code__c = request.endUserFilter;
                        pricingReqItem.End_User__c = request.endUserNameFilter;
                    }
                    //added if condition to populate End User on PRItem only if End User exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    
                    //Ver 5.26 END
                    //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy
                    //added if condition to populate Customer Hierarchy on PRItem only if Customer Hierarchy exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Customer Hierarchy'))
                    {
                        pricingReqItem.Customer_Hierarchy_Code__c = request.customerHierarchyFilter;
                        pricingReqItem.Customer_Hierarchy__c = request.customerHierarchyNameFilter;
                    }
                    //added if condition to populate Customer Hierarchy on PRItem only if Customer Hierarchy exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    //added if condition to populate Ship to on PRItem only if Ship to exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                    /*To populate Ship To*/
                    if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Ship to'))
                    {
                        pricingReqItem.ShipTo__c =request.shipToNameFilter;
                        pricingReqItem.ShipTo_Code__c=request.shipToFilter;
                    }
                    //added if condition to populate Ship to on PRItem only if Ship to exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                    
                    List<string> splitMaterialGroup1ValueList = new List<string>();
                    if(request.materialGroup1Filter!=null && request.materialGroup1Filter!=PICK_SELECT   && request.materialGroup1Filter!=''){
                        splitMaterialGroup1ValueList = request.materialGroup1Filter.split('-',2);
                        if(splitMaterialGroup1ValueList.size()!=0){
                            //added if condition to populate Material Group 1 on PRItem only if Material Group 1 exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Group 1'))
                            {
                                pricingReqItem.Material_Group_1_Code__c = splitMaterialGroup1ValueList[0];
                                pricingReqItem.Material_Group_1__c=splitMaterialGroup1ValueList[1];
                            }
                            //added if condition to populate Material Group 1 on PRItem only if Material Group 1 exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                        }
                    }
                    
                    //added for Edit link in Pricing Task BY Prachi
                    if(pricingReqItem.Pricing_Request_Type__c <> 'Pricing Task')
                    {
                        pricingReqItem.New__c=true;
                    }
                    if(pricingReqItem.Scaled_Price_Flag__c){
                        //scaled flags
                        //pricingReqItem.Scale__c=request.pricingCondition.pricingCondition.Scale__c;
                        pricingReqItem.Scale_Basis__c=request.pricingCondition.pricingCondition.Scale_Base__c;
                        //System.debug('****in scale check'+request.pricingCondition.pricingCondition.Scale_Type__c);
                        //**VER 5.39 start
                        if(request.pricingCondition.pricingCondition.Scale_Type__c!=null){ //added for roll outs
                            pricingReqItem.Scale_Type__c=request.pricingCondition.pricingCondition.Scale_Type__c;
                            pricingReqItem.Scale_Type_Code__c=request.pricingCondition.pricingCondition.Scale_Type_Code__c;
                        }
                        else{
                            System.debug('****pricingReqItem.Scale_Type__c'+pricingReqItem.Scale_Type__c+'***pricingReqItem.Scale_Type_Code__c'+pricingReqItem.Scale_Type_Code__c);
                            if(pricingReqItem.Scale_Type__c=='Base Scale'){
                                pricingReqItem.Scale_Type_Code__c='A';
                            }
                            else if(pricingReqItem.Scale_Type__c=='To Scale'){
                                pricingReqItem.Scale_Type_Code__c='B';
                            }
                        }
                        //5.39 VER end
                        pricingReqItem.Check_Scale__c=request.pricingCondition.pricingCondition.Check_Scale__c;
                        pricingReqItem.Check_Scale_Code__c=request.pricingCondition.pricingCondition.Check_Scale_Code__c;
                        
                        
                        pricingReqItem.Scale_Basis_Code__c=request.pricingCondition.pricingCondition.Scale_Basis_Code__c;
                        
                    }   
                    pricingReqItem.Condition_Class_Code__c=request.pricingCondition.pricingCondition.Condition_Class_Code__c;
                    pricingReqItem.Condition_Class__c=request.pricingCondition.pricingCondition.Condition_Class__c;
                    pricingReqItem.Calculation_Type_Code__c=request.pricingCondition.pricingCondition.Calculation_Type_Code__c;
                    pricingReqItem.Calculation_Type__c=request.pricingCondition.pricingCondition.Calculation_Type__c;
                    pricingReqItem.Plus_Minus_Code__c=request.pricingCondition.pricingCondition.Plus_Minus_Code__c;
                    pricingReqItem.Plus_Minus__c=request.pricingCondition.pricingCondition.Plus_Minus__c;
                    //<PP20130424> -- Ver 5.28
                    populateUtilUoMMaps();
                    //Shiva- Currency Test start //added - bala decimal Places for Unit % && pricingReqItem.New_Unit__c != PERCENT
                    if(!String.isBlank(pricingReqItem.New_Rate__c)  && pricingReqItem.New_Unit__c != null && pricingReqItem.New_Unit__c != ''  && pricingReqItem.New_Unit__c !=PICK_SELECT)
                    {
                        //<PP20130424> -- Ver 5.28
                        standardizeRate();
                        System.debug('****pricing req item New Rate Test'+pricingReqItem.New_Rate__c);
                        /*String newRedefinedRate = Util_SortHelper.findDecimalPlaces(Decimal.ValueOf(pricingReqItem.New_Rate__c),pricingReqItem.New_Unit__c);
System.debug('****pricing req item newRedefinedRate '+newRedefinedRate);

Integer scaleValue = 0;
if(newRedefinedRate.contains('-'))
{
scaleValue= Integer.valueOf(newRedefinedRate.split('-')[1]);
}
newRedefinedRate = newRedefinedRate.split('-')[0];
Decimal roundOfRate = Decimal.valueOf(newRedefinedRate).setScale(scaleValue,System.RoundingMode.HALF_EVEN);
newRedefinedRate = String.valueOf(roundOfRate);
pricingReqItem.New_Rate__c = newRedefinedRate;*/
                        Decimal roundOfRate;
                        if(pricingReqItem.New_Unit__c != PERCENT)
                            //<PP20130424> -- Ver 5.28
                            //roundOfRate = (Decimal.valueOf(pricingReqItem.New_Rate__c).abs()).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            roundOfRate = (Decimal.valueOf(pricingReqItem.New_Rate__c)).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                        else if(pricingReqItem.New_Unit__c == PERCENT)
                            //<PP20130424> -- Ver 5.28
                            //roundOfRate = (Decimal.valueOf(pricingReqItem.New_Rate__c).abs()).setScale(2,System.RoundingMode.HALF_EVEN);
                            roundOfRate = (Decimal.valueOf(pricingReqItem.New_Rate__c)).setScale(3,System.RoundingMode.HALF_EVEN);
                        
                        
                        //bala--UAT # 82
                        System.debug('***pricingReqItem.Plus_Minus_Code__c'+pricingReqItem.Plus_Minus_Code__c);
                        
                        String newRedefinedRate = String.valueOf(roundOfRate);
                        
                        
                        pricingReqItem.New_Rate__c = newRedefinedRate;
                        System.debug('****pricing req item New Rate Test'+pricingReqItem.New_Rate__c);
                    }
                    //<PP20130524> -- Ver 5.36
                    calculateNewRateWithPlusMinus();
                    /*<PP20130524> -- Ver 5.36 -- Comment as method is added
if(!String.isBlank(pricingReqItem.New_Rate__c)){
//<PP20130524> -- Ver 5.36 START
Decimal roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c);
if(!String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c))
{
roundOfRate = roundOfRate.abs();
}
//<PP20130524> -- Ver 5.36 END
//bala--UAT # 82

//<PP20130524> -- Ver 5.36 -- Added !String.isBlank condition
if(!String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c)
&& request.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X')
{
roundOfRate= (-1) * roundOfRate;
} 
pricingReqItem.New_Rate__c = String.valueOf(roundOfRate);
}*/
                    System.debug('****pricing req item New Unit Test'+pricingReqItem.New_Unit__c);
                    if(pricingReqItem.Scaled_Price_Flag__c && !string.IsBlank(pricingReqItem.New_Unit__c) && pricingReqItem.New_Unit__c != PICK_SELECT)
                    {
                        Decimal newScaleRate;
                        if(!String.isBlank(pricingReqItem.ScaleRate1__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate1__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate1__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate1',pricingReqItem.ScaleRate1__c.replace('.',separator));//NE20131108
                        }
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate2__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate2__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate2__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate2',pricingReqItem.ScaleRate2__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate3__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate3__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate3__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate3',pricingReqItem.ScaleRate3__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate4__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate4__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate4__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate4',pricingReqItem.ScaleRate4__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate5__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate5__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate5__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate5',pricingReqItem.ScaleRate5__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate6__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate6__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate6__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate6',pricingReqItem.ScaleRate6__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate7__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate7__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate7__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate7',pricingReqItem.ScaleRate7__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate8__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate8__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate8__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate8',pricingReqItem.ScaleRate8__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate9__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate9__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate9__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate9',pricingReqItem.ScaleRate9__c.replace('.',separator));//NE20131108
                        }
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate10__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate10__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate10__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate10',pricingReqItem.ScaleRate10__c.replace('.',separator));//NE20131108
                        }
                        
                    }
                    
                    //Shiva- Currency Test end
                    List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
                    //added condition for null value by Prachi
                    System.debug('*****request.material description'+request.materialDescription);
                    System.debug('*****request. ph  description'+request.phDescription);
                    
                    //Ver 5.16 -- Added code for insertion of multiple records on selection of multiple PH
                    Set<String> phSet=new Set<String>();
                    Set<String> matSet=new Set<String>();
                    Set<String> phMatSet=new Set<String>();
                    map<String,String> pH_UOM=new map<String,String>();
                    map<String,Decimal> pH_Per=new map<String,Decimal>();
                    Map<String,String> matCodeDescMap=new Map<String,String>();
                    //Adding map for MG5 values
                    Map<String,String> matMG5Map=new Map<String,String>();
                    Map<String,String> matMG5CodeMap=new Map<String,String>();
                    Map<String,String> phCodeDescMap=new Map<String,String>();
                    if(!String.isBlank(request.phFilter) && !pricingReqItem.Non_Commercial_Products__c )
                    {
                        List<String> splitPHList = new List<String>();
                        system.debug('**@@@phfilter in request:'+request.phFilter);
                        splitPHList = request.phFilter.split(',');
                        
                        for(String s1 : splitPHList)
                        {
                            if(!String.isBlank(s1))
                            {
                                phSet.add(s1.trim());
                            }
                        }
                        //<TJ20140402> -- Querying all BU_PH Data.
                        reqitem2=new PARequestItemHelper(request.requestServiceState.ogItems.selectedBU);
                        List<BU_PH__c> allPHList=reqitem2.query(phSet);
                        
                        for(BU_PH__c ph1 :allPHList)
                        {
                            phCodeDescMap.put(ph1.Product_Hierarchy__r.PH_Code__c,ph1.Business_Description__c);
                        }
                        Pricing_Request_Item__c clonedpricingReqItem;
                        
                        
                        //<TJ20140402> -- START Adding Default UOM & Default Per to Object
                        pH_UOM=reqitem2.getDefaultUOM(allPHList);
                        pH_Per=reqitem2.getDefaultPer(allPHList);
                        //<AV20140617> added Default_SalesArea_UoM__c in the query
                        List<Organizational_Group_Item__c> ogi=[select Default_Per_UoM_Setup__c,ERP_UoM__c,Default_Per_Value__c,Default_SalesArea_UoM__c from Organizational_group_Item__c where business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND
                                                                                                                                                                                                                 RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c
                                                                AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c
                                                                AND OrgGroup__r.ERP_Division_Code__c=:request.pricingRequest.Division_Code__c];
                        
                        
                        for(String X: phSet)
                        {
                            clonedpricingReqItem = pricingReqItem.clone(false,true);
                            List<String> PHDivideList = new List<String>();
                            Map<String,String> phLevelToCodeMap = new Map<String,String>();
                            phLevelToCodeMap.put('PH1','');
                            phLevelToCodeMap.put('PH2','');
                            phLevelToCodeMap.put('PH3','');
                            phLevelToCodeMap.put('PH4','');
                            phLevelToCodeMap.put('PH5','');
                            phLevelToCodeMap.put('PH6','');
                            phLevelToCodeMap.put('PH7','');
                            phLevelToCodeMap.put('PH8','');
                            phLevelToCodeMap.put('PH9','');
                            for(Integer i=0;i<X.length();i=i+2)
                            {
                                PHDivideList.add(X.substring(i,i+2));
                                
                            } 
                            for(Integer i=0;i<PHDivideList.size();i++)
                            {
                                Integer j = i+1;
                                phLevelToCodeMap.put('PH'+j,PHDivideList[i]);
                            } 
                            
                            clonedpricingReqItem.PH1_Code__c =  phLevelToCodeMap.get('PH1');
                            clonedpricingReqItem.PH2_Code__c =  phLevelToCodeMap.get('PH2');
                            clonedpricingReqItem.PH3_Code__c =  phLevelToCodeMap.get('PH3');
                            clonedpricingReqItem.PH4_Code__c =  phLevelToCodeMap.get('PH4');
                            clonedpricingReqItem.PH5_Code__c =  phLevelToCodeMap.get('PH5');
                            clonedpricingReqItem.PH6_Code__c =  phLevelToCodeMap.get('PH6');
                            clonedpricingReqItem.PH7_Code__c =  phLevelToCodeMap.get('PH7');
                            clonedpricingReqItem.PH8_Code__c =  phLevelToCodeMap.get('PH8');
                            clonedpricingReqItem.PH9_Code__c =  phLevelToCodeMap.get('PH9');
                            
                            //String default_UOM=ogi[0].Default_SalesArea_UoM__c;
                            
                            if(ogi[0].Default_Per_UoM_Setup__c=='Sales Area Config')
                            {
                                //<AV20140612> added condition to check if calculation type is percentage then populate new unit with %
                                if(request.pricingRequest.Default_Currency__c != null && (request.pricingCondition.pricingCondition.Calculation_Type__c == null || (request.pricingCondition.pricingCondition.Calculation_Type__c != null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')))){
                                    clonedpricingReqItem.New_Unit__c = request.pricingRequest.Default_Currency__c;
                                    clonedpricingReqItem.New_UOM__c = ogi[0].Default_SalesArea_UoM__c;
                                    clonedpricingReqItem.New_Per__c = ogi[0].Default_Per_Value__c;
                                    system.debug('*****request.pricingRequest.Default_Currency__c'+request.pricingRequest.Default_Currency__c);
                                }
                                else if(request.pricingCondition.pricingCondition.Calculation_Type__c!=null && request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))
                                {
                                    clonedpricingReqItem.New_Unit__c = '%';
                                    system.debug('*****New_Unit__c is'+clonedpricingReqItem.New_Unit__c );
                                }
                                //<AV20140612>-end
                                system.debug('*****request.pricingRequest.Default_Currency__c'+request.pricingRequest.Default_Currency__c);
                            }
                            else
                            {
                                for(Integer i=0;i<allPHList.size();i++)
                                {
                                    //<BB20140429> --Adding Default Unit to request Item.
                                    
                                    //<AV20140612> added condition to check if calculation type is percentage then populate new unit with %
                                    if(request.pricingRequest.Default_Currency__c != null && (request.pricingCondition.pricingCondition.Calculation_Type__c == null || (request.pricingCondition.pricingCondition.Calculation_Type__c != null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))))
                                    {
                                        clonedpricingReqItem.New_Unit__c = request.pricingRequest.Default_Currency__c;
                                        clonedpricingReqItem.New_UOM__c = pH_UOM.get(allPHList[i].Product_Hierarchy__r.PH_Code__c);
                                        clonedpricingReqItem.New_Per__c = pH_Per.get(allPHList[i].Product_Hierarchy__r.PH_Code__c);
                                        system.debug('*****request.pricingRequest.Default_Currency__c'+request.pricingRequest.Default_Currency__c);
                                    }
                                    else if(request.pricingCondition.pricingCondition.Calculation_Type__c!=null && request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))
                                    {
                                        clonedpricingReqItem.New_Unit__c = '%';
                                        system.debug('*****New_Unit__c is'+clonedpricingReqItem.New_Unit__c );
                                    }
                                    //<AV20140612> end
                                    //<BB20140429> END
                                }
                                
                            }
                            //<TJ20140402> -- END
                            if(phCodeDescMap.containsKey(X))
                                clonedpricingReqItem.Product_Hierarchy__c = phCodeDescMap.get(X);
                            pricingReqItemList.add(clonedpricingReqItem);
                            //System.debug('pricingReqItemList-KC: '+pricingReqItemList);
                        }
                        
                    }
                    else if(request.materialFilter!=null && request.materialFilter <> '' && !pricingReqItem.Non_Commercial_Products__c )
                    {
                        List<String> splitMaterialList = new List<String>();
                        Map<String,String> phLevelMatToCodeMap = new Map<String,String>();                            
                        Set<String> phCodes=new Set<String>();
                        map<String,String> materialPH=new map<String,String>();
                        map<String,String> pHUOM=new map<String,String>();
                        map<String,Decimal> pHPer=new map<String,Decimal>();
                        splitMaterialList = request.materialFilter.split(',');                            
                        String matSetForQuery = '';
                        for(String s:splitMaterialList){
                            if(!String.ISBLANK(s)){
                                matSet.add(s.trim());
                                matSetForQuery=matSetForQuery+'\''+s.trim()+'\',';
                            } 
                        }
                        if(matSetForQuery!='')
                        {
                            matSetForQuery='('+matSetForQuery.substring(0, matSetForQuery.length()-1)+')';                              
                        }
                        else
                        {
                            matSetForQuery='(\''+'\')';
                        }
                        //<VR20130510> Ver 5.34 VR 2013-05-10 APAC Rollout1-Getting the variable config Material value
                        boolean enableVarConfigMaterial=false;
                        if(buOrgGroup!=null){
                            enableVarConfigMaterial = buOrgGroup.Enable_Variable_Config_Materials__c;                
                        }
                        //<VR20130510> Ver 5.34 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                        //<SP20140428> START
                        //<TJ20140529> Added Sales area, distribution channel in query
                        List<Material__c> matList = new List<Material__c>();
                        List<sObject> matSObjList = new List<sObject>();
                        if(enableVarConfigMaterial)
                        {
                            /*matList=[select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,
ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c FROM Material__c where ERP_Material_Code__c=:matSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial 
AND ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c];*/
                            matList = (List<Material__c>)PAQueryUtil.query('PARequestItem','matList',' ERP_Material_Code__c in '+matSetForQuery+'  AND RecordTypeId = \''+Material_RTYPE_Id+'\' AND ERP_Material_General_Data__r.ERP_IsConfigurable__c='+enableVarConfigMaterial+' AND ERP_Sales_Org_Code__c=\''+request.pricingRequest.Sales_Org_Code__c+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c=\''+request.pricingRequest.Dist_Channel_Code__c+'\'');        
                        }
                        //<TJ20140529> Added Sales area, distribution channel in query
                        else
                        { 
                            /*matList=[select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,
ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c FROM Material__c where ERP_Material_Code__c=:matSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c 
AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c];*/
                            matList = (List<Material__c>)PAQueryUtil.query('PARequestItem','matList',' ERP_Material_Code__c in '+matSetForQuery+'  AND RecordTypeId = \''+Material_RTYPE_Id+'\' AND ERP_Sales_Org_Code__c=\''+request.pricingRequest.Sales_Org_Code__c+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c=\''+request.pricingRequest.Dist_Channel_Code__c+'\'');       
                        }
                        matSObjList = matList;
                        //<SP20140428> END
                        Integer highestPHLevel=0;
                        if(pricingReqItem.Key_Combination__c.contains('PH'))
                        {
                            for(Integer y = 9; y >= 1; y--)
                            {
                                if(pricingReqItem.Key_Combination__c.contains(String.valueOf(y)))
                                {
                                    highestPHLevel = y;
                                    break;
                                }
                            }
                        }
                        //<TJ20140402> -- Retrieving PH Codes for materials
                        for(Integer i=0;i<matSObjList.size();i++){
                            phCodes.add((String)matSObjList[i].get('ERP_Product_Hierarchy_Code__c'));
                            String k = (String)matSObjList[i].get('ERP_Material_Code__c');
                            k = k.toUpperCase();
                            materialPH.put(k,(String)matSObjList[i].get('ERP_Product_Hierarchy_Code__c'));
                            if(pricingReqItem.Key_Combination__c.contains('PH'))
                            {
                                for(Integer y1 = 1; y1 <= 9; y1++)
                                {
                                    if(y1 <= highestPHLevel)
                                        phLevelMatToCodeMap.put('PH'+String.valueOf(y1)+k,(String)matSObjList[i].get('ERP_Product_Hierarchy_Level_'+String.valueOf(y1)+'_Code__c'));
                                    else
                                        phLevelMatToCodeMap.put('PH'+String.valueOf(y1)+k,'');
                                }
                            }
                        }
                        //System.debug('******** highestPHLevel***'+highestPHLevel+'**'+phLevelMatToCodeMap);
                        reqitem2=new PARequestItemHelper(request.requestServiceState.ogItems.selectedBU);
                        //<TJ20140402> Querying the Product Hierarchy Code from BU_PH Object using Query Method
                        list<BU_PH__c> allPHList1=new list<BU_PH__c>();
                        allPHList1=reqitem2.query(phCodes);
                        pHUOM=reqitem2.getDefaultUOM(allPHList1);
                        pHPer=reqitem2.getDefaultPer(allPHList1);
                        
                        //<VR20130510> Ver 5.34 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                        //<SP20140428> START
                        List<Material__c> matList1 = new List<Material__c>();
                        //<TJ20140529> Added Sales area, distribution channel and division code in query
                        //<MS20140923> Adding MG5 fields to queries
                        if(enableVarConfigMaterial)
                        {
                            matList1 = [select Id,ERP_Material_Code__c,Description__c,Name,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c FROM Material__c where ERP_Material_Code__c=:matSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial
                                        AND ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c];
                        }
                        //<TJ20140529> Added Sales area, distribution channel and division code in query
                        else
                        {
                            matList1 = [select Id,ERP_Material_Code__c,Description__c,Name,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c FROM Material__c where ERP_Material_Code__c=:matSet  AND RecordTypeId = :Material_RTYPE_Id
                                        AND ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c];
                        }
                        //<SP20140428> END
                        
                        for(Material__c m:matList1){
                            matCodeDescMap.put(m.ERP_Material_Code__c,m.Name);
                            matMG5Map.put(m.ERP_Material_Code__c,m.ERP_Material_Group_5__c);
                            matMG5CodeMap.put(m.ERP_Material_Code__c,m.ERP_Material_Group_5_Code__c);
                        }
                        Pricing_Request_Item__c clonedpricingReqItem = new Pricing_Request_Item__c();
                        
                        //<TJ20140402> -- START Adding Default UOM & Default Per to Object
                        //<AV20140617> added Default_SalesArea_UoM__c field in the query
                        List<Organizational_Group_Item__c> ogi=[select Default_Per_UoM_Setup__c,ERP_UoM__c,Default_Per_Value__c,Default_SalesArea_UoM__c from Organizational_group_Item__c where business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND
                                                                                                                                                                                                                 RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c
                                                                AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c
                                                                AND OrgGroup__r.ERP_Division_Code__c=:request.pricingRequest.Division_Code__c];
                        //List<String> default_UOM=ogi[0].ERP_UoM__c.split(';');
                        Integer i=0;
                        
                        for(String m : matSet)
                        {    
                            //system.debug('pricingReqItem DEBUG'+pricingReqItem);
                            clonedpricingReqItem = pricingReqItem.clone(false,true);
                            //system.debug('clonedpricingReqItem  DEBUG'+clonedpricingReqItem);
                            clonedpricingReqItem.Material_Code__c = m.toUpperCase();
                            if(pricingReqItem.Key_Combination__c.contains('PH') && materialPH.containsKey(m.toUpperCase()))
                            {
                                clonedpricingReqItem.PH1_Code__c =  phLevelMatToCodeMap.get('PH1'+m.toUpperCase());
                                clonedpricingReqItem.PH2_Code__c =  phLevelMatToCodeMap.get('PH2'+m.toUpperCase());
                                clonedpricingReqItem.PH3_Code__c =  phLevelMatToCodeMap.get('PH3'+m.toUpperCase());
                                clonedpricingReqItem.PH4_Code__c =  phLevelMatToCodeMap.get('PH4'+m.toUpperCase());
                                clonedpricingReqItem.PH5_Code__c =  phLevelMatToCodeMap.get('PH5'+m.toUpperCase());
                                clonedpricingReqItem.PH6_Code__c =  phLevelMatToCodeMap.get('PH6'+m.toUpperCase());
                                clonedpricingReqItem.PH7_Code__c =  phLevelMatToCodeMap.get('PH7'+m.toUpperCase());
                                clonedpricingReqItem.PH8_Code__c =  phLevelMatToCodeMap.get('PH8'+m.toUpperCase());
                                clonedpricingReqItem.PH9_Code__c =  phLevelMatToCodeMap.get('PH9'+m.toUpperCase());
                            }
                            //Adding Mg5 to pricing req item
                            if(matCodeDescMap.containsKey(m.toUpperCase()))
                            {
                                clonedpricingReqItem.Material__c=matCodeDescMap.get(m.toUpperCase());                                                  
                                clonedpricingReqItem.Material_Group_5__c=matMG5Map.get(m.toUpperCase());
                                clonedpricingReqItem.Material_Group_5_Code__c=matMG5CodeMap.get(m.toUpperCase());
                            }
                            if(ogi[0].Default_Per_UoM_Setup__c=='Sales Area Config')
                            {
                                
                                //<AV20140612> added condition to check if calculation type is percentage then populate new unit with %
                                if(request.pricingRequest.Default_Currency__c != null && (request.pricingCondition.pricingCondition.Calculation_Type__c == null ||(request.pricingCondition.pricingCondition.Calculation_Type__c != null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))))
                                {
                                    clonedpricingReqItem.New_Unit__c = request.pricingRequest.Default_Currency__c;
                                    clonedpricingReqItem.New_UOM__c = ogi[0].Default_SalesArea_UoM__c;
                                    clonedpricingReqItem.New_Per__c = ogi[0].Default_Per_Value__c;
                                }
                                else if(request.pricingCondition.pricingCondition.Calculation_Type__c!=null  && request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))
                                {
                                    clonedpricingReqItem.New_Unit__c = '%';
                                }
                                //<AV20140612>-end  
                            }
                            else
                            {
                                
                                //<BB20140429>
                                //<AV20140612> added condition to check if calculation type is percentage then populate new unit with %
                                if(request.pricingRequest.Default_Currency__c != null && (request.pricingCondition.pricingCondition.Calculation_Type__c == null || (request.pricingCondition.pricingCondition.Calculation_Type__c != null && !request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')))){
                                    clonedpricingReqItem.New_Unit__c = request.pricingRequest.Default_Currency__c;
                                    clonedpricingReqItem.New_UOM__c = pHUOM.get(materialPH.get(m.toUpperCase()));
                                    clonedpricingReqItem.New_Per__c = pHPer.get(materialPH.get(m.toUpperCase()));
                                }
                                else if(request.pricingCondition.pricingCondition.Calculation_Type__c!=null && request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))
                                {
                                    clonedpricingReqItem.New_Unit__c = '%';
                                }
                                //<AV20140612> end
                            }
                            //<TJ20140402> -- END
                            pricingReqItemList.add(clonedpricingReqItem);
                            //System.debug('pricingReqItemList-KC :'+pricingReqItemList);
                            i++;
                        }
                    }
                    
                    else
                    {   /*making references null**/ //Added Bala decimal places for Unit %
                        if(pricingReqItem.Scaled_Price_Flag__c){
                            
                            //pricingReqItem.New_Rate__c=String.valueOf(pricingReqItem.ScaleRate1__c);
                        }
                        else{
                            pricingReqItem.Scale_Quantity_Scale_Value1__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value2__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value3__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value4__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value5__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value6__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value7__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value8__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value9__c=null;
                            pricingReqItem.Scale_Quantity_Scale_Value10__c=null;
                            
                            pricingReqItem.Scale_UoM_Scale_Unit__c=null;
                            
                            pricingReqItem.ScaleRate1__c=null;
                            pricingReqItem.ScaleRate2__c=null;
                            pricingReqItem.ScaleRate3__c=null;
                            pricingReqItem.ScaleRate4__c=null;
                            pricingReqItem.ScaleRate5__c=null;
                            pricingReqItem.ScaleRate6__c=null;
                            pricingReqItem.ScaleRate7__c=null;
                            pricingReqItem.ScaleRate8__c=null;
                            pricingReqItem.ScaleRate9__c=null;
                            pricingReqItem.ScaleRate10__c=null;
                        }
                        if(request.pricingCondition.pricingCondition!=null && request.pricingCondition.pricingCondition.Calculation_Type__c != null && (request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage') || request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount'))){
                            pricingReqItem.New_Per__c=null;
                            pricingReqItem.New_UoM__c=null;
                        }
                        /*end*/
                        pricingReqItemList.add(pricingReqItem);
                        //System.debug('pricingReqItemList-KC :'+pricingReqItemList);
                    }
                    System.debug('****** pricingReqItemList' + pricingReqItemList);
                    
                    try
                    {
                        insert pricingReqItemList;
                        //added the below lines to delete the material details from view state once line items are inserted
                        request.materialFilter = '';
                        request.materialDescription='';
                        //System.debug('after sucess insert'+pricingReqItem.Id);
                    }
                    catch(DMLException e)
                    {
                        /*added because gap records check has to executed again*/
                        clickOk=''; //imp
                        showGapError=false;
                        showPriceCheck=false;
                        showPriceTail=false;
                        showExpireMsg=false;
                        gapCheck=null;
                        showRoundOffPopUp=false;
                        isRequestItemSaved=false; //for NPC
                        showFloorRefSection=false;
                        /*end*/
                        System.debug('in catch DML'+e);
                        System.debug('in catch DML'+e.getMessage());
                        System.debug('**mess'+System.Label.Per_negative);
                        
                        if(e.getMessage().contains(System.Label.Per_negative)){
                            pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                            //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                            //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                            pricingReqItem.Rate__c = tempStorageMap.get('rate');
                            pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                            if(pricingReqItem.Scaled_Price_Flag__c)
                            {
                                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                                relatedNonSAPList(tempStorageMap);
                            }
                            throw new PAException(System.Label.Per_negative,ApexPages.severity.Error);
                        }
                        else if(e.getMessage().contains('Request already exists for that period. Please change the validity dates')){
                            pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                            //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                            //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                            pricingReqItem.Rate__c = tempStorageMap.get('rate');
                            pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                            if(pricingReqItem.Scaled_Price_Flag__c)
                            {
                                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                                relatedNonSAPList(tempStorageMap);
                            }
                            return currentPageLabel;
                        }
                        
                    }
                    
                    
                    try
                    {
                        //if(!pricingReqItemList[0].Pricing_Request_Type__c.contains('Pricing Task'))
                        //commented if condition - bala Apr 29 for new req. 5.27
                        if(pricingReqItemList[0].Pricing_Request_Type__c.contains('Pricing Task') &&
                           (!String.isBlank(request.pricingRequest.Spot_Type__c) && (request.pricingRequest.Spot_Type__c.contains('Rebate Agreement')
                                                                                     || request.pricingRequest.Spot_Type__c.contains('Free of Charge')))){}
                        else
                            PAUtil.calculateFloorAndReference(pricingReqItemList);
                    }
                    catch(Exception e)
                    {
                        system.debug('priceReq Flr And Ref'+e);
                    }
                    //neeha
                    relatedWrappersList=getListWrappers();
                    
                    if(request.pricingRequest.Id!=null){
                        request.pricingRequestId= request.pricingRequest.Id;
                    }
                    
                    
                    //relatedWrappersList=getListWrappers();
                    /*added because gap records check has to executed again added for NPC -Neeharika -on april 17th*/
                    clickOk=''; //imp
                    showGapError=false;
                    showPriceCheck=false;
                    showPriceTail=false;
                    showExpireMsg=false;
                    gapCheck=null;
                    showRoundOffPopUp=false;
                    isRequestItemSaved=true; //for NPC
                    
                    showFloorRefSection=true;//TO display Floor ref section
                    System.debug('****Check 1'+pricingReqItem.ScaleRate1__c +'temp'+tempStorageMap);
                    changeRateBasedOnLocale(tempStorageMap);// VIMP
                    /*  pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
pricingReqItem.Rate__c = tempStorageMap.get('rate');
pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
if(pricingReqItem.Scaled_Price_Flag__c)
{
pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
if(relatedERPSAPPrice != null)
{
relatedERPSAPPrice.ScaleRate1__c = tempStorageMap.get('erpScaleRate1');
relatedERPSAPPrice.ScaleRate2__c = tempStorageMap.get('erpScaleRate2');
relatedERPSAPPrice.ScaleRate3__c = tempStorageMap.get('erpScaleRate3');
relatedERPSAPPrice.ScaleRate4__c = tempStorageMap.get('erpScaleRate4');
relatedERPSAPPrice.ScaleRate5__c = tempStorageMap.get('erpScaleRate5');
relatedERPSAPPrice.ScaleRate6__c = tempStorageMap.get('erpScaleRate6');
relatedERPSAPPrice.ScaleRate7__c = tempStorageMap.get('erpScaleRate7');
relatedERPSAPPrice.ScaleRate8__c = tempStorageMap.get('erpScaleRate8');
relatedERPSAPPrice.ScaleRate9__c = tempStorageMap.get('erpScaleRate9');
relatedERPSAPPrice.ScaleRate10__c = tempStorageMap.get('erpScaleRate10');
}
}*/
                    /*end added for NPC -Neeharika*/ 
                    
                    System.debug('before return sucess insert'+pricingReqItem.Id);
                    return newPageLabel;
                }
                
                else if(pricingReqItem.Id != null)
                {
                    //<PP20130424> -- Ver 5.28
                    populateUtilUoMMaps();
                    String s= pricingReqItem.PCKC__c;
                    System.debug('desiredAction before check'+desiredAction);
                    if(desiredAction.containsIgnoreCase('expire')!=true && pricingReqItem.Gap__c!=true){
                        
                        validate(desiredAction); //error check for price already exists and expirey holder
                    }
                    //get all the child gap records
                    List<Pricing_Request_Item__c> childGapRecordsList= [select F_Product_Hierarchy_Code__c,Id,USD_Rate__c,Base_UoM__c from Pricing_Request_Item__c where Gap_Pricing_Request_Item__c =:pricingReqItem.Id];
                    if(childGapRecordsList.size()!=0)
                    {
                        delete childGapRecordsList;
                    }
                    //end
                    List<Pricing_Request_Item__c> upsertPRIList=new List<Pricing_Request_Item__c>();
                    if(desiredAction.containsIgnoreCase('expire')==true){
                        System.debug('***in expire logic2');
                        pricingReqItem.Expire__c=true;
                        //<PP20140704>
                        pricingReqItem.isNPCApplicable__c = false;
                    }
                    if(desiredAction.containsIgnoreCase('new')==true){
                        pricingReqItem.New__c=true;
                    }
                    if(desiredAction.containsIgnoreCase('edit')==true){
                        pricingReqItem.Edit__c=true;
                    }
                    
                    //Shiva- Currency Test start //Added Bala decimal Places for Unit %
                    if((!String.isBlank(pricingReqItem.New_Rate__c)) && pricingReqItem.New_Unit__c != null && pricingReqItem.New_Unit__c != ''  && pricingReqItem.New_Unit__c !=PICK_SELECT)
                    {
                        //<PP20130424> -- Ver 5.28
                        standardizeRate();
                        System.debug('****pricing req item New Rate Test'+pricingReqItem.New_Rate__c);
                        Decimal roundOfRate;
                        if(pricingReqItem.New_Unit__c != PERCENT)
                            //<PP20130424> -- Ver 5.28
                            //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).abs().setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                        else if(pricingReqItem.New_Unit__c == PERCENT)
                            //<PP20130424> -- Ver 5.28
                            //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).abs().setScale(2,System.RoundingMode.HALF_EVEN);
                            roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(3,System.RoundingMode.HALF_EVEN);
                        
                        //bala--UAT # 82
                        String newRedefinedRate = String.valueOf(roundOfRate);
                        
                        pricingReqItem.New_Rate__c = newRedefinedRate;
                        System.debug('****pricing req item New Rate Test'+pricingReqItem.New_Rate__c);
                    }
                    //<PP20130524> -- Ver 5.36
                    calculateNewRateWithPlusMinus();
                    
                    if(pricingReqItem.Scaled_Price_Flag__c && !string.IsBlank(pricingReqItem.New_Unit__c) && pricingReqItem.New_Unit__c != PICK_SELECT)
                    {
                        Decimal newScaleRate;
                        if(!String.isBlank(pricingReqItem.ScaleRate1__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate1__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate1__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate1',pricingReqItem.ScaleRate1__c.replace('.',separator));//NE20131108
                        }
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate2__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate2__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate2__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate2',pricingReqItem.ScaleRate2__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate3__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate3__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate3__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate3',pricingReqItem.ScaleRate3__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate4__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate4__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate4__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate4',pricingReqItem.ScaleRate4__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate5__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate5__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate5__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate5',pricingReqItem.ScaleRate5__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate6__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate6__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate6__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate6',pricingReqItem.ScaleRate6__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate7__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate7__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate7__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate7',pricingReqItem.ScaleRate7__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate8__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate8__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate8__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate8',pricingReqItem.ScaleRate8__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate9__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate9__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate9__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate9',pricingReqItem.ScaleRate9__c.replace('.',separator));//NE20131108
                        }
                        
                        
                        if(!String.isBlank(pricingReqItem.ScaleRate10__c))
                        {
                            newScaleRate = Decimal.valueOf(pricingReqItem.ScaleRate10__c);
                            if(pricingReqItem.New_Unit__c != PERCENT)
                                newScaleRate =newScaleRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                            
                            else if(pricingReqItem.New_Unit__c == PERCENT)
                                newScaleRate =newScaleRate.setScale(3,System.RoundingMode.HALF_EVEN);
                            
                            pricingReqItem.ScaleRate10__c= String.valueOf(newScaleRate);
                            tempStorageMap.put('ScaleRate10',pricingReqItem.ScaleRate10__c.replace('.',separator)); //NE20131108
                        }
                        System.debug('***in rounding off scale values');
                        
                        
                        
                    }
                    System.debug('***scaling values' + pricingReqItem.ScaleRate1__c + pricingReqItem.ScaleRate2__c);
                    
                    
                    
                    //Shiva- Currency Test end
                    /*making references null**/ //Added Bala - Decimal Places for Unit %
                    if(pricingReqItem.Scaled_Price_Flag__c){
                        if(request.pricingCondition != null && request.pricingCondition.pricingCondition != null)
                        {
                            pricingReqItem.Scale_Basis__c=request.pricingCondition.pricingCondition.Scale_Base__c;
                            pricingReqItem.Check_Scale__c=request.pricingCondition.pricingCondition.Check_Scale__c;
                            pricingReqItem.Check_Scale_Code__c=request.pricingCondition.pricingCondition.Check_Scale_Code__c;
                            pricingReqItem.Scale_Basis_Code__c=request.pricingCondition.pricingCondition.Scale_Basis_Code__c;
                            if(pricingReqItem.Scale_Type__c=='Base Scale'){
                                pricingReqItem.Scale_Type_Code__c='A';
                            }
                            else if(pricingReqItem.Scale_Type__c=='To Scale'){
                                pricingReqItem.Scale_Type_Code__c='B';
                            }
                            else if(request.pricingCondition.pricingCondition.Scale_Type__c!=null)
                            { //added for roll outs
                                pricingReqItem.Scale_Type__c=request.pricingCondition.pricingCondition.Scale_Type__c;
                                pricingReqItem.Scale_Type_Code__c=request.pricingCondition.pricingCondition.Scale_Type_Code__c;
                            }                           
                        }
                        if(pricingReqItem.Scale_Type__c=='Base Scale'){
                            pricingReqItem.Scale_Type_Code__c='A';
                        }
                        else if(pricingReqItem.Scale_Type__c=='To Scale'){
                            pricingReqItem.Scale_Type_Code__c='B';
                        }
                        
                        //added for roll outs VER 5.39 END
                    }
                    else{
                        pricingReqItem.Scale_Quantity_Scale_Value1__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value2__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value3__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value4__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value5__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value6__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value7__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value8__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value9__c=null;
                        pricingReqItem.Scale_Quantity_Scale_Value10__c=null;
                        
                        pricingReqItem.Scale_UoM_Scale_Unit__c=null;
                        
                        pricingReqItem.ScaleRate1__c=null;
                        pricingReqItem.ScaleRate2__c=null;
                        pricingReqItem.ScaleRate3__c=null;
                        pricingReqItem.ScaleRate4__c=null;
                        pricingReqItem.ScaleRate5__c=null;
                        pricingReqItem.ScaleRate6__c=null;
                        pricingReqItem.ScaleRate7__c=null;
                        pricingReqItem.ScaleRate8__c=null;
                        pricingReqItem.ScaleRate9__c=null;
                        pricingReqItem.ScaleRate10__c=null;
                    }
                    if(request.pricingCondition.pricingCondition!=null && request.pricingCondition.pricingCondition.Calculation_Type__c!=null &&  (request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage') || request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount'))){
                        pricingReqItem.New_Per__c=null;
                        pricingReqItem.New_UoM__c=null;
                        
                    }
                    /*end*/
                    if(request.requestServiceState.ogItems.isEndUserRebate){
                        Decimal oldRPQRate;
                        Decimal prreduc;
                        Decimal changedRate;
                        oldRPQRate =  Double.ValueOf(pricingReqItem.Rate__c);
                        prreduc = Double.ValueOf(pricingReqItem.Price_Reduction__c);
                        changedRate = oldRPQRate - (oldRPQRate * (prreduc * 0.01));
                        pricingReqItem.New_Rate__c = String.valueOf(changedRate);
                    }
                    
                    upsertPRIList.add(pricingReqItem);
                    System.debug('****pricing req item'+pricingReqItem);
                    System.debug('**** current pricing req item');
                    System.debug('****gap check'+gapCheck);
                    if(gapCheck!=null){
                        List<String> gapSplit = new List<String>();
                        if(gapcheck.contains(':')) {
                            gapSplit = gapcheck.split(':');
                        }
                        else {
                            gapSplit.add(gapCheck);
                        }
                        Pricing_Request_Item__c pricingReqItemGap =new  Pricing_Request_Item__c();
                        for(String gap : gapSplit) {
                            //insert new PRI Pricing_Request_Item__c pricingReqItemRightGap = new Pricing_Request_Item__c();
                            //removed code for mapping one to one
                            System.debug('*****pricingReqItem.erp pricing procedure'+pricingReqItem.ERP_Pricing_Procedure__c);
                            pricingReqItemGap =pricingReqItem.clone(false,true);
                            pricingReqItemGap.Pricing_Request__c =  request.pricingRequest.Id;
                            
                            if(gap.containsIgnoreCase('leftGap')){
                                pricingReqItemGap.New_Valid_From__c = perm_LeftGapPricingReqItem.New_Valid_From__c;
                                pricingReqItemGap.New_Valid_To__c = perm_LeftGapPricingReqItem.New_Valid_To__c;
                            }
                            if(gap.containsIgnoreCase('rightGap')){
                                pricingReqItemGap.New_Valid_From__c = perm_rightGapPricingReqItem.New_Valid_From__c;
                                pricingReqItemGap.New_Valid_To__c = perm_rightGapPricingReqItem.New_Valid_To__c;
                            }
                            pricingReqItemGap.Gap__c =true;
                            pricingReqItemGap.Gap_Pricing_Request_Item__c=pricingReqItem.Id;
                            /*added by neeha--gap record's rate fields should be defaulted wid parent's (old)rate fields*/
                            pricingReqItemGap.New_Rate__c=pricingReqItem.Rate__c;
                            pricingReqItemGap.New_Unit__c=pricingReqItem.Unit__c;
                            pricingReqItemGap.New_Per__c=pricingReqItem.Per__c;
                            pricingReqItemGap.New_UoM__c=pricingReqItem.UoM__c; 
                            if(relatedERPSAPPrice!=null){
                                pricingReqItemGap.Scaled_Price_Flag__c=relatedERPSAPPrice.Scaled_Price_Flag__c;
                            }
                            else if(relatedNonSAPPrice!=null){
                                pricingReqItemGap.Scaled_Price_Flag__c=relatedNonSAPPrice.Scaled_Price_Flag__c;
                            }
                            if(relatedERPSAPPrice!=null && relatedERPSAPPrice.Scaled_Price_Flag__c ){
                                pricingReqItemGap.Scale_Quantity_Scale_Value1__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value1__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value2__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value2__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value3__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value3__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value4__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value4__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value5__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value5__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value6__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value6__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value7__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value7__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value8__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value8__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value9__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value9__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value10__c=relatedERPSAPPrice.Scale_Quantity_Scale_Value10__c;
                                
                                pricingReqItemGap.Scale_UoM_Scale_Unit__c=relatedERPSAPPrice.Scale_UoM_Scale_Unit__c;
                                
                                pricingReqItemGap.ScaleRate1__c=relatedERPSAPPrice.ScaleRate1__c;
                                pricingReqItemGap.ScaleRate2__c=relatedERPSAPPrice.ScaleRate2__c;
                                pricingReqItemGap.ScaleRate3__c=relatedERPSAPPrice.ScaleRate3__c;
                                pricingReqItemGap.ScaleRate4__c=relatedERPSAPPrice.ScaleRate4__c;
                                pricingReqItemGap.ScaleRate5__c=relatedERPSAPPrice.ScaleRate5__c;
                                pricingReqItemGap.ScaleRate6__c=relatedERPSAPPrice.ScaleRate6__c;
                                pricingReqItemGap.ScaleRate7__c=relatedERPSAPPrice.ScaleRate7__c;
                                pricingReqItemGap.ScaleRate8__c=relatedERPSAPPrice.ScaleRate8__c;
                                pricingReqItemGap.ScaleRate9__c=relatedERPSAPPrice.ScaleRate9__c;
                                pricingReqItemGap.ScaleRate10__c=relatedERPSAPPrice.ScaleRate10__c;
                            }  
                            else if(relatedNonSAPPrice!=null && relatedNonSAPPrice.Scaled_Price_Flag__c ){
                                pricingReqItemGap.Scale_Quantity_Scale_Value1__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value1__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value2__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value2__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value3__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value3__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value4__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value4__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value5__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value5__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value6__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value6__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value7__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value7__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value8__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value8__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value9__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value9__c;
                                pricingReqItemGap.Scale_Quantity_Scale_Value10__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value10__c;
                                
                                pricingReqItemGap.Scale_UoM_Scale_Unit__c=relatedNonSAPPrice.Scale_UoM_Scale_Unit__c;
                                
                                pricingReqItemGap.ScaleRate1__c=relatedNonSAPPrice.ScaleRate1__c;
                                pricingReqItemGap.ScaleRate2__c=relatedNonSAPPrice.ScaleRate2__c;
                                pricingReqItemGap.ScaleRate3__c=relatedNonSAPPrice.ScaleRate3__c;
                                pricingReqItemGap.ScaleRate4__c=relatedNonSAPPrice.ScaleRate4__c;
                                pricingReqItemGap.ScaleRate5__c=relatedNonSAPPrice.ScaleRate5__c;
                                pricingReqItemGap.ScaleRate6__c=relatedNonSAPPrice.ScaleRate6__c;
                                pricingReqItemGap.ScaleRate7__c=relatedNonSAPPrice.ScaleRate7__c;
                                pricingReqItemGap.ScaleRate8__c=relatedNonSAPPrice.ScaleRate8__c;
                                pricingReqItemGap.ScaleRate9__c=relatedNonSAPPrice.ScaleRate9__c;
                                pricingReqItemGap.ScaleRate10__c=relatedNonSAPPrice.ScaleRate10__c;
                            }  
                            else {
                                pricingReqItemGap.Scale_Quantity_Scale_Value1__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value2__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value3__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value4__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value5__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value6__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value7__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value8__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value9__c=null;
                                pricingReqItemGap.Scale_Quantity_Scale_Value10__c=null;
                                
                                pricingReqItemGap.Scale_UoM_Scale_Unit__c=null;
                                
                                pricingReqItemGap.ScaleRate1__c=null;
                                pricingReqItemGap.ScaleRate2__c=null;
                                pricingReqItemGap.ScaleRate3__c=null;
                                pricingReqItemGap.ScaleRate4__c=null;
                                pricingReqItemGap.ScaleRate5__c=null;
                                pricingReqItemGap.ScaleRate6__c=null;
                                pricingReqItemGap.ScaleRate7__c=null;
                                pricingReqItemGap.ScaleRate8__c=null;
                                pricingReqItemGap.ScaleRate9__c=null;
                                pricingReqItemGap.ScaleRate10__c=null;
                            } 
                            /***APAC roll out fix START */
                            
                            pricingReqItemGap.Stamp_Converted_Current_Price__c=null;
                            pricingReqItemGap.Stamp_Current_Net_Price__c=null;
                            pricingReqItemGap.Stamp_Floor_Net_Price__c=null;
                            pricingReqItemGap.Stamp_Floor_Price__c=null;
                            pricingReqItemGap.Stamp_New_Net_Price__c=null;
                            pricingReqItemGap.Stamp_Reference_Net_Price__c=null;
                            pricingReqItemGap.Stamp_Reference_Price__c=null;
                            pricingReqItemGap.Below_Current_Flag__c=false;
                            pricingReqItemGap.Below_Floor_Flag__c=false;
                            pricingReqItemGap.Below_Reference_Flag__c=false;
                            pricingReqItemGap.Below_Reference_Price__c=null;
                            pricingReqItemGap.Below_Floor_Price__c=null;
                            pricingReqItemGap.Integration_Error_Message__c=null;
                            pricingReqItemGap.Net_Price_Status__c=null;
                            pricingReqItemGap.Total_Materials__c=null; 
                            /*APAC roll out fix END*/
                            
                            /*added to map Scaled rate to New rate in case of Gap records -START*/
                            if(pricingReqItem.Scaled_Price_Flag__c && !String.isBlank(pricingReqItem.ScaleRate1__c) && pricingReqItem.New_Unit__c != null && pricingReqItem.New_Unit__c != ''  && pricingReqItem.New_Unit__c !=PICK_SELECT)
                            {   
                                Decimal roundOfRate=Decimal.valueof(calculateBestScaleRate(pricingReqItem));
                                
                                if(roundOfRate!=null && pricingReqItem.New_unit__c!=PERCENT && pricingReqItem.unit__c!=PERCENT){
                                    Decimal tempRate = roundOfRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                    
                                    pricingReqItemGap.New_Rate__c=String.valueOf(tempRate);
                                    System.debug('******* pricingReqItem.New_Rate__c'+pricingReqItem.New_Rate__c+'****temprate'+tempRate+'&&&&&&pricingReqItem.ScaleRate1__c'+pricingReqItem.ScaleRate1__c);
                                }
                                else if(roundOfRate!=null && pricingReqItem.New_unit__c==PERCENT && (pricingReqItem.unit__c!=PERCENT ||pricingReqItem.unit__c==PERCENT)){
                                    Decimal tempRate = roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN);
                                    pricingReqItemGap.New_Rate__c=String.valueOf(tempRate);
                                }
                            }
                            /*added to map Scaled rate to New rate in case of Gap records -END*/  
                            
                            pricingReqItemGap.Edit__c=true;
                            upsertPRIList.add(pricingReqItemGap);
                        }
                    }
                    System.debug('****upsertList size'+upsertPRIList.size());
                    try
                    {   pricingReqItemIsChanged=pricingReqItem.clone(false,true);
                     pricingReqItemVFrom =pricingReqItem.New_Valid_From__c;
                     pricingReqItemVTo=pricingReqItem.New_Valid_To__c;
                     
                     if(pricingReqItem.Scaled_Price_Flag__c){
                         sObject sObj = (sObject)pricingReqItem ; 
                         pricingReqItemScaleRateList=new List<String>();
                         pricingReqItemScaleQuantityList=new List<String>();
                         for(Integer i=1;i<=10;i++){ 
                             if(sobj!=null && String.isBlank(String.valueOf(sobj.get('ScaleRate'+String.valueOf(i)+'__c'))))
                                 pricingReqItemScaleRateList.add(String.valueOf(sobj.get('ScaleRate'+String.valueOf(i)+'__c')));
                         }
                         for(Integer i=1;i<=10;i++){
                             if(sobj!=null && String.isBlank(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+String.valueOf(i)+'__c'))))
                                 pricingReqItemScaleQuantityList.add(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+String.valueOf(i)+'__c')));
                         }
                     }
                     if(upsertPRIList.size()!=0)
                         upsert upsertPRIList;
                     
                     System.debug('******upsertList'+upsertPRIList[0].Gap__c+ upsertPRIList[0].New_Rate__c);
                     
                    }
                    catch(DMLException e)
                    {   /*added because gap records check has to executed again*/
                        clickOk=''; //imp
                        showGapError=false;
                        showPriceCheck=false;
                        showPriceTail=false;
                        showExpireMsg=false;
                        gapCheck=null;
                        showRoundOffPopUp=false;
                        isRequestItemSaved=false; //added for NPC
                        showFloorRefSection=false;
                        /*end*/
                        
                        System.debug('in catch DML'+e);
                        
                        if(e.getMessage().contains(System.Label.Per_negative)){
                            pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                            //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                            //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                            pricingReqItem.Rate__c = tempStorageMap.get('rate');
                            pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                            if(pricingReqItem.Scaled_Price_Flag__c)
                            {
                                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                                relatedNonSAPList(tempStorageMap);
                            }
                            throw new PAException(System.Label.Per_negative,ApexPages.severity.Error);
                        }
                        else if(e.getMessage().contains('Request already exists for that period. Please change the validity dates')){
                            pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                            //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                            //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                            pricingReqItem.Rate__c = tempStorageMap.get('rate');
                            pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                            if(pricingReqItem.Scaled_Price_Flag__c)
                            {
                                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                                relatedNonSAPList(tempStorageMap);
                            }
                            return currentPageLabel;
                        }
                        
                    }
                    //commented if condition - bala Apr 29 for new req. 5.27
                    //if(upsertPRIList.size()!=0  && !upsertPRIList[0].Pricing_Request_Type__c.contains('Pricing Task'))
                    if(upsertPRIList.size()!=0 && upsertPRIList[0].Pricing_Request_Type__c.contains('Pricing Task') &&
                       (!String.isBlank(request.pricingRequest.Spot_Type__c) && request.pricingRequest.Spot_Type__c.contains('Rebate Agreement'))){}
                    else
                    {      
                        try 
                        {                              
                            //<PP20131010> START
                            if(!pricingReqItem.Expire__c)
                            {
                                //<PP20131010> END
                                system.debug('upsertPRIList size'+upsertPRIList.size()+'list:'+upsertPRIList);
                                PAUtil.calculateFloorAndReference(upsertPRIList);
                                //<PP20131010>
                            }
                        }
                        catch(Exception e)
                        {
                            system.debug('priceReq1 Ref'+e);
                        }
                        //<TJ20150622>
                        //<TJ20150702>
                        if(request.pricingrequest.BU__c.containsIgnoreCase('DPP Polymers EMEA')|| request.pricingrequest.BU__c.containsIgnoreCase('DPT NA')|| request.pricingrequest.BU__c.containsIgnoreCase('DPP AP')||request.pricingrequest.BU__c.containsIgnoreCase('DPP Polymers NAFTA'))
                        {
                            try 
                            {                              
                                //<PP20131010> START
                                if(!pricingReqItem.Expire__c)
                                {
                                    //<PP20131010> END
                                    system.debug('upsertPRIList size'+upsertPRIList.size()+'list:'+upsertPRIList);
                                    PAUtil.calculateNetFloorAndReference(upsertPRIList);
                                    //<PP20131010>
                                }
                            }
                            catch(Exception e)
                            {
                                system.debug('priceReq1 Ref'+e);
                            }
                        }
                    }
                    relatedWrappersList=getListWrappers();
                    if(request.pricingRequest.Id!=null){
                        request.pricingRequestId= request.pricingRequest.Id;
                    }
                    //pageRef=new PageReference('/apex/PricingRequestPA');
                    relatedWrappersList=getListWrappers();
                    /*added because gap records check has to executed again added for NPC -Neeharika -on april 17th*/
                    clickOk=''; //imp
                    showGapError=false;
                    showPriceCheck=false;
                    showPriceTail=false;
                    showExpireMsg=false;
                    gapCheck=null;
                    showRoundOffPopUp=false;
                    isRequestItemSaved=true; //for NPC
                    
                    showFloorRefSection=true;//To disply section
                    System.debug('****Check 2'+tempStorageMap);
                    //neeha pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                    
                    pricingReqItem.New_Rate__c = tempStorageMap.get('newRate'); //will not have plus minus updated & Scalerate updated
                    //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                    //pricingReqItem.New_Markup_Percentage__c =Decimal.valueOf(tempStorageMap.get('newMarkup'));
                    pricingReqItem.Rate__c = tempStorageMap.get('rate');
                    pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                    if(pricingReqItem.Scaled_Price_Flag__c)
                    {   System.debug('*****tempStorageMap'+tempStorageMap.get('ScaleRate1'));
                     pricingReqItem.New_Rate__c =  calculateBestScaleRate(pricingReqItem);   //tempStorageMap.get('ScaleRate1');  //TO BE Changed if best scale price is to be decided 
                     pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                     pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                     pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                     pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                     pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                     pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                     pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                     pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                     pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                     pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                     relatedNonSAPList(tempStorageMap);
                    }
                    //<PP20130621>
                    String newRateModified = [SELECT Id, New_Rate__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c FROM Pricing_Request_Item__c WHERE Id = :pricingReqItem.Id].New_Rate__c;
                    if(newRateModified != null && newRateModified != '')
                        pricingReqItem.New_Rate__c = newRateModified.replace('.',seperatorOnPage);
                    
                    System.debug('****newRateModified'+pricingReqItem.New_Rate__c);
                    /*end added for NPC -Neeharika*/
                    return newPageLabel;
                }
            }
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            if(request.pricingRequest.Request_Type__c == 'Import') 
            {
                //<PP20130424> -- Ver 5.28
                populateUtilUoMMaps();
                //Shiva- Currency Test start //Added Bala - Decimal Places for Unit %
                if(!String.isBlank(pricingReqItem.New_Rate__c) && pricingReqItem.New_Unit__c != null && pricingReqItem.New_Unit__c != ''  && pricingReqItem.New_Unit__c !=PICK_SELECT)
                {
                    System.debug('****pricing req item New Rate Test'+pricingReqItem.New_Rate__c);
                    
                    //<PP20130424> -- Ver 5.28
                    standardizeRate();
                    Decimal roundOfRate;
                    if(pricingReqItem.New_Unit__c != PERCENT)
                        roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                    else if(pricingReqItem.New_Unit__c == PERCENT)
                        roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(3,System.RoundingMode.HALF_EVEN);
                    
                    String newRedefinedRate = String.valueOf(roundOfRate);
                    pricingReqItem.New_Rate__c = newRedefinedRate;
                    
                    System.debug('****pricing req item New Rate Test'+pricingReqItem.New_Rate__c);
                }
                //Shiva- Currency Test end
                //added for indicator logic.Ver/ 5.8
                //<PP20130524> -- Ver 5.36
                calculateNewRateWithPlusMinus();
                
                pricingReqItem.Per__c = pricingReqItem.New_Per__c;
                pricingReqItem.Rate__c = pricingReqItem.New_Rate__c;
                pricingReqItem.Unit__c = pricingReqItem.New_Unit__c;
                pricingReqItem.UoM__c = pricingReqItem.New_UoM__c;
                pricingReqItem.Valid_From__c = pricingReqItem.New_Valid_From__c;
                pricingReqItem.Valid_To__c = pricingReqItem.New_Valid_To__c;
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                //pricingReqItem.Base_Floor__c = pricingReqItem.New_Base_Floor__c;
                //pricingReqItem.Markup_Percentage__c = pricingReqItem.New_Markup_Percentage__c;
                request.pricingCondition.pricingCondition.Pricing_Condition_Code__c = pricingReqItem.Pricing_Condition_Code__c;
                request.pricingCondition.pricingCondition.Pricing_Condition__c = pricingReqItem.Pricing_Condition__c;
                /**added for NPC start-neeha*/
                pricingReqItemIsChanged=pricingReqItem.clone(false,true);
                pricingReqItemVFrom =pricingReqItem.New_Valid_From__c;
                pricingReqItemVTo=pricingReqItem.New_Valid_To__c;
                if(pricingReqItem.Scaled_Price_Flag__c){
                    pricingReqItemScaleRateList=new List<String>();
                    pricingReqItemScaleQuantityList=new List<String>();
                    sObject sObj = (sObject)pricingReqItem ; 
                    for(Integer i=1;i<=10;i++){ 
                        if(sobj!=null && String.isBlank(String.valueOf(sobj.get('ScaleRate'+i+'__c'))))
                            pricingReqItemScaleRateList.add(String.valueOf(sobj.get('ScaleRate'+i+'__c')));
                    }
                    for(Integer i=1;i<=10;i++){
                        if(sobj!=null && String.isBlank(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+i+'__c'))))
                            pricingReqItemScaleQuantityList.add(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+i+'__c')));
                    }
                }
                /**added for NPC end*/
                /*Added - bala for flr and ref*/
                List<Pricing_Request_Item__c> forFlrAndRef = new List<Pricing_Request_Item__c>();
                forFlrAndRef.add(pricingReqItem);
                //upsert pricingReqItem;
                upsert forFlrAndRef;
                try
                {   
                    PAUtil.calculateFloorAndReference(forFlrAndRef);
                }
                catch(Exception e)
                {
                    system.debug('*** import err'+e);
                }
                relatedWrappersList = getListWrappers();
                /*added because gap records check has to executed again added for NPC -Neeharika -on april 17th*/
                clickOk=''; //imp
                showGapError=false;
                showPriceCheck=false;
                showPriceTail=false;
                showExpireMsg=false;
                gapCheck=null;
                showRoundOffPopUp=false;
                isRequestItemSaved=true; //for NPC
                
                
                showFloorRefSection=true;
                System.debug('****Check 3');
                pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                pricingReqItem.Rate__c = tempStorageMap.get('rate');
                pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                if(pricingReqItem.Scaled_Price_Flag__c)
                {   pricingReqItem.New_Rate__c =  calculateBestScaleRate(pricingReqItem); //tempStorageMap.get('ScaleRate1');  //TO BE Changed if best scale price is to be decided
                 pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                 pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                 pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                 pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                 pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                 pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                 pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                 pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                 pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                 pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                 relatedNonSAPList(tempStorageMap);
                }
                //<PP20130621>
                String newRateModified = [SELECT Id, New_Rate__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c FROM Pricing_Request_Item__c WHERE Id = :pricingReqItem.Id].New_Rate__c;
                pricingReqItem.New_Rate__c = newRateModified.replace('.',seperatorOnPage);
                
                System.debug('****newRateModified'+pricingReqItem.New_Rate__c);
                /*end added for NPC -Neeharika*/
                return newPageLabel;
            }
            if(pricingReqItem.Pricing_Request_Type__c == 'Project')
            {   //added -for indicator-ver.5.8
                //<PP20130424> -- Ver 5.28
                populateUtilUoMMaps();
                //<PP20130524> -- Ver 5.36 START
                if(!String.isBlank(pricingReqItem.New_Rate__c))
                {
                    //<PP20130424> -- Ver 5.28
                    standardizeRate();
                }
                //<PP20130524> -- Ver 5.36
                calculateNewRateWithPlusMinus();
                
                if(!String.isBlank(pricingReqItem.New_Rate__c))
                {
                    pricingReqItem.New_Rate__c = String.valueOf(Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(3,System.RoundingMode.HALF_EVEN));
                }   
                //pricingReqItem.New_Rate__c = String.valueOF(roundOfRate.setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.Roundingmode.HALF_EVEN));
                //<PP20130524> -- Ver 5.36 END
                
                
                
                /**added for NPC start-neeha*/
                pricingReqItemIsChanged=pricingReqItem.clone(false,true);
                pricingReqItemVFrom =pricingReqItem.New_Valid_From__c;
                pricingReqItemVTo=pricingReqItem.New_Valid_To__c;
                if(pricingReqItem.Scaled_Price_Flag__c){
                    pricingReqItemScaleRateList=new List<String>();
                    pricingReqItemScaleQuantityList=new List<String>();
                    sObject sObj = (sObject)pricingReqItem ; 
                    for(Integer i=1;i<=10;i++){ 
                        if(sobj!=null && String.isBlank(String.valueOf(sobj.get('ScaleRate'+i+'__c')))) 
                            pricingReqItemScaleRateList.add(String.valueOf(sobj.get('ScaleRate'+i+'__c')));
                    }
                    for(Integer i=1;i<=10;i++){
                        if(sobj!=null && String.isBlank(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+i+'__c'))))
                            pricingReqItemScaleQuantityList.add(String.valueOf(sobj.get('Scale_Quantity_Scale_Value'+i+'__c')));
                    }
                }
                /**added for NPC end*/
                /*Added - bala for flr and ref*/
                List<Pricing_Request_Item__c> forFlrAndRef = new List<Pricing_Request_Item__c>();
                forFlrAndRef.add(pricingReqItem);
                //upsert pricingReqItem;
                //ver 3.5 start
                try
                {
                    if(forFlrAndRef.size()!=0) {
                        //  upsert upsertPRIList;
                        upsert forFlrAndRef;
                    }
                }
                catch(DMLException e)
                {
                    /*added because gap records check has to executed again*/
                    clickOk=''; //imp
                    showGapError=false;
                    showPriceCheck=false;
                    showPriceTail=false;
                    showExpireMsg=false;
                    gapCheck=null;
                    showRoundOffPopUp=false;
                    isRequestItemSaved=false; //for NPC
                    showFloorRefSection=false;
                    pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                    //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                    //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                    pricingReqItem.Rate__c = tempStorageMap.get('rate');
                    pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                    if(pricingReqItem.Scaled_Price_Flag__c)
                    {   pricingReqItem.New_Rate__c = tempStorageMap.get('ScaleRate1');  //TO BE Changed if best scale price is to be decided
                     pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                     pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                     pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                     pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                     pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                     pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                     pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                     pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                     pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                     pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                     relatedNonSAPList(tempStorageMap);
                    }
                    /*end*/
                    System.debug('in catch DML'+e);
                    System.debug('in catch DML'+e.getMessage());
                    
                    if(e.getMessage().contains('Request already exists')){
                        
                        throw new PAException('Request already exists.',ApexPages.severity.Error);
                    }
                    else{
                        
                        throw e;
                    }
                    
                } 
                //ver 3.5 ends
                // upsert forFlrAndRef;
                
                
                
                try
                {  //commented if condition - bala Apr 29 for new req. 5.27
                    // if(!forFlrAndRef[0].Pricing_Request_Type__c.contains('Pricing Task'))
                    if(forFlrAndRef.size()!=0 && forFlrAndRef[0].Pricing_Request_Type__c.contains('Pricing Task') &&
                       (!String.isBlank(request.pricingRequest.Spot_Type__c) && (request.pricingRequest.Spot_Type__c.contains('Rebate Agreement')
                                                                                 || request.pricingRequest.Spot_Type__c.contains('Free of Charge')))){}
                    PAUtil.calculateFloorAndReference(forFlrAndRef);
                }
                catch(Exception e)
                {
                    pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                    //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                    //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                    pricingReqItem.Rate__c = tempStorageMap.get('rate');
                    pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                    if(pricingReqItem.Scaled_Price_Flag__c)
                    {
                        pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                        pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                        pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                        pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                        pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                        pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                        pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                        pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                        pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                        pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                        relatedNonSAPList(tempStorageMap);
                    }
                    system.debug('***Project Ref'+e);
                }
                /*completed*/
                
                relatedWrappersList = getListWrappers();
                /*added because gap records check has to executed again added for NPC -Neeharika -on april 17th*/
                clickOk=''; //imp
                showGapError=false;
                showPriceCheck=false;
                showPriceTail=false;
                showExpireMsg=false;
                gapCheck=null;
                showRoundOffPopUp=false;
                isRequestItemSaved=true; //for NPC
                
                showFloorRefSection=true;
                System.debug('****Check 4');
                //<PP20130621>
                String newRateModified = [SELECT Id, New_Rate__c FROM Pricing_Request_Item__c WHERE Id = :pricingReqItem.Id].New_Rate__c;
                newRateModified = newRateModified.replace('.',seperatorOnPage);
                tempStorageMap.put('newRate',newRateModified);
                changeRateBasedOnLocale(tempStorageMap); //VIMP
                System.debug('****newRateModified'+pricingReqItem.New_Rate__c);
                
                
                /*  pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
pricingReqItem.Rate__c = tempStorageMap.get('rate');
pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
if(pricingReqItem.Scaled_Price_Flag__c)
{
pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
if(relatedERPSAPPrice != null)
{
relatedERPSAPPrice.ScaleRate1__c = tempStorageMap.get('erpScaleRate1');
relatedERPSAPPrice.ScaleRate2__c = tempStorageMap.get('erpScaleRate2');
relatedERPSAPPrice.ScaleRate3__c = tempStorageMap.get('erpScaleRate3');
relatedERPSAPPrice.ScaleRate4__c = tempStorageMap.get('erpScaleRate4');
relatedERPSAPPrice.ScaleRate5__c = tempStorageMap.get('erpScaleRate5');
relatedERPSAPPrice.ScaleRate6__c = tempStorageMap.get('erpScaleRate6');
relatedERPSAPPrice.ScaleRate7__c = tempStorageMap.get('erpScaleRate7');
relatedERPSAPPrice.ScaleRate8__c = tempStorageMap.get('erpScaleRate8');
relatedERPSAPPrice.ScaleRate9__c = tempStorageMap.get('erpScaleRate9');
relatedERPSAPPrice.ScaleRate10__c = tempStorageMap.get('erpScaleRate10');
}
} */
                /*end added for NPC -Neeharika*/
                return newPageLabel;
            }
        }
        
        return newpageLabel;
        
        
    }
    //method separated by sumita dabas to avoid "A method was found with too much code" error for IS ID-00061597 on 28 Jan 2016 END
    
    
    /**<AV20140515>- cancel action moved inside this method**/    
    public String cancelAction(String newpageLabel,String desiredAction,Map<String,String> tempStorageMap){
        
        System.debug('***cancel method'+pricingReqItem);
        //to make filter values null on click of cancel -try
        if(pricingReqItem.Id==null){ //on click of new price and cancel
            request.soldToFilter = null;
            request.materialFilter = null;
            request.materialdescription=null;
            request.phFilter = null;
            request.profitCenterFilter = null;
            request.cpgFilter = null;
            //Piyush <PG20202707>
            request.distFilter = null;
            request.priceListTypeFilter = null;
            request.discRefFilter = null;
            request.mpgFilter = null;
            request.paymentTermsFilter = null;
            request.salesOfficeFilter = null;
            request.salesDistrictFilter = null;
            request.shipToFilter = null;
            //Ver 5.13 START
            request.endUseFilter = null;
            request.marketSegmentFilter = null;
            request.countryFilter = null;
            request.priceRefPartnerFilter = null;
            //Ver 5.13 END
            //<MS20141114>
            request.projectFilter = null;
            request.kcodeFilter = null;
            //<MS20140514> Including Variant and Sales Order Type START
            request.variantFilter = null;
            request.salesOrderTypeFilter = null;
            //<MS20150101>
            request.contractFilter = null;
            request.comPartnerFilter = null;
            //<MS20150213>
            request.materialGroup5KeyFilter = null;         
            //<MS20140514> Including Variant and Sales Order Type END
            //<PP20131028>
            request.shipToCountryFilter = null;
            //Ver 5.26 START
            request.endUserFilter = null;
            //Ver 5.26 END
            //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy,FRB
            request.customerHierarchyFilter = null;
            //<BB20130726> Ver 5.47 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Sales Type Incoterms START
            request.incotermsFilter = null;
            //<BB20130726> Ver 5.47 ENDS
            request.materialGroup1Filter = null;
            request.payerFilter = null;
            request.partnerZFFilter = null;
            request.discRefNoFilter = null;
            request.fixValDateFilter = null;
            pricingReqItem.FixValDate__c = null;
            request.campaignFilter = null;
            request.documentCurrencyFilter = null;
            request.stateFilter = null;
            
        }                   
        else{
            //neeha-For NPC-start
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
            //NPC end
        }
        System.debug('***desired Ation in cancel'+desiredAction);
        if(desiredAction.containsIgnoreCase('CancelNetPrice')){
            //neeha
            
            /*added because gap records check has to executed again added for NPC -Neeharika -on april 17th*/
            /*  clickOk=''; //imp
showGapError=false;
showPriceCheck=false;
showExpireMsg=false;
gapCheck=null;
showRoundOffPopUp=false; */
            //isRequestItemSaved=false; //29th april//for NPC.
            //showFloorRefSection=true;-not needed
            netPricingFlag=false;
            if(calNetPrice == NULL)
                calNetPrice =new PACalculateNetPrice();
            //  pricingReqItem.New_Rate__c=calNetPrice.bindvalueToNewRate();//to bind the rate user entered in material net page to Pricing request item 's new rate
            System.debug('*****check neeha'+pricingReqItem.New_Rate__c);                      
            System.debug('****Check 5'+tempStorageMap);
            Decimal stdDecimal = 1.1;
            String localeDecimalString = stdDecimal.format();
            String separator = localeDecimalString.subString(1,2);
            if(pricingReqItem.New_rate__c!=null){
                pricingReqItem.New_Rate__c= pricingReqItem.New_rate__c.replace('.',separator);
            }
            if(pricingReqItem.Rate__c!=null){
                pricingReqItem.Rate__c= pricingReqItem.Rate__c.replace('.',separator);
            }
            if(pricingReqItem.Scaled_Price_Flag__c)
            {
                sObject sObj = (sObject)pricingReqItem;
                sObject sObjERP = (sObject)relatedERPSAPPrice;
                for(Integer i=1;i<=10;i++){
                    if(sObj!=null && sobj.get('ScaleRate'+i+'__c')!=null){
                        String tempValue=String.valueof(sobj.get('ScaleRate'+i+'__c'));
                        tempStorageMap.put('ScaleRate'+i,tempValue.replace('.',separator));
                    }
                    
                    if(sObjERP!=null && sObjERP.get('ScaleRate'+i+'__c')!=null){
                        String tempValueERP=String.valueof(sObjERP.get('ScaleRate'+i+'__c'));
                        tempStorageMap.put('erpScaleRate'+i,tempValueERP.replace('.',separator));
                    }
                }   
                System.debug('*****tempStorageMap'+tempStorageMap);
                pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1'); //Success- not an exception 
                pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                relatedNonSAPList(tempStorageMap);
            }
            /*end added for NPC -Neeharika*/ 
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
            return newPageLabel;
        }
        
        return newPageLabel;
        
    }
    
    
    private void replaceSeparator(Map<String,String> tempStorageMap,Map<String,String> tempScaleRateMap){
        //<PP20130524> -- Ver 5.36 START
        Integer  plusMinus;
        //Changed != null condition to !String.isBlank
        if(request.pricingCondition.pricingCondition!=null && !String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c) && request.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X')
        {
            plusMinus = -1;
        } 
        else if(request.pricingCondition.pricingCondition!=null && !String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c) && request.pricingCondition.pricingCondition.Plus_Minus_Code__c=='A')
        {
            plusMinus = 1;
        }
        //<PP20130524> -- Ver 5.36 END
        if(!String.isBlank(pricingReqItem.New_Rate__c) && (pricingReqItem.New_Rate__c.contains(',') || pricingReqItem.New_Rate__c.contains('.')))
        {
            if(!String.isBlank(pricingReqItem.New_Rate__c) && pricingReqItem.New_Rate__c.contains(separator) && pricingReqItem.New_Rate__c.countMatches(separator)==1 && !pricingReqItem.New_Rate__c.contains(nonLocaleSeparator))
            {
                if(separator == ',')
                {
                    pricingReqItem.New_Rate__c = pricingReqItem.New_Rate__c.replace(separator,'.');
                    
                }                   
            }
            else
            {
                pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                if(pricingReqItem.Scaled_Price_Flag__c)
                {
                    
                    
                    pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                    pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                    pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                    pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                    pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                    pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                    pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                    pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                    pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                    pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                    relatedNonSAPList(tempStorageMap);
                }
                pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                throw new  PAException('<html>'+System.Label.Invalid_Rate_Error+'</html>',ApexPages.Severity.ERROR);
            }
        }
        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
        
        
        
        if(pricingReqItem.Scaled_Price_Flag__c)
        { 
            Boolean scaleRateMapFlag = true;                                         
            if((!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value1__c) && !pricingReqItem.Scale_Quantity_Scale_Value1__c.replace('-','').isNumeric()) ||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value2__c) && !pricingReqItem.Scale_Quantity_Scale_Value2__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value3__c) && !pricingReqItem.Scale_Quantity_Scale_Value3__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value4__c) && !pricingReqItem.Scale_Quantity_Scale_Value4__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value5__c) && !pricingReqItem.Scale_Quantity_Scale_Value5__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value6__c) && !pricingReqItem.Scale_Quantity_Scale_Value6__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value7__c) && !pricingReqItem.Scale_Quantity_Scale_Value7__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value8__c) && !pricingReqItem.Scale_Quantity_Scale_Value8__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value9__c) && !pricingReqItem.Scale_Quantity_Scale_Value9__c.replace('-','').isNumeric())||
               (!String.isBlank(pricingReqItem.Scale_Quantity_Scale_Value10__c) && !pricingReqItem.Scale_Quantity_Scale_Value10__c.replace('-','').isNumeric()))
            {
                pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                pricingReqItem.Rate__c = tempStorageMap.get('rate');
                pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                if(pricingReqItem.Scaled_Price_Flag__c)
                {
                    
                    
                    pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                    pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                    pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                    pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                    pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                    pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                    pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                    pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                    pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                    pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                    relatedNonSAPList(tempStorageMap);
                }
                  throw new  PAException('<html>'+System.Label.Invalid_Scale_Quantity_Error+'</html>',ApexPages.Severity.ERROR);
            } 
            
            for(Integer i=1; i<=10; i++)
            {
                if(tempStorageMap!=null && tempStorageMap.containsKey('ScaleRate'+i) && !string.isBlank(tempStorageMap.get('ScaleRate'+i)))
                {
                    if(!String.isBlank(tempStorageMap.get('ScaleRate'+i)) && tempStorageMap.get('ScaleRate'+i).contains(separator) && tempStorageMap.get('ScaleRate'+i).countMatches(separator)==1 && !tempStorageMap.get('ScaleRate'+i).contains(nonLocaleSeparator))
                    {
                        if(separator == ',')
                        {
                            tempScaleRateMap.put('ScaleRate'+i,tempStorageMap.get('ScaleRate'+i).replace(separator,'.'));
                            
                        }
                        else if(separator == '.') 
                        {
                            tempScaleRateMap.put('ScaleRate'+i,tempStorageMap.get('ScaleRate'+i));
                        }               
                    }
                    else if(!String.isBlank(tempStorageMap.get('ScaleRate'+i)) && !tempStorageMap.get('ScaleRate'+i).contains('.') && !tempStorageMap.get('ScaleRate'+i).contains(','))
                    {
                        tempScaleRateMap.put('ScaleRate'+i,tempStorageMap.get('ScaleRate'+i));
                    }
                    else
                    {
                        scaleRateMapFlag = false;
                        System.debug('*****tempStorageMap'+tempStorageMap);
                        pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                        pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1');
                        pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
                        pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
                        pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
                        pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
                        pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
                        pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
                        pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
                        pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
                        pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
                        pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                        throw new  PAException('<html>'+System.Label.Invalid_ScaleRate_Error+i+'</html>',ApexPages.Severity.ERROR);
                    }
                }
            }
            
            if(scaleRateMapFlag)
            {
                //<PP20130524> -- Ver 5.36 START
                
                sObject priSObject = (sObject)pricingReqItem;
                for(Integer j =1; j <= 10; j++)
                {
                    if(!String.isBlank(tempScaleRateMap.get('ScaleRate'+j)))
                    {
                        Decimal newScaleRate = Decimal.valueOf(tempScaleRateMap.get('ScaleRate'+j));
                        if(newScaleRate != null && plusMinus != null && (plusMinus == 1 || plusMinus == -1))
                        {
                            newScaleRate = newScaleRate.abs() * plusMinus;
                        }
                        priSObject.put('ScaleRate'+j+'__c',String.valueOf(newScaleRate));
                    }
                    else
                    {
                        priSObject.put('ScaleRate'+j+'__c','');
                    }
                }
                pricingReqItem = (Pricing_Request_Item__c)priSObject;  // endcmmneted as it is throwing an exception -neeha
                //<PP20130524> -- Ver 5.36 END
                /*<PP20130524> -- Ver 5.36 -- Commented as it is replaced by code above
if(!String.isBlank(tempScaleRateMap.get('ScaleRate1')))
{
pricingReqItem.ScaleRate1__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate1')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate1__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate2')))
{
pricingReqItem.ScaleRate2__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate2')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate2__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate3')))
{
pricingReqItem.ScaleRate3__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate3')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate3__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate4')))
{
pricingReqItem.ScaleRate4__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate4')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate4__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate5')))
{
pricingReqItem.ScaleRate5__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate5')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate5__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate6')))
{
pricingReqItem.ScaleRate6__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate6')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate6__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate7')))
{
pricingReqItem.ScaleRate7__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate7')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate8__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate8')))
{
pricingReqItem.ScaleRate8__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate8')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate8__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate9')))
{
pricingReqItem.ScaleRate9__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate9')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate9__c = '';
}
if(!String.isBlank(tempScaleRateMap.get('ScaleRate10')))
{
pricingReqItem.ScaleRate10__c = String.valueOf(Decimal.valueOf(tempScaleRateMap.get('ScaleRate10')).abs() * plusMinus);
}
else
{
pricingReqItem.ScaleRate10__c = '';
}*/
                
            }
            
            for(Integer j=1; j<=10; j++)
            {
                if(tempStorageMap!=null && tempStorageMap.containsKey('erpScaleRate'+j) && !String.isBlank(tempStorageMap.get('erpScaleRate'+j)))
                {
                    tempScaleRateMap.put('erpScaleRate'+j,tempStorageMap.get('erpScaleRate'+j).replace(separator,'.'));
                }
            }
            relatedNonSAPList(tempStorageMap);
       //  }
        }
        
        if(!String.isBlank(pricingReqItem.Quantity__c) && (pricingReqItem.Quantity__c.contains(',') || pricingReqItem.Quantity__c.contains('.')))
        {
            if(!String.isBlank(pricingReqItem.Quantity__c) && pricingReqItem.Quantity__c.contains(separator) && pricingReqItem.Quantity__c.countMatches(separator)==1 && !pricingReqItem.Quantity__c.contains(nonLocaleSeparator))
            {
                if(separator == ',')
                {
                    pricingReqItem.Quantity__c = pricingReqItem.Quantity__c.replace(separator,'.');
                    
                }                   
            }
            else
            {
                pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
                //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
                //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
                pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
                throw new  PAException('<html>'+System.Label.Invalid_Quantity_Error+'</html>',ApexPages.Severity.ERROR);
            }
        }
        if(!String.isBlank(pricingReqItem.Rate__c) && pricingReqItem.Rate__c.contains(','))
        {
            pricingReqItem.Rate__c = pricingReqItem.Rate__c.replace(',','.');
        }
        
        
    } 
    /*
* Author     : Vinoth
* Method Name : uploadRecords
* Parameters  : None
* Return type : void
* Description : used to import records and do system validations on them
*/
    private void uploadRecords() {
        string csvString;
        List<string> headerList = new List<string>();
        ///rejectedRecords = null;
        /*      if(contentFile==null) {
throw new PAException(Label.select_file,ApexPages.severity.Error);
}*/
        /*try {
//Converting the content of the blob to string
csvString=contentFile.toString();*/
        
        string[] fileRows ;
        List<string> header;
        List<PAWrapper> impWrapperList ;
        string [] columnCompare;
        ERP_Pricing_Condition__c priCondObj = new ERP_Pricing_Condition__c();
        ERP_Key_Combination__c keyCombObj = new ERP_Key_Combination__c();
        Map<string,string> objAPIMap ;
        Map<String, Schema.SObjectField> objectFields;
        List<string> columnCheck ;
        //<GT20150122>Added for massive import
        if(request.massiveImport && popUpFlag!='details')
        {
            popUpFlag='Import';
        }
        if(!request.massiveImport)
        {
            
            headerList = new List<string>();
            ///rejectedRecords = null;
            if(contentFile==null) {
                throw new PAException(Label.select_file,ApexPages.severity.Error);
            }
            try {
                //Converting the content of the blob to string
                csvString=contentFile.toString();
            }
            catch(Exception e) {
                System.debug('Exception::::'+e+'-'+e.getMessage());
                throw new PAException(Label.Please_select_a_valid_file_type_to_Upload_Error,ApexPages.severity.Error);
            }
            contentFile=null;
            fileRows = csvString.split('\n');   //Splitting the string into Rows
            header = new List<string>();
            if(fileRows.size()>0) {
                headerList = fileRows[0].split('\t');   //First row which contains headers
                header = fileRows[0].toLowerCase().split('\t');
                headerList[headerList.size()-1]=headerList[headerList.size()-1].trim();
                header[header.size()-1]=header[header.size()-1].trim();
            }
            //List<Sobject> importRecords= new List<Pricing_Request_Item__c>();
            impWrapperList = new List<PAWrapper>();
            
            //Getting the Objects Label name and API name of the fields of Pricing_Request_Item__c Object
            objAPIMap = new Map<string,string>();
            objectFields = Schema.getGlobalDescribe().get('Pricing_Request_Item__c').getDescribe().fields.getMap();
            
            for(Schema.SObjectField f:objectFields.Values()) {
                string Label = f.getDescribe().getLabel();
                string value = f.getDescribe().getName();
                objAPIMap.put(Label.toLowerCase(),value);
            }
            system.debug('***objAPIMap : '+objAPIMap);//Nitin
            columnCheck = new List<string>();
            
            string pricingCondition;
            string keyCombination;
            system.debug('***fileRows.size() : '+fileRows.size());//Nitin
            //<PP20131231>
            //<PP20140522>
        }
        
        Organizational_Group_Item__c ogItemObj = [SELECT Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c,isPaymentTermsApplicable__c,isVolumeApplicable__c,Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,ERP_Pricing_Procedure__c, ERP_Pricing_Procedure__r.SAP_Cluster__c,Base_UoM__c,
                                                  ERP_Pricing_Procedure__r.SAP_Client_Id__c, ERP_Pricing_Procedure__r.SAP_Application_Id__c, 
                                                  Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c 
                                                  WHERE Business__c=:request.requestServiceState.ogItems.selectedBU 
                                                  AND OrgGroup__r.ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c 
                                                  AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c 
                                                  AND OrgGroup__r.ERP_Division_Code__c=:request.pricingRequest.Division_Code__c limit 1];
        
        
        //<GT20150122>Added for massive import
        if(!request.massiveImport)
        {
            //ERP_Pricing_Condition__c priCondObj = new ERP_Pricing_Condition__c();
            //ERP_Key_Combination__c keyCombObj = new ERP_Key_Combination__c();
            Set<string> descriptions = new Set<string>();
            Decimal standardDecimalImport = 1.1;
            string decimalSeparatorImport = standardDecimalImport.format().subString(1,2);
            string nonDecimalSeaparator;
            if(decimalSeparatorImport == ',') {
                nonDecimalSeaparator = '.';
            }
            else {
                nonDecimalSeaparator = ',';
            }       
            
            //Iterating through rows and splitting the values in columns
            for (Integer i=1;i<fileRows.size();i++) {
                String[] inputvalues = new String[]{};
                    string[] correct =new string[]{};
                        string[] temp =new List<string>();
                inputvalues = fileRows[i].split('\t');
                
                //Creating the Object for each rows in the csv file and assigning values
                PAWrapper impWrapperObj = new PAWrapper();
                impWrapperObj.sObjectRecord = new Pricing_Request_Item__c();
                
                for(Integer columns=0;columns<header.size();columns++ ) {
                    try {
                        if(header[columns].trim()!='sid' && objectFields.get(objAPIMap.get(header[columns].trim())).getDescribe().getType()==Schema.DisplayType.String) {                      
                            if(header[columns].trim().contains('rate')) {
                                if((!string.isBlank(inputvalues[columns].trim().unescapeCsv())) && (inputvalues[columns].trim().unescapeCsv().contains(',') || inputvalues[columns].trim().unescapeCsv().contains('.'))) {
                                    if(inputvalues[columns].trim().unescapeCsv().contains(decimalSeparatorImport) && inputvalues[columns].trim().unescapeCsv().countMatches(decimalSeparatorImport)==1 && (!inputvalues[columns].trim().unescapeCsv().contains(nonDecimalSeaparator))){
                                        if(decimalSeparatorImport == ',') {
                                            impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),inputvalues[columns].trim().unescapeCsv().removeStart('\'').replace(',','.'));                            
                                        }
                                        else {
                                            impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                        }
                                    }
                                    else {
                                        if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                            impWrapperObj.stringMap.put('errors', 'Invalid '+headerList[columns]+' : '+inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                        }
                                        else {
                                            impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', Invalid '+headerList[columns]+' : '+inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                        }
                                    }
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                }
                            }
                            else if(header[columns].trim().contains('quantity')) {
                                if(!string.isBlank(inputvalues[columns].trim().unescapeCsv().removeStart('\''))) {
                                    if(inputvalues[columns].trim().unescapeCsv().removeStart('\'').isNumeric()) {
                                        impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                    }
                                    else {
                                        if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                            impWrapperObj.stringMap.put('errors', 'Invalid '+headerList[columns]+' : '+inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                        }
                                        else {
                                            impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', Invalid '+headerList[columns]+' : '+inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                                        }
                                    }
                                }
                            }
                            else {
                                //Version 5.41: Added condition to change the CASE of UOM AND CURRENCY to upper case <UD20130608>
                                if(inputvalues[columns].trim().unescapeCsv().removeStart('\'') <> NULL)
                                    impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),(header[columns].trim()=='uom' || header[columns].trim()=='currency' || header[columns].trim()=='scale uom/scale unit')? inputvalues[columns].trim().unescapeCsv().removeStart('\'').toUpperCase() : inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                            }
                        }
                        else if(header[columns].trim()!='sid' && objectFields.get(objAPIMap.get(header[columns].trim())).getDescribe().getType()==Schema.DisplayType.Double){
                            if(inputvalues[columns].trim().unescapeCsv().contains(',')) {
                                impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),string.isBlank(inputvalues[columns].trim().unescapeCsv()) ? null : Decimal.valueOf(inputvalues[columns].trim().unescapeCsv().removeStart('\'').replace(',','.')));
                            }
                            else {
                                impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),string.isBlank(inputvalues[columns].trim().unescapeCsv()) ? null : Decimal.valueOf(inputvalues[columns].trim().unescapeCsv().removeStart('\'')));
                            }
                        }
                        else if(header[columns].trim()!='sid' && objectFields.get(objAPIMap.get(header[columns].trim())).getDescribe().getType()==Schema.DisplayType.Date){
                            if(!string.isBlank(inputvalues[columns].trim().unescapeCsv().removeStart('\''))) {
                                if((inputvalues[columns].trim().unescapeCsv().removeStart('\'')).isNumeric() && (inputvalues[columns].trim().unescapeCsv().removeStart('\'')).length()==8 && Integer.valueOf((inputvalues[columns].trim().unescapeCsv().removeStart('\'')).substring(4,6))<13 && Integer.valueOf((inputvalues[columns].trim().unescapeCsv().removeStart('\'')).substring(6,8)) < 32) {
                                    //Date ImportedDate = date.newinstance(Integer.valueOf((inputvalues[columns].trim().unescapeCsv()).substring(0,4)), Integer.valueOf((inputvalues[columns].trim().unescapeCsv()).substring(4,6)), Integer.valueOf((inputvalues[columns].trim().unescapeCsv()).substring(6,8)));
                                    impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),date.newinstance(Integer.valueOf((inputvalues[columns].trim().unescapeCsv().removeStart('\'')).substring(0,4)), Integer.valueOf((inputvalues[columns].trim().unescapeCsv().removeStart('\'')).substring(4,6)), Integer.valueOf((inputvalues[columns].trim().unescapeCsv().removeStart('\'')).substring(6,8))));
                                }
                                else {
                                    if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                        impWrapperObj.stringMap.put('errors', headerList[columns]+' '+Label.Date_format_import_Error);
                                    }
                                    else {
                                        impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+headerList[columns]+' '+Label.Date_format_import_Error);
                                    }
                                }
                            }
                        }
                        else if(header[columns].trim()!='sid' && objectFields.get(objAPIMap.get(header[columns].trim())).getDescribe().getType()==Schema.DisplayType.Boolean){
                            impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),(inputvalues[columns].trim().unescapeCsv().removeStart('\'')=='true' ? true : false));
                        }
                        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                        else if(header[columns].trim()!='sid' && objectFields.get(objAPIMap.get(header[columns].trim())).getDescribe().getType()==Schema.DisplayType.Percent){
                            if(inputvalues[columns].trim().unescapeCsv().contains(',')) {
                                impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),string.isBlank(inputvalues[columns].trim().unescapeCsv()) ? 0 : Decimal.valueOf(inputvalues[columns].trim().unescapeCsv().removeStart('\'').replace(',','.')));
                            }
                            else {
                                impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),string.isBlank(inputvalues[columns].trim().unescapeCsv()) ? 0 : Decimal.valueOf(inputvalues[columns].trim().unescapeCsv().removeStart('\'')));
                            }
                        }
                        else if(header[columns].trim()!='sid'){
                            impWrapperObj.sObjectRecord.put(objAPIMap.get(header[columns].trim()),inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                        }
                        else if((header[columns].trim()).equalsIgnoreCase('sid')) {
                            impWrapperObj.sObjectRecord.put('ERP_Sales_Prices_SAP__c',inputvalues[columns].trim().unescapeCsv().removeStart('\''));
                        }
                        if(i>1) {
                            //<NE20140121> - Added to ignore empty columns in header
                            if(!(Pattern.matches('ph[2-9] code',header[columns]) || header[columns]=='sid' || descriptions.contains(header[columns]) || String.ISBLANK(header[columns]))) {//header[columns]=='sold to' || header[columns]=='material' || header[columns]=='shipto' || header[columns]=='customer price group' || header[columns]=='material price group' || header[columns]=='price list type' || header[columns]=='sales office' || header[columns]=='profit center' || header[columns]=='product hierarchy')) {
                                if(!((header[columns].contains('scale quantity/ scale value') && header[columns]!='scale quantity/ scale value1') || (header[columns].contains('scalerate') && header[columns]!='scalerate1') )) {
                                    if(((header[columns].contains('scale quantity/ scale value') || header[columns].contains('scalerate') || header[columns]=='scale uom/scale unit') && ((boolean)impWrapperObj.sObjectRecord.get('Scaled_Price_Flag__c'))) || (!(header[columns].contains('scale quantity/ scale value') || header[columns].contains('scalerate') || header[columns]=='scale uom/scale unit'))) {
                                        if(String.isBlank(inputvalues[columns].trim().unescapeCsv().removeStart('\''))) {
                                            if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                                impWrapperObj.stringMap.put('errors', Label.Mandatory_import+' '+headerList[columns]);
                                            }
                                            else {
                                                impWrapperObj.stringMap.put('errors',impWrapperObj.stringMap.get('errors')+', '+Label.Mandatory_import+' '+headerList[columns]);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch(TypeException te) {
                        if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                            impWrapperObj.stringMap.put('errors', headerList[columns]+' : '+te.getMessage());
                        }
                        else {
                            impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+headerList[columns]+' : '+te.getMessage());
                        }
                    }
                    catch(Exception e) {
                        
                    }
                    if(i==1) {
                        columnCheck.add(headerList[columns]);
                    }
                }
                //Checking whether the Record has values in Pricing Condition Code column and Key Combination Code Column
                if(!(string.isBlank(string.valueOf(impWrapperObj.sObjectRecord.get('Pricing_Condition_Code__c'))) || string.isBlank(string.valueOf(impWrapperObj.sObjectRecord.get('Key_Combination_Code__c'))))) {
                    if(impWrapperList.size()>0) {
                        //Checking whether the previous added Pricing Condition Code and Current record Pricing Condition Code are same
                        if(string.valueOf(impWrapperList[impWrapperList.size()-1].sObjectRecord.get('Pricing_Condition_Code__c')).equalsIgnoreCase(string.valueOf(impWrapperObj.sObjectRecord.get('Pricing_Condition_Code__c')))) {
                            //Checking whether the previous added Key Combination Code and Current record Key Combination Code are same
                            if(string.valueOf(impWrapperList[impWrapperList.size()-1].sObjectRecord.get('Key_Combination_Code__c')).equalsIgnoreCase(string.valueOf(impWrapperObj.sObjectRecord.get('Key_Combination_Code__c')))) {
                                impWrapperList.add(impWrapperObj);
                                if(impWrapperList.size()>300) {
                                    throw new PAException(Label.Records_count_exceeded_Error,ApexPages.severity.Error);
                                }
                            }
                            else {
                                throw new PAException(Label.Only_one_Key_Combination_Error,ApexPages.severity.Error);
                            }
                        }
                        else {
                            throw new PAException(Label.Only_one_Pricing_Condition_Error,ApexPages.severity.Error);
                        }                   
                        //<PP20130524> -- Ver 5.36 START
                        if((!string.isBlank((string)impWrapperObj.sObjectRecord.get('Rate__c'))) && impWrapperObj.sObjectRecord.get('Unit__c')!=null) 
                        {
                            try {
                                //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                Decimal roundOfRate = Decimal.valueOf((String)impWrapperObj.sObjectRecord.get('Rate__c'));
                                system.debug('roundOfRate2&&&'+roundOfRate);
                                if(!String.isBlank(priCondObj.Plus_Minus_Code__c))
                                {
                                    roundOfRate = roundOfRate.abs();
                                    if(priCondObj.Plus_Minus_Code__c == 'X')
                                    {
                                        roundOfRate = roundOfRate * (-1);
                                    }                               
                                } 
                                else{
                                    system.debug('roundOfRate1&&&'+roundOfRate);
                                    If(((String)impWrapperObj.sObjectRecord.get('Rate__c')).contains('-')){                                  
                                        roundOfRate = roundOfRate.abs();
                                        roundOfRate = roundOfRate * (-1);
                                    }                                    
                                    
                                }                           
                                if(priCondObj.Calculation_Type_Code__c=='A') {
                                    impWrapperObj.sObjectRecord.put('Rate__c',String.valueOf(roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN)));
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Rate__c',String.valueOf(roundOfRate.setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)));
                                }
                            }
                            catch(Exception e) {
                                if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                    impWrapperObj.stringMap.put('errors', Label.Invalid_Rate_Error);
                                }
                                else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_Rate_Error)) {
                                    impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_Rate_Error);
                                }
                            }
                        }                  
                        //<PP20130524> -- Ver 5.36 END
                        
                        //Rounding off the Rate Value
                        if((!string.isBlank((string)impWrapperObj.sObjectRecord.get('Rate__c'))) && ((string)impWrapperObj.sObjectRecord.get('Rate__c')).contains('.') && impWrapperObj.sObjectRecord.get('Unit__c')!=null && priCondObj.Plus_Minus_Code__c=='X') {
                            try {
                                //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                if(priCondObj.Calculation_Type_Code__c=='A') {
                                    impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).abs().setScale(3,System.RoundingMode.HALF_EVEN)*(-1)));
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).abs().setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)*(-1)));
                                }
                            }
                            catch(Exception e) {
                                if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                    impWrapperObj.stringMap.put('errors', Label.Invalid_Rate_Error);
                                }
                                else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_Rate_Error)) {
                                    impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_Rate_Error);
                                }
                            }
                        }
                        else if((!string.isBlank((string)impWrapperObj.sObjectRecord.get('Rate__c'))) && ((string)impWrapperObj.sObjectRecord.get('Rate__c')).contains('.')){
                            try {
                                //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                if(((string)impWrapperObj.sObjectRecord.get('Rate__c')).contains('-'))
                                {
                                    if(priCondObj.Calculation_Type_Code__c=='A') {
                                        impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).setScale(3,System.RoundingMode.HALF_EVEN)));
                                    }
                                    else {
                                        impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)));
                                    }                               
                                }
                                else
                                {
                                    if(priCondObj.Calculation_Type_Code__c=='A') {
                                        impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).abs().setScale(3,System.RoundingMode.HALF_EVEN)));
                                    }
                                    else {
                                        impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).abs().setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)));
                                    }
                                }
                            }
                            catch(Exception e) {
                                if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                    impWrapperObj.stringMap.put('errors', Label.Invalid_Rate_Error);
                                }
                                else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_Rate_Error)) {
                                    impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_Rate_Error);
                                }
                            }
                        }
                        else if(!string.isBlank((string)impWrapperObj.sObjectRecord.get('Rate__c'))) {
                            try {                           
                                if(priCondObj.Plus_Minus_Code__c=='X') {
                                    impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).abs()*(-1)));
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Rate__c',string.valueOf(Decimal.valueOf((string)impWrapperObj.sObjectRecord.get('Rate__c')).abs()));
                                }
                            }
                            catch(Exception e) {
                                if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                    impWrapperObj.stringMap.put('errors', Label.Invalid_Rate_Error);
                                }
                                else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_Rate_Error)) {
                                    impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_Rate_Error);
                                }
                            }
                        }
                        
                        //Rounding off the Scale Rate Values
                        if(enableScale=='true') {                   
                            for(Integer scaleIndex=1;scaleIndex<=10;scaleIndex++) {
                                //<PP20130524> -- Ver 5.36 START
                                if((!string.isBlank((string)impWrapperObj.sObjectRecord.get('ScaleRate'+scaleIndex+'__c'))) && impWrapperObj.sObjectRecord.get('Unit__c')!=null) 
                                {
                                    try {
                                        //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                        Decimal roundOfRate = Decimal.valueOf((String)impWrapperObj.sObjectRecord.get('ScaleRate'+scaleIndex+'__c'));
                                        system.debug('roundOfRate2&&&'+roundOfRate);
                                        if(!String.isBlank(priCondObj.Plus_Minus_Code__c))
                                        {
                                            roundOfRate = roundOfRate.abs();
                                            if(priCondObj.Plus_Minus_Code__c == 'X')
                                            {
                                                roundOfRate = roundOfRate * (-1);
                                            }                                                                      
                                        }
                                        else{
                                            system.debug('roundOfRate2&&&'+roundOfRate);
                                            If(((String)impWrapperObj.sObjectRecord.get('Rate__c')).contains('-')){                                       
                                                roundOfRate = roundOfRate.abs();
                                                roundOfRate = roundOfRate * (-1);
                                            }                                                              
                                        } 
                                        if(priCondObj.Calculation_Type_Code__c=='A') {
                                            impWrapperObj.sObjectRecord.put('ScaleRate'+scaleIndex+'__c',String.valueOf(roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN)));
                                        }
                                        else {
                                            impWrapperObj.sObjectRecord.put('ScaleRate'+scaleIndex+'__c',String.valueOf(roundOfRate.setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)));
                                        }
                                    }
                                    catch(Exception e) {
                                        if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                            impWrapperObj.stringMap.put('errors', Label.Invalid_ScaleRate_Error+scaleIndex);
                                        }
                                        else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_ScaleRate_Error+scaleIndex)) {
                                            impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_ScaleRate_Error+scaleIndex);
                                        }
                                    }
                                }                  
                                //<PP20130524> -- Ver 5.36 END
                                
                            }
                        }
                    }
                    else {
                        ERP_Procedure_Conditions__c proCondObj = new ERP_Procedure_Conditions__c();                
                        try {
                            if(request.pricingCondition.pricingCondition==null) {
                                request.pricingCondition.pricingCondition = new ERP_Pricing_Condition__c();
                            }
                            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                            priCondObj=[SELECT id,Calculation_Type_Code__c,Pricing_Condition_Code__c,Pricing_Condition_Description__c,
                                        Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class__c,Condition_Class_Code__c,
                                        Plus_Minus__c,Plus_Minus_Code__c,Scale_Base__c,Scale_Basis_Code__c,Scale_Type_Code__c,
                                        Pricing_Condition__c,Scale_Type__c,SAP_Cluster__c,Price_Types__c,
                                        SAP_Application_Id__c,SAP_Client_Id__c FROM  ERP_Pricing_Condition__c 
                                        WHERE Pricing_Condition_Code__c=:(string)impWrapperObj.sObjectRecord.get('Pricing_Condition_Code__c') 
                                        AND SAP_Cluster__c=:ogItemObj.ERP_Pricing_Procedure__r.SAP_Cluster__c 
                                        AND SAP_Client_Id__c=:ogItemObj.ERP_Pricing_Procedure__r.SAP_Client_Id__c 
                                        AND SAP_Application_Id__c=:ogItemObj.ERP_Pricing_Procedure__r.SAP_Application_Id__c limit 1];
                            
                            
                            
                            proCondObj = [select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__r.Calculation_Type__c from ERP_Procedure_Conditions__c 
                                          WHERE Sales_Pricing_Procedure__c=:ogItemObj.ERP_Pricing_Procedure__c AND 
                                          Pricing_Condition__r.Pricing_Condition_Code__c=:priCondObj.Pricing_Condition_Code__c limit 1];
                            if(proCondObj != null && proCondObj.Sales_Pricing_Procedure_Condition_Config__c !=null && proCondObj.Sales_Pricing_Procedure_Condition_Config__c.contains('Enable Scale')) {
                                enableScale = 'true';
                            }
                            request.pricingCondition.pricingCondition=priCondObj;
                            
                            request.pricingCondition.pricingCondition.Pricing_Condition_Code__c = priCondObj.Pricing_Condition_Code__c;
                            request.pricingCondition.pricingCondition.Pricing_Condition__c = priCondObj.Pricing_Condition__c;
                        }
                        catch(Exception e) {
                            system.debug('checkingexception'+e);
                            throw new PAException(Label.Pricing_Condition_Code_Error+' "'+(string)impWrapperObj.sObjectRecord.get('Pricing_Condition_Code__c')+'" '+Label.not_matching_Error,ApexPages.severity.Error);
                        }
                        try {
                            //Vinoth-Production Issue
                            system.debug('*** keyCombObj.Key_Combination_Code__c ** '+keyCombObj.Key_Combination_Code__c);
                            keyCombObj=[SELECT Key_Combination_Code__c,Key_Combination__c,Key_Combination_Tech__c,Customer_Specific__c FROM  ERP_Key_Combination__c
                                        WHERE Key_Combination_Code__c=:(string)impWrapperObj.sObjectRecord.get('Key_Combination_Code__c')
                                        AND SAP_Cluster__c=:ogItemObj.ERP_Pricing_Procedure__r.SAP_Cluster__c 
                                        AND SAP_Client_Id__c=:ogItemObj.ERP_Pricing_Procedure__r.SAP_Client_Id__c 
                                        AND SAP_Application_Id__c=:ogItemObj.ERP_Pricing_Procedure__r.SAP_Application_Id__c limit 1];
                            //<PP20140522>
                            /*ERP_Access_Sequence__c accessSeqObj = [SELECT Id,isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c,
Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c,
Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c=:priCondObj.id AND Sales_Pricing_Procedure__c=:ogItemObj.ERP_Pricing_Procedure__c AND Pricing_Key_Combination__r.Key_Combination_Code__c=:keyCombObj.Key_Combination_Code__c];*/
                            ERP_Access_Sequence__c accessSeqObj = ((List<ERP_Access_Sequence__c>)PAQueryUtil.query('PARequestItem','accessSeqObj',' Pricing_Condition__c=\''+priCondObj.id+'\' AND Sales_Pricing_Procedure__c=\''+ogItemObj.ERP_Pricing_Procedure__c+'\' AND Pricing_Key_Combination__r.Key_Combination_Code__c=\''+keyCombObj.Key_Combination_Code__c+'\''))[0];                                    
                            //<VR20130827> RollOut2 Issue fix
                            request.keyCombination.KeyCombinationName = accessSeqObj.Key_Combination__c;
                            request.keyCombination.erpKeyCombination = new ERP_Key_Combination__c();
                            request.keyCombination.erpKeyCombination.Key_Combination_Code__c = keyCombObj.Key_Combination_Code__c;
                            request.keyCombination.erpKeyCombination.Key_Combination__c = accessSeqObj.Key_Combination__c;
                            request.keyCombination.accSequence = accessSeqObj;
                        }
                        catch(Exception e) {
                            system.debug('*** keyCombObj.Key_Combination_Code__c - exception E** '+e);
                            throw new PAException(Label.Key_Combination_Code_Error+' "'+(string)impWrapperObj.sObjectRecord.get('Key_Combination_Code__c')+'" '+Label.not_matching_Error,ApexPages.severity.Error);
                        }
                        if(keyCombObj.Key_Combination__c!=null && keyCombObj.Key_Combination__c.containsIgnoreCase('Project'))  {
                            throw new PAException(Label.Import_is_not_allowed_for_Project_Price_Error,ApexPages.severity.Error);
                        }
                        String replacedKCTech;
                        if(keyCombObj.Key_Combination_Tech__c.contains('Ship-To'))
                        {
                            replacedKCTech = keyCombObj.Key_Combination_Tech__c.replace('Ship-To','Ship To');
                        }
                        else
                            replacedKCTech = keyCombObj.Key_Combination_Tech__c;
                        List<string> descHeaderList = replacedKCTech.split('-')[1].toLowerCase().split('/');
                        for(string descr : descHeaderList) {
                            if(descr == 'Ship To Country')
                                descr = descr.replace('Ship To','Ship-To');
                            descriptions.add(descr);
                        }
                        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                        
                        //<PP20130524> -- Ver 5.36 START
                        if((!string.isBlank((string)impWrapperObj.sObjectRecord.get('Rate__c'))) && impWrapperObj.sObjectRecord.get('Unit__c')!=null) 
                        {
                            try {
                                //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                
                                Decimal roundOfRate = Decimal.valueOf((String)impWrapperObj.sObjectRecord.get('Rate__c'));
                                system.debug('roundOfRate3&&&'+roundOfRate);
                                if(!String.isBlank(priCondObj.Plus_Minus_Code__c))
                                {
                                    roundOfRate = roundOfRate.abs();
                                    if(priCondObj.Plus_Minus_Code__c == 'X')
                                    {
                                        roundOfRate = roundOfRate * (-1);
                                    }                                                              
                                }
                                else{
                                    system.debug('roundOfRate456&&&'+roundOfRate);
                                    If(((String)impWrapperObj.sObjectRecord.get('Rate__c')).contains('-')){                                 
                                        roundOfRate = roundOfRate.abs();
                                        roundOfRate = roundOfRate * (-1);
                                        system.debug('roundOfRate555&&&'+roundOfRate);
                                    }
                                } 
                                if(priCondObj.Calculation_Type_Code__c=='A') {
                                    impWrapperObj.sObjectRecord.put('Rate__c',String.valueOf(roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN)));
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Rate__c',String.valueOf(roundOfRate.setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)));
                                }
                            }
                            catch(Exception e) {
                                if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                    impWrapperObj.stringMap.put('errors', Label.Invalid_Rate_Error);
                                }
                                else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_Rate_Error)) {
                                    impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_Rate_Error);
                                }
                            }
                        }                  
                        //<PP20130524> -- Ver 5.36 END
                        
                        //Rounding off the Rate Value
                        
                        
                        //Rounding off the Scale Rate Values
                        if(enableScale=='true') {                   
                            for(Integer scaleIndex=1;scaleIndex<=10;scaleIndex++) {
                                //<PP20130524> -- Ver 5.36 START
                                if((!string.isBlank((string)impWrapperObj.sObjectRecord.get('ScaleRate'+scaleIndex+'__c'))) && impWrapperObj.sObjectRecord.get('Unit__c')!=null) 
                                {
                                    try {
                                        //roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                                        Decimal roundOfRate = Decimal.valueOf((String)impWrapperObj.sObjectRecord.get('ScaleRate'+scaleIndex+'__c'));
                                        system.debug('roundOfRate4&&&'+roundOfRate); 
                                        if(!String.isBlank(priCondObj.Plus_Minus_Code__c))
                                        {
                                            roundOfRate = roundOfRate.abs();
                                            if(priCondObj.Plus_Minus_Code__c == 'X')
                                            {
                                                roundOfRate = roundOfRate * (-1);
                                            }
                                            
                                        }
                                        else{
                                            system.debug('roundOfRate4&&&'+roundOfRate);
                                            If(((String)impWrapperObj.sObjectRecord.get('Rate__c')).contains('-')){                                        
                                                roundOfRate = roundOfRate.abs();
                                                roundOfRate = roundOfRate * (-1);
                                            } 
                                        }
                                        if(priCondObj.Calculation_Type_Code__c=='A') {
                                            impWrapperObj.sObjectRecord.put('ScaleRate'+scaleIndex+'__c',String.valueOf(roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN)));
                                        }
                                        else {
                                            impWrapperObj.sObjectRecord.put('ScaleRate'+scaleIndex+'__c',String.valueOf(roundOfRate.setScale(PAUtil.decimalPlacesMap.get((string)impWrapperObj.sObjectRecord.get('Unit__c')),System.RoundingMode.HALF_EVEN)));
                                        }
                                    }
                                    catch(Exception e) {
                                        if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                            impWrapperObj.stringMap.put('errors', Label.Invalid_ScaleRate_Error+scaleIndex);
                                        }
                                        else if(!impWrapperObj.stringMap.get('errors').contains(Label.Invalid_ScaleRate_Error+scaleIndex)) {
                                            impWrapperObj.stringMap.put('errors', impWrapperObj.stringMap.get('errors')+', '+Label.Invalid_ScaleRate_Error+scaleIndex);
                                        }
                                    }
                                }                  
                                //<PP20130524> -- Ver 5.36 END
                                
                            }
                        }
                        
                        for(Integer columns=0;columns<header.size();columns++ ) {
                            if(!(Pattern.matches('ph[2-9] code',header[columns]) || header[columns]=='sid' || descriptions.contains(header[columns]) || String.ISBLANK(header[columns]))) {
                                if(!((header[columns].contains('scale quantity/ scale value') && header[columns]!='scale quantity/ scale value1') || (header[columns].contains('scalerate') && header[columns]!='scalerate1') )) {
                                    if(((header[columns].contains('scale quantity/ scale value') || header[columns].contains('scalerate') || header[columns]=='scale uom/scale unit') && (((boolean)impWrapperObj.sObjectRecord.get('Scaled_Price_Flag__c')) && header[columns]!='rate')) || (!(header[columns].contains('scale quantity/ scale value') || header[columns].contains('scalerate') || header[columns]=='scale uom/scale unit'))) {
                                        if(String.isBlank(inputvalues[columns].trim().unescapeCsv().removeStart('\''))) {
                                            if(string.isBlank(impWrapperObj.stringMap.get('errors'))) {
                                                impWrapperObj.stringMap.put('errors', Label.Mandatory_import+' '+headerList[columns]);
                                            }
                                            else {
                                                impWrapperObj.stringMap.put('errors',impWrapperObj.stringMap.get('errors')+', '+Label.Mandatory_import+' '+headerList[columns]);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        string mustColumns = columnGenerate(request.keyCombination.erpKeyCombination.Key_Combination_Code__c);
                        System.debug(logginglevel.error,'mustColumns:'+mustColumns);
                        system.debug(logginglevel.error,'headerList:'+headerList);
                        columnCompare = mustColumns.split(',');
                        string missingColumns=null;
                        for(Integer sysGenColumn=0;sysGenColumn<columnCompare.size();sysGenColumn++) {
                            boolean checkFlag = false;
                            for(Integer csvColumn=0;csvColumn<headerList.size();csvColumn++) {
                                System.debug(logginglevel.error,'columnCompare[sysGenColumn]:'+columnCompare[sysGenColumn]);
                                System.debug(logginglevel.error,'headerList[csvColumn]:'+headerList[csvColumn]);
                                if(columnCompare[sysGenColumn].equalsIgnoreCase(headerList[csvColumn])) {
                                    checkFlag = true;
                                    System.debug('Checkedflag%%%'+checkFlag);
                                }
                            }
                            if(!checkFlag) {
                                System.debug(Logginglevel.Error,'Match not Found for '+columnCompare[sysGenColumn]);
                                if(missingColumns==null) {
                                    missingColumns=columnCompare[sysGenColumn];
                                }
                                else {
                                    missingColumns+=', '+columnCompare[sysGenColumn];
                                }
                            }
                        }
                        system.debug(Logginglevel.Error,'after processing, final columns are '+missingColumns);
                        if(missingColumns!=null) {
                            throw new PAException(Label.Column_headings_Error+' '+missingColumns+' '+Label.not_found_Error,ApexPages.severity.Error);
                        }
                        impWrapperList.add(impWrapperObj);
                    }
                }
            }        
            system.debug('impWrapperList@@@'+impWrapperList);
            if(fileRows.size()>0) {
                fileRows[0] = fileRows[0].toLowerCase();
                if(!(fileRows[0].contains('pricing condition code') && fileRows[0].contains('key combination code'))) {
                    throw new PAException(Label.Column_headings_not_found_Error,ApexPages.severity.Error);
                }
            }
            if(impWrapperList.size()==0){
                //Throwing error when there is no records to import
                throw new PAException(Label.No_Records_to_import_Error,ApexPages.severity.Error);
            }
            
        }
        if(popUpFlag=='ReImport') {
            List<Pricing_Request_Item__c> requestItemList = [SELECT F_Product_Hierarchy_Code__c,id,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c=:request.pricingRequest.id];
            delete requestItemList;
            request.pricingRequest.Request_Approval_Status__c = 'Draft';
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            //<GT20150122>Added for massive import
            
            if(!request.massiveImport)
            {
                if(priCondObj.Price_Types__c!=null && (priCondObj.Price_Types__c.contains('Floor') || priCondObj.Price_Types__c.contains('Reference'))) {
                    request.pricingRequest.Pricing_Request_Type__c = 'Floor';
                }
                else//Added to route the import request type
                {
                    request.pricingRequest.Pricing_Request_Type__c = 'Permanent';
                }
            }
            update request.pricingRequest;
        }
        else {
            request.pricingRequest.BU__c = request.selectedBU;
            System.debug('****selected bu'+request.pricingRequest.BU__c);
            if(!string.isBlank(request.requestServiceState.ogItems.selectedUser)) {
                request.pricingRequest.OwnerId = (Id)request.requestServiceState.ogItems.selectedUser;
            }
            request.pricingRequest.On_Behalf_Of__c = request.requestServiceState.ogItems.selectedUser;
            request.pricingRequest.Request_Approval_Status__c = 'Draft';
            request.pricingRequest.On_Behalf_Of__c = request.requestServiceState.ogItems.selectedUser;
            request.pricingRequest.SAP_Cluster__c = ogItemObj.ERP_Pricing_Procedure__r.SAP_Cluster__c;
            request.pricingRequest.SAP_Application_Id__c = ogItemObj.ERP_Pricing_Procedure__r.SAP_Application_Id__c;
            request.pricingRequest.SAP_Client_Id__c = ogItemObj.ERP_Pricing_Procedure__r.SAP_Client_Id__c;
            //<GT20140903>
            request.pricingRequest.Customer_Specific__c =  keyCombObj.Customer_Specific__c;
            //<GT20140903>
            
            //<PP20131231> START
            request.pricingRequest.Display_Standardized_Rate__c = ogItemObj.Display_Standardized_Rate__c;
            request.pricingRequest.Standardized_Currency__c = ogItemObj.Standardized_Currency__c;
            request.pricingRequest.Standardized_UoM__c = ogItemObj.Standardized_UoM__c;
            if(ogItemObj.Approval_Escalation_Pricing_Task__c != null )
                request.pricingRequest.Approval_Escalation_Pricing_Task__c = ogItemObj.Approval_Escalation_Pricing_Task__c;
            if(ogItemObj.Approval_Escalation_Price_Requests__c != null )
                request.pricingRequest.Approval_Escalation_Price_Requests__c = ogItemObj.Approval_Escalation_Price_Requests__c;
            //<PP20131231> END
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            if(priCondObj.Price_Types__c!=null && (priCondObj.Price_Types__c.contains('Floor') || priCondObj.Price_Types__c.contains('Reference'))) {
                request.pricingRequest.Pricing_Request_Type__c = 'Floor';
            }
            else//Added to route the import request type
            {
                request.pricingRequest.Pricing_Request_Type__c = 'Permanent';
            }
            
            //added for massive import
            if(request.massiveImport)
                request.pricingRequest.Request_Type__c = 'Mass Import';
            upsert request.pricingRequest;
            request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','priceRequestlist',' id = \''+request.pricingRequest.id+'\''))[0];
            system.debug('request Id:'+request.pricingRequest.id+' '+request.pricingRequest.name);
            request.requestId = request.pricingRequest.id;
        }
        
        //<GT20150122>Added for massive import
        if(!request.massiveImport)
        {
            List<Pricing_Request_Item__c> priRequestItemList = new List<Pricing_Request_Item__c>();
            for(PAWrapper impWrap : impWrapperList) {
                if(impWrap.sObjectRecord.get('Scaled_Price_Flag__c')!=null && (boolean)impWrap.sObjectRecord.get('Scaled_Price_Flag__c')) {
                    Map<String,String> mapofScaleQuantityAndRates=new Map<String,String>();
                    //Fix for IS ID-00046797 - <PP20140926>
                    List<Decimal> sortQuantityList= new List<Decimal>();
                    for(Integer i=1; i<=10;i++) {
                        mapofScaleQuantityAndRates.put(string.valueOf(impWrap.sObjectRecord.get('Scale_Quantity_Scale_Value'+i+'__c')),string.valueOf(impWrap.sObjectRecord.get('ScaleRate'+i+'__c')));
                        if(impWrap.sObjectRecord.get('Scale_Quantity_Scale_Value'+i+'__c') != null)
                            sortQuantityList.add(Decimal.valueOf((String)impWrap.sObjectRecord.get('Scale_Quantity_Scale_Value'+i+'__c')));
                    }               
                    sortQuantityList.sort();
                    system.debug('Issue Check: '+sortQuantityList+' '+mapofScaleQuantityAndRates);
                    String bestRate = '';
                    if(sortQuantityList.size()!=0)
                        bestRate=mapofScaleQuantityAndRates.get(String.valueOf(sortQuantityList[sortQuantityList.size()-1]));
                    
                    impWrap.sObjectRecord.put('Rate__c',bestRate);
                    //impWrap.sObjectRecord.put('Rate__c',string.valueOf(impWrap.sObjectRecord.get('ScaleRate1__c')));
                }
                if(priCondObj.Calculation_Type_Code__c=='A'){
                    impWrap.sObjectRecord.put('Per__c',null);
                    impWrap.sObjectRecord.put('UoM__c',null);
                }
                
                //Production Issue
                if(keyCombObj.Customer_Specific__c) {
                    impWrap.sObjectRecord.put('Customer_Specific__c',true);
                }
                //<VR20130829> RollOut2 Issue fix
                impWrap.sObjectRecord.put('Below_Current_Flag__c',true);
                impWrap.sObjectRecord.put('Pricing_Request__c',request.pricingRequest.id);
                impWrap.sObjectRecord.put('ERP_Pricing_Procedure__c',ogItemObj.ERP_Pricing_Procedure__c);
                impWrap.sObjectRecord.put('Pricing_Condition__c',request.pricingCondition.pricingCondition.Pricing_Condition__c);
                impWrap.sObjectRecord.put('Key_Combination__c',keyCombObj.Key_Combination__c);
                impWrap.sObjectRecord.put('Key_Combination_SFDC__c',request.keyCombination.erpKeyCombination.Key_Combination__c);
                impWrap.sObjectRecord.put('New_Rate__c',(string)impWrap.sObjectRecord.get('Rate__c'));
                impWrap.sObjectRecord.put('New_Unit__c',(string)impWrap.sObjectRecord.get('Unit__c'));
                impWrap.sObjectRecord.put('New_UoM__c',(string)impWrap.sObjectRecord.get('UoM__c'));
                impWrap.sObjectRecord.put('New_Per__c',(Decimal)impWrap.sObjectRecord.get('Per__c'));
                impWrap.sObjectRecord.put('New_Valid_From__c',(Date)impWrap.sObjectRecord.get('Valid_From__c'));
                impWrap.sObjectRecord.put('New_Valid_To__c',(Date)impWrap.sObjectRecord.get('Valid_To__c'));
                
                impWrap.sObjectRecord.put('Sales_Org__c',request.pricingRequest.Sales_Org__c);
                impWrap.sObjectRecord.put('Dist_Channel__c',request.pricingRequest.Dist_Channel__c);
                impWrap.sObjectRecord.put('Division__c',request.pricingRequest.Division__c);
                impWrap.sObjectRecord.put('Approval_Status__c','Draft');
                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                if(priCondObj.Price_Types__c!=null && (priCondObj.Price_Types__c.contains('Floor') && !priCondObj.Price_Types__c.contains('Net Floor'))){
                    impWrap.sObjectRecord.put('Pricing_Request_Type__c','Floor');
                }
                else if(priCondObj.Price_Types__c!=null && (priCondObj.Price_Types__c.contains('Reference') && !priCondObj.Price_Types__c.contains('Net Reference'))){
                    impWrap.sObjectRecord.put('Pricing_Request_Type__c','Reference');
                }
                else if(priCondObj.Price_Types__c!=null && priCondObj.Price_Types__c.contains('Net Floor')){
                    impWrap.sObjectRecord.put('Pricing_Request_Type__c','Net Floor');
                }
                else if(priCondObj.Price_Types__c!=null && priCondObj.Price_Types__c.contains('Net Reference')){
                    impWrap.sObjectRecord.put('Pricing_Request_Type__c','Net Reference');
                }
                else {
                    impWrap.sObjectRecord.put('Pricing_Request_Type__c','Import');
                }
                impWrap.sObjectRecord.put('SAP_Cluster__c',ogItemObj.ERP_Pricing_Procedure__r.SAP_Cluster__c);
                impWrap.sObjectRecord.put('SAP_Application_Id__c',ogItemObj.ERP_Pricing_Procedure__r.SAP_Application_Id__c);
                impWrap.sObjectRecord.put('SAP_Client_Id__c',ogItemObj.ERP_Pricing_Procedure__r.SAP_Client_Id__c);
                impWrap.sObjectRecord.put('Calculation_Type__c',priCondObj.Calculation_Type__c);
                impWrap.sObjectRecord.put('Calculation_Type_Code__c',priCondObj.Calculation_Type_Code__c);
                impWrap.sObjectRecord.put('Check_Scale__c',priCondObj.Check_Scale__c);
                impWrap.sObjectRecord.put('Check_Scale_Code__c',priCondObj.Check_Scale_Code__c);
                impWrap.sObjectRecord.put('Condition_Class__c',priCondObj.Condition_Class__c);
                impWrap.sObjectRecord.put('Condition_Class_Code__c',priCondObj.Condition_Class_Code__c);
                impWrap.sObjectRecord.put('Plus_Minus__c',priCondObj.Plus_Minus__c);
                impWrap.sObjectRecord.put('Plus_Minus_Code__c',priCondObj.Plus_Minus_Code__c);
                impWrap.sObjectRecord.put('Scale_Basis__c',priCondObj.Scale_Base__c);
                impWrap.sObjectRecord.put('Scale_Basis_Code__c',priCondObj.Scale_Basis_Code__c);
                //<PP20140522>
                if(request.keyCombination.accSequence != null)
                {
                    if(request.keyCombination.accSequence.isNPCApplicable__c != null && request.keyCombination.accSequence.isNPCApplicable__c)
                    {
                        impWrap.sObjectRecord.put('isNPCApplicable__c',true);
                    }
                    if(!String.isBlank(request.keyCombination.accSequence.Floor_Key_Combination__c) || !String.isBlank(request.keyCombination.accSequence.Floor_Pricing_Condition__c)
                       || !String.isBlank(request.keyCombination.accSequence.Reference_Key_Combination__c) || !String.isBlank(request.keyCombination.accSequence.Reference_Pricing_Condition__c))
                    {
                        impWrap.sObjectRecord.put('isFloorApplicable__c',true);
                    }
                    if(ogItemObj.isPaymentTermsApplicable__c && request.keyCombination.accSequence.isPaymentTermsApplicable__c)
                    {
                        impWrap.sObjectRecord.put('isPaymentTermsApplicable__c',true);
                        impWrap.sObjectRecord.put('New_Customer_Price_Payment_Terms__c',(String)impWrap.sObjectRecord.get('Customer_Price_Payment_Terms__c'));
                        impWrap.sObjectRecord.put('New_Payment_Terms_Fixed_Date__c',(Date)impWrap.sObjectRecord.get('Payment_Terms_Fixed_Date__c'));
                    }
                    if(ogItemObj.isVolumeApplicable__c && request.keyCombination.accSequence.isVolumeApplicable__c)
                    {
                        impWrap.sObjectRecord.put('isVolumeApplicable__c',true);
                        impWrap.sObjectRecord.put('New_Volume__c',(Decimal)impWrap.sObjectRecord.get('Volume__c'));
                        impWrap.sObjectRecord.put('New_Volume_UoM__c',(String)impWrap.sObjectRecord.get('Volume_UoM__c'));
                    }
                    
                }
                
                if(string.isBlank(priCondObj.Scale_Type__c)) {
                    if(impWrap.sObjectRecord.get('Scale_Type__c')!=null && (((string)impWrap.sObjectRecord.get('Scale_Type__c')).containsIgnoreCase('Base-Scale') || ((string)impWrap.sObjectRecord.get('Scale_Type__c')).containsIgnoreCase('Base Scale'))) {
                        impWrap.sObjectRecord.put('Scale_Type__c','Base-Scale');
                        impWrap.sObjectRecord.put('Scale_Type_Code__c','A');
                    }
                    else if(impWrap.sObjectRecord.get('Scale_Type__c')!=null && ((string)impWrap.sObjectRecord.get('Scale_Type__c')).containsIgnoreCase('To Scale')) {
                        impWrap.sObjectRecord.put('Scale_Type__c','To Scale');
                        impWrap.sObjectRecord.put('Scale_Type_Code__c','B');
                    }
                    else if(impWrap.sObjectRecord.get('Scale_Type__c')!=null) {
                        impWrap.stringMap.put('errors','Invalid Scale Type');
                    }
                }
                else {
                    impWrap.sObjectRecord.put('Scale_Type__c',priCondObj.Scale_Type__c);
                    impWrap.sObjectRecord.put('Scale_Type_Code__c',priCondObj.Scale_Type_Code__c);
                }
                priRequestItemList.add((Pricing_Request_Item__c)impWrap.sObjectRecord); 
            } 
            //<PP20130715> -- <NS20130821> Added Landing_Cost__c field to query select clause
            /*request.pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Zip_PostalCode__c,  Terms_Of_Payment__c,Incoterms_Code__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,
State_Province__c,Spot_Type__c, Sold_To__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,
Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById,
LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, CreatedDate,
CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
Sent_To_Backup_Approver__c, Approver1_Date__c,Asynchronous_Call_Out_Indicator__c, Project_Header_Approval_Flag__c,NPC_Status__c,Landing_Cost__c,
Standardized_Currency__c,Standardized_UoM__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c where id = :request.pricingRequest.id];*/
            request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','priceRequestlist',' id = \''+request.pricingRequest.id+'\''))[0];                        
            
            Database.SaveResult[] sr = Database.insert(priRequestItemList,false);
            for(Integer i=0;i<sr.size();i++) {
                if(!sr[i].isSuccess()) {
                    if(string.isBlank(impWrapperList[i].stringMap.get('errors'))) {
                        impWrapperList[i].stringMap.put('errors',sr[i].getErrors()[0].getMessage());
                    }
                    else {
                        impWrapperList[i].stringMap.put('errors',impWrapperList[i].stringMap.get('errors')+', '+sr[i].getErrors()[0].getMessage());
                    }
                }
            }
            
            List<PAWrapper> successList = new List<PAWrapper>();
            List<PAWrapper> rejectedRecList = new List<PAWrapper>();
            List<Pricing_Request_Item__c> deleteList = new List<Pricing_Request_Item__c>();
            for(PAWrapper impWrapper : impWrapperList) {
                if(string.isBlank(impWrapper.stringMap.get('errors'))) {
                    successList.add(impWrapper);
                }
                else {
                    if(!string.isBlank(((Pricing_Request_Item__c)impWrapper.sObjectRecord).id)) {
                        deleteList.add((Pricing_Request_Item__c)impWrapper.sObjectRecord);
                    }
                    rejectedRecList.add(impWrapper);
                    ///rejectedRecordsList.add(impWrapper);
                }
            }
            rejectedRecordsList = new List<PAWrapper>();
            if(rejectedRecList.size()!=0) {
                rejectedRecordsList.addAll(rejectedRecList);
                rejectedRecordsList.addAll(successList);
            }
            delete deleteList;
            
            if(successList.size()==0) {
                popUpFlag='validate';
            }
            else {
                popUpFlag='details';
            }
            recordCount = rejectedRecList.size();  
            //recordCount = limits.getScriptStatements();     
            relatedWrappersList= new   List<PARelatedList>();
            relatedWrappersList=getListWrappers();
            //System.debug('PC Code at the end of Upload record method'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
            return;
        }
    }
    
    
    /*
* Author     : Vinoth
* Method Name : validate
* Parameters  : None
* Return type : void
* Description : used to do Business validations on the Records
*/
    public void validateImport(){
        final String PERCENT='%';
        Set<id> spProIdSet=new Set<id>();
        List<ERP_Procedure_Conditions__c> proCondList = new List<ERP_Procedure_Conditions__c>();
        Map<string,ERP_Procedure_Conditions__c> priCondMap = new Map<string,ERP_Procedure_Conditions__c>();
        List<Organizational_Group_Item__c> orgGroupItemList = new List<Organizational_Group_Item__c>();
        
        string buId;
        string salesAreaId;
        //System.debug('PC Code at the start of Validate Import method'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
        try {
            //buId = [select id FROM OrgGroup__c WHERE Business__c=:request.selectedBU].id;
            //salesAreaId = [select id FROM OrgGroup__c WHERE ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c AND ERP_Division_Code__c=:request.pricingRequest.Division_Code__c limit 1].id;
            //<VR20140109> DTT Rollout Issue - Added Include Customer Currency in select
            /*orgGroupItemList = [select id,ERP_Currency__c,ERP_UoM__c,Retroactive_Limit__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,OrgGroup__c,OrgGroup__r.ERP_Sales_Org__c,
OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division__c,Business__r.Business__c,ERP_Pricing_Procedure__c,
OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c, Include_Customer_Currency__c,
Enable_Variable_Config_Materials__c from Organizational_Group_Item__c where Business__c=:request.requestServiceState.ogItems.selectedBU 
AND OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c
AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c 
AND OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c limit 1];*/
            orgGroupItemList = (List<Organizational_Group_Item__c>)PAQueryUtil.query('PARequestItem','orgGroupItemList',' Business__c=\''+request.requestServiceState.ogItems.selectedBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c = \''+request.pricingRequest.Sales_Org_Code__c+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c = \''+request.pricingRequest.Dist_Channel_Code__c+'\' AND OrgGroup__r.ERP_Division_Code__c = \''+request.pricingRequest.Division_Code__c+'\' limit 1');                    
        }
        catch(Exception e) {
            
        }
        system.debug('request.pricingCondition.pricingCondition.Pricing_Condition_Code__c is '+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c);
        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
        proCondList = (List<ERP_Procedure_Conditions__c>)PAQueryUtil.query('PARequestItem','proCondList',' Sales_Pricing_Procedure__c =\''+orgGroupItemList[0].ERP_Pricing_Procedure__c+'\' AND Pricing_Condition__r.Pricing_Condition_Code__c=\''+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c+'\'');             
        boolean check=true;
        string error;
        if(proCondList.size()==0) {
            error = Label.Pricing_Condition_not_defined_in_Pricing_Procedure_Error;
            check=false;
        }
        //system.debug('pri cond error check'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c+' '+request.keyCombination.erpKeyCombination.Key_Combination_Code__c);
        //Checking whether the Key Combination is associated with the Pricing Condition
        set<string> descriptions = new set<string>();
        List<ERP_Access_Sequence__c> accSeqList=new List<ERP_Access_Sequence__c>();
        accSeqList=[SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.Key_Combination_Code__c,
                    Pricing_Key_Combination__r.Key_Combination_Tech__c,Pricing_Key_Combination__r.Key_Combination__c from
                    ERP_Access_Sequence__c WHERE
                    Pricing_Condition__r.Pricing_Condition_Code__c = :request.pricingCondition.pricingCondition.Pricing_Condition_Code__c
                    AND Pricing_Key_Combination__r.Key_Combination_Code__c=:request.keyCombination.erpKeyCombination.Key_Combination_Code__c
                    AND Pricing_Key_Combination__r.Status__c='Active' AND Sales_Pricing_Procedure__c =:orgGroupItemList[0].ERP_Pricing_Procedure__c];
        //System.debug('list size'+accSeqList.size());
        //System.debug('where clause'+request.pricingCondition.pricingCondition.Pricing_Condition_Code__c+request.keyCombination.erpKeyCombination.Key_Combination_Code__c);
        if(accSeqList.size()==0 && check) {
            //System.debug(accSeqList[0].Pricing_Condition__r.Pricing_Condition_Code__c+','+accSeqList[0].Pricing_Key_Combination__r.Key_Combination_Code__c+accSeqList[0].Pricing_Condition__r.Pricing_Condition_Code__c+accSeqList[0].Pricing_Key_Combination__r.Status__c);
            error = Label.Key_Combination_not_in_Pricing_Condition_Error;
            check=false;
        }
        else {
            String replacedKCTech;
            if(accSeqList[0].Pricing_Key_Combination__r.Key_Combination_Tech__c.contains('Ship-To'))
            {
                replacedKCTech = accSeqList[0].Pricing_Key_Combination__r.Key_Combination_Tech__c.replace('Ship-To','Ship To');
            }
            else
                replacedKCTech = accSeqList[0].Pricing_Key_Combination__r.Key_Combination_Tech__c;
            List<string> descHeaderList = replacedKCTech.split('-')[1].toLowerCase().split('/');
            for(string descr : descHeaderList) {
                if(descr == 'Ship To Country')
                    descr = descr.replace('Ship To','Ship-To');
                descriptions.add(descr);
            }
        }
        
        List<PAWrapper> importWrapperList = new List<PAWrapper>();
        
        string queryString = 'SELECT ';
        Map<String, Schema.SObjectField> objAPIFieldMap = Schema.getGlobalDescribe().get('Pricing_Request_Item__c').getDescribe().fields.getMap();
        Map<String, String> objAPIMap = new Map<String, String>();
        for(Schema.SObjectField f : objAPIFieldMap.Values()) {
            objAPIMap.put(f.getDescribe().getLabel().toLowerCase(),f.getDescribe().getName());
            queryString+=f.getDescribe().getName()+',';
        }
        queryString=queryString.substring(0, queryString.length()-1);
        queryString+= ' FROM Pricing_Request_Item__c Where Pricing_Request__c=\''+request.pricingRequest.id+'\'';
        List<Pricing_Request_Item__c> pricingReqItemsList = Database.query(queryString);
        //<PG20202707>
        Set<String> sDistributorCodeFromImportedFile = new  Set<String>();
        for(Pricing_Request_Item__c reqItemObj : pricingReqItemsList) {
            PAWrapper paWrapObj = new PAWrapper();
            paWrapObj.sobjectRecord = reqItemObj;
            importWrapperList.add(paWrapObj);
            sDistributorCodeFromImportedFile.add(reqItemObj.Distributor_Code__c);
        }         
        Map<string,string> rejectReasonsMap = new Map<string,string>();
        if(!check) {
            List<Pricing_Request_Item__c> priRequestItemList = new List<Pricing_Request_Item__c>();
            for(PAWrapper impWrapObj : importWrapperList) {
                rejectReasonsMap.put((string)impWrapObj.sObjectRecord.get('id'),error);
            }
        }else {
            string keyCombinationCodeDesc = accSeqList[0].Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+accSeqList[0].Pricing_Key_Combination__r.Key_Combination__c;
            List<string> quantityList = new List<string>();
            for(Integer i=1; i<=10;i++) {
                quantityList.add('ScaleRate'+i+'__c');
            }
            
            Set<string> cusCodeSet = new Set<string>();
            Set<string> shipToSet = new Set<string>();
            Set<String> payercodesSet = new Set<String>(); //<SS20221104> New set for Payer values
            Set<string> matCodeSet = new Set<string>();
            Set<string> priceRefPartnerCodeSet = new Set<string>();
            Set<string> endUserCodeSet = new Set<string>();
            //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy
            Set<string> customerHierarchyCodeSet = new Set<string>();
            Map<string,Sobject> uomCheckMap = new Map<string,Sobject>();
            Map<string,List<Sobject>> pckcMap = new Map<string,List<Sobject>>();   //Used to check overlapping Records
            
            Integer phCheck = 0;
            Map<string,string> phCheckMap = new Map<string,string>();
            if(keyCombinationCodeDesc.subStringAfter('-').contains('PH1')) {
                phCheck = 1;
                for(Integer i=2;i<10;i++) {
                    if(keyCombinationCodeDesc.subStringAfter('-').contains('PH'+i)) {
                        phCheck = i;
                    }
                }
            }
            
            List<string> sIdList = new List<string>();
            for(PAWrapper impWrap : importWrapperList) {
                if(phCheck>0) {
                    phCheckMap.put((string)impWrap.sObjectRecord.get('id'),(string)impWrap.sObjectRecord.get('PH1_Code__c')+(phCheck>=2 ? (impWrap.sObjectRecord.get('PH2_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH2_Code__c')) : '')+(phCheck>=3 ? (impWrap.sObjectRecord.get('PH3_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH3_Code__c')) : '')+(phCheck>=4 ? (impWrap.sObjectRecord.get('PH4_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH4_Code__c')) : '')+(phCheck>=5 ? (impWrap.sObjectRecord.get('PH5_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH5_Code__c')) : '')+(phCheck>=6 ? (impWrap.sObjectRecord.get('PH6_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH6_Code__c')) : '')+(phCheck>=7 ? (impWrap.sObjectRecord.get('PH7_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH7_Code__c')) : '')+(phCheck>=8 ? (impWrap.sObjectRecord.get('PH8_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH8_Code__c')) : '')+(phCheck>=9 ? (impWrap.sObjectRecord.get('PH9_Code__c')==null ? '__' : (string)impWrap.sObjectRecord.get('PH9_Code__c')) : ''));
                }
                if(!string.isBlank((string)impWrap.sObjectRecord.get('ERP_Sales_Prices_SAP__c'))) {
                    sIdList.add((string)impWrap.sObjectRecord.get('ERP_Sales_Prices_SAP__c'));
                }
                //Getting Customer code from the Imported Records
                if(!string.isBlank((string)impWrap.sObjectRecord.get('Sold_To_Code__c'))) {
                    cusCodeSet.add((string)impWrap.sObjectRecord.get('Sold_To_Code__c'));
                }
                //Getting Ship To code from the Imported Records
                if(!string.isBlank((string)impWrap.sObjectRecord.get('ShipTo_Code__c'))) {
                    shipToSet.add((string)impWrap.sObjectRecord.get('ShipTo_Code__c'));
                }
                //Getting Material code from the Imported Records
                if(!string.isBlank((string)impWrap.sObjectRecord.get('Material_Code__c'))) {
                    matCodeSet.add((string)impWrap.sObjectRecord.get('Material_Code__c'));
                    
                }
                //Getting the Price Ref. Partner code from the Imported Records
                if(keyCombinationCodeDesc!=null && keyCombinationCodeDesc.containsIgnoreCase('Price Ref. Partner') && (!string.isBlank((string)impWrap.sObjectRecord.get('Price_Ref_Partner_Code__c')))) {
                    priceRefPartnerCodeSet.add((string)impWrap.sObjectRecord.get('Price_Ref_Partner_Code__c'));
                }
                //Getting the End User code from the Imported Records
                if(keyCombinationCodeDesc!=null && keyCombinationCodeDesc.containsIgnoreCase('End User') && (!string.isBlank((string)impWrap.sObjectRecord.get('End_User_Code__c')))) {
                    endUserCodeSet.add((string)impWrap.sObjectRecord.get('End_User_Code__c'));
                }
                //Getting the Customer Hierarchy code from the Imported Records
                //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy
                if(keyCombinationCodeDesc!=null && keyCombinationCodeDesc.containsIgnoreCase('Customer Hierarchy') && (!string.isBlank((string)impWrap.sObjectRecord.get('Customer_Hierarchy_Code__c')))) {
                    priceRefPartnerCodeSet.add((string)impWrap.sObjectRecord.get('Customer_Hierarchy_Code__c'));
                }
                //<SS20221104> Getting the Payer code from the Imported Records
                if(keyCombinationCodeDesc!=null && keyCombinationCodeDesc.containsIgnoreCase('Payer') && (!string.isBlank((string)impWrap.sObjectRecord.get('Payer_Code__c')))) {
                    payercodesSet.add((string)impWrap.sObjectRecord.get('Payer_Code__c'));
                }
                //Populating PCKC Map
                List<Sobject> sObjList = new List<Sobject>();
                if(pckcMap.get((string)impWrap.sObjectRecord.get('PCKC__c'))==null) {
                    sObjList.add(impWrap.sObjectRecord);
                    pckcMap.put((string)impWrap.sObjectRecord.get('PCKC__c'),sObjList);
                }
                else {
                    sObjList = pckcMap.get((string)impWrap.sObjectRecord.get('PCKC__c'));
                    sObjList.add(impWrap.sObjectRecord);
                    pckcMap.put((string)impWrap.sObjectRecord.get('PCKC__c'),sObjList);
                }
            }
            
            //Getting PH codes for the selected Key Combination PH level
            Set<string> phCodeSet = new Set<string>();
            for(string phCode : phCheckMap.values()) {
                phCodeSet.add(phCode);
            }
            List<BU_PH__c> phList = [SELECT Business_Description__c,Product_Hierarchy__r.PH_Level__c,Product_Hierarchy__r.PH_Code__c FROM BU_PH__c WHERE OrgGroup__c=:request.requestServiceState.ogItems.selectedBU AND Product_Hierarchy__r.PH_Level__c<=:phCheck];        
            Set<string> concatPhCode= new Set<string>();
            Map<string,string> phMap = new Map<string,string>();
            for(BU_PH__c phObj : phList) {
                concatPhCode.add(phObj.Product_Hierarchy__r.PH_Code__c);
                phMap.put(phObj.Product_Hierarchy__r.PH_Code__c,phObj.Business_Description__c);
            }
            
            //Overlapping Records Check
            for(string pckc : pckcMap.keyset()) {
                List<Sobject> sObjList = pckcMap.get(pckc);
                if(sObjList.size()==1) {
                    continue;
                }
                sObjList = PAUtil.sortList(sObjList,'Valid_From__c','asc');
                Date validFrom = (Date)sObjList[0].get('Valid_From__c');
                Date validTo = (Date)sObjList[0].get('Valid_To__c');
                for(Integer i=0;i<sObjList.size();i++) {
                    if(sObjList.size()-1==i) {
                        break;
                    }
                    if((Date)sObjList[i+1].get('Valid_From__c')>=validFrom && (Date)sObjList[i+1].get('Valid_From__c')<=validTo) {
                        if(validTo<(Date)sObjList[i+1].get('Valid_To__c')) {
                            validTo = (Date)sObjList[i+1].get('Valid_To__c');
                        }
                        //rejectReasonsMap.put((string)sObjList[i].get('id'),'Overlapping Records Found');
                        rejectReasonsMap.put((string)sObjList[i+1].get('id'),Label.Overlapping_Request_item_in_the_same_request_Error);
                    }
                    else {
                        validFrom = (Date)sObjList[i+1].get('Valid_From__c');
                        validTo = (Date)sObjList[i+1].get('Valid_To__c');
                    }
                }
            }
            
            //Getting the UoM and Currency available for the Sales Area
            string uomInSA = orgGroupItemList[0].ERP_UoM__c==null ? ' ' : orgGroupItemList[0].ERP_UoM__c;
            string currencyInSA = orgGroupItemList[0].ERP_Currency__c==null ? ' ' : orgGroupItemList[0].ERP_Currency__c;
            
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            string ObjName=' ';
            if(request.pricingRequest.Pricing_Request_Type__c!=null && (request.pricingRequest.Pricing_Request_Type__c.contains('Floor') || request.pricingRequest.Pricing_Request_Type__c.contains('Reference'))) {
                ObjName='Sales_Prices__c';
            }
            else {
                ObjName='ERP_Sales_Prices_SAP__c';
            }
            
            //Getting Object field Map from the ERP Sales Price SAP Object
            Map<String, Schema.SObjectField> erpObjectFields = Schema.getGlobalDescribe().get(ObjName).getDescribe().fields.getMap();
            //Creating the query string to check Gap Record
            string query='SELECT ';
            Map<string,string> erpObjAPIMap = new Map<string,string>();
            for(Schema.SObjectField f:erpObjectFields.Values()) {
                erpObjAPIMap.put(f.getDescribe().getLabel().toLowerCase(),f.getDescribe().getName());
                query+=f.getDescribe().getName()+',';
            }
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            query+='Price_Holder__r.Valid_To__c FROM '+ObjName+' WHERE id in :sIdList';
            List<Sobject> salesPriceSAPList =Database.query(query);
            Map<id,Sobject> salesPriceSAPMap = new Map<id,Sobject>(Database.query(query));
            Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get('Pricing_Request_Item__c').getDescribe().fields.getMap();
            
            //Querying based on the Material code got from the Imported Records
            //<VR20130510> Ver 5.34 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
            //<SP20140428> - START
            List<Material__c> matList = new List<Material__c>();
            if(orgGroupItemList[0].Enable_Variable_Config_Materials__c)
            {
                matList = [SELECT id,Name,ERP_Material_General_Data__c,ERP_Base_UOM__c,ERP_Material_Code__c,Material_Description__c,Unit_of_Measure__c FROM Material__c WHERE ERP_Material_Code__c IN : matCodeSet AND (ERP_Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c) AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:orgGroupItemList[0].Enable_Variable_Config_Materials__c AND ERP_Deletion_Flag__c =false];
            }
            else
            {
                matList = [SELECT id,Name,ERP_Material_General_Data__c ,ERP_Base_UOM__c,ERP_Material_Code__c,Material_Description__c,Unit_of_Measure__c FROM Material__c WHERE ERP_Material_Code__c IN : matCodeSet AND (ERP_Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c) AND ERP_Deletion_Flag__c =false];
            }
            //<SP20140428> END
            //Added by George, to validate the UOM from material during import
            map<String,List<string>> DcodeUomMap = new map<String,List<string>>();
            List<Id>DcGenList = New List<Id>();
            set<ID>DcGenSet = new Set<ID>();
            for(Material__c matObj : matList) {
                uomCheckMap.put(matObj.ERP_Material_Code__c,(Sobject)matObj);
                DcGenSet.add(matObj.ERP_Material_General_Data__c);
            }
            if(DcGenSet.size()>0)
                DcGenList.addAll(DcGenSet);
            if(DcGenList.size()>0)
                for(ERP_Material_Conversion_Factor__c con :[select Alternative_UOM__c,Material__r.ERP_Material_Code__c from ERP_Material_Conversion_Factor__c where Material__C in:DcGenList ])
            {
                if(!DcodeUomMap.containsKey(con.Material__r.ERP_Material_Code__c))
                {
                    DcodeUomMap.put(con.Material__r.ERP_Material_Code__c,new List<String>{con.Alternative_UOM__c});
                }
                else
                {
                    List<String>uoms = DcodeUomMap.get(con.Material__r.ERP_Material_Code__c);
                    uoms.add(con.Alternative_UOM__c);
                    DcodeUomMap.put(con.Material__r.ERP_Material_Code__c,uoms);
                }
            }
            System.debug('DcodeUomMap:'+DcodeUomMap);
            //Querying based on the Sold To code got from the Imported Records
            Map<string,Sobject> cusCheckMap = new Map<string,Sobject>();
            //<VR20131218> DTT Rollout Issue - Added the deletion flag
            //<VR20140109> DTT Rollout Issue - Added Currency Code in select
            List<ERP_Customer__c> cusList = [SELECT id,Customer_code__c,Name,Currency_Code__c FROM ERP_Customer__c WHERE Customer_code__c IN : cusCodeSet AND (Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Division_Code__c= : request.pricingRequest.Division_Code__c) AND Deletion_Flag__c=false AND Customer_General_Data__r.Deletion_Flag__c=false];
            for(ERP_Customer__c cusObj : cusList) {
                cusCheckMap.put(cusObj.Customer_code__c,(Sobject)cusObj);
            }
            
            //Querying based on the Price Ref Partner code got from the Imported Records
            Map<string,Sobject> priceRefPartnerCheckMap = new Map<string,Sobject>();
            //<VR20131218> DTT Rollout Issue - Added the deletion flag
            List<ERP_Customer__c> priceRefPartnerList = [SELECT id,Customer_code__c,Name FROM ERP_Customer__c WHERE Customer_code__c IN : priceRefPartnerCodeSet AND (Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Division_Code__c= : request.pricingRequest.Division_Code__c) AND Deletion_Flag__c=false AND Customer_General_Data__r.Deletion_Flag__c=false];
            for(ERP_Customer__c priceRefPartnerObj : priceRefPartnerList) {
                priceRefPartnerCheckMap.put(priceRefPartnerObj.Customer_code__c,(Sobject)priceRefPartnerObj);
            }
            
            //Querying based on the Customer Hierarchy code got from the Imported Records
            //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy
            Map<string,Sobject> customerHierarchyCheckMap = new Map<string,Sobject>();
            //<VR20131218> DTT Rollout Issue - Added the deletion flag
            List<ERP_Customer__c> customerHierarchyList = [SELECT id,Customer_code__c,Name FROM ERP_Customer__c WHERE Customer_code__c IN : customerHierarchyCodeSet AND (Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Division_Code__c= : request.pricingRequest.Division_Code__c) AND Deletion_Flag__c=false AND Customer_General_Data__r.Deletion_Flag__c=false];
            for(ERP_Customer__c customerHierarchyObj : customerHierarchyList) {
                customerHierarchyCheckMap.put(customerHierarchyObj.Customer_code__c,(Sobject)customerHierarchyObj);
            }
            
            Set<string> soldToIds = new Set<string>();
            //<TJ20150105> Commented if condition and updated query
            if(!(/*string.isBlank(request.requestServiceState.ogItems.selectedUser) ||*/ string.isBlank(request.requestServiceState.ogItems.userName))) {
                List<ERP_Relationship__c> erpRelationshipList = [SELECT ERP_Customer__r.Customer_Code__c FROM ERP_Relationship__c WHERE User__r.Name=:request.requestServiceState.ogItems.userName AND Partner_Function_Code__c = 'ZU'];               
                for(ERP_Relationship__c erpRelationshipObj : erpRelationshipList) {
                    soldToIds.add(erpRelationshipObj.ERP_Customer__r.Customer_Code__c.trim());
                }
            }
            
            //Querying based on the Ship code got from the Imported Records         
            Map<string,Set<string>> shipToMap = new Map<string,Set<string>>();
            Map<string,string> shipToMapDesc = new Map<string,string>();
            Set<string> comPartnerCodeSet = new Set<string>();
            Map<string,string> comPartnerMapDesc = new Map<string,string>();
            Set<string> PartnerZFCodeSet = new Set<string>();
            Map<string,string> PartnerZFMapDesc = new Map<string,string>();
            Set<string> payerCodeSet = new Set<string>();
            Map<string,string> payerMapDesc = new Map<string,string>();
            Set <string> shipToCodeSet = new Set<string>();
            if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('Ship To')) {
                //<VR20131030> DTT Rollout Issue - Modified query to add partner function code in the where class instead of account group code
                System.debug(LoggingLevel.Error,'George:-cusCodeSet-'+cusCodeSet+'-request.pricingRequest.Sales_Org_Code__c:-'+request.pricingRequest.Sales_Org_Code__c+'-request.pricingRequest.Dist_Channel_Code__c:-'+request.pricingRequest.Dist_Channel_Code__c+'-request.pricingRequest.Division_Code__c'+request.pricingRequest.Division_Code__c);
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c IN :cusCodeSet AND /*Related_ERP_Customer__r.Account_Group_Code__c = 'Z002'*/Partner_Function_Code__c='WE' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    if(shipToMap.get(shipToObj.ERP_Customer__r.Customer_Code__c)==null){
                        Set <string> shipToCodesSet = new Set<string>();
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        shipToMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    else if(shipToObj.Related_ERP_Customer__c!=null){
                        Set <string> shipToCodesSet = shipToMap.get(shipToObj.ERP_Customer__r.Customer_Code__c);
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        shipToMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    shipToMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('Ship To')) {
                //<VR20131030> DTT Rollout Issue - Modified query to add partner function code in the where class instead of account group code
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c IN :shipToSet AND /*Related_ERP_Customer__r.Account_Group_Code__c = 'Z002'*/Partner_Function_Code__c='WE' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    shipToCodeSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                    shipToMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }       
            }
            //Querying based on the End User code got from the Imported Records
            Map<string,Set<string>> endUserMap = new Map<string,Set<string>>();
            Map<string,Set<string>> comPartnerMap = new Map<string,Set<string>>();
            Map<string,Set<string>> partnerZFMap = new Map<string,Set<string>>();
            Map<string,Set<string>> payerMap = new Map<string,Set<string>>();
            Map<string,string> endUserMapDesc = new Map<string,string>();
            if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('End User')) {
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c IN :cusCodeSet AND Partner_Function_Code__c='ZH' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    system.debug('***endcodecheck'+shipToObj.ERP_Customer__r.Customer_Code__c);
                    if(endUserMap.get(shipToObj.ERP_Customer__r.Customer_Code__c)==null){
                        Set <string> shipToCodesSet = new Set<string>();
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        endUserMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    else if(shipToObj.Related_ERP_Customer__c!=null){
                        Set <string> shipToCodesSet = endUserMap.get(shipToObj.ERP_Customer__r.Customer_Code__c);
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        endUserMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    endUserMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('End User')) {
                // Updated Query to populate End User on PRItem when PR is created through import functionality, by Madhurima Daggumati for IS ID-00065371 on 29 Feb 2016 START
                // <RB20211202> Updated the below query to populate End User name having partner function code ZQ when using Import Prices functionality
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c IN :endUserCodeSet AND (Partner_Function_Code__c='ZH' OR Partner_Function_Code__c='ZN' OR Partner_Function_Code__c='ZQ') AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                // Updated Query to populate End User on PRItem when PR is created through import functionality, by Madhurima Daggumati for IS ID-00065371 on 29 Feb 2016 END
                for(ERP_Relationship__c shipToObj : shipToList) {
                    endUserCodeSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                    endUserMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('ComPartner')) {
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c IN :cusCodeSet AND Partner_Function_Code__c='ZV' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    system.debug('***endcodecheck'+shipToObj.ERP_Customer__r.Customer_Code__c);
                    if(comPartnerMap.get(shipToObj.ERP_Customer__r.Customer_Code__c)==null){
                        Set <string> shipToCodesSet = new Set<string>();
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        comPartnerMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    else if(shipToObj.Related_ERP_Customer__c!=null){
                        Set <string> shipToCodesSet = comPartnerMap.get(shipToObj.ERP_Customer__r.Customer_Code__c);
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        comPartnerMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    comPartnerMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('ComPartner')) {
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c IN :shipToSet AND Partner_Function_Code__c='ZV' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    comPartnerCodeSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                    comPartnerMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('Partner ZF')) {
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c IN :cusCodeSet AND Partner_Function_Code__c='ZF' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    if(partnerZFMap.get(shipToObj.ERP_Customer__r.Customer_Code__c)==null){
                        Set <string> shipToCodesSet = new Set<string>();
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        partnerZFMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    else if(shipToObj.Related_ERP_Customer__c!=null){
                        Set <string> shipToCodesSet = endUserMap.get(shipToObj.ERP_Customer__r.Customer_Code__c);
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        partnerZFMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    PartnerZFMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('Partner ZF')) {
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c IN :shipToSet AND Partner_Function_Code__c='ZF' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    partnerZFCodeSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                    partnerZFMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('Payer')) {
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c IN :cusCodeSet AND Partner_Function_Code__c='RG' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)];
                for(ERP_Relationship__c shipToObj : shipToList) {
                    system.debug('***endcodecheck'+shipToObj.ERP_Customer__r.Customer_Code__c);
                    if(payerMap.get(shipToObj.ERP_Customer__r.Customer_Code__c)==null){
                        Set <string> shipToCodesSet = new Set<string>();
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        payerMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    else if(shipToObj.Related_ERP_Customer__c!=null){
                        Set <string> shipToCodesSet = payerMap.get(shipToObj.ERP_Customer__r.Customer_Code__c);
                        shipToCodesSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                        payerMap.put(shipToObj.ERP_Customer__r.Customer_Code__c,shipToCodesSet);
                    }
                    payerMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('Payer')) {                             
                List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c IN :payercodesSet AND Partner_Function_Code__c='RG' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : request.pricingRequest.Sales_Org_Code__c AND Related_ERP_Customer__r.Distribution_Channel_Code__c= : request.pricingRequest.Dist_Channel_Code__c AND Related_ERP_Customer__r.Division_Code__c= : request.pricingRequest.Division_Code__c)]; //<SS20221104> - Updated Shiptoset to Payercodesset to fetch Payer values in Customer codes
                for(ERP_Relationship__c shipToObj : shipToList) {
                    payerCodeSet.add(shipToObj.Related_ERP_Customer__r.Customer_Code__c);
                    payerMapDesc.put(shipToObj.Related_ERP_Customer__r.Customer_Code__c,shipToObj.Related_ERP_Customer__r.Name);
                }
            }
            //<RB20211115>
            string divisionCode = string.valueOf(request.pricingRequest.Division_Code__c);
            Integer retroActiveDays = (orgGroupItemList[0].Retroactive_Limit__c != null ? Integer.valueOf(orgGroupItemList[0].Retroactive_Limit__c) : 0);
            //<TJ20150313>
            ERP_Key_Combination__c kcCustSpec=[Select Customer_Specific__c from ERP_Key_Combination__c where id=:accSeqList[0].Pricing_Key_Combination__c];
            Integer latestValidTo=0,latestValidFrom=0;
            if(kcCustSpec.Customer_Specific__c==true)
            {
                latestValidTo = (orgGroupItemList[0].Latest_Valid_To_Offset_Cust_Spec__c !=null ? Integer.valueOf(orgGroupItemList[0].Latest_Valid_To_Offset_Cust_Spec__c) : 0);
                latestValidFrom = (orgGroupItemList[0].Max_Valid_From_Offset_Cust_Spec__c !=null ? Integer.valueOf(orgGroupItemList[0].Max_Valid_From_Offset_Cust_Spec__c) : 0);
            }
            else
            {
                latestValidTo = (orgGroupItemList[0].Latest_Valid_To_Offset_Non_Cust_Spec__c !=null ? Integer.valueOf(orgGroupItemList[0].Latest_Valid_To_Offset_Non_Cust_Spec__c) : 0);
                latestValidFrom = (orgGroupItemList[0].Latest_Valid_From_Offset_Non_Cust_Spec__c !=null ? Integer.valueOf(orgGroupItemList[0].Latest_Valid_From_Offset_Non_Cust_Spec__c) : 0);
            }
            string[] headerList = columnGenerate(keyCombinationCodeDesc).split(',');
            List<Org_Group_ERP_Key__c> orgGroupKeyList = [SELECT id,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Description__c,ERP_Cus_Mat_Compt_Key__r.Type__c,ERP_Cus_Mat_Compt_Key__r.Name__c  FROM Org_Group_ERP_Key__c WHERE Organizational_Group_Item__c=:orgGroupItemList[0].id AND ERP_Cus_Mat_Compt_Key__r.Status__c='Active'];
            Set<string> cpgConcat = new Set<string>();
            Set<string> mpgConcat = new Set<string>();
            //<BB20130726> --Ver 5.47 Added salesTypeConcat,incotermsConcat
            Set<string> incotermsConcat = new Set<string>();
            Set<string> priceListTypeConcat = new Set<string>();
            Set<string> salesOfficeConcat = new Set<string>();
            Set<string> salesDistrictConcat = new Set<string>();
            Set<string> countryConcat = new Set<string>();
            Set<string> paymentTermsConcat = new Set<string>();
            Set<string> campaignConcat = new Set<string>();
            Set<string> documentCurrencyConcat = new Set<string>();
            Set<string> stateConcat = new Set<string>();
            //<PG20202707>
            Set<string> distConcat = new Set<string>();
            Set<string> marketSegmentSet = new Set<string>();
            Set<string> endUseSet = new Set<string>();
            Set<string> mg1Set = new Set<String>();
            Set<String> mg5KeySet= new Set<String>();
            Map<string,string> cpgCodeMap = new Map<string,string>();
            Map<string,string> mpgCodeMap = new Map<string,string>();
            //<MS20140515> Added Variant and SalesOrderType
            Set<string> variantSet = new Set<string>();
            Set<string> salesOrderTypeSet = new Set<string>();
            Set<string> salesOrderItemSet = new Set<string>();//<SS20220826>
            Set<string> valuecenterSet = new Set<string>();//<SS20230501>
            Set<string> externalmatlgrpSet = new Set<string>();//<SS20230501>
            Set<string> materialgroup2Set = new Set<string>();//<SS20230501>
            Set<string> pricezoneSet = new Set<string>();//<SS20230501>
            Set<string> plantSet = new Set<string>();
            Set<string> shippingConditionSet = new Set<string>();
            Set<string> destinationCountrySet = new Set<string>();
            Set<string> commPtrSet = new Set<string>();
            Set<string> custMktSegmentSet = new Set<string>();
            Set<string> shipToCountrySet = new Set<string>();
            Map<string,string> variantCodeMap = new Map<string,string>();
            Map<string,string> salesOrderTypeCodeMap = new Map<string,string>();
            Map<string,string> salesOrderItemCodeMap= new Map<string,string>();//<SS20220826>
            Map<string,string> valuecenterMap= new Map<string,string>();//<SS20230501>
            Map<string,string> externalmatlgrpMap= new Map<string,string>();//<SS20230501>
            Map<string,string> materialgroup2Map= new Map<string,string>();//<SS20230501>
            Map<string,string> pricezoneMap= new Map<string,string>();//<SS20230501>
            Map<string,string> plantCodeMap = new Map<string,string>();
            Map<string,string> shippingConditionCodeMap = new Map<string,string>();
            Map<string,string> destinationCountryCodeMap = new Map<string,string>();
            Map<string,string> commPtrCpdeMap = new Map<string,string>();
            Map<string,string> custMktSegmentCodeMap = new Map<string,string>();
            Map<string,string> shipToCountryCodeMap = new Map<string,string>();
            //<BB20130726> --Ver 5.47 Added salesTypeCodeMap,incotermsCodeMap
            Map<string,string> incotermsCodeMap = new Map<string,string>();
            Map<string,string> priceListTypeCodeMap = new Map<string,string>();
            Map<string,string> salesOfficeCodeMap = new Map<string,string>();
            Map<string,string> salesDistrictCodeMap = new Map<string,string>();
            Map<string,string> countryCodeMap = new Map<string,string>();
            Map<string,string> paymentTermsCodeMap = new Map<string,string>();
            Map<string,string> marketSegmentCodeMap = new Map<string,string>();
            Map<string,string> endUseCodeMap = new Map<string,string>();
            Map<string,string> mg1CodeMap = new Map<string,string>();
            Map<String,String> mg5KeyCodeMap = new Map<string,string>();
            Map<string,string> campaignCodeMap = new Map<string,string>();
            Map<string,string> documentCurrencyCodeMap = new Map<string,string>();
            Map<string,string> stateCodeMap = new Map<string,string>();
            //<PG20202707>
            Map<string,string> distCodeMap = new Map<string,string>();
            for(Org_Group_ERP_Key__c orgGroupKeyObj : orgGroupKeyList) {
                if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Customer Price Group')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Customer Price Group')) {
                        cpgConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        cpgCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<BB20130726> Ver 5.47 2013-07-25 APAC Rollout2-Adding Logic for Extra field Incoterms
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Incoterms')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Incoterms')) {
                        incotermsConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        incotermsCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Price Group')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Material Price Group')) {
                        mpgConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        mpgCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Price List Type')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Price List Type')) {
                        priceListTypeConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        priceListTypeCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales Office')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sales office')) {
                        salesOfficeConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        salesOfficeCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales District')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sales District')) {
                        salesDistrictConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        salesDistrictCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Country')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Country') || keyCombinationCodeDesc.containsIgnoreCase('Country to') || keyCombinationCodeDesc.containsIgnoreCase('Recip Country')) {
                        countryConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        countryCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Terms of Payment')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Terms of Payment')) {
                        paymentTermsConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        paymentTermsCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 4')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Market Segment')) {
                        marketSegmentSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        marketSegmentCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<MS20140515> Added conditions for Variant and SalesOrderType START
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Variant')) 
                {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Variant')) 
                    {
                        variantSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        variantCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales Order Type')) 
                {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sales Order Type')) 
                    {
                        salesOrderTypeSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        salesOrderTypeCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<MS20140515> Added conditions for Variant and SalesOrderType END
                //<SS20220826>
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales Order Item')) 
                {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sales Order Item')) 
                    {
                        salesOrderItemSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        salesOrderItemCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<SS20230501>
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Value Center')) 
                {   
                    if(keyCombinationCodeDesc.containsIgnoreCase('Value Center')) 
                    {
                        valuecenterSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        valuecenterMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                } 
                //<SS20230501>
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 2')) 
                {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Material Group 2')) 
                    {
                        materialgroup2Set.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        materialgroup2Map.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<SS20230501>
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Ext Matl Grp')) 
                {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Ext Matl Grp')) 
                    {
                        externalmatlgrpSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        externalmatlgrpMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<SS20230501>
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Shipping Condition'))
                {   
                    if(keyCombinationCodeDesc.containsIgnoreCase('Shipping Condition')) 
                    {
                        shippingConditionSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        shippingConditionCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                //<SS20230501>
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Price Zone')) 
                {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Price Zone')) 
                    {
                        pricezoneSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        pricezoneMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }                                                                  
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 3')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('End User')) {
                        keyCombinationCodeDesc = keyCombinationCodeDesc.replace('End User','EndUser');
                    }
                    if(keyCombinationCodeDesc.containsIgnoreCase('End Use')) {
                        endUseSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        endUseCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                    if(keyCombinationCodeDesc.containsIgnoreCase('EndUser')) {
                        keyCombinationCodeDesc = keyCombinationCodeDesc.replace('EndUser','End User');
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 1')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Material Group 1') || keyCombinationCodeDesc.containsIgnoreCase('Matl grp1') 
                       || keyCombinationCodeDesc.containsIgnoreCase('Matl grp 1') || keyCombinationCodeDesc.containsIgnoreCase('MatGrp1')) {
                           mg1Set.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                           mg1CodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                       }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Campaign')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Campaign')) {
                        campaignConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        campaignCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Document Currency')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('Document Currency')) {
                        documentCurrencyConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        documentCurrencyCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                
                //<PG20202707> 
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Distributor Code')  ) {                            
                    if(keyCombinationCodeDesc.containsIgnoreCase('Distributor') &&  sDistributorCodeFromImportedFile.contains(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c)) {
                        distConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        distCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
                
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('State')) {
                    if(keyCombinationCodeDesc.containsIgnoreCase('State')) {
                        stateConcat.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        stateCodeMap.put(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c);
                    }
                }
            }
            //Validations on the imported records
            for(PAWrapper impWrapperObj : importWrapperList) {
                if(rejectReasonsMap.get((string)impWrapperObj.sObjectRecord.get('id'))==null) {
                    string reason= rejectReasonsMap.get((string)impWrapperObj.sObjectRecord.get('id'));
                    //boolean comaremoveFlag = false;
                    if(reason==null) {
                        reason='';
                        //comaremoveFlag = true;
                    }
                    
                    //Checking whether the Sales Area value is associated with the Sales Area selected
                    if(keyCombinationCodeDesc.contains('Sales Org.')) {
                        if((!((request.pricingRequest.Sales_Org_Code__c).equalsIgnoreCase((string)impWrapperObj.sObjectRecord.get('Sales_Org_Code__c'))))) {
                            reason+=', '+Label.Sales_Area_different_from_Import_selection_Error;
                        }
                        else if (keyCombinationCodeDesc.contains('Dist. Channel') && (!(request.pricingRequest.Dist_Channel_Code__c).equalsIgnoreCase((string)impWrapperObj.sObjectRecord.get('Dist_Channel_Code__c')))) {
                            reason+=', '+Label.Sales_Area_different_from_Import_selection_Error;
                            
                        }
                        else if(keyCombinationCodeDesc.contains('Division') && (!(request.pricingRequest.Division_Code__c).equalsIgnoreCase((string)impWrapperObj.sObjectRecord.get('Division_Code__c')))) {
                            reason+=', '+Label.Sales_Area_different_from_Import_selection_Error;
                        }
                    }
                    
                    //Checking whether the Valid To is greater than todays date
                    if(((date)impWrapperObj.sObjectRecord.get('Valid_To__c')) < date.today()) {
                        reason+=', '+Label.Valid_to_past_date_Error;
                    }
                    //Checking whether the Valid To is greater than Valid From date todays date
                    //<TJ20150106> Removed '=' condition
                    if(((date)impWrapperObj.sObjectRecord.get('Valid_To__c')) < ((date)impWrapperObj.sObjectRecord.get('Valid_From__c'))) {
                        reason+=', '+Label.valid_to_less_than_valid_from_Error;
                    }
                    
                    //RetroActive Check
                    if((((date)impWrapperObj.sObjectRecord.get('Valid_From__c')) < Date.today().addDays(-retroActiveDays))
                       || (((date)impWrapperObj.sObjectRecord.get('Valid_From__c')) > Date.today().addDays(latestValidFrom))) {
                           
                           reason+=', '+Label.Valid_From_date_out_of_range_Import_Error;
                       }
                    //Max Validity
                    if((((date)impWrapperObj.sObjectRecord.get('Valid_From__c')).addMonths(latestValidTo)) < ((date)impWrapperObj.sObjectRecord.get('Valid_To__c'))) {
                        reason+=', '+Label.Valid_To_date_out_of_range_Import_Error;
                    }
                    if(keyCombinationCodeDesc.contains('PH1')) {
                        string phConcatCode = phCheckMap.get((string)impWrapperObj.sObjectRecord.get('id'));
                        for(Integer ph=1;ph<=phCheck;ph++){
                            Integer phLength = phConcatCode.length();
                            phConcatCode = phConcatCode.removeEnd('__');
                            if(phLength == phConcatCode.length()) {
                                break;
                            }
                        }
                        if(phConcatCode.contains('__')) {
                            reason+=', '+Label.Wrong_Values_in_PH_Error;
                        }
                        else if(!concatPhCode.contains(phConcatCode)) {
                            reason+=', '+Label.PH_values_not_configured_for_the_BU_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Product_Hierarchy__c',phMap.get(phConcatCode));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Customer Price Group')) {
                        if(!cpgConcat.contains((string)impWrapperObj.sObjectRecord.get('Customer_Price_Group_Code__c'))) {
                            reason+=', '+Label.CPG_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Customer_Price_Group__c',cpgCodeMap.get((string)impWrapperObj.sObjectRecord.get('Customer_Price_Group_Code__c')));
                        }
                    }
                    //<BB20130726> Ver 5.47 2013-07-25 APAC Rollout2-Adding Logic for Extra field Incoterms
                    if(keyCombinationCodeDesc.contains('Incoterms')) {
                        if(!incotermsConcat.contains((string)impWrapperObj.sObjectRecord.get('Incoterms_Code__c'))) {
                            reason+=', '+Label.Incoterms_Code_not_Configured_for_the_Sales_Area_Error;
                        }
                        else {
                            //<VR20130924> DTT Rollout
                            impWrapperObj.sObjectRecord.put('Inco_terms__c',incotermsCodeMap.get((string)impWrapperObj.sObjectRecord.get('Incoterms_Code__c')));
                        }
                    }
                    
                    if(keyCombinationCodeDesc.contains('Material Price Group')) {
                        if(!mpgConcat.contains((string)impWrapperObj.sObjectRecord.get('Material_Price_Group_Code__c'))) {
                            reason+=', '+Label.MPG_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Material_Price_Group__c',mpgCodeMap.get((string)impWrapperObj.sObjectRecord.get('Material_Price_Group_Code__c')));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Price List Type')) {
                        if(!priceListTypeConcat.contains((string)impWrapperObj.sObjectRecord.get('Price_List_Type_Code__c'))) {
                            reason+=', '+Label.Price_List_Type_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Price_List_Type__c',priceListTypeCodeMap.get((string)impWrapperObj.sObjectRecord.get('Price_List_Type_Code__c')));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Sales office')) {
                        if(!salesOfficeConcat.contains((string)impWrapperObj.sObjectRecord.get('Sales_Office_Code__c'))) {
                            reason+=', '+Label.Sales_Office_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Sales_Office__c',salesOfficeCodeMap.get((string)impWrapperObj.sObjectRecord.get('Sales_Office_Code__c')));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Sales District')) {
                        if(!salesDistrictConcat.contains((string)impWrapperObj.sObjectRecord.get('Sales_District_Code__c'))) {
                            reason+=', '+'Sales district not configured for sales area';
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Sales_District__c',salesDistrictCodeMap.get((string)impWrapperObj.sObjectRecord.get('Sales_District_Code__c')));
                        }
                    }
                    //<PP20131028>
                    if(keyCombinationCodeDesc.replace('Ship-To Country','').contains('Country')) {
                        if(!countryConcat.contains((string)impWrapperObj.sObjectRecord.get('Country_Code__c'))) {
                            reason+=', '+Label.Country_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Country__c',countryCodeMap.get((string)impWrapperObj.sObjectRecord.get('Country_Code__c')));
                        }
                    }
                    
                    //<PP20131028> START                    
                    if(keyCombinationCodeDesc.contains('Ship-To Country')) {
                        if(!countryConcat.contains((string)impWrapperObj.sObjectRecord.get('Ship_To_Country_Code__c'))) {
                            reason+=', '+Label.Country_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Ship_To_Country__c',countryCodeMap.get((string)impWrapperObj.sObjectRecord.get('Ship_To_Country_Code__c')));
                        }
                    }
                    //<PP20131028> END
                    if(keyCombinationCodeDesc.contains('Market Segment')) {
                        if(!marketSegmentSet.contains((string)impWrapperObj.sObjectRecord.get('Market_Segment_Code__c'))) {
                            reason+=', '+Label.Market_Segment_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Market_Segment__c',marketSegmentCodeMap.get((string)impWrapperObj.sObjectRecord.get('Market_Segment_Code__c')));
                        }
                    }
                    //<MS20140515> Added Variant and SalesOrderType fields START
                    if(keyCombinationCodeDesc.contains('Variant')) {
                        if(!variantSet.contains((string)impWrapperObj.sObjectRecord.get('Variant_Code__c'))) {
                            reason+=', '+Label.Variant_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Variant__c',variantCodeMap.get((string)impWrapperObj.sObjectRecord.get('Variant_Code__c')));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Material Group 5 Key')) {
                        if(!mg5KeySet.contains((string)impWrapperObj.sObjectRecord.get('Material_Group_5_Key__c_Code'))) {
                            reason+=', '+Label.Material_Group_5_Key_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Material_Group_5_Key__c',mg5KeyCodeMap.get((string)impWrapperObj.sObjectRecord.get('Material_Group_5_Key__c_Code')));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Sales Order Type')) {
                        if(!salesOrderTypeSet.contains((string)impWrapperObj.sObjectRecord.get('Sales_Order_Type_Code__c'))) {
                            reason+=', '+Label.Sales_Order_Type_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Sales_Order_Type__c',salesOrderTypeCodeMap.get((string)impWrapperObj.sObjectRecord.get('Sales_Order_Type_Code__c')));
                        }
                    }
                    //<SS20220826> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    if(keyCombinationCodeDesc.contains('Sales Order Item')) {
                        if(!salesOrderItemSet.contains((string)impWrapperObj.sObjectRecord.get('Sales_Order_Item_Code__c'))) {
                            reason+=', '+Label.Sales_Order_Item_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Sales_Order_Item__c',salesOrderItemCodeMap.get((string)impWrapperObj.sObjectRecord.get('Sales_Order_Item_Code__c')));
                        }//<SS20220826> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    }
                    //<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    if(keyCombinationCodeDesc.contains('Value Center')) {
                        System.debug('Value Center@'+keyCombinationCodeDesc);
                        if(!valuecenterSet.contains((string)impWrapperObj.sObjectRecord.get('Value_Center_Code__c'))) {
                            reason+=', '+Label.Value_Center_not_configured_for_the_Sales_Area;
                        System.debug('Value Center@reason'+reason);
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Value_Center__c',valuecenterMap.get((string)impWrapperObj.sObjectRecord.get('Value_Center_Code__c')));
                        System.debug('Value Center@else'+impWrapperObj.sObjectRecord.put('Value_Center__c',valuecenterMap.get((string)impWrapperObj.sObjectRecord.get('Value_Center_Code__c'))));
                        }//<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    }
                    //<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    if(keyCombinationCodeDesc.contains('Material Group 2')) {
                        if(!materialgroup2Set.contains((string)impWrapperObj.sObjectRecord.get('Material_Group_2_Code__c'))) {
                            reason+=', '+Label.Material_Group_2_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Material_Group_2__c',materialgroup2Map.get((string)impWrapperObj.sObjectRecord.get('Material_Group_2_Code__c')));
                        }//<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    }
                    //<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    if(keyCombinationCodeDesc.contains('Ext Matl Grp')) {
                         System.debug('Errormessage###'+keyCombinationCodeDesc);
                        System.debug(keyCombinationCodeDesc.contains('Ext Matl Grp'));
                        if(!externalmatlgrpSet.contains((string)impWrapperObj.sObjectRecord.get('Ext_Matl_Grp_Code__c'))) {
                            reason+=', '+Label.External_Matl_Grp_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Ext_Matl_Grp__c',externalmatlgrpMap.get((string)impWrapperObj.sObjectRecord.get('Ext_Matl_Grp_Code__c')));
                        }//<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    }
                    if(keyCombinationCodeDesc.contains('Shipping Condition')) {  //Added by MM
                        System.debug('Shipping Condition'+keyCombinationCodeDesc);
                        if(!shippingConditionSet.contains((string)impWrapperObj.sObjectRecord.get('Shipping_Condition_Code__c'))) {
                            reason+=', '+Label.Shipping_Condition_not_configured_for_the_SalesArea;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Shipping_Condition__c',shippingConditionCodeMap.get((string)impWrapperObj.sObjectRecord.get('Shipping_Condition_Code__c')));
                        }
                    }
                    //<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    if(keyCombinationCodeDesc.contains('Price Zone')) {
                        if(!pricezoneSet.contains((string)impWrapperObj.sObjectRecord.get('Price_Zone_Code__c'))) {
                            reason+=', '+Label.Price_Zone_not_configured_for_the_Sales_Area;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Price_Zone__c',pricezoneMap.get((string)impWrapperObj.sObjectRecord.get('Price_Zone_Code__c')));
                        }//<SS20230501> Added if condition to check Sales Order Item value is used is configured for Sales Area - START
                    }                                                                                 
                    system.debug('salesOrderItemCodeMap DEBUG'+salesOrderItemCodeMap);
                    if(keyCombinationCodeDesc.contains('Material Group 1') || keyCombinationCodeDesc.contains('Matl grp1') 
                       || keyCombinationCodeDesc.contains('Matl grp 1') || keyCombinationCodeDesc.contains('MatGrp1')) {
                           if(!mg1Set.contains((string)impWrapperObj.sObjectRecord.get('Material_Group_1_Code__c'))) {
                               reason+=', '+'Material Group 1 not configured for the sales area';
                           }
                           else {
                               impWrapperObj.sObjectRecord.put('Material_Group_1__c',mg1CodeMap.get((string)impWrapperObj.sObjectRecord.get('Material_Group_1_Code__c')));
                           }
                       }
                    //<MS20140515> Added Variant and SalesOrderType fields END
                    if(keyCombinationCodeDesc.containsIgnoreCase('End User')) {
                        keyCombinationCodeDesc = keyCombinationCodeDesc.replace('End User','EndUser');
                    }
                    if(keyCombinationCodeDesc.contains('End Use')) {
                        if(!endUseSet.contains((string)impWrapperObj.sObjectRecord.get('End_Use_code__c'))) {
                            reason+=', '+Label.End_Use_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('End_Use__c',endUseCodeMap.get((string)impWrapperObj.sObjectRecord.get('End_Use_code__c')));
                        }
                    }
                    if(keyCombinationCodeDesc.containsIgnoreCase('EndUser')) {
                        keyCombinationCodeDesc = keyCombinationCodeDesc.replace('EndUser','End User');
                    }
                    
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('Ship To')) {
                        if(shipToMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).contains((string)impWrapperObj.sObjectRecord.get('ShipTo_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('ShipTo__c',shipToMapDesc.get((string)impWrapperObj.sObjectRecord.get('ShipTo_Code__c')));
                        }
                        else {
                            reason+=', '+Label.Ship_To_not_configured_for_the_Sold_To_Error;
                        }
                    }   
                    else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('Ship To')) {
                        if(shipToCodeSet.contains((string)impWrapperObj.sObjectRecord.get('ShipTo_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('ShipTo__c',shipToMapDesc.get((string)impWrapperObj.sObjectRecord.get('ShipTo_Code__c')));
                        }
                        else {
                            reason+=', '+Label.Ship_To_not_configured_for_the_Sales_Area_Error;
                        }
                    }
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('ComPartner')) {
                        if(comPartnerMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).contains((string)impWrapperObj.sObjectRecord.get('ComPartner_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('ComPartner__c',comPartnerMapDesc.get((string)impWrapperObj.sObjectRecord.get('ComPartner_Code__c')));
                        }
                        else {
                            reason+=', '+'ComPartner not configured for Sold To';
                        }
                    }   
                    else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('ComPartner')) {
                        if(comPartnerCodeSet.contains((string)impWrapperObj.sObjectRecord.get('ComPartner_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('ComPartner__c',comPartnerMapDesc.get((string)impWrapperObj.sObjectRecord.get('ComPartner_Code__c')));
                        }
                        else {
                            reason+=', '+'ComPartner not configured for Sales Area';
                        }
                    }
                    
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('End User') && endUserMap.size() != 0) {
                        if(endUserMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).contains((string)impWrapperObj.sObjectRecord.get('End_User_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('End_User__c',endUserMapDesc.get((string)impWrapperObj.sObjectRecord.get('End_User_Code__c')));
                        }
                        else {
                            reason+=', '+Label.End_User_not_configured_for_the_Sold_To_Error;
                        }
                    }   
                    else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('End User')) {
                        if(endUserCodeSet.contains((string)impWrapperObj.sObjectRecord.get('End_User_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('End_User__c',endUserMapDesc.get((string)impWrapperObj.sObjectRecord.get('End_User_Code__c')));
                        }
                        else {
                            reason+=', '+Label.End_User_not_configured_for_the_Sales_Area_Error;
                        }
                    }
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('Partner ZF')) {
                        if(partnerZFMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).contains((string)impWrapperObj.sObjectRecord.get('Partner_ZF_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('Partner_ZF__c',partnerZFMapDesc.get((string)impWrapperObj.sObjectRecord.get('Partner_ZF_Code__c')));
                        }
                        else {
                            reason+=', '+'Partner ZF not configured for Sold To';
                        }
                    }   
                    else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('Partner ZF')) {
                        if(partnerZFCodeSet.contains((string)impWrapperObj.sObjectRecord.get('Partner_ZF_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('Partner_ZF__c',partnerZFMapDesc.get((string)impWrapperObj.sObjectRecord.get('Partner_ZF_Code__c')));
                        }
                        else {
                            reason+=', '+'Partner ZF not configured for Sales Area';
                        }
                    }
                    if(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && keyCombinationCodeDesc.containsIgnoreCase('Payer')) {
                        if(payerMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).contains((string)impWrapperObj.sObjectRecord.get('Payer_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('Payer__c',payerMapDesc.get((string)impWrapperObj.sObjectRecord.get('Payer_Code__c')));
                        }
                        else {
                            reason+=', '+'Payer not configured for Sold To';
                        }
                    }   
                    else if((!keyCombinationCodeDesc.containsIgnoreCase('Sold To')) && keyCombinationCodeDesc.containsIgnoreCase('Payer')) {
                        if(payerCodeSet.contains((string)impWrapperObj.sObjectRecord.get('Payer_Code__c'))) {
                            impWrapperObj.sObjectRecord.put('Payer__c',payerMapDesc.get((string)impWrapperObj.sObjectRecord.get('Payer_Code__c')));
                        }
                        else {
                            System.debug('PayerCodeSet'+payerCodeSet);
                            reason+=', '+'Payer not configured for Sales Area';
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Campaign')) {
                        if(!campaignConcat.contains((string)impWrapperObj.sObjectRecord.get('Campaign_Code__c'))) {
                            reason+=', '+'Campaign not configured for Sales Area';
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Campaign__c',campaignCodeMap.get((string)impWrapperObj.sObjectRecord.get('Campaign_Code__c')));
                        }
                    }
                    if(keyCombinationCodeDesc.contains('Document Currency')) {
                        if(!documentCurrencyConcat.contains((string)impWrapperObj.sObjectRecord.get('Document_Currency_Code__c'))) {
                            reason+=', '+'Document Currency not configured for Sales Area';
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Document_Currency__c',documentCurrencyCodeMap.get((string)impWrapperObj.sObjectRecord.get('Document_Currency_Code__c')));//KS20220614
                        }
                    }
                    //<PG20202707>
                    if(keyCombinationCodeDesc.contains('Distributor')) {
                        impWrapperObj.sObjectRecord.put('Distributor_Name__c',distCodeMap.get((string)impWrapperObj.sObjectRecord.get('Distributor_Code__c')));   
                    }
                    
                    if(keyCombinationCodeDesc.contains('State')) {
                        if(!stateConcat.contains((string)impWrapperObj.sObjectRecord.get('State_Code__c'))) {
                            reason+=', '+'State not configured for Sales Area';
                        }
                        else {
                            system.debug(stateCodeMap.get((string)impWrapperObj.sObjectRecord.get('State_Code__c')));
                            impWrapperObj.sObjectRecord.put('State__c',stateCodeMap.get((string)impWrapperObj.sObjectRecord.get('State_Code__c')).split(',',2)[0]);
                            impWrapperObj.sObjectRecord.put('Country_Code__c',stateCodeMap.get((string)impWrapperObj.sObjectRecord.get('State_Code__c')).split(',',2)[1]);
                        }
                    }
                    
                    
                    string rateString = (string)impWrapperObj.sObjectRecord.get('Rate__c');
                    //rateString = rateString.replace(',','');
                    if(rateString.contains('.')) {
                        rateString = rateString.replace('.','');
                    }
                    if(rateString.contains('-')) {
                        rateString = rateString.replace('-','');
                    }
                    if(!rateString.isNumeric()){
                        reason+=', '+Label.Invalid_Rate_Error;
                    }
                    else {
                        try {
                            if(proCondList[0].Pricing_Condition__r.Calculation_Type__c!=null && (!proCondList[0].Pricing_Condition__r.Calculation_Type__c.contains('Percentage'))) {
                                if(Decimal.valueOf(rateString)<0) {
                                    reason+=', '+Label.Positive_value_in_Rate_Error;
                                }
                            }
                        }
                        catch(Exception e) {
                            reason+=', '+Label.Invalid_Rate_Error;
                        }
                    }                   
                    if(keyCombinationCodeDesc.contains('Terms of Payment')) {
                        if(!paymentTermsConcat.contains((string)impWrapperObj.sObjectRecord.get('Terms_Of_Payment_Code__c'))) {
                            reason+=', '+Label.Payment_Terms_not_configured_for_the_Sales_Area_Error;
                        }
                        else {
                            impWrapperObj.sObjectRecord.put('Terms_Of_Payment__c',paymentTermsCodeMap.get((string)impWrapperObj.sObjectRecord.get('Terms_Of_Payment_Code__c')));
                        }
                    }
                    //Validations on scaling order
                    if(proCondList[0].Sales_Pricing_Procedure_Condition_Config__c!=null && proCondList[0].Sales_Pricing_Procedure_Condition_Config__c.contains('Enable Scale')) {
                        Decimal previousValue=0;
                        for(Integer i=0;i<quantityList.size();i++) {
                            if(((string)impWrapperObj.sObjectRecord.get('Scale_Quantity_Scale_Value'+(i+1)+'__c'))!=null && Decimal.valueOf(((string)impWrapperObj.sObjectRecord.get('Scale_Quantity_Scale_Value'+(i+1)+'__c')))<0) {
                                reason+=', '+Label.Positive_value_in_Quantity_Error;
                                break;
                            }
                            if(proCondList[0].Pricing_Condition__r.Check_Scale__c!=null && (!(proCondList[0].Pricing_Condition__r.Check_Scale__c=='Descending'))) {
                                if(i!=0 && ((string)impWrapperObj.sObjectRecord.get(quantityList[i]))!=null) {
                                    if(previousValue>Decimal.valueOf(((string)impWrapperObj.sObjectRecord.get(quantityList[i])))) {
                                        reason+=', '+Label.Scale_Rate_incorrect_order_Error;
                                        break;
                                    }
                                }
                                previousValue=((string)impWrapperObj.sObjectRecord.get(quantityList[i]))==null  ? 0 : Decimal.valueOf((string)impWrapperObj.sObjectRecord.get(quantityList[i]));
                            }
                            else {
                                if(i!=0 && ((string)impWrapperObj.sObjectRecord.get(quantityList[i]))!=null) {
                                    if(previousValue<Decimal.valueOf(((string)impWrapperObj.sObjectRecord.get(quantityList[i])))) {
                                        reason+=', '+Label.Scale_Rate_incorrect_order_Error;
                                        break;
                                    }
                                }
                                previousValue=((string)impWrapperObj.sObjectRecord.get(quantityList[i]))==null ? 0 : Decimal.valueOf((string)impWrapperObj.sObjectRecord.get(quantityList[i]));
                            }
                            if(previousValue==null && ((string)impWrapperObj.sObjectRecord.get(quantityList[i]))!=null) {
                                reason+=', '+Label.Scale_Rate_incorrect_order_Error;
                                break;
                            }
                        }
                    }
                    //Checking Non edited records
                    try {
                        boolean equalCheck=true;
                        //boolean otherFieldChangeFlag = true;
                        if(string.isBlank((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c'))) {
                            equalCheck=false;
                            //otherFieldChangeFlag = false;
                        }
                        for(string header : headerList) {
                            if(!(header.equalsIgnoreCase('sid') || descriptions.contains(header.toLowerCase()) || string.isBlank((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')))) {
                                if(objectFields.get(objAPIMap.get(header.toLowerCase().trim())).getDescribe().getType()==Schema.DisplayType.Date){
                                    if((!(((Date)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase())))==null)) && equalCheck) {
                                        if(!((Date)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase()))).isSameDay((Date)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase())))) {
                                            equalCheck = false;
                                        }
                                    }
                                    /*if(header.equalsIgnoreCase('Valid From')) {
if(((Date)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase()))) > (((ERP_Sales_Prices_SAP__c)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c'))).Price_Holder__r.Valid_To__c.addDays(1))) {
reason+=', '+Label.Gap_in_pricing_Record_Error;
}
}*/
                                }
                                //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
                                else if(objectFields.get(objAPIMap.get(header.toLowerCase().trim())).getDescribe().getType()==Schema.DisplayType.Double || objectFields.get(objAPIMap.get(header.toLowerCase().trim())).getDescribe().getType()==Schema.DisplayType.Percent){
                                    if((impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase()))==null ? 0 : (Decimal)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase())))!=(salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase()))==null ? 0 : (Decimal)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase()))) && equalCheck) {
                                        equalCheck = false;
                                    }
                                }
                                else if(objectFields.get(objAPIMap.get(header.toLowerCase().trim())).getDescribe().getType()==Schema.DisplayType.Boolean){
                                    if((impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase()))==null ? false : (boolean)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase())))!=(salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase()))==null ? false : (boolean)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase()))) && equalCheck) {
                                        equalCheck = false;
                                    }
                                }
                                else {
                                    if((!(string.isBlank((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase()))) ? ' ' : (string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase()))).equalsIgnoreCase(string.isBlank((string)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase()))) ? ' ' : (string)salesPriceSAPMap.get((string)impWrapperObj.sObjectRecord.get('ERP_Sales_Prices_SAP__c')).get(erpObjAPIMap.get(header.toLowerCase())))) && equalCheck) {
                                        equalCheck = false;
                                    }
                                }
                            }
                            if(header.equalsIgnoreCase('Material Code')) {
                                if(uomCheckMap.get((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get(header.toLowerCase())))==null) {
                                    reason+=', '+Label.Material_not_configured_for_the_Sales_Area_Error;                                                                       
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Material__c',(string)uomCheckMap.get((string)impWrapperObj.sObjectRecord.get('Material_Code__c')).get('Name'));
                                }
                            }
                            if(header.equalsIgnoreCase('Price Ref. Partner Code')) {
                                if(priceRefPartnerCheckMap.get((string)impWrapperObj.sObjectRecord.get('Price_Ref_Partner_Code__c'))==null) {
                                    reason+=', '+Label.Price_Reference_Partner_not_Configured_for_the_Sales_Area_Error;                                                                    
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Price_Ref_Partner__c',(string)priceRefPartnerCheckMap.get((string)impWrapperObj.sObjectRecord.get('Price_Ref_Partner_Code__c')).get('Name'));
                                }
                            }
                            //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra field Customer Hierarchy
                            if(header.equalsIgnoreCase('Customer Hierarchy Code')) {
                                if(priceRefPartnerCheckMap.get((string)impWrapperObj.sObjectRecord.get('Customer_Hierarchy_Code__c'))==null) {
                                    reason+=', '+Label.Customer_Hierarchy_Code_not_Configured_for_the_Sales_Area_Error;                                                                    
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Customer_Hierarchy__c',(string)priceRefPartnerCheckMap.get((string)impWrapperObj.sObjectRecord.get('Customer_Hierarchy_Code__c')).get('Name'));
                                }
                            }
                            if(header.equalsIgnoreCase('Sold To Code')) {
                                //<TJ20150105> Commented if condition
                                /*if(string.isBlank(request.requestServiceState.ogItems.selectedUser) || string.isBlank(request.requestServiceState.ogItems.userName)) {
reason+=', '+Label.You_are_not_allowed_to_create_requests_for_Customer_Specific_Prices_Error;
}
else {*/
                                if(cusCheckMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c'))==null) {
                                    reason+=', '+Label.Sold_To_Code_not_configured_for_the_Sales_Area_Error;
                                }
                                else {
                                    impWrapperObj.sObjectRecord.put('Sold_To__c',cusCheckMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).get('Name'));
                                }
                                //<TJ20150105> Commented if condition
                                if(!(/*string.isBlank(request.requestServiceState.ogItems.selectedUser) || */string.isBlank(request.requestServiceState.ogItems.userName) || reason.contains(Label.Sold_To_Code_not_configured_for_the_Sales_Area_Error))) {
                                System.debug('hello Buddy'+request.requestServiceState.ogItems.userName+reason.contains(Label.Sold_To_Code_not_configured_for_the_Sales_Area_Error));
                                    if(!soldToIds.contains((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c'))) {
                                        reason+=', '+Label.You_are_not_authorized_to_create_requests_for_Error+' '+(string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c');
                                    }
                                }
                                //}
                            }
                            if(header.equalsIgnoreCase('UoM')) {
                                if(!uomInSA.toLowerCase().contains(((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get('uom'))).toLowerCase())) {
                                    reason+=', '+Label.UoM_not_configured_for_the_Sales_Area_Error;
                                }
                                if(DcodeUomMap.keyset().size()>0){
                                    List<String> Uom = DcodeUomMap.get((string)impWrapperObj.sObjectRecord.get('Material_Code__c')); 
                                    Set<String>Uoms = new set<string>();
                                    Uoms.addAll(uom);
                                    if(!Uoms.contains((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get('uom'))))
                                    {
                                        reason+=', '+Label.UoM_not_applicable_for_the_Material_Error;
                                    }
                                }
                            }
                            if(header.equalsIgnoreCase('Unit') && proCondList[0].Pricing_Condition__r.Calculation_Type__c!=null && (!proCondList[0].Pricing_Condition__r.Calculation_Type__c.contains('Percentage'))) {
                                if(!currencyInSA.toLowerCase().contains(((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get('unit'))).toLowerCase())) {
                                    //<VR20140109> DTT Rollout Issue - Added the if condition to include customer currency check
                                    if(!(keyCombinationCodeDesc.containsIgnoreCase('Sold To') && orgGroupItemList[0].Include_Customer_Currency__c && ((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get('unit'))).equalsIgnoreCase((string)cusCheckMap.get((string)impWrapperObj.sObjectRecord.get('Sold_To_Code__c')).get('Currency_Code__c'))))
                                        reason+=', '+Label.Currency_not_configured_for_the_Sales_Area_Error;
                                }
                            }
                            else if(header.equalsIgnoreCase('Unit') && proCondList[0].Pricing_Condition__r.Calculation_Type__c!=null && proCondList[0].Pricing_Condition__r.Calculation_Type__c.contains('Percentage')){
                                if(((string)impWrapperObj.sObjectRecord.get(ObjAPIMap.get('unit')))!=PERCENT) {
                                    reason+=', '+Label.Invalid_Unit_Error;
                                }
                            }
                        }
                        if(equalCheck) {
                            reason+=', '+Label.Non_Edited_Records_Error;
                        }
                    }
                    catch(Exception e) {
                        reason+=', '+Label.Invalid_sid_Error;
                    }
                    reason = reason.removeStart(',');
                    rejectReasonsMap.put((string)impWrapperObj.sObjectRecord.get('id'),reason);
                }
            }
        }
        //Generating the Reject Records List
        List<Sobject> deleteList = new List<Sobject>();
        List<PAWrapper> successList = new List<PAWrapper>();
        List<PAWrapper> rejectedRecList = new List<PAWrapper>();
        for(PAWrapper impWrapperObj : rejectedRecordsList) {
            if(!string.isBlank((string)impWrapperObj.stringMap.get('errors'))) {
                rejectedRecList.add(impWrapperObj);
            }
        }
        rejectedRecordsList = new List<PAWrapper>();
        List<Pricing_Request_Item__c> updateList = new List<Pricing_Request_Item__c>();
        rejectedRecordsList.addAll(rejectedRecList);
        rejectedRecList.clear();
        for(PAWrapper impWrapperObj : importWrapperList) {
            if(string.isBlank(rejectReasonsMap.get((string)impWrapperObj.sObjectRecord.get('id')))) {
                successList.add(impWrapperObj);
                updateList.add((Pricing_Request_Item__c)impWrapperObj.sObjectRecord);
            }
            else {
                impWrapperObj.stringMap.put('errors', rejectReasonsMap.get((string)impWrapperObj.sObjectRecord.get('id')));
                rejectedRecordsList.add(impWrapperObj);
                deleteList.add(impWrapperObj.sObjectRecord);
            }
        }
        recordCount = deleteList.size();
        rejectedRecordsList.addAll(successList);        
        delete deleteList;
        update updateList;      
        relatedWrappersList= new   List<PARelatedList>();
        relatedWrappersList=getListWrappers();    
        request.pricingRequest.Request_Approval_Status__c = 'Validated';
        update request.pricingRequest;
        //recordCount = limits.getScriptStatements();
        popUpFlag='validate';
        //<PP20140616>
        /*request.pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,
Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c,
Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c,
Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c,
Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c,
Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name,
On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate,
LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, 
Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c,
Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,
CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, 
Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c, 
Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c,
On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, 
Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, 
Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, 
NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, 
Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c,
Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c,
Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request__c WHERE Id = :request.pricingRequest.Id];*/
        
        request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','request.pricingRequest',' Id = \''+request.pricingRequest.Id+'\''))[0];                          
    }
    
    /*
* Author     : Vinoth
* Method Name : flagCheck
* Parameters  : None
* Return type : pageReference
* Description : Used to Check the Floor,Reference and Current Flag based on Rate
*/
    public pageReference flagCheck() {
        system.debug('&@^hi1');
        //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
        //Brundha Roll out 2 <BR20130626> -- <NS20130821> Added Landing_Cost__c field to query select clause
        //<PP20131028>
        //<BB20130709> Ver 5.39 Added Standardized_currency__c and Standardized_UoM__c in the query
        //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
        //<BB20140404> Added Error_Indicator__c  in the query
        //<BB20140508> Added Sales_Type_Code__c,Sales_Type__c  in the query 
        /*List<Pricing_Request_Item__c> priReqItemList = [SELECT BU__c,Ship_To_Country__c,Ship_To_Country_Code__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c,Country_Code__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Disc_Ref__c,
Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,
Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,
ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,
ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,
Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,
Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,
PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,
PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,
Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,
Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,
Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Country__c, Below_Reference_Flag__c, Below_Floor_Flag__c,
Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c,
Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c,
Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,Pricing_Request__r.Request_Valid_From__c,Pricing_Request__r.Request_Valid_To__c,
Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,
Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c,Total_Materials__c,Integration_Error_Message__c
,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,Pricing_Request__r.Request_Type__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c,
Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c,
ComPartner__c,ComPartner_Code__c  
FROM Pricing_Request_Item__c WHERE Pricing_Request__c=:request.pricingRequest.id];*/
        
        List<Pricing_Request_Item__c> priReqItemList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequestItem','priReqItemList',' Pricing_Request__c=\''+request.pricingRequest.id+'\'');
        
        //<PP20131230> START
        Set<String> matCodeSet = new Set<String>();
        if(priReqItemList != null && priReqItemList.size() >0 && priReqItemList[0].Key_Combination__c != null)
        {
            String replacedKC = priReqItemList[0].Key_Combination__c.replace('Material Price Group','');
            if(replacedKC.containsIgnoreCase('Material'))
            {
                for(Pricing_Request_Item__c priReqItem : priReqItemList)
                {
                    matCodeSet.add(priReqItem.Material_Code__c);
                    
                }
                PAUtil.populateBaseUoMAndAlternateUoM(matCodeSet, request.pricingRequest.Sales_Org_Code__c + ':' +request.pricingRequest.Dist_Channel_Code__c + ':' +request.pricingCondition.pricingCondition.SAP_Cluster__c);
                PAUtil.populateSourceUoMNumDeno(matCodeSet, request.pricingCondition.pricingCondition.SAP_Cluster__c);
            }
            for(Pricing_Request_Item__c priReqItem : priReqItemList)
            {               
                if(request.pricingRequest !=null && !String.isBlank(request.pricingRequest.Standardized_Currency__c) && !String.isBlank(request.pricingRequest.Standardized_UoM__c) && request.pricingCondition.pricingCondition != null && request.pricingCondition.pricingCondition.Calculation_Type__c != null
                   &&(request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount')
                      || request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Quantity')))
                {
                    //<MS20150105> Added checkBaseUOM to method arguments
                    priReqItem = PAUtil.standardizeRate(priReqItem, request.pricingCondition.pricingCondition, request.pricingRequest.Sales_Org_Code__c, request.pricingRequest.Dist_Channel_Code__c,priReqItem.Pricing_Request__r.Standardized_Currency__c,priReqItem.Pricing_Request__r.Standardized_UoM__c,request.requestServiceState.ogItems.orgGroupItems.Base_UoM__c);                  
                }
                system.debug(priReqItem);
            }
        }
        //<PP20131230> END
        try
        {   
            PAUtil.calculateFloorAndReference(priReqItemList);
        }
        catch(Exception e)
        {
            system.debug('*** import err'+e);
        }
        relatedWrappersList= new   List<PARelatedList>();
        relatedWrappersList=getListWrappers();
        return null;
    }
    
    /*
* Author     : Vinoth
* Method Name : deleteSelectedImport
* Parameters  : None
* Return type : void
* Description : used to delete the selected records
*/
    private void deleteSelectedImport() {
        List<Pricing_Request_Item__c> priRequestItemList = new List<Pricing_Request_Item__c>();
        if(relatedWrappersList!=null && relatedWrappersList.size()!=0) {
            for(PAWrapper relatedObject : relatedWrappersList[0].wrapperList) {
                if(relatedObject.isSelected==true) {
                    priRequestItemList.add((Pricing_Request_Item__c)relatedObject.sObjectRecord);
                }
            }
        }
        if(priRequestItemList.size()==0) {
            throw new PAException(Label.select_items_to_delete_Error,ApexPages.severity.Error);
        }
        delete priRequestItemList;
        relatedWrappersList= new   List<PARelatedList>();
        relatedWrappersList=getListWrappers();
    }
    
    /*
* Author     : Vinoth
* Method Name : errorLog
* Parameters  : None
* Return type : void
* Description : used to export the Rejected csv Records
*/
    private void errorLog() {
        if(request.keyCombination!=null && (!string.isBlank(request.keyCombination.erpKeyCombination.Key_Combination_Code__c))) {
            //string exportHeader = columnGenerate(request.keyCombination.KeyCombinationName);
            string exportHeader = columnGenerate(request.keyCombination.erpKeyCombination.Key_Combination_Code__c);
            List<Pricing_Request_Item__c> successList = new List<Pricing_Request_Item__c>();
            List<Pricing_Request_Item__c> rejectedRecList = new List<Pricing_Request_Item__c>();
            if(rejectedRecordsList!=null) {
                for(PAWrapper impWrap : rejectedRecordsList) {
                    if(string.isBlank(impWrap.stringMap.get('errors'))) {
                        successList.add((Pricing_Request_Item__c)impWrap.sObjectRecord);
                    }
                    else {
                        rejectedRecList.add((Pricing_Request_Item__c)impWrap.sObjectRecord);
                    }
                }
            }
            
            string rejectedRecords = request.expDataGen(exportHeader,'Pricing_Request_Item__c',rejectedRecList,'errorLog');
            rejectedRecords+='\n'+ request.expDataGen(exportHeader,'Pricing_Request_Item__c',successList,'');
            string[] rejectedRecordsArray = rejectedRecords.split('\n');
            for(Integer i=0;i<rejectedRecordsArray.size();i++) {
                If(i!=0 && i<=rejectedRecList.size()) {
                    rejectedRecordsArray[i] = rejectedRecordsArray[i]+'\tFailure\t'+rejectedRecordsList[i-1].stringMap.get('errors').escapeCsv();
                }
                if(i>rejectedRecList.size()) {
                    rejectedRecordsArray[i] = rejectedRecordsArray[i]+'\tSuccess';
                }
                else if(i==0){
                    rejectedRecordsArray[i] = rejectedRecordsArray[i]+'\tImport Status\tRejection Reason';
                }
            }
            rejectedRecordsArray.remove(rejectedRecList.size()+1);
            rejectedRecords = string.join(rejectedRecordsArray,'\n');
            request.csvString = rejectedRecords;
        }
    }
    
    
    /*
* Author     : Vinoth
* Method Name : columnGenerate
* Parameters  : None
* Return type : string
* Description : Used to Generate the columns based on the Key Combination
*/
    private string columnGenerate(string keyComb) {
        string mustColumns;
        ERP_Procedure_Conditions__c proCondObj = new ERP_Procedure_Conditions__c();
        ERP_Key_Combination__c keyCombinationObject = new ERP_Key_Combination__c();
        
        try {
            //string buId = [select id FROM OrgGroup__c WHERE Business__c=:request.selectedBU].id;
            //string salesAreaId = [select id FROM OrgGroup__c WHERE ERP_Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND ERP_Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_Code__c AND ERP_Division_Code__c=:request.pricingRequest.Division_Code__c limit 1].id;
            Organizational_Group_Item__c orgGroupItemObj = [select id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,Enable_Variable_Config_Materials__c,
                                                            ERP_Pricing_Procedure__r.SAP_Client_Id__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c 
                                                            from Organizational_Group_Item__c where Business__c=:request.requestServiceState.ogItems.selectedBU 
                                                            AND OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c
                                                            AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c 
                                                            AND OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c limit 1];
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            proCondObj = [select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__r.Calculation_Type__c,Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Price_Types__c from ERP_Procedure_Conditions__c 
                          WHERE Sales_Pricing_Procedure__c=:orgGroupItemObj.ERP_Pricing_Procedure__c AND 
                          Pricing_Condition__r.Pricing_Condition_Code__c=:request.pricingCondition.pricingCondition.Pricing_Condition_Code__c ];
            system.debug('***keycomb'+keyComb);
            if(keyComb!=null && keyComb.contains('-')) {
                keyComb = keyComb.subStringBefore('-').trim();
            }
            keyCombinationObject= [SELECT Key_Combination_Code__c,Key_Combination_Tech__c FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c=:keyComb AND SAP_Cluster__c=:orgGroupItemObj.ERP_Pricing_Procedure__r.SAP_Cluster__c
                                   AND SAP_Application_Id__c=:orgGroupItemObj.ERP_Pricing_Procedure__r.SAP_Application_Id__c AND SAP_Client_Id__c=:orgGroupItemObj.ERP_Pricing_Procedure__r.SAP_Client_Id__c];
        }
        catch(Exception e) {
            throw new PAException(Label.Pricing_Condition_not_defined_in_Pricing_Procedure_Error,ApexPages.severity.Error);
        }
        String replacedKCTech;
        boolean hasShipToCountry = false;
        if(keyCombinationObject.Key_Combination_Tech__c.contains('Ship-To'))
        {
            replacedKCTech = keyCombinationObject.Key_Combination_Tech__c.replace('Ship-To','Ship To');
            hasShipToCountry = true;
        }
        else
            replacedKCTech = keyCombinationObject.Key_Combination_Tech__c;
        string keyCombTech = replacedKCTech.split('-')[0].replace('/',',');
        
        if(proCondObj.Sales_Pricing_Procedure_Condition_Config__c!=null && (proCondObj.Sales_Pricing_Procedure_Condition_Config__c).contains('Enable Scale')) {
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
                mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Valid From,Valid To';
            }
            else {
                mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Per,UoM,Valid From,Valid To';
            }
        }
        else {
            //<VR20130719> Ver 5.46 VR 2013-07-19 APAC Rollout2-Added logic for Floor and Reference Price Creation
            if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
                mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Valid From,Valid To';
            }
            else {
                mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Per,UoM,Valid From,Valid To';
            }
        }      
        
        string descriptions = replacedKCTech.split('-')[1];
        descriptions = descriptions.replace('Sales Org./','');
        descriptions = descriptions.replace('Dist. Channel/','');
        descriptions = descriptions.replace('Division/','');
        if(hasShipToCountry)
        {
            mustColumns = mustColumns.replace('Ship To Country','Ship-To Country');
            descriptions = descriptions.replace('Ship To Country','Ship-To Country');
        }
        return mustColumns.trim()+','+descriptions.replace('/',',').trim()+',sid';
    }
    
    
    /*
* Author      :   Neeharika
* Method Name  :   checkForGap
* Parameters   :   No Parameters
* Return type  :   String
* Description  :   This method checks for GAP records and returns a String which signifies which gap record to be created.
*/
    public String checkForGap(){
        Boolean leftGapFlag=false;
        Boolean rightGapFlag=false;
        showGapError=false;
        
        //pricingReqItem.Valid_To__c>=System.now() added coz, no GAP for expired records.!
        //System.now().Date()< pricingReqItem.New_Valid_From__c-1 : added coz gap records should be created only for sys date < new valid from-1,not for already frozen period
        if(pricingReqItem.Valid_From__c < pricingReqItem.New_Valid_From__c && System.now().Date()< pricingReqItem.New_Valid_From__c-1 ){
            //display section 1
            leftGapFlag=true;
            perm_LeftGapPricingReqItem=new Pricing_Request_Item__c();
            Date today =System.today();
            if(System.today()>= pricingReqItem.Valid_From__c && today< pricingReqItem.New_Valid_From__c){
                perm_LeftGapPricingReqItem.New_Valid_From__c=today+1;
            }else{
                perm_LeftGapPricingReqItem.New_Valid_From__c=pricingReqItem.Valid_From__c;
            }
            if(pricingReqItem.New_Valid_From__c >=pricingReqItem.Valid_From__c && pricingReqItem.New_Valid_From__c <=pricingReqItem.Valid_To__c ){
                //if new VF lies between old VF and old VTo
                perm_LeftGapPricingReqItem.New_Valid_To__c=pricingReqItem.New_Valid_From__c-1;
            }
            else{
                perm_LeftGapPricingReqItem.New_Valid_To__c=pricingReqItem.Valid_To__c;
            }
            System.debug('****perm_LeftGapPricingReqItem'+perm_LeftGapPricingReqItem);
        }
        
        if(pricingReqItem.Valid_To__c > pricingReqItem.New_Valid_To__c){
            //display section 2
            rightGapFlag=true;
            
            perm_rightGapPricingReqItem=new Pricing_Request_Item__c();
            
            if(pricingReqItem.New_Valid_To__c >=pricingReqItem.Valid_From__c)
            {
                perm_rightGapPricingReqItem.New_Valid_From__c=pricingReqItem.New_Valid_To__c+1;
            }
            else{
                perm_rightGapPricingReqItem.New_Valid_From__c=pricingReqItem.Valid_From__c;
            }
            perm_rightGapPricingReqItem.New_Valid_To__c=pricingReqItem.Valid_To__c;
            System.debug('****perm_rightGapPricingReqItem'+perm_rightGapPricingReqItem);
        }
        String retStr='';
        if(leftGapFlag||rightGapFlag){
            showGapError=true;
            
            if(leftGapFlag){
                retStr+= 'leftGap';
            }
            if(rightGapFlag){
                if(retStr.length() == 0)
                    retStr = 'rightGap';
                else 
                    retStr+= ':rightGap';
            }
            return retStr;
        }
        return null;
    }
    /*
* Author      :   
* Method Name  :   populateReqItem
* Parameters   :   PARequest
* Return type  :   void
* Description  :   This method pupulates the Request Item details,customer details from Request when PricingReqItem id is null*
*/
    
    private void populateReqItem(PARequest request){
        //System.debug('***218'+request.pricingRequest);
        //System.debug('***218 value'+paServiceState.ogitems);
        
        //Added for Project Price 3 March 2013 - Bala
        if(request!=null && request.Pricingrequest!=null && request.customer!=null && (request.pricingRequest.Pricing_Request_Type__c.equalsIgnoreCase('Project Pricing') || request.pricingRequest.Pricing_Request_Type__c.equalsIgnoreCase('Pricing Task')) && request.customer.paErpCustomer != null && request.customer.paErpCustomer.Customer_Code__c ==null)
        {
            //system.debug('check check'+request.pricingRequest.soldto_code__c+'andddd sales org code'+request.pricingRequest.sales_org_code__c
            //        +'annnd dc'+request.pricingRequest.Dist_channel_code__c +'annnd div'+request.pricingRequest.Division_code__c);
            //<BB20140508> -- Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query.            
            /*request.customer.paErpCustomer = [SELECT Id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c,
Distribution_Channel_Code__c,Distribution_channel__c,
Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
Customer_Price_Group__c,Price_List_type__c,
price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c,
sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,
Zip_Postal_Code__c,Customer_Group_2_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c 
WHERE Customer_code__c=:request.pricingRequest.soldto_code__c AND sales_org_code__c=:request.pricingRequest.sales_org_code__c
AND Distribution_Channel_Code__c=:request.pricingRequest.Dist_channel_code__c
AND Division_code__c=:request.pricingRequest.Division_code__c limit 1];*/
            
            request.customer.paErpCustomer = ((List<ERP_Customer__c>)PAQueryUtil.query('PARequestItem','paServiceState.erpCustomer.PAERPCustomer',' Customer_code__c=\''+request.pricingRequest.soldto_code__c+'\' AND sales_org_code__c=\''+request.pricingRequest.sales_org_code__c+'\' AND Distribution_Channel_Code__c=\''+request.pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+request.pricingRequest.Division_code__c+'\' limit 1'))[0];
        }
        //System.debug('****request.pricingRequest 1'+request);
        //System.debug('****request.pricingRequest 2'+request.pricingRequest);
        //System.debug('****request.pricingRequest  3'+request.pricingRequest.Request_Type__c);
        if(request!=null && request.Pricingrequest!=null && request.pricingRequest.Request_Type__c.equalsIgnoreCase('Customer Specific'))
        {
            //<BB20140508> -- Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query.
            /*request.customer.paErpCustomer = [SELECT Id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c,
Distribution_Channel_Code__c,Distribution_channel__c,
Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
Customer_Price_Group__c,Price_List_type__c,
price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c,
sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,
Zip_Postal_Code__c,Customer_Group_2_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c 
WHERE Customer_code__c=:request.pricingRequest.soldto_code__c AND sales_org_code__c=:request.pricingRequest.sales_org_code__c
AND Distribution_Channel_Code__c=:request.pricingRequest.Dist_channel_code__c
AND Division_code__c=:request.pricingRequest.Division_code__c limit 1];  */
            
            request.customer.paErpCustomer = ((List<ERP_Customer__c>)PAQueryUtil.query('PARequestItem','paServiceState.erpCustomer.PAERPCustomer',' Customer_code__c=\''+request.pricingRequest.soldto_code__c+'\' AND sales_org_code__c=\''+request.pricingRequest.sales_org_code__c+'\' AND Distribution_Channel_Code__c=\''+request.pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+request.pricingRequest.Division_code__c+'\' limit 1'))[0];                                                                                                      
            
            //Ver 5.31 populating customer in the service state(request)- on click of edit(7th June)
            request.requestServiceState.erpCustomer = request.customer;
        }
        
        
        ERP_Key_Combination__c keyCombination =new ERP_Key_Combination__c();
        //System.debug('******request.keyCombination.keyCombinationID'+request.keyCombination.keyCombinationID);
        //<PP20130422> - Ver 5.24
        if(/*request.pricingCondition.selectedPricingCondition!=null && */request!=null && request.keycombination!=null && request.keyCombination.keyCombinationID!=null
           && request.keyCombination.keyCombinationID != '--Select--' && request.keyCombination.keyCombinationID != 'callKCSetter'){
               keyCombination = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c
                                 WHERE Id = :request.keyCombination.keyCombinationID];
           }
        //<AV20153007>-Production issue-Too many SOQL rows error
        if(request!=null && request.Pricingrequest!=null && request.pricingRequest.Id!=null && request.pricingRequestId==null){
            request.pricingRequestId=request.pricingRequest.Id;
        }
        //System.debug('***in else of constructor request id'+request.pricingRequest.Id);
        /*populating SFDC KC descrpiton*/
        Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
        //  Map<Id,String> kcIdandKcDescMap=new Map<Id,String>();
        List<Organizational_Group_Item__c> orgGroupItemsList;//code review = new List<Organizational_Group_Item__c>();
        orgGroupItemsList = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Base_UoM__c,
                             Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                             Enable_Variable_Config_Materials__c,Default_Value_for_Scaled_Prices__c FROM Organizational_Group_Item__c
                             WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND
                                                   RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c
                             AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c AND
                             OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
        //<PP20130422> - Ver 5.24 - Changed Id to String
        kcIdandKcDescMap=new Map<String,String>();
        if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0){
            buOrgGroup  =   orgGroupItemsList[0];  
        }
        //System.debug('***request.pricingCondition.selectedPricingCondition'+request.pricingCondition.selectedPricingCondition);       
        List<ERP_Access_Sequence__c>    accSqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c FROM ERP_Access_Sequence__c
                                                     WHERE Pricing_Condition__c = :request.pricingCondition.selectedPricingCondition
                                                     AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
        String finalKC='';
        for(ERP_Access_Sequence__c ac:accSqList)
        {
            
            kcIdandKcDescMap.put(ac.Pricing_Key_Combination__c,ac.Key_Combination__c);
        }
        if(kcIdandKcDescMap.containsKey(request.keyCombination.keyCombinationID)){
            finalKC=kcIdandKcDescMap.get(request.keyCombination.keyCombinationID);
            System.debug('***finalKC'+finalKC);
        }
        pricingReqItem.Key_Combination_SFDC__c= finalKC;
        /*end*/
        //  pricingReqItem.Scaled_Price_Flag__c = pricingCondition.Scaled_Price_Flag__c;
        if(request!=null && request.Pricingrequest!=null && request.pricingRequest.Pricing_Request_Type__c!=null && (request.pricingRequest.Pricing_Request_Type__c.contains('Floor') || request.pricingRequest.Pricing_Request_Type__c.contains('Reference'))) {
            pricingReqItem.Pricing_Request_Type__c = request.pricingCondition.pricingCondition.Price_Types__c;
        }
        else {
            pricingReqItem.Pricing_Request_Type__c = request.pricingRequest.Pricing_Request_Type__c;
        }
        pricingReqItem.Pricing_Condition_Code__c = request.pricingCondition.pricingCondition.Pricing_Condition_Code__c;
        pricingReqItem.Pricing_Condition__c = request.pricingCondition.pricingCondition.Pricing_Condition__c;
        pricingReqItem.Key_Combination_Code__c = keyCombination.Key_Combination_Code__c;
        pricingReqItem.Key_Combination__c = keyCombination.Key_Combination__c;
        //Only Ship-to enhancement
        if(keyCombination.Key_Combination__c!=null && (keyCombination.Key_Combination__c).containsIgnoreCase('Sold to'))
        {
            //<TJ20141106> START
            if(request!=null && request.pricingRequest!=null && request.pricingRequest.Request_Type__c!='Massive')
            {
                pricingReqItem.Sold_To_Code__c =   request.pricingRequest.SoldTo_Code__c; //request.pricingRequest.Sold_To_Code__r.Customer_Code__c; request.customer.customerCode; 
                pricingReqItem.Sold_To__c = request.pricingRequest.Sold_To__c;
            }
            //<TJ20141106> END
        }
        
        //System.debug('***keyCombination.Key_Combination__c'+keyCombination.Key_Combination__c);
        if(keyCombination.Key_Combination__c!=null && (keyCombination.Key_Combination__c).containsIgnoreCase('Sales Org.')){
            pricingReqItem.Sales_Org__c = request.pricingRequest.Sales_Org__c;
            pricingReqItem.Sales_Org_Code__c = request.pricingRequest.Sales_Org_Code__c;
        }
        if(keyCombination.Key_Combination__c!=null && (keyCombination.Key_Combination__c).containsIgnoreCase('Dist. Channel')){
            
            pricingReqItem.Dist_Channel__c = request.pricingRequest.Dist_Channel__c;
            pricingReqItem.Dist_Channel_Code__c =request.pricingRequest.Dist_Channel_Code__c;
        }
        if(keyCombination.Key_Combination__c!=null && (keyCombination.Key_Combination__c).containsIgnoreCase('Division')){
            pricingReqItem.Division__c = request.pricingRequest.Division__c;
            pricingReqItem.Division_Code__c = request.pricingRequest.Division_Code__c;
        }
        
        
        String replacedKeyComb ='';
        
        if(keyCombination.Key_Combination__c !=null)
            replacedKeyComb = keyCombination.Key_Combination__c.replace('Material Price Group','');
        // System.debug('******replacedKeyComb'+replacedKeyComb);
        if((replacedKeyComb!=null && !replacedKeyComb.containsIgnoreCase('Material')) && (keyCombination!=null && keyCombination.Key_Combination__c !=null && !keyCombination.Key_Combination__c.containsIgnoreCase('PH') )){
            pricingReqItem.New_Valid_From__c = request.pricingRequest.Request_Valid_From__c;
            pricingReqItem.New_Valid_To__c = request.pricingRequest.Request_Valid_To__c;
        }
        /*To make New Per=null when there is materail/PH in KC ver 5.18 */
        else {
            pricingReqItem.New_Per__c=null;
        }
        
        /*For making Per and New UoM null if Calculation_Type__c is fixed amt or Percentage*/
        if(request!=null && request.Pricingcondition!=null && request.pricingCondition.pricingCondition!=null && request.pricingCondition.pricingCondition.Calculation_Type__c!=null &&  (request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage') || request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount'))){
            pricingReqItem.New_Per__c=null;
            pricingReqItem.New_UoM__c=null;
        }
        /*5.18 end*/
        //end 
        pricingReqItem.Customer_Specific__c =  request.pricingRequest.Customer_Specific__c;
        pricingReqItem.Approval_Status__c =  request.pricingRequest.Request_Approval_Status__c;
        pricingReqItem.SAP_Application_Id__c = request.pricingCondition.pricingCondition.SAP_Application_Id__c;
        pricingReqItem.SAP_Client_Id__c = request.pricingCondition.pricingCondition.SAP_Client_ID__c;
        pricingReqItem.SAP_Cluster__c = request.pricingCondition.pricingCondition.SAP_Cluster__c;
        //pricingReqItem.Country__c= request.pricingRequest.Country__c;
        //pricingReqItem.Inco_terms__c =request.pricingRequest.Incoterm__c;
        //pricingReqItem.Incoterms_Code__c =request.pricingRequest.Incoterms_Code__c;
        //<PP20131108>
        request.phFilter=null;
        //Ver 5.14 strt
        //<PP20140305> STARTS - commented as 'Non-Scale Price' should be defaulted
        //if(enableScale == 'true' && pricingReqItem.Pricing_Request_Type__c != 'Pricing Task' && pricingReqItem.Pricing_Request_Type__c != 'Project')
        //{
        //pricingReqItem.Scaled_Price_Flag__c=true;
        //}
        //else
        //{
        //    pricingReqItem.Scaled_Price_Flag__c=false;
        //}
        //<MS20140425> Checking the Default value for scaled price
        if(enableScale == 'true'&& buOrgGroup.Default_Value_for_Scaled_Prices__c == 'Scale')
        {
            pricingReqItem.Scaled_Price_Flag__c=true;
        }
        else
            pricingReqItem.Scaled_Price_Flag__c=false;
        //<PP20140305> ENDS
        //Ver 5.14 end
        if(request!=null && request.Pricingrequest!=null && request.pricingRequest.Spot_Type__c == 'Free of Charge') //For Pricing Task
        {
            pricingReqItem.New_Rate__c ='0';
            System.debug('***rate'+pricingReqItem.New_Rate__c);
        }
        
    }
    /*
the 
*/
    private void populateViewState(String currentPageId,PAServiceState paServiceState){
        
        //serviceClass = new PAService();
        system.debug('\n\n\n in method');
        final String LINE_BREAK = '<br/>';
        //request.requestServiceState.ogitems.ogItemFromRequest(request.pricingRequest);
        
        currentPageId = ApexPages.currentPage().getParameters().get('id');
        
        pricingRequest = new Pricing_Request__c();
        if(currentPageId.subString(0,3) == schema.sobjecttype.Task.getKeyPrefix())
        {
            List<Pricing_Request__c> prListForProject=new List<Pricing_Request__c>();
            //[AJ20151223] Changes related to archival task issue by adding all rows.      
            List<Task> taskList=[Select WhoId, TaskCompletionComment__c, WhatId, Subject, Status,  RecordTypeId,Priority, OwnerId, ActivityDate, Id, Description   From Task where Id=:ApexPages.currentPage().getParameters().get('id') all rows];
            if(taskList!=null && taskList.size()!=0){
                taskRecord = taskList.get(0);
                
                system.debug('@@@task record'+taskRecord);
            }
            
            RecordType rec=[select Name FROM RecordType  where id=:taskRecord.RecordTypeId];
            List<Pricing_Request__c> prList;
            List<Project_Price__c> projList;
            
            if(taskRecord.WhatId <> NULL)
            {
                system.debug('@@@task record whatId'+taskRecord.whatId);
                //<PP20130715> -- <NS20130821> Added Landing_Cost__c field to query select clause
                /*prList=[select F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,
CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
Sent_To_Backup_Approver__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name, 
Project_Header_Approval_Flag__c,NPC_Status__c,Landing_Cost__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request__c where Id=:taskRecord.whatId];*/
                
                prList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','pricingRequest',' Id = \''+taskRecord.whatId+'\'');        
                System.debug('** prList '+prList);
                System.debug('** prList size '+prList.size());
                projList=[select Id,Name,Project_Id__c,Project_Description__c,Project_Volume__c,Valid_From__c,Valid_To__c from Project_Price__c where id=:taskRecord.WhatId];
            }
            if(projList!=null && projList.size()!=0)
            {
                projectPrice = projList.get(0);
                
                //<PP20130715>                
                /*prListForProject=[select F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Standardized_Currency__c,Standardized_UoM__c,Id, Request_Class__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
LastActivityDate, IsDeleted, Incoterm__c, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,
CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
Sent_To_Backup_Approver__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
Project_Header_Approval_Flag__c,NPC_Status__c  ,Landing_Cost__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request__c where Project_Id__c =: projectPrice.Project_Id__c ORDER BY LastModifiedDate DESC];*/
                
                prListForProject = (List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','pricingRequest',' Project_Id__c = \''+projectPrice.Project_Id__c+'\' ORDER BY LastModifiedDate DESC');                    
            }                                 
            System.debug('** project list size '+prListForProject.size());
            System.debug('**pricing Request'+pricingRequest);
            if(prList!=null && prList.size()!=0)
            {
                pricingRequest =    prList.get(0);
            }
            else if(prListForProject!=null && prListForProject.size()!=0)
            {
                pricingRequest = prListForProject.get(0);
            }
            if(projList!=null && projList.size()!=0)
            {
                projectPrice = projList.get(0);
                system.debug('***projectprice.Valid_From__c'+projectPrice.Valid_From__c);
                if( projectPrice.Valid_From__c<=Date.today() && taskRecord.Status !='In Progress' && taskRecord.Status !='Completed' && projectPrice.Valid_To__c>=Date.today())
                {
                    taskRecord.Status='In Progress';
                    update taskRecord;
                    system.debug('***status'+ taskRecord.status);
                }
                
                
            }
            recordTypeName=rec.Name;
            
            
        }
        
        
        else if((currentPageId.subString(0,3) == schema.sobjecttype.Pricing_Request__c.getKeyPrefix())) 
        {
            
            //<PP20130715>
            /*pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,
CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
Sent_To_Backup_Approver__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name, 
Project_Header_Approval_Flag__c ,NPC_Status__c,Landing_Cost__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request__c WHERE Id =: ApexPages.currentPage().getParameters().get('id')];*/
            
            pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','pricingRequest',' Id = \''+ApexPages.currentPage().getParameters().get('id')+'\''))[0];                  
            
            system.debug('***in constr check here'+pricingRequest);  
            
            projectprice=new Project_Price__c();
            //added by anand on 8 Mar starts
            if( pricingRequest.Project_Price__c!=null)
            {
                System.debug('***in setter of proj');
                /*List<Project_Price__c> projList=[select Id,Project_Id__c,Name,Project_status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Project_Volume__c, Default_Discount__c,Valid_From__c,
Valid_To__c,status__c From Project_Price__c where Id=:pricingRequest.Project_Price__c];*/
                
                List<Project_Price__c> projList = (List<Project_Price__c>)PAQueryUtil.query('PARequestItem','projectPrice',' Id =\''+pricingRequest.Project_Price__c+'\'');                                  
                
                if(projList!=null && projList.size()!=0)
                {
                    projectprice=projList.get(0);
                }
                System.debug('***in setter of request'+projectprice);
            }
            else if(pricingRequest.Project_Id__c !=null )
            {
                /*List<Project_Price__c> projList1=[select Id,Project_Id__c,Name,Project_status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,
Valid_To__c,status__c From Project_Price__c where Project_Id__c=:pricingRequest.Project_Id__c];*/
                
                List<Project_Price__c> projList1 = (List<Project_Price__c>)PAQueryUtil.query('PARequestItem','projectPrice',' Project_Id__c =\''+pricingRequest.Project_Id__c+'\'');
                if(projList1!=null && projList1.size()!=0)
                {
                    projectprice=projList1.get(0);
                }
                System.debug('***in setter of request'+projectprice);
            }
            //added by anand on 8 Mar ends
            
            //getRecordsToDisplay();  
        }
        
        else if(currentPageId.subString(0,3) == schema.sobjecttype.Project_Price__c.getKeyPrefix())
        {
            /*projectPrice = [SELECT id,Project_Id__c,Name,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,Sold_To_Code__c,Default_Discount__c,Pricing_Condition_Code__c,
Pricing_Condition__c,CreatedBy.Name,Project_Volume__c,Valid_From__c,Valid_To__c,status__c,Project_status__c
FROM Project_Price__c WHERE Id =: currentPageId ];*/
            
            projectPrice = ((List<Project_Price__c>)PAQueryUtil.query('PARequestItem','projectPrice',' Id =\''+currentPageId+'\''))[0];
            
            system.debug('***ID'+projectPrice);              
            //<PP20130715>              
            /*list<Pricing_Request__c> priceRequestlist  = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,
CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
Sent_To_Backup_Approver__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name, Project_Header_Approval_Flag__c ,NPC_Status__c ,Landing_Cost__c,
ComPartner__c,ComPartner_Code__c 
FROM Pricing_Request__c WHERE Project_Id__c =: projectPrice.Project_Id__c ORDER BY LastModifiedDate DESC];*/
            
            list<Pricing_Request__c> priceRequestlist = (List<Pricing_Request__c>)PAQueryUtil.query('PARequestItem','priceRequestlist',' Project_Id__c =\''+projectPrice.Project_Id__c+'\' ORDER BY LastModifiedDate DESC');  
            
            pricingRequest = priceRequestlist[0];   
            system.debug('@@@@@@@pricing request'+pricingRequest);
            getProjectTaskRecords();
        }   
        
        //paServiceState = new PAServiceState();
        paServiceState.ogItems = new PAOrganizationalGroupItems();
        paServiceState.erpCustomer = new PAERPCustomer(paServiceState);
        system.debug('@@@@@@@pricing request BU '+pricingRequest.BU__c);
        paServiceState.ogitems.selectedBU = [select Business__c FROM OrgGroup__c WHERE Business__c=:pricingRequest.BU__c].Id;
        //request = paServiceState.currentRequest;
        //Ver-5.19 starts - putting this NUll condition for Massive and non-customer specific requests 
        if(pricingRequest.soldto_code__c <> NULL)
        {
            //<BB20140508> -- Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query.
            /*paServiceState.erpCustomer.PAERPCustomer   = [SELECT Id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c,
Distribution_Channel_Code__c,Distribution_channel__c,
Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
Customer_Price_Group__c,Price_List_type__c,
price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c,
sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,
Zip_Postal_Code__c,Customer_Group_2_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c 
WHERE Customer_code__c=:pricingRequest.soldto_code__c AND sales_org_code__c=:pricingRequest.sales_org_code__c
AND Distribution_Channel_Code__c=:pricingRequest.Dist_channel_code__c
AND Division_code__c=:pricingRequest.Division_code__c limit 1];*/
            List<ERP_Customer__c> customerList = (List<ERP_Customer__c>)PAQueryUtil.query('PARequestItem','paServiceState.erpCustomer.PAERPCustomer',' Customer_code__c= \''+pricingRequest.soldto_code__c+'\' AND sales_org_code__c=\''+pricingRequest.sales_org_code__c+'\' AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+pricingRequest.Division_code__c+'\' limit 1');
            paServiceState.erpCustomer.PAERPCustomer = customerList[0];
            
            paServiceState.erpCustomer.divCode = paServiceState.erpCustomer.PAERPCustomer.Division_code__c;
            paServiceState.erpCustomer.distCode =  paServiceState.erpCustomer.PAERPCustomer.Distribution_Channel_Code__c;
            paServiceState.erpCustomer.salesOrgCode =paServiceState.erpCustomer.PAERPCustomer.sales_org_code__c;
            paServiceState.erpCustomer.salesArea = pricingRequest.Sales_Org_Code__c+'-'+pricingRequest.Sales_Org__c+LINE_BREAK+pricingRequest.Dist_Channel_Code__c+'-'+pricingRequest.Dist_Channel__c+LINE_BREAK+pricingRequest.Division_Code__c+'-'+pricingRequest.Division__c;
        }
        //Ver-5.19 ends
        request = new PARequest(paServiceState);
        paServiceState.currentRequest = request;
        approvalWF = new PAApprovalWF(paServiceState);
        request.approvalWF = approvalWF;
        paServiceState.ogitems.ogItemFromRequest(pricingRequest);
        if(request.requestServiceState.erpCustomer <> NULL)
            request.customer = request.requestServiceState.erpCustomer;
        request.pricingCondition = new PAPricingCondition(request.requestServiceState);
        request.keyCombination = new PAKeyCombination(request.requestServiceState);
        paServiceState.currentRequest.salesPriceSAP =new PASalesPriceSAP(paServiceState);
        request.requestServiceState.currentProjectPrice = new PAProjectPrice(paServiceState);
        request.projectprice = projectprice;     
        request.pricingRequestId = pricingRequest.Id;
        
        this.paProjectPrice=(PAProjectPrice)paServiceState.currentProjectPrice;
        PricingConditionState = new PAPricingCondition(paServiceState);
        
    }
    
    /*
* Author      :   
* Method Name  :   notesAttachment
* Parameters   :   -
* Return type  :   void
* Description  :  TO BE-Prachi
*/
    public void notesAttachment(list<Attachment> addAttachments)
    {   
        system.debug('addAttachments'+addAttachments);
        for(Attachment attach : addAttachments){
            PAWrapper paAttach = new PAWrapper();
            paAttach.sobjectRecord = attach;
            if(attachPAWrapperList ==null)
                attachPAWrapperList = new List<PAWrapper>();
            
            attachPAWrapperList.add(paAttach);
        }
        system.debug('#####'+attachPAWrapperList.size());
    }
    
    // Version 4.6 starts
    
    /*
* Author      :   
* Method Name  :   toGetSapRecordsOfProject
* Parameters   :   -
* Return type  :   void
* Description  :   This method pupulates the project records from sap on click of AddProject Material Button 
*/
    private void toGetSapRecordsOfProject()
    {
        //<PP20130427> -- Ver 5.31
        separator = PAUtil.determineLocaleSeparator();
        //Added - Bala March 1
        List<PARelatedList> sapRelatedList = paProjectPrice.getListWrappers(); 
        List<ERP_Sales_Prices_SAP__c> tempList = new List<ERP_Sales_Prices_SAP__c>();
        Map<String,Schema.FieldSet> fieldSetMap = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap();
        List<Schema.FieldSetMember> kcFields = fieldSetMap.get('PAPricingRecordsColumns').getFields();
        List<Schema.FieldSetMember> commonFields = fieldSetMap.get('PAPricingRecordCommonColumns').getFields();
        List<Schema.FieldSetMember> soldToFields = fieldSetMap.get('PASoldTo').getFields();
        List<Schema.FieldSetMember> commonSet = new List<Schema.FieldSetMember>();
        String sObjectName = ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
        List<Schema.FieldSetMember> dateFields = fieldSetMap.get('PAPricingRecordDateColumns').getFields();
        List<PARelatedList> relatedListProject = new List<PARelatedList>();
        List<ERP_Sales_Prices_SAP__c> sapListRecords = new List<ERP_Sales_Prices_SAP__c>();
        
        system.debug('**** SAP Related List'+sapRelatedList); 
        List<PAWrapper> sapWrapperList = new List<PAWrapper>();//sapRelatedList[i].wrapperList;
        List<PAWrapper> reqWrapperList = new List<PAWrapper>();//relatedWrappersList[i].wrapperList;
        
        for(Integer i =0;i<sapRelatedList.size();i++)
        {
            sapWrapperList.addAll(sapRelatedList[i].wrapperList);
        }
        for(Integer i =0;i<relatedWrappersList.size();i++)
        {
            reqWrapperList.addAll(relatedWrappersList[i].wrapperList);
        }
        
        List<Id> idsToBeRemoved = new List<Id>();
        Map<Id,Pricing_Request_Item__c> sapPriReqItemMap = new Map<Id,Pricing_Request_Item__c>();
        Map<Id,ERP_Sales_Prices_SAP__c> sapRecordsMap = new Map<Id,ERP_Sales_Prices_SAP__c>();
        string conCat;
        set<string> PCKCConcatSet = new set<string>();
        Map<string,List<ERP_Sales_Prices_SAP__c>> pcKCConcatSAP = new Map<string,List<ERP_Sales_Prices_SAP__c>>();
        
        for(PAWrapper wrap:reqWrapperList)
        {
            Pricing_Request_Item__c prq = (Pricing_Request_Item__c)wrap.sObjectRecord;
            sapPriReqItemMap.put(prq.ERP_Sales_Prices_SAP__c,prq);
        }
        for(PAWrapper wrap:sapWrapperList)
        {
            ERP_Sales_Prices_SAP__c erpSales = (ERP_Sales_Prices_SAP__c)wrap.sObjectRecord;
            sapRecordsMap.put(erpSales.Id,erpSales);
        }
        for(Id sapId:sapRecordsMap.keySet())
        {
            if(sapPriReqItemMap.get(sapId)!=null)
            {
                idsToBeRemoved.add(sapId);
            } 
        }              
        for(Id ids:idsToBeRemoved)
        {
            sapRecordsMap.remove(ids); 
        }
        
        
        
        for(ERP_Sales_Prices_SAP__c ERPSales : sapRecordsMap.values())
        {
            tempList = new List<ERP_Sales_Prices_SAP__c>();
            concat =  ERPSales.Pricing_Condition_Code__c + '-' +ERPSales.Pricing_Condition__c + ':' +ERPSales.Key_Combination_Code__c + '-' +ERPSales.Key_Combination__c;
            PCKCConcatSet.add(concat);
            if(pcKCConcatSAP.get(concat)!=null)
            {
                tempList = pcKCConcatSAP.get(concat);
                tempList.add(ERPSales);
                pcKCConcatSAP.put(concat,tempList);
            }
            else
            {
                tempList.add(ERPSales);
                pcKCConcatSAP.put(concat,tempList);
            }
        }
        for(String s : PCKCConcatSet)
        {
            
            PARelatedList c = new PARelatedList(); 
            c.wrapperList = new List<PAWrapper>();
            List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
            for(Schema.FieldSetMember fSet : kcFields)
            {   
                String fLabel = fSet.getLabel();
                String replacedS = s.replace('Material Price Group','');
                String replacedEU = s.replace('End User','');
                if(fLabel.contains('Material') &&(!fLabel.contains('Price'))&&(replacedS.contains('Material')))
                {
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Material Price Group') &&(s.contains('Material Price Group')))
                {
                    kcSet.add(fSet);
                }
                if(!fLabel.contains('Material') &&(s.remove(' ').toLowerCase().contains(fLabel.remove(' ').toLowerCase()) || s.remove(' ').toLowerCase().contains(fLabel.replace(' Code','').remove(' ').toLowerCase())))
                {
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Product Hierarchy') &&(s.contains('PH')))
                {
                    if(replacedS.contains('Material'))
                    {
                        if(fLabel != 'Product Hierarchy')
                            kcSet.add(fSet);
                    }
                    else
                        kcSet.add(fSet);
                }
                //Added extra field Profit Center
                if(fLabel.contains('Profit Center') &&(s.contains('FRB')))
                {
                    kcSet.add(fSet);
                    
                }
                if(fLabel.contains('End User') &&(s.contains('End User')))
                {
                    kcSet.add(fSet);                    
                }
                if(fLabel.contains('End Use') && (!fLabel.contains('End User')) && (replacedEU.contains('End Use')))
                {
                    kcSet.add(fSet);
                    
                }
            }
            c.keyCombinationColumns = kcSet;
            
            for(Schema.FieldSetMember cSet : commonFields)
            {
                String cLabel = cSet.getLabel();
                if(!cLabel.contains('Per') && !cLabel.contains('UoM'))
                {
                    
                    kcSet.add(cSet);
                }
            }
            c.priceType = s;
            c.keyCombinationColumns = kcSet;
            c.sObjectTypeName=sObjectName;
            system.debug('KCSet'+c.keyCombinationColumns);
            for(ERP_Sales_Prices_SAP__c ERPSales : pcKCConcatSAP.get(s))
            {
                PAWrapper rw = new PAWrapper();
                rw.stringMap =new map<string,string>();
                rw.stringMap.put('disableCheckBox','false');
                rw.stringMap.put('rateLocale','');
                //<PP20130427> -- Ver 5.31 START
                if(!String.isBlank(ERPSales.Rate__c))
                {
                    rw.stringMap.put('rateLocale',ERPSales.Rate__c.replace('.',separator));
                }
                //<PP20130427> -- Ver 5.31 END
                rw.isSelected = false;
                rw.sObjectRecord = ERPSales;
                c.wrapperList.add(rw);
            }
            relatedListProject.add(c);
            
        }
        
        paProjectPrice.relatedListSAPRecord = relatedListProject;
    }  // Version 4.6 ends
    /*
* Author      :   
* Method Name  :   getProjectTaskRecords
* Parameters   :   -
* Return type  :   void
* Description  :   TO BE -Anand
*/
    public void getProjectTaskRecords()
    {          
        //<PP20130427> -- Ver 5.31
        separator = PAUtil.determineLocaleSeparator();   
        relatedListProjectTaskRecords = new List<PARelatedList>();
        relatedWrappersList=new List<PARelatedList>();
        list<ERP_Sales_Prices_SAP__c> projectRecordList;
        //<VR20130509> Ver 5.33 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query    
        /*projectRecordList =[SELECT Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,
Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,
PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,
Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,
ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_Ref__c,Project_Id__c,Calculation_Type__c,Calculation_Type_Code__c,
Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,SAP_Cluster__c,
ComPartner__c,ComPartner_Code__c 
FROM ERP_Sales_Prices_SAP__c where Project_Id__c=:projectPrice.Project_Id__c AND Project_Id__c <> NULL ORDER BY Approved_Date__c DESC];*/
        system.debug(LoggingLevel.Error,'projectPrice.Project_Id__c is '+projectPrice.Project_Id__c);
        projectRecordList = (List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PARequestItem', 'projectRecordList', ' Project_Id__c = \''+projectPrice.Project_Id__c+'\' AND Project_Id__c <> NULL ORDER BY Approved_Date__c DESC');
        
        //Shiva Start ver-2.0 start -- for getting the latest Approved records
        Set<ERP_Sales_Prices_SAP__c> priceHolderSet =new Set<ERP_Sales_Prices_SAP__c>();
        List<ERP_Sales_Prices_SAP__c> nonPriceHolderList =new List<ERP_Sales_Prices_SAP__c>();
        Map<Id,List<ERP_Sales_Prices_SAP__c>> newChildRecMap = new Map<Id,List<ERP_Sales_Prices_SAP__c>>();
        system.debug('****Project List'+projectRecordList.size());
        for(ERP_Sales_Prices_SAP__c rec1: projectRecordList)
        {
            if(rec1.Price_Holder__c == null) 
            {
                priceHolderSet.add(rec1);
                
            }
            else
            {
                nonPriceHolderList.add(rec1);
                if(!newChildRecMap.containskey(rec1.Price_Holder__c))
                {
                    List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
                    l1.add(rec1);
                    newChildRecMap.put(rec1.Price_Holder__c,l1);
                }     
                else
                {       
                    List<ERP_Sales_Prices_SAP__c> hRecList = newChildRecMap.get(rec1.Price_Holder__c);
                    hRecList.add(rec1);
                    newChildRecMap.put(rec1.Price_Holder__c,hRecList);
                } 
            }
        }
        
        List<ERP_Sales_Prices_SAP__c> finalProjectRecList = new List<ERP_Sales_Prices_SAP__c>(); 
        for(Id X:newChildRecMap.keyset())
        {
            List<ERP_Sales_Prices_SAP__c> sortProjectRecList = new List<ERP_Sales_Prices_SAP__c>();
            if(newChildRecMap.containsKey(X)){
                sortProjectRecList = newChildRecMap.get(X);
            }
            finalProjectRecList.add(sortProjectRecList[0]);
        }
        
        //Shiva End ver 2.0 end
        
        system.debug('***projectRecordList'+projectRecordList);
        Set<String> PCKCConcatSet = new Set<String>();
        string concat ;
        List<ERP_Sales_Prices_SAP__c> tempList;
        Map<string,List<ERP_Sales_Prices_SAP__c>> pcKCConcatSAP = new Map<string,List<ERP_Sales_Prices_SAP__c>>(); 
        for(ERP_Sales_Prices_SAP__c ERPSales : finalProjectRecList)
        {
            tempList = new List<ERP_Sales_Prices_SAP__c>();
            concat =  ERPSales.Pricing_Condition_Code__c + '-' +ERPSales.Pricing_Condition__c + ':' +ERPSales.Key_Combination_Code__c + '-' +ERPSales.Key_Combination__c;
            PCKCConcatSet.add(concat);
            if(pcKCConcatSAP.get(concat)!=null)
            {
                tempList = pcKCConcatSAP.get(concat);
                tempList.add(ERPSales);
                pcKCConcatSAP.put(concat,tempList);
            }
            else
            {
                tempList.add(ERPSales);
                pcKCConcatSAP.put(concat,tempList);
            }
        }
        // Modified - Bala Feb 27
        Map<String,Schema.FieldSet> fieldSetMap = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap();
        List<Schema.FieldSetMember> kcFields = fieldSetMap.get('PAPricingRecordsColumns').getFields();
        System.debug('KCFields@@'+kcFields);
        List<Schema.FieldSetMember> commonFields = fieldSetMap.get('PAPricingRecordCommonColumns').getFields();
        List<Schema.FieldSetMember> soldToFields = fieldSetMap.get('PASoldTo').getFields();
        List<Schema.FieldSetMember> commonSet = new List<Schema.FieldSetMember>();
        String sObjectName = ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
        List<Schema.FieldSetMember> dateFields = fieldSetMap.get('PAPricingRecordDateColumns').getFields();
        for(String s : PCKCConcatSet)
        {
            
            PARelatedList c = new PARelatedList(); 
            c.wrapperList = new List<PAWrapper>();
            List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
            for(Schema.FieldSetMember fSet : kcFields)
            {
                String fLabel = fSet.getLabel();
                String replacedS = s.replace('Material Price Group','');
                String replacedEU = s.replace('End User','');
                if(fLabel.contains('Material') &&(!fLabel.contains('Price'))&&(replacedS.contains('Material')))
                {
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Material Price Group') &&(s.contains('Material Price Group')))
                {
                    kcSet.add(fSet);
                }
                if(!fLabel.contains('Material') &&(s.remove(' ').toLowerCase().contains(fLabel.remove(' ').toLowerCase()) || s.remove(' ').toLowerCase().contains(fLabel.replace(' Code','').remove(' ').toLowerCase())))
                {
                    kcSet.add(fSet);
                }
                if(fLabel.contains('Product Hierarchy') &&(s.contains('PH')))
                {
                    if(replacedS.contains('Material'))
                    {
                        if(fLabel != 'Product Hierarchy')
                            kcSet.add(fSet);
                    }
                    else
                        kcSet.add(fSet);
                }
                //Added extra field Profit Center
                if(fLabel.contains('Profit Center') &&(s.contains('FRB')))
                {
                    kcSet.add(fSet);                                    
                }
                if(fLabel.contains('End User') &&(s.contains('End User')))
                {
                    kcSet.add(fSet);                    
                }
                if(fLabel.contains('End Use') && (!fLabel.contains('End User')) && (replacedEU.contains('End Use')))
                {
                    kcSet.add(fSet);
                    
                }
            } 
            
            System.debug('KCFields@@'+kcSet);
            c.keyCombinationColumns = kcSet;
            
            for(Schema.FieldSetMember cSet : commonFields)
            {
                String cLabel = cSet.getLabel();
                if(!cLabel.contains('Per') && !cLabel.contains('UoM'))
                {
                    kcSet.add(cSet);
                }
            }
            
            
            c.priceType = s;
            c.keyCombinationColumns = kcSet;
            c.sObjectTypeName=sObjectName;
            system.debug('KCSet'+c.keyCombinationColumns);
            //Ver 1.1 END  
            
            
            for(ERP_Sales_Prices_SAP__c ERPSales : pcKCConcatSAP.get(s))
            {
                PAWrapper rw = new PAWrapper();
                rw.stringMap =new map<string,string>();
                rw.stringMap.put('disableCheckBox','false');
                rw.stringMap.put('rateLocale','');
                //<PP20130427> -- Ver 5.31 START
                if(!String.isBlank(ERPSales.Rate__c))
                {
                    rw.stringMap.put('rateLocale',ERPSales.Rate__c.replace('.',separator));
                }
                //<PP20130427> -- Ver 5.31 END
                rw.isSelected = false;
                rw.sObjectRecord = ERPSales;
                c.wrapperList.add(rw);
                
            }
            relatedListProjectTaskRecords.add(c);    
        }
        system.debug('****relatedListProjectTaskRecords'+relatedListProjectTaskRecords);    
    } 
    private void changeRateBasedOnLocale(Map<String,String> tempStorageMap){ 
        pricingReqItem.New_Rate__c = tempStorageMap.get('newRate');
        //pricingReqItem.New_Base_Floor__c = tempStorageMap.get('newBaseFloor');
        //pricingReqItem.New_Markup_Percentage__c = Decimal.valueOf(tempStorageMap.get('newMarkup'));
        pricingReqItem.Rate__c = tempStorageMap.get('rate');
        pricingReqItem.Quantity__c = tempStorageMap.get('quantity');
        if(pricingReqItem.Scaled_Price_Flag__c)
        {
            pricingReqItem.ScaleRate1__c = tempStorageMap.get('ScaleRate1'); //Success- not an exception 
            pricingReqItem.ScaleRate2__c = tempStorageMap.get('ScaleRate2');
            pricingReqItem.ScaleRate3__c = tempStorageMap.get('ScaleRate3');
            pricingReqItem.ScaleRate4__c = tempStorageMap.get('ScaleRate4');
            pricingReqItem.ScaleRate5__c = tempStorageMap.get('ScaleRate5');
            pricingReqItem.ScaleRate6__c = tempStorageMap.get('ScaleRate6');
            pricingReqItem.ScaleRate7__c = tempStorageMap.get('ScaleRate7');
            pricingReqItem.ScaleRate8__c = tempStorageMap.get('ScaleRate8');
            pricingReqItem.ScaleRate9__c = tempStorageMap.get('ScaleRate9');
            pricingReqItem.ScaleRate10__c = tempStorageMap.get('ScaleRate10');
            relatedNonSAPList(tempStorageMap);
        }
        
    }
    
    
    //Added -neeharika
    private String calculateBestScaleRate(Pricing_Request_Item__c pri){
        String highestQuantity;
        Map<String,String> mapofScaleQuantityAndRates=new Map<String,String>();
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value1__c,pri.ScaleRate1__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value2__c,pri.ScaleRate2__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value3__c,pri.ScaleRate3__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value4__c,pri.ScaleRate4__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value5__c,pri.ScaleRate5__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value6__c,pri.ScaleRate6__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value7__c,pri.ScaleRate7__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value8__c,pri.ScaleRate8__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value9__c,pri.ScaleRate9__c);
        mapofScaleQuantityAndRates.put(pri.Scale_Quantity_Scale_Value10__c,pri.ScaleRate10__c);
        
        Set<String> quantityList=mapofScaleQuantityAndRates.keySet();
        List<Decimal> sortedQuantityList=new List<Decimal>();
        for(String s: quantityList){
            if(s!=null){ //removing those quantities which are null
                sortedQuantityList.add(Decimal.valueOf(s));
            }
        }
        if(sortedQuantityList!=null && sortedQuantityList.size()!=0){
            sortedQuantityList.sort();
            highestQuantity=mapofScaleQuantityAndRates.get(String.valueOf(sortedQuantityList.get(sortedQuantityList.size()-1)));
            
        }
        system.debug('\n\n\n highestQuantity '+highestQuantity);
        return highestQuantity;
        
    }
    //added -neeha end
    
    //Added - bala for NPC  
    public class FlrPriceSection
    {
        
        public string price{get;set;}
        public string Rate{get;set;}
        public string unit{get;set;}
        public string per{get;set;}
        public string UoM{get;set;}
        public boolean scl{get;set;}
        public Pricing_Request_Item__c prIteminWrapper{get;set;}
        
        public Decimal convRatePercent{get;set;}
        public FlrPriceSection()
        {
            prIteminWrapper = new Pricing_Request_Item__c();
        }
        
    }
    
    public List<FlrPriceSection> floorRefWrapper{
        get
        {       System.debug('*****pricingReqItem'+pricingReqItem+'**id'+pricingReqItem.Id);
         if(pricingReqItem!=null && pricingReqItem.Id!=null){
             Decimal standardDecimal = 1.1;
             String localeDecimalStr = standardDecimal.format();
             String seperator = localeDecimalStr.subString(1,2);
             boolean isRateDecimal = true;
             
             if(pricingReqItem.New_rate__c!=null){
                 System.debug('****pricingReqItem.New_rate__c'+pricingReqItem.New_rate__c+'***seperator'+seperator);
                 pricingReqItem.New_Rate__c= pricingReqItem.New_rate__c.replace(seperator,'.');
                 System.debug('****pricingReqItem.New_rate__c'+pricingReqItem.New_rate__c);
                 try{
                     Decimal.ValueOf(pricingReqItem.New_Rate__c);
                 }
                 catch(exception e){
                     isRateDecimal = false;
                 }
             }
             //<PP20130524> -- Ver 5.36
             if(isRateDecimal)
             {
                 calculateNewRateWithPlusMinus();
                 List<FlrPriceSection> fpsList = new List<FlrPriceSection>();
                 Map<Integer,string> mapForRef = new Map<Integer,string>{1=>'Current Rate',2=>'New Rate',3=>'Converted Current Rate',4=>'Delta Current',5=>'Floor',6=>'Delta Floor',7=>'Reference',8=>'Delta Reference'};
                     if(pricingReqItem!=null && pricingReqItem.Id!=null)
                 {
                     System.debug('****Stamp_Converted_Current_Price__c'+pricingReqItem.Stamp_Converted_Current_Price__c);
                     System.debug('****pricingReqItem.New_Rate__cFLRREF'+pricingReqItem.New_Rate__c);
                     for(Integer i=1;i<=8;i++)
                     {
                         FlrPriceSection fps = new FlrPriceSection();
                         fps.price = mapForRef.get(i);
                         if(i==1)
                         {   fps.prIteminWrapper=pricingReqItem;
                          fps.Rate = pricingReqItem.Rate__c;
                          fps.unit = pricingReqItem.Unit__c;
                          fps.per = String.valueOf(pricingReqItem.per__c);
                          fps.uom = pricingReqItem.UoM__c;
                          
                          //added by neeharika - scaled flag for current price should be taken from pricing record
                          List<ERP_Sales_Prices_SAP__c> erpSapList = [SELECT Id,Scaled_Price_Flag__c FROM ERP_Sales_Prices_SAP__c WHERE Id = :pricingReqItem.ERP_Sales_Prices_SAP__c];
                          if(erpSapList!=null && erpSapList.size()!=0){ 
                              fps.scl  = erpSapList[0].Scaled_Price_Flag__c;
                          }
                          //fps.scl = pricingReqItem.Scaled_Price_Flag__c;
                         }
                         else if(i==2){
                             fps.prIteminWrapper=pricingReqItem;
                             fps.Rate = pricingReqItem.New_Rate__c;
                             fps.scl = pricingReqItem.Scaled_Price_Flag__c;
                             
                         }
                         else if(i==3)
                             fps.Rate = pricingReqItem.Stamp_Converted_Current_Price__c;
                         else if(i==4){
                             //<PP20131216>
                             if(!String.isBlank(pricingReqItem.Stamp_Converted_Current_Price__c) && !String.isBlank(pricingReqItem.New_Rate__c))
                             {
                                 fps.Rate = String.valueOf(Decimal.valueOf(pricingReqItem.New_Rate__c)-Decimal.valueOf(pricingReqItem.Stamp_Converted_Current_Price__c));
                                 if(Decimal.valueOf(pricingReqItem.Stamp_Converted_Current_Price__c)!=0)
                                     fps.convRatePercent = Decimal.valueOf(fps.Rate) / Decimal.valueOf(pricingReqItem.Stamp_Converted_Current_Price__c) * 100;
                             }
                         }
                         else if(i==5)
                             fps.Rate = pricingReqItem.Stamp_Floor_Price__c;
                         
                         else if(i==6)
                         {
                             //<PP20131216>
                             if(!String.isBlank(pricingReqItem.Stamp_Floor_Price__c) && !String.isBlank(pricingReqItem.New_Rate__c))
                             {
                                 fps.Rate = String.valueOf(Decimal.valueOf(pricingReqItem.New_Rate__c)-Decimal.valueOf(pricingReqItem.Stamp_Floor_Price__c));
                                 if(Decimal.valueOf(pricingReqItem.Stamp_Floor_Price__c)!=0)
                                     fps.convRatePercent = Decimal.valueOf(fps.Rate) / Decimal.valueOf(pricingReqItem.Stamp_Floor_Price__c) * 100;
                             }
                         }  
                         else if(i==7)
                             fps.Rate = pricingReqItem.Stamp_Reference_Price__c;
                         else if(i==8)
                         {
                             //<PP20131216>
                             if(!String.isBlank(pricingReqItem.Stamp_Reference_Price__c) && !String.isBlank(pricingReqItem.New_Rate__c))
                             {
                                 fps.Rate = String.valueOf(Decimal.valueOf(pricingReqItem.New_Rate__c)-Decimal.valueOf(pricingReqItem.Stamp_Reference_Price__c));
                                 if(Decimal.valueOf(pricingReqItem.Stamp_Reference_Price__c)!=0)
                                     fps.convRatePercent = Decimal.valueOf(fps.Rate) / Decimal.valueOf(pricingReqItem.Stamp_Reference_Price__c) * 100;
                             }
                         }       
                         if(i!=1)
                         {
                             //for all records except first put New Unit and so on
                             fps.unit = pricingReqItem.New_Unit__c;
                             fps.per = String.valueOf(pricingReqItem.New_per__c);
                             fps.uom = pricingReqItem.New_UoM__c;
                             
                         }
                         if(fps.convRatePercent!=null){
                             fps.convRatePercent=    fps.convRatePercent.setScale(1,System.Roundingmode.HALF_EVEN);
                         }
                         if(!((i==1 || i==3 || i==4) && fps.rate==null)) //added not to add Current rate,Converted Current rate into the wrapper in case Current rate is null
                             fpsList.add(fps);
                     }
                 }
                 /*adding it for locale */
                 if(pricingReqItem.New_Rate__c!=null){
                     pricingReqItem.New_Rate__c = pricingReqItem.New_rate__c.replace('.',seperatorOnPage);
                 }
                 System.debug('****pricingReqItem.New_Rate__cFLRREF'+pricingReqItem.New_Rate__c);
                 return fpsList;
             }
             return null;
             /*end*/
             
         }
         return null; 
        }
        set;}   
    //<PP20130424> -- Ver 5.28 START
    private void populateUtilUoMMaps()
    {
        String replacedKeyComb = pricingReqItem.Key_Combination__c.replace('Material Price Group','');
        if(replacedKeyComb.containsIgnoreCase('Material'))
        {
            Set<String> matCodeSet = new Set<String>(); 
            //Start--Changes for IS ID-00072189(Time Limit Exceeded-Adding Material) done by Kunal Sharma(752081)
            if(pricingReqItem.Material_Code__c !=null){
                //End--Changes for IS ID-00072189(Time Limit Exceeded-Adding Material) done by Kunal Sharma(752081)   
                matCodeSet.add(pricingReqItem.Material_Code__c);
            }
            //<BB20130715>  --Ver 5.41 Replaced populateBaseUoM with populateBaseUoMAndAlternateUoM
            //Start--Changes for IS ID-00072189(Time Limit Exceeded-Adding Material) done by Kunal Sharma(752081)
            if(!(matCodeSet.isEmpty())){
                //End--Changes for IS ID-00072189(Time Limit Exceeded-Adding Material) done by Kunal Sharma(752081)
                PAUtil.populateBaseUoMAndAlternateUoM(matCodeSet, request.pricingRequest.Sales_Org_Code__c + ':' +request.pricingRequest.Dist_Channel_Code__c + ':' +request.pricingCondition.pricingCondition.SAP_Cluster__c);
                PAUtil.populateSourceUoMNumDeno(matCodeSet, request.pricingCondition.pricingCondition.SAP_Cluster__c);
            }
        }
    }
    private void standardizeRate()
    {
        if(request.pricingRequest !=null && !String.isBlank(request.pricingRequest.Standardized_Currency__c) /*&& !String.isBlank(request.pricingRequest.Standardized_UoM__c)*/ && request.pricingCondition.pricingCondition != null && request.pricingCondition.pricingCondition.Calculation_Type__c != null
           &&(request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount')
              || request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Quantity')))
        {
            //<BB20130715> --Ver 5.41 checking if currency conversion rate is defined.
            String stdCurrency = request.pricingRequest.Standardized_Currency__c;
            String stdUoM = request.pricingRequest.Standardized_UoM__c;
            
            if(PAUtil.conversionRateMap.get(pricingReqItem.New_Unit__c) != null && PAUtil.conversionRateMap.get(request.pricingRequest.Standardized_Currency__c) != null)
            {
                //<MS20150105> Added checkBaseUOM to method arguments
                pricingReqItem = PAUtil.standardizeRate(pricingReqItem, request.pricingCondition.pricingCondition, request.pricingRequest.Sales_Org_Code__c,request.pricingRequest.Dist_Channel_Code__c, stdCurrency, stdUoM,request.requestServiceState.ogItems.orgGroupItems.Base_UoM__c);
            }
            else 
            {
                throw new PAException(Label.Invalid_Currency_Error,ApexPages.severity.Error);
            }        
        }
    }
    //<PP20130424> -- Ver 5.28 END
    //<PP20130524> -- Ver 5.36 START
    private void calculateNewRateWithPlusMinus()
    {
        Decimal roundOfRate;
        if(!String.isBlank(pricingReqItem.New_Rate__c))
        {
            roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c);
            if(!String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c))
            {
                roundOfRate = roundOfRate.abs();
            }
            //Added !String.isBlank condition
            if(!String.isBlank(request.pricingCondition.pricingCondition.Plus_Minus_Code__c)
               && request.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X')
            {
                roundOfRate= (-1) * roundOfRate;
            }
            else{
                roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c);
                if(roundOfRate<0)
                    roundOfRate = (-1)*roundOfRate.abs();
                else
                    roundOfRate = roundOfRate.abs();
            }
            pricingReqItem.New_Rate__c = String.valueOf(roundOfRate);
        }
        
        system.debug('plusMinus**'+request.pricingCondition.pricingCondition.Plus_Minus_Code__c);
        system.debug('plusMinus&&&'+ pricingReqItem.New_Rate__c);
    }
    //<PP20130524> -- Ver 5.36 END
    //<PP20130614> -- Added for NPC Applicable check - Ver 5.37 START
    private boolean checkNPCApplicability()
    {
        Organizational_Group_Item__c buOrgGroup;
        buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c FROM Organizational_Group_Item__c WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE
                                                                                                                 Business__c = :request.pricingRequest.BU__c AND RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c =
                      :request.pricingRequest.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c =
                      :request.pricingRequest.Dist_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
        List<ERP_Access_Sequence__c> accessSequenceList = new List<ERP_Access_Sequence__c>();
        accessSequenceList = [SELECT Id FROM ERP_Access_Sequence__c WHERE Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND
                              Pricing_Key_Combination__r.SAP_Application_Id__c = :pricingReqItem.SAP_Application_Id__c AND
                              Pricing_Key_Combination__r.SAP_Client_Id__c = :pricingReqItem.SAP_Client_Id__c AND
                              Pricing_Condition__r.Pricing_Condition_Code__c = :pricingReqItem.Pricing_Condition_Code__c AND
                              Pricing_Key_Combination__r.Key_Combination_Code__c = :pricingReqItem.Key_Combination_Code__c AND
                              Pricing_Condition__r.SAP_Cluster__c = :pricingReqItem.SAP_Cluster__c AND Pricing_Condition__r.SAP_Application_Id__c =
                              :pricingReqItem.SAP_Application_Id__c AND Pricing_Condition__r.SAP_Client_Id__c = :pricingReqItem.SAP_Client_Id__c AND
                              Pricing_Key_Combination__r.SAP_Cluster__c = :pricingReqItem.SAP_Cluster__c AND isNPCApplicable__c = true];
        if(accessSequenceList.size()==0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }  
    //<PP20130614> -- Added for NPC Applicable check - Ver 5.37 END
    //<PP20140512> START
    public boolean projectPC {get;set;}
    public void pcKcChange()
    {
        if(accSeqId != '--Select--')
        {
            system.debug('View state:');
            request.relatedListRequestItemsList = new  List<PARelatedList>(); 
            request.relatedListERPSalesList = new List<PARelatedList> ();
            request.customer.orgGroupUserList = new List<Organizational_Group_User__c>();
            request.customer.oguIdSet = new Set<Id>();
            //erpAccSeqIdToRecMap = new Map<Id,ERP_Access_Sequence__c>();
            /*request.requestServiceState.rpqReporting.quoteHighlightrep1 = new RPQReportHandler.QuoteHighlight();
request.requestServiceState.rpqReporting.quoteHighlightrep2 = new RPQReportHandler.QuoteHighlight();
request.requestServiceState.rpqReporting.quoteHighlightrep3 = new RPQReportHandler.QuoteHighlight();
request.requestServiceState.rpqReporting.quoteHighlightrep4 = new RPQReportHandler.QuoteHighlight();
*/
            //request.requestServiceState.ogItems = new PAOrganizationalGroupItems();
            /*request.requestServiceState.erpCustomer.distChannelCodesList = new List<String>();
request.requestServiceState.erpCustomer.divisionCodesList = new List<String>();
request.requestServiceState.erpCustomer.userNameToOrgGrpMap = new Map<String,Set<Id>>();

//system.debug('requestServiceState- distChannelCodesList:'+request.requestServiceState.erpCustomer.distChannelCodesList.clear());
//system.debug('requestServiceState- divisionCodesList:'+request.requestServiceState.erpCustomer.divisionCodesList.clear());
system.debug('requestServiceState:'+request.requestServiceState);
system.debug('currentRequest:'+request.relatedWrappersList);
system.debug('currentRequestItem-relatedWrappersList :'+request.requestServiceState.currentRequestItem.relatedWrappersList);
system.debug('customer:'+request.customer);
system.debug('exportWrapList:'+request.exportWrapList);
system.debug('attachPAWrapperList:'+request.attachPAWrapperList);
system.debug('relatedListRequestItemsList:'+request.relatedListRequestItemsList);
system.debug('relatedListERPSalesList:'+request.relatedListERPSalesList);
system.debug('pricingExceptionList:'+request.pricingExceptionList);
system.debug('pricingReqItemList:'+request.pricingReqItemList);
system.debug('pricingReqItemList:'+request.pricingReqItemList);
System.debug('orgGroupUserList:'+request.customer.orgGroupUserList);
system.debug('currentRequestItem:'+request.requestServiceState.currentRequestItem);
system.debug('ogItems:'+request.requestServiceState.ogItems);
system.debug('approvalSetup:'+request.requestServiceState.approvalSetup);
system.debug('productHierarchy:'+request.requestServiceState.productHierarchy);
system.debug('currentProjectPrice:'+request.requestServiceState.currentProjectPrice);
system.debug('currentNPCRequest:'+request.requestServiceState.currentNPCRequest);
system.debug('rpqReporting:'+request.requestServiceState.rpqReporting);
System.debug('*****request.pricingRequest.BU__c'+request.pricingRequest.BU__c+request.pricingRequest.Sales_Org_Code__c+request.pricingRequest.Division_Code__c+request.pricingRequest.Dist_Channel_Code__c);
system.debug('currentRequest:'+request.relatedWrappersList);
System.debug('*****request.pricingRequest.BU__c'+request.pricingRequest.BU__c+request.pricingRequest.Sales_Org_Code__c+request.pricingRequest.Division_Code__c+request.pricingRequest.Dist_Channel_Code__c);
*/
            pricingReqItem = new Pricing_Request_Item__c();
            //System.debug('request.requestServiceState.erpCustomer:-'+request.requestServiceState.erpCustomer);
            //<TJ20141106> START
            if(request!=null && request.pricingRequest!=null && request.pricingRequest.Request_Type__c=='Massive' && request.requestServiceState.erpCustomer!=null)
                pricingReqItem.Sold_To_Code__c=request.requestServiceState.erpCustomer.customerCode;
            //<TJ20141106> END
            System.debug('erpAccSeqIdToRecMap:-'+erpAccSeqIdToRecMap);
            System.debug('accSeqId:-'+accSeqId);
            
            ERP_Access_Sequence__c aSeq = erpAccSeqIdToRecMap.get(accSeqId);
            system.debug('aSeq is '+aSeq);
            if(aSeq == null)
                aSeq = new ERP_Access_Sequence__c();
            pricingReqItem.Pricing_Condition_Code__c = aSeq.Pricing_Condition__r.Pricing_Condition_Code__c;
            pricingReqItem.Pricing_Condition__c = aSeq.Pricing_Condition__r.Pricing_Condition__c;
            pricingReqItem.Key_Combination_Code__c = aSeq.Pricing_Key_Combination__r.Key_Combination_Code__c;
            pricingReqItem.Key_Combination__c = aSeq.Pricing_Key_Combination__r.Key_Combination__c;
            pricingReqItem.Key_Combination_SFDC__c = aSeq.Key_Combination__c;
            
            if(aSeq.Key_Combination__c != null && aSeq.Key_Combination__c.containsIgnoreCase('Project'))
            {
                projectPC=true;
            }
            else
            {
                projectPC=false;
            }
            if(!String.isBlank(aSeq.Floor_Key_Combination__c) || !String.isBlank(aSeq.Floor_Pricing_Condition__c)
               || !String.isBlank(aSeq.Reference_Key_Combination__c) || !String.isBlank(aSeq.Reference_Pricing_Condition__c))
            {
                pricingReqItem.isFloorApplicable__c = true;
            }
            else
            {
                pricingReqItem.isFloorApplicable__c = false;
            }
            if(request.pricingRequest.Request_Type__c != 'Pricing Task')
            {
                pricingReqItem.isNPCApplicable__c = aSeq.isNPCApplicable__c;
                if(aSeq.isPaymentTermsApplicable__c && request.requestServiceState.ogItems.orgGroupItems.isPaymentTermsApplicable__c)
                {
                    pricingReqItem.isPaymentTermsApplicable__c = true;
                    enablePaymentTerms=true;
                }
                else
                {
                    pricingReqItem.isPaymentTermsApplicable__c = false;
                }
                //<AV20140515>-Added logic to check that volume is configured at both sales area and PC-KC level
                if(aSeq.isVolumeApplicable__c && request.requestServiceState.ogItems.orgGroupItems.isVolumeApplicable__c){
                    pricingReqItem.isVolumeApplicable__c = true;
                }
            }
            
            request.keyCombination.setKeyCombinationID(aSeq.Pricing_Key_Combination__c);
            request.pricingCondition.selectedPricingCondition = aSeq.Pricing_Condition__c;
            isRequestItemSaved = false;
            System.debug('****request.pricingRequest.Pricing_Request_Type__c'+request.pricingCondition.pricingCondition.Price_Types__c);
            if(request.pricingRequest.Request_Type__c!=null
               && (request.pricingRequest.Request_Type__c.contains('Non Customer Specific')))
            {
                if(request.pricingCondition != null && request.pricingCondition.pricingCondition != null && request.pricingCondition.pricingCondition.Price_Types__c != null
                   && request.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Floor')
                   && !request.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Floor'))
                    pricingReqItem.Pricing_Request_Type__c = 'Floor';
                else if(request.pricingCondition != null && request.pricingCondition.pricingCondition != null && request.pricingCondition.pricingCondition.Price_Types__c != null
                        && request.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Reference')
                        && !request.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Reference'))
                    pricingReqItem.Pricing_Request_Type__c = 'Reference';
                else if(request.pricingCondition != null && request.pricingCondition.pricingCondition != null && request.pricingCondition.pricingCondition.Price_Types__c != null
                        && request.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Floor'))
                    pricingReqItem.Pricing_Request_Type__c = 'Net Floor';
                else if(request.pricingCondition != null && request.pricingCondition.pricingCondition != null && request.pricingCondition.pricingCondition.Price_Types__c != null
                        && request.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Reference'))
                    pricingReqItem.Pricing_Request_Type__c = 'Net Reference';
                else
                    pricingReqItem.Pricing_Request_Type__c = 'Permanent';
            }
            else if(request.pricingRequest.Pricing_Request_Type__c!=null && request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing')
            {
                pricingReqItem.Pricing_Request_Type__c = 'Project';
            }
            else
            {
                pricingReqItem.Pricing_Request_Type__c = request.pricingRequest.Pricing_Request_Type__c;
            }
            
            //Only Ship-to enhancement
            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Sold to'))
            {
                //<TJ20141106> START
                if(request!=null && request.pricingRequest!=null && request.pricingRequest.Request_Type__c!='Massive')
                {
                    pricingReqItem.Sold_To_Code__c =   request.pricingRequest.SoldTo_Code__c;
                    pricingReqItem.Sold_To__c = request.pricingRequest.Sold_To__c;
                }
                //<TJ20141106> END
            }
            
            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales Org.'))
            {
                pricingReqItem.Sales_Org__c = request.pricingRequest.Sales_Org__c;
                pricingReqItem.Sales_Org_Code__c = request.pricingRequest.Sales_Org_Code__c;
            }
            System.debug('****pricingReqItem.Key_Combination__c'+pricingReqItem.Key_Combination__c);
            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Dist. Channel'))
            {
                pricingReqItem.Dist_Channel__c = request.pricingRequest.Dist_Channel__c;
                pricingReqItem.Dist_Channel_Code__c =request.pricingRequest.Dist_Channel_Code__c;
            }
            if(pricingReqItem.Key_Combination__c!=null && (pricingReqItem.Key_Combination__c).containsIgnoreCase('Division'))
            {
                pricingReqItem.Division__c = request.pricingRequest.Division__c;
                pricingReqItem.Division_Code__c = request.pricingRequest.Division_Code__c;
            }
            String replacedKeyComb ='';
            if(pricingReqItem.Key_Combination__c !=null)
                replacedKeyComb = pricingReqItem.Key_Combination__c.replace('Material Price Group','');
            if((replacedKeyComb!=null && !replacedKeyComb.containsIgnoreCase('Material')) && (pricingReqItem.Key_Combination__c !=null && !pricingReqItem.Key_Combination__c.containsIgnoreCase('PH')))
            {
                pricingReqItem.New_Valid_From__c = request.pricingRequest.Request_Valid_From__c;
                pricingReqItem.New_Valid_To__c = request.pricingRequest.Request_Valid_To__c;
                if(request.requestServiceState.ogItems.orgGroupItems.Default_Per_UoM_Setup__c=='Sales Area Config')
                {
                    pricingReqItem.New_Per__c=request.requestServiceState.ogItems.orgGroupItems.Default_Per_Value__c;
                    pricingReqItem.New_UoM__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c;                   
                }
                if(request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency' && request.pricingRequest.Pricing_Request_Type__c!='Pricing Task')
                {
                    pricingReqItem.New_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
                }
                else if(request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency' && request.pricingRequest.Pricing_Request_Type__c!='Pricing Task')
                {
                    
                    pricingReqItem.New_Unit__c=request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c;
                }                
            }
            else 
            {
                pricingReqItem.New_Per__c=null;
            }        
            if(request.pricingCondition.pricingCondition!=null && request.pricingCondition.pricingCondition.Calculation_Type__c!=null
               && (request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage')
                   || request.pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount')))
            {
                pricingReqItem.New_Per__c=null;
                pricingReqItem.New_UoM__c=null;
            }
            pricingReqItem.Customer_Specific__c =  request.pricingRequest.Customer_Specific__c;
            pricingReqItem.Approval_Status__c =  request.pricingRequest.Request_Approval_Status__c;
            pricingReqItem.SAP_Application_Id__c = request.pricingCondition.pricingCondition.SAP_Application_Id__c;
            pricingReqItem.SAP_Client_Id__c = request.pricingCondition.pricingCondition.SAP_Client_ID__c;
            pricingReqItem.SAP_Cluster__c = request.pricingCondition.pricingCondition.SAP_Cluster__c;
            request.phFilter=null;
            if(erpPriCondIdToScaleMap.containsKey(aSeq.Pricing_Condition__c) && erpPriCondIdToScaleMap.get(aSeq.Pricing_Condition__c) && request.requestServiceState.ogItems.orgGroupItems.Default_Value_for_Scaled_Prices__c == 'Scale')
            {
                pricingReqItem.Scaled_Price_Flag__c=true;
                if(request.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && request.requestServiceState.ogItems.orgGroupItems.Default_Per_UoM_Setup__c=='Sales Area Config' && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
                {
                    pricingReqItem.Scale_UoM_Scale_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c;
                }
                if(request.pricingCondition.pricingCondition.Scale_Base__c=='Value Scale' && request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency' && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
                {
                    pricingReqItem.Scale_UoM_Scale_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
                }                
                else if(request.pricingCondition.pricingCondition.Scale_Base__c=='Value Scale' && request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency' && pricingReqItem.Scale_UoM_Scale_Unit__c==null)
                {
                    
                    pricingReqItem.Scale_UoM_Scale_Unit__c=request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c;
                }
            }
            else
                pricingReqItem.Scaled_Price_Flag__c=false;
            
            if(erpPriCondIdToScaleMap.containsKey(aSeq.Pricing_Condition__c) && erpPriCondIdToScaleMap.get(aSeq.Pricing_Condition__c))
                enableScale = 'true';
            else
                enableScale = 'false';              
            if(request.pricingRequest.Spot_Type__c == 'Free of Charge')
            {
                pricingReqItem.New_Rate__c ='0';
            }
            /* if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
{               
if(request.requestServiceState.ogItems.orgGroupItems.Default_Per_UoM_Setup__c=='Sales Area Config')
{
pricingReqItem.New_Per__c=request.requestServiceState.ogItems.orgGroupItems.Default_Per_Value__c;
pricingReqItem.New_UoM__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_UoM__c;
}
if(request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency')
{
pricingReqItem.New_Unit__c=request.requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
}                
else if(request.requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency')
{

pricingReqItem.New_Unit__c=request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c;
}
system.debug('Curr: '+pricingReqItem.New_Unit__c+' '+request.requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c);
}*/            
            
        }
        //<MS20140515>Adding variantFilter and salesOrderType
        else
        {
            pricingReqItem = new Pricing_Request_Item__c();
            if(request.pricingRequest.Pricing_Request_Type__c!=null && request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing')
            {
                pricingReqItem.Pricing_Request_Type__c = 'Project';
            }
            else
            {
                pricingReqItem.Pricing_Request_Type__c = request.pricingRequest.Pricing_Request_Type__c;
            }
            //<TJ20141106> START
            if(request!=null && request.pricingRequest!=null && request.pricingRequest.Request_Type__c!='Massive')
            {               
                pricingReqItem.Sold_To_Code__c = request.pricingRequest.SoldTo_Code__c;
                pricingReqItem.Sold_To__c = request.pricingRequest.Sold_To__c;
            }
            //<TJ20141106> END
            request.keyCombination.keyCombinationID = null;
            request.pricingCondition.selectedPricingCondition = null;
            request.soldToFilter = null;
            request.materialFilter = null; 
            request.phFilter = null;
            request.profitCenterFilter = null;
            request.cpgFilter = null;
            //Piyush <PG20202707>
            request.distFilter = null;
            request.priceListTypeFilter = null;
            request.discRefFilter = null;
            request.mpgFilter = null;
            request.paymentTermsFilter = null;
            request.salesOfficeFilter = null;
            request.salesDistrictFilter = null;
            request.shipToFilter = null;
            request.priceRefPartnerFilter = null;
            request.endUseFilter = null;
            request.marketSegmentFilter = null;
            request.endUserFilter = null;
            request.countryFilter = null;
            request.customerHierarchyFilter = null;
            request.incotermsFilter = null;
            request.shipToCountryFilter = null;
            request.variantFilter = null;
            request.salesOrderTypeFilter = null;
            request.comPartnerFilter = null;
            request.materialGroup5KeyFilter = null;
            request.kcodeFilter = null;
            //<MS20141114>
            request.projectFilter = null;
            request.materialGroup1Filter = null;
            request.partnerZFFilter = null;
            request.payerFilter = null;
            request.discRefNoFilter = null;
            request.fixValDateFilter = null;
            request.campaignFilter = null;
            request.documentCurrencyFilter = null;
            request.stateFilter = null;
        }   
        //erpAccSeqIdToRecMap = new Map<Id,ERP_Access_Sequence__c>();
        system.debug('State , request.requestServiceState.ogItems:'+request.requestServiceState.ogItems);
        system.debug('State , request.requestServiceState.erpCustomer:'+request.requestServiceState.erpCustomer);
        system.debug('State , request.requestServiceState.currentRequest:'+request.requestServiceState.currentRequest);
        system.debug('State , request.requestServiceState.salesPriceSAP:'+request.requestServiceState.currentRequest.salesPriceSAP);
        system.debug('State , request.requestServiceState.currentRequestItem:'+request.requestServiceState.currentRequestItem);
        
        
    }
    //<PP20140512> END
    
    //<TJ20140731>
    public void relatedNonSAPList(Map<string,string> tempStorageMap)
    {
        if(relatedERPSAPPrice != null)
        {
            relatedERPSAPPrice.ScaleRate1__c = tempStorageMap.get('erpScaleRate1');
            relatedERPSAPPrice.ScaleRate2__c = tempStorageMap.get('erpScaleRate2');
            relatedERPSAPPrice.ScaleRate3__c = tempStorageMap.get('erpScaleRate3');
            relatedERPSAPPrice.ScaleRate4__c = tempStorageMap.get('erpScaleRate4');
            relatedERPSAPPrice.ScaleRate5__c = tempStorageMap.get('erpScaleRate5');
            relatedERPSAPPrice.ScaleRate6__c = tempStorageMap.get('erpScaleRate6');
            relatedERPSAPPrice.ScaleRate7__c = tempStorageMap.get('erpScaleRate7');
            relatedERPSAPPrice.ScaleRate8__c = tempStorageMap.get('erpScaleRate8');
            relatedERPSAPPrice.ScaleRate9__c = tempStorageMap.get('erpScaleRate9');
            relatedERPSAPPrice.ScaleRate10__c = tempStorageMap.get('erpScaleRate10');
        }
        else if(relatedNonSAPPrice!=null)
        {
            relatedNonSAPPrice.ScaleRate1__c = tempStorageMap.get('erpScaleRate1');
            relatedNonSAPPrice.ScaleRate2__c = tempStorageMap.get('erpScaleRate2');
            relatedNonSAPPrice.ScaleRate3__c = tempStorageMap.get('erpScaleRate3');
            relatedNonSAPPrice.ScaleRate4__c = tempStorageMap.get('erpScaleRate4');
            relatedNonSAPPrice.ScaleRate5__c = tempStorageMap.get('erpScaleRate5');
            relatedNonSAPPrice.ScaleRate6__c = tempStorageMap.get('erpScaleRate6');
            relatedNonSAPPrice.ScaleRate7__c = tempStorageMap.get('erpScaleRate7');
            relatedNonSAPPrice.ScaleRate8__c = tempStorageMap.get('erpScaleRate8');
            relatedNonSAPPrice.ScaleRate9__c = tempStorageMap.get('erpScaleRate9');
            relatedNonSAPPrice.ScaleRate10__c = tempStorageMap.get('erpScaleRate10');
        }
    }
    public void relatedNonSAPScaleList()
    {
        pricingReqItem.Scale_Quantity_Scale_Value1__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value1__c;
        pricingReqItem.Scale_Quantity_Scale_Value2__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value2__c;
        pricingReqItem.Scale_Quantity_Scale_Value3__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value3__c;
        pricingReqItem.Scale_Quantity_Scale_Value4__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value4__c;
        pricingReqItem.Scale_Quantity_Scale_Value5__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value5__c;
        pricingReqItem.Scale_Quantity_Scale_Value6__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value6__c;
        pricingReqItem.Scale_Quantity_Scale_Value7__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value7__c;
        pricingReqItem.Scale_Quantity_Scale_Value8__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value8__c;
        pricingReqItem.Scale_Quantity_Scale_Value9__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value9__c;
        pricingReqItem.Scale_Quantity_Scale_Value10__c=relatedNonSAPPrice.Scale_Quantity_Scale_Value10__c;
        pricingReqItem.Scale_UoM_Scale_Unit__c=relatedNonSAPPrice.Scale_UoM_Scale_Unit__c;
        pricingReqItem.ScaleRate1__c=relatedNonSAPPrice.ScaleRate1__c;
        pricingReqItem.ScaleRate2__c=relatedNonSAPPrice.ScaleRate2__c;
        pricingReqItem.ScaleRate3__c=relatedNonSAPPrice.ScaleRate3__c;
        pricingReqItem.ScaleRate4__c=relatedNonSAPPrice.ScaleRate4__c;
        pricingReqItem.ScaleRate5__c=relatedNonSAPPrice.ScaleRate5__c;
        pricingReqItem.ScaleRate6__c=relatedNonSAPPrice.ScaleRate6__c;
        pricingReqItem.ScaleRate7__c=relatedNonSAPPrice.ScaleRate7__c;
        pricingReqItem.ScaleRate8__c=relatedNonSAPPrice.ScaleRate8__c;
        pricingReqItem.ScaleRate9__c=relatedNonSAPPrice.ScaleRate9__c;
        pricingReqItem.ScaleRate10__c=relatedNonSAPPrice.ScaleRate10__c;
    }
    public void relatedNonSAPScaleList1(string decimalSeparator)
    {
        relatedNonSAPPrice.ScaleRate1__c=(relatedNonSAPPrice.ScaleRate1__c==null ? null : (relatedNonSAPPrice.ScaleRate1__c.contains('.') ? relatedNonSAPPrice.ScaleRate1__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate1__c));
        relatedNonSAPPrice.ScaleRate2__c=(relatedNonSAPPrice.ScaleRate2__c==null ? null : (relatedNonSAPPrice.ScaleRate2__c.contains('.') ? relatedNonSAPPrice.ScaleRate2__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate2__c));
        relatedNonSAPPrice.ScaleRate3__c=(relatedNonSAPPrice.ScaleRate3__c==null ? null : (relatedNonSAPPrice.ScaleRate3__c.contains('.') ? relatedNonSAPPrice.ScaleRate3__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate3__c));
        relatedNonSAPPrice.ScaleRate4__c=(relatedNonSAPPrice.ScaleRate4__c==null ? null : (relatedNonSAPPrice.ScaleRate4__c.contains('.') ? relatedNonSAPPrice.ScaleRate4__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate4__c));
        relatedNonSAPPrice.ScaleRate5__c=(relatedNonSAPPrice.ScaleRate5__c==null ? null : (relatedNonSAPPrice.ScaleRate5__c.contains('.') ? relatedNonSAPPrice.ScaleRate5__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate5__c));
        relatedNonSAPPrice.ScaleRate6__c=(relatedNonSAPPrice.ScaleRate6__c==null ? null : (relatedNonSAPPrice.ScaleRate6__c.contains('.') ? relatedNonSAPPrice.ScaleRate6__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate6__c));
        relatedNonSAPPrice.ScaleRate7__c=(relatedNonSAPPrice.ScaleRate7__c==null ? null : (relatedNonSAPPrice.ScaleRate7__c.contains('.') ? relatedNonSAPPrice.ScaleRate7__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate7__c));
        relatedNonSAPPrice.ScaleRate8__c=(relatedNonSAPPrice.ScaleRate8__c==null ? null : (relatedNonSAPPrice.ScaleRate8__c.contains('.') ? relatedNonSAPPrice.ScaleRate8__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate8__c));
        relatedNonSAPPrice.ScaleRate9__c=(relatedNonSAPPrice.ScaleRate9__c==null ? null : (relatedNonSAPPrice.ScaleRate9__c.contains('.') ? relatedNonSAPPrice.ScaleRate9__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate9__c));
        relatedNonSAPPrice.ScaleRate10__c=(relatedNonSAPPrice.ScaleRate10__c==null ? null : (relatedNonSAPPrice.ScaleRate10__c.contains('.') ? relatedNonSAPPrice.ScaleRate10__c.replace('.',decimalSeparator) : relatedNonSAPPrice.ScaleRate10__c));
    }
    public void relatedNonSAPScaleList2(Map<string,string> tempStorageMap)
    {
        tempStorageMap.put('erpScaleRate1',relatedNonSAPPrice.ScaleRate1__c);
        tempStorageMap.put('erpScaleRate2',relatedNonSAPPrice.ScaleRate2__c);
        tempStorageMap.put('erpScaleRate3',relatedNonSAPPrice.ScaleRate3__c);
        tempStorageMap.put('erpScaleRate4',relatedNonSAPPrice.ScaleRate4__c);
        tempStorageMap.put('erpScaleRate5',relatedNonSAPPrice.ScaleRate5__c);
        tempStorageMap.put('erpScaleRate6',relatedNonSAPPrice.ScaleRate6__c);
        tempStorageMap.put('erpScaleRate7',relatedNonSAPPrice.ScaleRate7__c);
        tempStorageMap.put('erpScaleRate8',relatedNonSAPPrice.ScaleRate8__c);
        tempStorageMap.put('erpScaleRate9',relatedNonSAPPrice.ScaleRate9__c);
        tempStorageMap.put('erpScaleRate10',relatedNonSAPPrice.ScaleRate10__c);
    }
    public String getDynamicFormatString(decimal value)
    {
        String formattedValue = value.format();
        String thousandSep = formattedValue.substring(1,2);
        return '{0,number,#'+thousandSep+'###'+thousandSep+'###'+thousandSep+'###'+thousandSep+'###'+thousandSep+'##0}';
    }
}