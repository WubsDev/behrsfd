@isTest
private class Test_Behr_TotalPayoutTotal_China{
Static testmethod void Behr_TotalPayoutTotal_China(){

CurrencyType RMBrate = [SELECT ConversionRate FROM CurrencyType where IsoCode = 'RMB' Limit 1] ;
    Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
UserRole ur=new UserRole(Name='CM'); 
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        rpsm__c='test',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
 
        Account objparentacc = new Account();
       
        objparentacc.Name = 'Test Parent Account';
        objparentacc.Estimated_Annual_Spend__c = 1200;
        objparentacc.Market_Segment__c = 'Exporter';
        objparentacc.Lead_Source__c = 'ARCAT';   
        objparentacc.BillingStreet ='24,marg';
        objparentacc.BillingCity = 'kolkata';
        objparentacc.BillingState = 'Iowa';
        objparentacc.BillingPostalCode = '700061';
        objparentacc.BillingCountry ='United States';
       
        insert objparentacc ;
        
        
          Contact c = new Contact();
        c.AccountId = objparentacc.id;
        c.LastName = 'contact';
        c.FirstName = 'test';
        c.phone = '9876543210';
        c.Email = 'test@gmail.com';
        c.LeadSource = 'ARCAT'; 
        insert c;
        
        Payouts__c pay=new Payouts__c();
       pay.Status__c='pending'; 
        pay.Pro_Rep_Name__c=u.id;
        pay.Payout_Type__c='Product';
       
         pay.Account__c=objparentacc.id;
        // pay.Contractor_Name__c=c.id;
         insert pay;
         
         Products_China__c pro=new Products_China__c();
         pro.Material__c='aaa';
         pro.Retail_Price__c=100;
         insert pro;
         
         Payout_Product__c pp=new Payout_Product__c();
         
         pp.Payouts__c=pay.id;
         pp.Products_China__c=pro.id;
         pp.Quantity__c=10;
       
         insert pp;
         pp.Quantity__c=20;
         update pp;
         Payout_Product__c ppdel=new Payout_Product__c();
         
         ppdel.Payouts__c=pay.id;
         ppdel.Products_China__c=pro.id;
         ppdel.Quantity__c=10;
       
         insert ppdel;
         delete ppdel;


}
}