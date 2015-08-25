@isTest
private class Test_CreateCaseComment_China{
Static testmethod void test_CreateCaseComment_China(){
     /* Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
        UserRole ur=new UserRole(Name='CM'); 
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
        RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Account' and name = 'China Standard Account'];
        Account objparentacc = new Account();
        objparentacc.RecordTypeid = rt.id;
        objparentacc.Name = '3456546vnmbmTest Accountnmbnb,';
        objparentacc.Estimated_Annual_Spend__c = 1200;
        objparentacc.Market_Segment__c = 'Exporter';
        objparentacc.Lead_Source__c = 'ARCAT';   
        objparentacc.BillingStreet ='24,marg';
        objparentacc.BillingCity = 'kolkata';
        objparentacc.BillingState = 'Iowa';
         objparentacc.Source__c='Phone';
        objparentacc.BillingPostalCode = '700061';
        objparentacc.BillingCountry ='United States';
   
        insert objparentacc ;
        
        Account objacc = new Account();
        objacc.RecordTypeid = rt.id;
        objacc.Name = '34abc56sde546vnmbmTestancd Accountnmbnb,';
        objacc.Estimated_Annual_Spend__c = 1200;
        objacc.Market_Segment__c = 'Exporter';
        objacc.Lead_Source__c = 'ARCAT';   
        objacc.BillingStreet ='24,marg';
        objacc.BillingCity = 'kolkata';
        objacc.BillingState = 'Iowa';
        objacc.BillingPostalCode = '700061';
        objacc.BillingCountry ='United States';
      
        insert objacc;
        
        Contact c = new Contact();
        c.AccountId = objparentacc.id;
        c.LastName = 'contact';
        c.FirstName = 'test';
        c.phone = '9876543210';
        c.Email = 'test@gmail.com';
        c.LeadSource = 'ARCAT'; 
        insert c;
              
        
        RecordType rt1 = [select id, name 
                     from Recordtype 
                     where sobjectType ='case' and name = 'China Inquiry Case'];
                     
        Case cs=new Case();
        cs.AccountID = objparentacc.id;
        cs.recordtypeid=rt1.id;
        cs.ContactId=c.id;
        cs.Status='New';
       // cs.Origin='Email';
        cs.Subject='sub';
        cs.Description='des';
        insert cs;
        cs.description='new subject';
         cs.AccountID = objacc.id;
        update cs;
        
        
        
        
        Behr_createcommentVariable.flag=false;
        Case cs1=new Case();
        cs1.AccountID = objparentacc.id;
        cs1.recordtypeid=rt1.id;
        cs1.ContactId=c.id;
        cs1.Status='New';
        cs1.Origin='Email';
        cs1.Subject=null;
        cs1.Description='des';
        insert cs1;
  
       cs1.Subject='sub';
        cs1.Description='des11111';
        update cs1;
         Behr_createcommentVariable.flag=false;
          cs1.Subject='sub111';
             update cs1;
              Behr_createcommentVariable.flag=false;
          cs1.Subject=null;
             update cs1;
              Behr_createcommentVariable.flag=false;
          cs1.Description=null;
             update cs1;
          
        RecordType rtpay = [SELECT id, name
                              FROM Recordtype
                              WHERE SobjectType = 'Payouts__c' and name ='China Payout'];
        
        Payouts__c objpay = new Payouts__c();
        objpay.Account__c = objparentacc.id;
        objpay.recordtypeid = rtpay.id;
        objpay.Payout_Type__c='Monetary';
        objpay.Monetary_Payout_Amount__c=245442;
        objpay.Case__C = cs.id;
        insert objpay;*/
    

}
}