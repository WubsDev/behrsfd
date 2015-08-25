@isTest
public class UtilNovaUnitTest { 
/*
* @Method This method getUser is used to get a User
* @param Method is not having any parameters
* @return User - Method returning instance of User
* @throws exception - Method is not throwing any exception
*/ 
 public static User getUser(){ 
      String aliasString = 'resutset';
     Id sysAdminId = [Select Id from Profile Where Name = 'System Administrator' Limit 1].Id;
     User usr = new User(
     alias = aliasString, 
      email= aliasString+'@accenture.com',
     emailencodingkey='UTF-8',
     lastname='Testing', 
      languagelocalekey='en_US',
     localesidkey='en_US',
     profileid = sysAdminId,
     timezonesidkey='Europe/London',
     username= 'testforbehr@expl.com');
     insert usr;
     return usr;
}

/*
* @Method This method  getAccount is used to get a  Account
* @param Method is not having any parameters
* @return Account - Method returning instance of  Account
* @throws exception - Method is not throwing any exception
*/  
 public static Account getAccount() {
      Account accountSample=new Account();
      accountSample.Name='Test Account';

      return accountSample;
  }

/*
* @Method This method  getActual_Sales_Line_Items__c is used to get a  Actual_Sales_Line_Items__c
* @param Method is not having any parameters
* @return Actual_Sales_Line_Items__c - Method returning instance of  Actual_Sales_Line_Items__c
* @throws exception - Method is not throwing any exception
*/  
 public static Actual_Sales_Line_Items__c getActual_Sales_Line_Items_c() {
      Actual_Sales_Line_Items__c actual_sales_line_itemsSample=new Actual_Sales_Line_Items__c();
      actual_sales_line_itemsSample.Name='Test Actual_Sales_Line_Items__c';

      actual_sales_line_itemsSample.Cost__c=1.00;
      actual_sales_line_itemsSample.Line__c=1.0;
      actual_sales_line_itemsSample.Multiplier__c=1.00;
      actual_sales_line_itemsSample.Quantity__c=1.0;
      Actual_Sales__c sampleActual_Sales_c =getActual_Sales_c();
      insert sampleActual_Sales_c;

      actual_sales_line_itemsSample.SAP_Order__c = sampleActual_Sales_c.Id;
      actual_sales_line_itemsSample.external_id__c='Test Actual_Sales_Li';
      return actual_sales_line_itemsSample;
  }

/*
* @Method This method  getActual_Sales__c is used to get a  Actual_Sales__c
* @param Method is not having any parameters
* @return Actual_Sales__c - Method returning instance of  Actual_Sales__c
* @throws exception - Method is not throwing any exception
*/  
 public static Actual_Sales__c getActual_Sales_c() {
      Actual_Sales__c actual_salesSample=new Actual_Sales__c();
      actual_salesSample.Name='Test Actual_Sales__c';

      Account sampleAccount =getAccount();
      insert sampleAccount;

      actual_salesSample.Account_Name__c = sampleAccount.Id;
      Opportunity sampleOpportunity =getOpportunity();
      insert sampleOpportunity;

      actual_salesSample.Opportunity__c = sampleOpportunity.Id;
      return actual_salesSample;
  }


/*
* @Method This method  getLead is used to get a  Lead
* @param Method is not having any parameters
* @return Lead - Method returning instance of  Lead
* @throws exception - Method is not throwing any exception
*/  
 public static Lead getLead() {
      Lead leadSample=new Lead();
      leadSample.salutation='Mr.';
      leadSample.FirstName='Test LastName1232';
      leadSample.LastName='Test LastName';
      leadSample.Company = 'Accenture';
      leadSample.Email = 'testabc@ghjkl.com';
      leadSample.lastname = 'TestAbcName';
      leadSample.Company = 'ACBe';
      leadSample.Phone = '97889763846454';
      leadSample.Status = 'New';
      leadSample.LeadSource = 'RAM';
      leadSample.Sub_Lead_Source__c = 'Cold Call';
      leadSample.Estimated_Monthly_Paint_Usage__c ='>125 Gallons';
      leadSample.Behr_Rep_Contact__c ='Yes';
      insert leadSample;
      return leadSample;
  }
  

/*
* @Method This method  getCase is used to get a  Case
* @param Method is not having any parameters
* @return Case - Method returning instance of  Case
* @throws exception - Method is not throwing any exception
*/  
 public static Case getCase() {
      Case caseSample=new Case();
      caseSample.SuppliedEmail = 'test@salesforce.com';
      return caseSample;
  }



/*
* @Method This method  getDirect_Onboarding__c is used to get a  Direct_Onboarding__c
* @param Method is not having any parameters
* @return Direct_Onboarding__c - Method returning instance of  Direct_Onboarding__c
* @throws exception - Method is not throwing any exception
*/  
 public static Direct_Onboarding__c getDirect_Onboarding_c() {
      Direct_Onboarding__c direct_onboardingSample=new Direct_Onboarding__c();
      return direct_onboardingSample;
  }


/*
* @Method This method  getOpportunity is used to get a  Opportunity
* @param Method is not having any parameters
* @return Opportunity - Method returning instance of  Opportunity
* @throws exception - Method is not throwing any exception
*/  
 public static Opportunity getOpportunity() {
      Opportunity opportunitySample=new Opportunity();
      opportunitySample.Name='Test Opportunity';

      opportunitySample.CloseDate = System.today();
      opportunitySample.StageName ='Prospecting';
      
      return opportunitySample;
  }
  

/*
* @Method This method  getProduct2 is used to get a  Product2
* @param Method is not having any parameters
* @return Product2 - Method returning instance of  Product2
* @throws exception - Method is not throwing any exception
*/  
 public static Product2 getProduct2() {
      Product2 product2Sample=new Product2();
      product2Sample.Name='Test Product2';

      return product2Sample;
  }


/*
* @Method This method  getQuote is used to get a  Quote
* @param Method is not having any parameters
* @return Quote - Method returning instance of  Quote
* @throws exception - Method is not throwing any exception
*/  
 public static Quote getQuote() {
      Quote quoteSample=new Quote();
      quoteSample.Name='Test Quote';
      insert quoteSample;
      return quoteSample;
  }



}