/********************************************************************************
Change History:
            : <Alvin20160531> Added if condition to resolve production issue IS ID-00070422
            : <Bhargavi 20160919> Added new country Check (IS ID-00072470) 
********************************************************************************/
public class ExtractDMSController {

    public String ProfileName{get;set;}
    public Customer_Data_Request__c OnboardingReq{get;set;}
    public Customer_Data_Request__c OnboardingReqdetails{get;set;}

    public Boolean displayPage{get;set;}

    public Boolean existFlag{get;set;}
    public String recordData;
    public String APIName1{get; set;}
    public Static Id CurrentUserId{get;set;}
    public List <Attachment> attachemntsList{get;set;}
    public List <Customer_Data_Request_Line_Item__c> lineItemList{get;set;}
    public User RequestorUser{get;set;}
    public String RecordTypeName{get;set;}
    public Static Id selectedRecordTypeId;
    public Map<String, Schema.SObjectField> fldObjMap{get;set;}
    public ExtractDMSController(){

        displayPage=false;
        ProfileName = currentUserProfile();
        OnboardingReq = new Customer_Data_Request__c();
        recordData= ApexPages.currentPage().getParameters().get('param');
        attachemntsList = new List<Attachment>();
        lineItemList= new List<Customer_Data_Request_Line_Item__c>();
        CurrentUserId = userInfo.getUserId();
        RequestorUser = [Select Id, Name, Phone,Email from User where Id=:CurrentUserId ];
        attachemntsList =[select Id, Name,ParentId from Attachment where ParentId =:recordData];
        OnboardingReqdetails= getRequestInformation(recordData);


        //code changed for street and Office/House Number
        existFlag=false;
        if(OnboardingReqdetails.RecordType.name!='New Customer Creation'){
            existFlag=true;
        }

        String lineItemRef=OnboardingReqdetails.Name;


      lineItemList=[select Id, Name,Account_Group__c,City__c,Comments__c,Company_Code__c,Company_Name__c,Contact_Department__c,Contact_e_mail__c,
                      Contact_Fax__c,Customer_Contact_Function__c,Contact_Name__c,Contact_Telephone__c,Copy_Sold_To_Address__c,Country__c,Customer_Data_Request__c,
                      Customer_Number__c,Distribution_Channel__c,District__c,Division__c,Email_Address__c,External_Id__c,House_Supplement__c,
                      Incoterms_Part_1__c,Incoterms_Part_2__c,Fax_Number__c,Local_Language_City__c,Local_Language_Country__c,Local_Language_District__c,
                      Local_Language_House_Supplement__c,Local_Language_Office_House_Number__c,Local_Language_Postal_Code__c,Local_Language_Region__c,
                      Local_Language_State_Province__c,Local_Language_Street__c,Local_Language_Street2__c,Local_Language_Street3__c,Local_Language_Street4__c,
                      Local_Language_Street5__c,Local_Version__c,Name1__c,Name2__c,Name3__c,Name4__c,Office_House_Number__c,On_By_Indicator__c,P_O_Box__c,
                      P_O_Box_City__c,Partner_Function__c,ERP_Relationship_User__c,Partner_Number__c,Postal_Code__c,Region__c,Sales_Organization__c,
                      Shipping_Conditions__c,Ship_to_Delivery_Plant__c,Ship_to_Sales_Office__c,Street__c,Street2__c,Street3__c,Street4__c,Street5__c,
                      Telephone__c,RecordType.name,State_Province__c,Customer_Name__c,Customer_Name_2__c,Customer_Name_3__c,
                      Local_Language_Customer_Name_1__c,Local_language_Customer_Name_2__c,Local_language_Customer_Name_3__c,Local_language_Customer_Name_4__c,
                      Local_language_Data_Line__c,Local_language_Telebox__c,Local_language_Search_Terms__c,Customer_Name_4__c from Customer_Data_Request_Line_Item__c where Customer_Data_Request__R.name=:lineItemRef];  
        RecordTypeName=OnboardingReqdetails.RecordType.name;
        editFields();

    }


    public Customer_Data_Request__c getRequestInformation(Id reqId){
        Customer_Data_Request__c req = new Customer_Data_Request__c();

        fldObjMap = schema.SObjectType.Customer_Data_Request__c.fields.getMap();
        String querySearch= '';
        String query;
        for(String s :fldObjMap.KeySet()){
            querySearch = querySearch + s + ',';
        }
        querySearch = querySearch.removeEnd(',');
        query = 'Select '+  querySearch + ',RecordType.Name,CreatedBy.Id from Customer_Data_Request__c where Id=\''+reqId+'\'';
        req=database.query(query);
        return req;
    }

    public String currentUserProfile(){
        Id ProfileId = UserInfo.getProfileId();
        String profileName=[Select Id,Name from Profile where Id=:ProfileId].Name;
        return profileName;
    }


    public Pagereference exportAll(){
        return new Pagereference('/apex/exportAll');
    }

