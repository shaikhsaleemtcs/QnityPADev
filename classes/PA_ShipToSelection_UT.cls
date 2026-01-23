/*
Date : 29/12/2016
Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest
public class  PA_ShipToSelection_UT{
    
    
   static testMethod void  PAShipToSelection_UT() { 
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
       Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
      //UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_D630']; 
      /*
      UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces']; 
      system.debug('roleeeeeeeeee'+r);              
        //[27122016] Merge&Spin: Updated External ERP Id to Dummy Value 
      User u= new User(Firstname='test2test2',Alias='Hill', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest1',profileid = p.id,
                         Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
      */
       UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
       insert Ur;
       User usr = TestUserUtil.createTestUser(Ur.Id,p.Id,'User1 FirstName','User1 LastName');
       insert usr;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
      system.runAs(usr){
      
      ERP_Customer__c customer=new ERP_Customer__c();
      customer.Account_Group_Code__c='Z002';
      customer.Customer_Code__c='Sample-0001';
      insert customer;
      
      ERP_Relationship__c relationship=new ERP_Relationship__c();
      relationship.ERP_Customer__c=customer.id;
      relationship.Partner_Function_Code__c='ZH';
      relationship.ERP_Customer__c=customer.id;
      //relationship.ERP_Customer__r.Customer_Code__c=customer.Customer_Code__c;
      relationship.Related_ERP_Customer__c = customer.id;
      insert relationship;
                  
      PAShipToSelection ShipToSelection=new PAShipToSelection();
      ShipToSelection.shipToCustomerCode='Sample-0001';
      ShipToSelection.componentType='PriceRefPartner';
      ShipToSelection.action();
      ShipToSelection.displayPopUpWindow();
      ShipToSelection.dosearch();
      ShipToSelection.returnData();
      ShipToSelection.closeWindow();
      
      PAShipToSelection ShipToSelection1=new PAShipToSelection();
      ShipToSelection1.shipToCode='Sample';
      ShipToSelection.shipToCustomerCode='Sample-0001';
      ShipToSelection.componentType='CustomerHierarchy';
      ShipToSelection1.action();
      ShipToSelection1.displayPopUpWindow();
      //ShipToSelection1.dosearch();
      ShipToSelection1.returnData();
      ShipToSelection1.closeWindow();
      
      PAShipToSelection ShipToSelection2=new PAShipToSelection();
      ShipToSelection2.shipToCode='Sample';   
      ShipToSelection2.componentType='PriceRefPartner';
      ShipToSelection2.action();
      ShipToSelection2.displayPopUpWindow();
      //ShipToSelection2.dosearch();
      ShipToSelection2.returnData();
      ShipToSelection2.closeWindow();
      
      PAShipToSelection ShipToSelection3=new PAShipToSelection();
      ShipToSelection3.shipToCode='Sample';  
      ShipToSelection3.componentType='';
      ShipToSelection3.action();
      ShipToSelection3.displayPopUpWindow();
      //ShipToSelection3.dosearch();
      ShipToSelection3.returnData();
      ShipToSelection3.closeWindow();     
      ShipToSelection3.shipToCustomerCode='Sample-0001';
      
      PAShipToSelection ShipToSelection4=new PAShipToSelection();
      ShipToSelection4.shipToCustomerCode='Sample-0001';
      ShipToSelection4.componentType='EndUser';
      ShipToSelection4.action();
      ShipToSelection4.displayPopUpWindow();
      //ShipToSelection4.dosearch();
      ShipToSelection4.returnData();
      ShipToSelection4.closeWindow();
      
      PAShipToSelection ShipToSelection5=new PAShipToSelection();
      ShipToSelection5.shipToCustomerCode='Sample-0001';
      ShipToSelection5.shipToCode='Sample'; 
      ShipToSelection5.componentType='EndUser';
      ShipToSelection5.action();
      ShipToSelection5.displayPopUpWindow();
      //ShipToSelection5.dosearch();
      ShipToSelection5.returnData();
      ShipToSelection5.closeWindow();
      
      PAShipToSelection ShipToSelection6=new PAShipToSelection();
      ShipToSelection6.shipToCode='';    
      ShipToSelection6.componentType='';
      ShipToSelection6.action();
      ShipToSelection6.displayPopUpWindow();
      //ShipToSelection6.dosearch();
      ShipToSelection6.returnData();
      ShipToSelection6.closeWindow();     
      ShipToSelection6.shipToCustomerCode='Sample-0001';
      ShipToSelection6.enablePopUpBoolean= null;
      
      }                
                         
   }
   //pooja
   static testMethod void  PAShipToSelection1_UT() { 
       Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
      //UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_D630']; 
      /*
      UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces']; 
      system.debug('roleeeeeeeeee'+r);              
    // [27122016] Merge&Spin: Updated External ERP Id to Dummy Value
      User u= new User(Firstname='test2test2',Alias='Hill', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest2',profileid = p.id,
                         Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
      */
      UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
      insert Ur;
      User usr = TestUserUtil.createTestUser(Ur.Id,p.Id,'User1 FirstName','User1 LastName');
      insert usr;
      //End: Updated as a part of Merge & Spin to the change the UserRole name.
      system.runAs(usr){
      
      ERP_Customer__c customer=new ERP_Customer__c();
      customer.Account_Group_Code__c='Z012';
      customer.Customer_Code__c=' ';
      customer.City__c=' ';
      customer.Country__c=' ';
      customer.Name=' ';
      insert customer;
      
      ERP_Relationship__c relationship=new ERP_Relationship__c();
      relationship.ERP_Customer__c=customer.id;
      relationship.Partner_Function_Code__c='ZV';
      relationship.ERP_Customer__c=customer.id;
      //relationship.ERP_Customer__r.Customer_Code__c=customer.Customer_Code__c;
      relationship.Related_ERP_Customer__c = customer.id;
      insert relationship;
      
      ERP_Relationship__c relationship1=new ERP_Relationship__c();
      relationship1.ERP_Customer__c=customer.id;
      relationship1.Partner_Function_Code__c='ZF';
      relationship1.ERP_Customer__c=customer.id;
      //relationship1.ERP_Customer__r.Customer_Code__c=customer.Customer_Code__c;
      relationship1.Related_ERP_Customer__c = customer.id;
      insert relationship1;
      
      
      ERP_Relationship__c relationship2=new ERP_Relationship__c();
      relationship2.ERP_Customer__c=customer.id;
      relationship2.Partner_Function_Code__c='RG';
      relationship2.ERP_Customer__c=customer.id;
      //relationship2.ERP_Customer__r.Customer_Code__c=customer.Customer_Code__c;
      relationship2.Related_ERP_Customer__c = customer.id;
      insert relationship2;
      
      /*List<Org_Group_ERP_Key__c> orgERPKeyCountry = new List<Org_Group_ERP_Key__c>();
      
      Org_Group_ERP_Key__c trial = new Org_Group_ERP_Key__c();
      trial.ERP_Cus_Mat_Compt_Key__r.Type__c = 'Country';
      trial.ERP_Cus_Mat_Compt_Key__r.Code__c='Bond007';
      trial.ERP_Cus_Mat_Compt_Key__r.Name__c='JamesBond';
      trial.Organizational_Group_Item__r.Business__c='BI_EMEA_Surfaces';
      trial.Organizational_Group_Item__r.OrgGroup__r.ERP_Sales_Org_Code__c='G250';
      trial.Organizational_Group_Item__r.OrgGroup__r.ERP_Distribution_Channel_Code__c='10';
      trial.Organizational_Group_Item__r.OrgGroup__r.ERP_Division_Code__c='02';
      
      insert trial;
      
      Org_Group_ERP_Key__c trial1 = [select ERP_Cus_Mat_Compt_Key__r.Name__c from Org_Group_ERP_Key__c where Id = :trial.Id];
      
      //orgERPKeyCountry.add(trial);
      
      //insert orgERPKeyCountry;
      
      List<SelectOption> countrySelectList = new List<SelectOption>();
      countrySelectList.add(new selectoption(trial1.ERP_Cus_Mat_Compt_Key__r.Name__c,trial1.ERP_Cus_Mat_Compt_Key__r.Name__c));*/
      
  
      PAShipToSelection ShipToSelection=new PAShipToSelection();
      ShipToSelection.shipToCustomerCode='Sample-0001';
      ShipToSelection.componentType='CustomerHierarchy';
      //ShipToSelection.listOfCountry=countrySelectList;
      ShipToSelection.action();
      ShipToSelection.displayPopUpWindow();
      ShipToSelection.dosearch();
      ShipToSelection.returnData();
      ShipToSelection.closeWindow();
      
      
      PAShipToSelection ShipToSelection1=new PAShipToSelection();
      ShipToSelection1.shipToCode='Sample';    
      ShipToSelection1.componentType='Partner ZF';
      ShipToSelection1.action();
      ShipToSelection1.displayPopUpWindow();
      //ShipToSelection1.dosearch();
      ShipToSelection1.returnData();
      ShipToSelection1.closeWindow();     
      ShipToSelection1.shipToCustomerCode='Sample-0001';
      

      PAShipToSelection ShipToSelection2=new PAShipToSelection();
      ShipToSelection2.shipToCode='Sample';    
      ShipToSelection2.componentType='Payer';
      ShipToSelection2.action();
      ShipToSelection2.displayPopUpWindow();
      //ShipToSelection2.dosearch();
      ShipToSelection2.returnData();
      ShipToSelection2.closeWindow();     
      ShipToSelection2.shipToCustomerCode='Sample-0001';
      
      
      PAShipToSelection ShipToSelection7=new PAShipToSelection();
      ShipToSelection7.shipToCode='Sample';    
      ShipToSelection7.componentType='ComPartner';
      ShipToSelection7.action();
      ShipToSelection7.displayPopUpWindow();
      //ShipToSelection7.dosearch();
      ShipToSelection7.returnData();
      ShipToSelection7.closeWindow();     
      ShipToSelection7.shipToCustomerCode='Sample-0001';
      //ShipToSelection7.helpLink();


      PAShipToSelection ShipToSelection8=new PAShipToSelection();
      ShipToSelection8.business='BI EMEA';
      //ShipToSelection8.listOfCountry;
      ShipToSelection8.label='Home';
      ShipToSelection8.hasNext=true;
      ShipToSelection8.hasPrevious=true;
      ShipToSelection8.pageNumber=5;
      ShipToSelection8.first();
      ShipToSelection8.last();
      ShipToSelection8.previous();
      ShipToSelection8.next();
      Boolean abc = ShipToSelection8.enablePopUpBoolean;
      
      }
    }
}