    public void editFields(){
        String[] modifiedList=new List<String>();
        String[] additionalModifiedList=new List<String>();
        String[] requestDetailsList=new List<String>();
        if(OnboardingReqdetails.Fields_Modified_1__c!=null){
            modifiedList=OnboardingReqdetails.Fields_Modified_1__c.split(';');

        }
        if(OnboardingReqdetails.Fields_Modified_2__c!=null){
            additionalModifiedList=OnboardingReqdetails.Fields_Modified_2__c.split(';');
        }

        if(RecordTypeName=='Extend Existing Customer'|| RecordTypeName=='Modify Existing Customer Data' ){
            System.debug('Inside Modify Data');
            //setting the request details default to not make blank
            requestDetailsList.add('Customer Data Request Number');
            requestDetailsList.add('Record Type');
            requestDetailsList.add('Request Description');
            requestDetailsList.add('Request Status');
            requestDetailsList.add('Priority');
            requestDetailsList.add('Requestor Phone Number');
            requestDetailsList.add('Requestor Email');
            requestDetailsList.add('Requestor Name');
            requestDetailsList.add('Sub – Business');
            requestDetailsList.add('Created By ID');
            requestDetailsList.add('Last Modified By ID');
            requestDetailsList.add('Last Modified Date');
            requestDetailsList.add('Created Date');
            requestDetailsList.add('Urgency');
            requestDetailsList.add('Last Viewed Date');
            requestDetailsList.add('Last Referenced Date');
            requestDetailsList.add('Owner');
            requestDetailsList.add('Deleted');
            requestDetailsList.add('System Modstamp');
            requestDetailsList.add('Last Activity Date');
            requestDetailsList.add('Currency');
            requestDetailsList.add('SF Region');
            requestDetailsList.add('SBU');
            requestDetailsList.add('Selling Company Code');
            requestDetailsList.add('Group Key');
            requestDetailsList.add('Sales Organization');
            requestDetailsList.add('Distribution Channel');
            requestDetailsList.add('Other Group Key');
            requestDetailsList.add('Division');
            requestDetailsList.add('Account Group');
            requestDetailsList.add('Sold-To Customer Number');
            requestDetailsList.add('Customer Number');
            requestDetailsList.add('Data Analyst Comments');
            requestDetailsList.add('CSR Comments');
            requestDetailsList.add('Country Credit Comments');
            requestDetailsList.add('Escalated Approver comments');
            requestDetailsList.add('Source Cluster');
            requestDetailsList.add('Fields Modified 1');
            requestDetailsList.add('Fields Modified 2');
            requestDetailsList.add('Approved Cash Management Group');
            requestDetailsList.add('Approved Cred.rep.grp');
            requestDetailsList.add('Approved Credit Information Number');
            requestDetailsList.add('Approved Credit Limit');
            requestDetailsList.add('Approved Credit Limit Currency Code');
            requestDetailsList.add('Approved Credit Term Type');
            requestDetailsList.add('Approved Customer Credit Group');

            requestDetailsList.add('Approved Customer Group');
            requestDetailsList.add('Approved Non Standard Terms of Payment');
            requestDetailsList.add('Approved Risk Category');
            requestDetailsList.add('Approved Terms of Payment');

            requestDetailsList.add('Approved Number of Orders per Month');
            requestDetailsList.add('Approved Average Monthly Purchases');  
            requestDetailsList.add('Last External Review');

            requestDetailsList.add('Last Internal Review');
            requestDetailsList.add('Next Internal Review');

            requestDetailsList.add('Approved Reference Date');
            requestDetailsList.add('Approved Payment Index');
            requestDetailsList.add('Approved Rating');
            requestDetailsList.add('Business Justification');
            requestDetailsList.add('Miscellaneous Type Intent');
            requestDetailsList.add('On/By Indicator');
            requestDetailsList.add('Tax Classification');

            //Added by Ashish for fixing PDF extract fields Missing issue.
            /*requestDetailsList.add('Website');
            requestDetailsList.add('Sold-to Street');
            requestDetailsList.add('Local Language House Supplement');
            requestDetailsList.add('Local Language City');
            requestDetailsList.add('Business Category');
            requestDetailsList.add('Ownership Type');
            requestDetailsList.add('Jurisdiction Code');
            requestDetailsList.add('Ultimate Consign Type (attribute 5)');
            requestDetailsList.add('CFOP');
            requestDetailsList.add('Business Strategic');
            requestDetailsList.add('GeoCode');
            requestDetailsList.add('Unloading Point');
            requestDetailsList.add('Tax Classification');
            requestDetailsList.add('Business partner ID/Grouping');
            requestDetailsList.add('Price Group');
            requestDetailsList.add('Local Version');
            requestDetailsList.add('P.O.Box City');
            requestDetailsList.add('Sold-to Region');
            requestDetailsList.add('Incoterms 1');
            requestDetailsList.add('Incoterms 2');*/

            //End----------


            Map<String, String> FieldLabelAPIMap = new Map <String, String>();
            // To get the Label - API Name Mapping

            for(String s :fldObjMap.KeySet()){
                
                s=s.toLowerCase();
                String sName= fldObjMap.get(s).getDescribe().getLabel();
               //  <Alvin20160531> Added if condition to resolve production issue IS ID-00070422             
                if(fldObjMap.get(s).getDescribe().isCalculated()==false){ // added if condition to prevent formulae fields coming 
                sName=sName.toLowerCase();
               
                FieldLabelAPIMap.put(sName,s);     
                }  
                
            }

            //getting the multiselect picklist values

            Map<String,String> MultipicklistMap = new Map <String,String>();
            for(String s: modifiedList){
                s=s.toLowerCase();
                MultipicklistMap.put(s,s);
            }
            for(String s1:additionalModifiedList){
               s1=s1.toLowerCase();
                MultipicklistMap.put(s1,s1);
            }
            for(String s2: requestDetailsList){
                s2=s2.toLowerCase();
                MultipicklistMap.put(s2,s2);
            }
            
            for(string s4 : FieldLabelAPIMap.KeySet()){
       
            
                if(FieldLabelAPIMap.get(s4) != 'util_customer_data_request_name__c'){
                    if(!MultipicklistMap.containsKey(s4)){
                    
                       APIName1 = FieldLabelAPIMap.get(s4);
                       system.debug('^^^^^^^^'+ APIName1);
                       if(!APIName1.contains('connection')) //<Bhargavi 20160919>
                       OnboardingReqDetails.put(APIName1,null);
                    }
                }
            }


        }
    }
}