@isTest(SeeAllData=true)
private class Test_AccountController{    

    static testMethod void myUnitTest() {
    
      
    
      RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Account' and name = 'Standard Account'];
                     
                     
        Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
        UserRole ur=new UserRole(Name='CM'); 
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        rpsm__c='test',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
        Test.starttest();
        Account objparentacc = new Account();
        objparentacc.RecordTypeid = rt.id;
        objparentacc.Name = 'Test Parent Account000';
        objparentacc.Estimated_Annual_Spend__c = 1200;
        objparentacc.Market_Segment__c = 'Exporter';
        objparentacc.Lead_Source__c = 'ARCAT';   
        objparentacc.BillingStreet ='24,marg';
        objparentacc.BillingCity = 'kolkata';
        objparentacc.BillingState = 'Iowa';
        objparentacc.BillingPostalCode = '700061';
        objparentacc.BillingCountry ='United States';
        objparentacc.Tier_Level__c = 'Tier 1';
        insert objparentacc ;
     
        Account a = new Account();
        a.RecordTypeid = rt.id;
        a.ParentId = objparentacc.id;
        a.Name = 'Test Account9';
        a.Estimated_Annual_Spend__c = 1200;
        a.Market_Segment__c = 'Exporter';
        a.Lead_Source__c = 'ARCAT';   
        a.BillingStreet ='24,marg';
        a.BillingCity = 'kolkata';
        a.BillingState = 'Iowa';
        a.BillingPostalCode = '700061';
        a.BillingCountry ='United States';
        a.Tier_Level__c = 'Tier 1';
        a.ownerid=u.id;
        insert a;
        
     System.currentPageReference().getParameters().put('id', a.id);
     ApexPages.currentPage().getParameters().put('retURL',a.id);
     ApexPages.StandardController controller=new ApexPages.StandardController(a);  
    // Behr_AccountController_US acc = new Behr_AccountController_US(controller);
   //  acc.getAccount();
   //  acc.getContact();
   //  acc.getOpportunity();
  //   acc.getActivity();
   //  acc.getAccountteam();
   //  acc.getCustomerPayoyts();
    // acc.getReasonforLostOpp();
   //  acc.getDashboard();
   //  acc.getOrder();

       
 
        Contact c = new Contact();
        c.AccountId = a.id;
        c.LastName = 'contact';
        c.FirstName = 'test';
        c.phone = '9876543210';
        c.Email = 'test@gmail.com';
        c.LeadSource = 'ARCAT'; 
        insert c;
        
       
      
      List<Account> objactivityHistory = [Select (Select WhoID, Subject, IsTask, 
                                                      ActivityDate, Owner.name, Status                                    
                                                      From ActivityHistories
                                                      Where AccountId =:a.id)
                                           From Account
                                           WHERE id =:a.id];
  
      AccountTeamMember objmember = new AccountTeamMember ();
      objmember.UserId = u.id;
      objmember.AccountId = a.id;
      insert objmember;
       Test.StopTest();
      
     
   
                           
      

    }
     static testMethod void QuoteTestMethod() {
         test.startTest();
          RecordType rt = [select id, name 
         from Recordtype 
         where sobjectType ='Account' and name = 'Standard Account'];
          Account a = new Account();
        a.RecordTypeid = rt.id;        
        a.Name = 'Test Account9';
        a.Estimated_Annual_Spend__c = 1200;
        a.Market_Segment__c = 'Exporter';
        a.Lead_Source__c = 'ARCAT';   
        a.BillingStreet ='24,marg';
        a.BillingCity = 'kolkata';
        a.BillingState = 'Iowa';
        a.BillingPostalCode = '700061';
        a.BillingCountry ='United States';
        a.Tier_Level__c = 'Tier 1';        
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.LastName = 'contact';
        c.FirstName = 'test';
        c.phone = '9876543';
        c.Email = 'test@gmail.com';
        c.LeadSource = 'ARCAT'; 
        insert c;
        
        Opportunity o =new Opportunity();
        o.AccountId =a.id;
        o.StageName = 'Position/Prepare';
        o.Primary_Contact__c = c.id;
        o.CloseDate = system.today() + 10;
        o.Amount = 765;
        o.Behr_Rep_Contact_Number__c = '9876543210';
        o.Behr_Rep_Email__c = 'testopp@gmail.com';
        o.Behr_Rep_Name__c = 'test rep';
        o.Name = 'test Opp';
        o.Opportunity_Type__c = 'Bid';
        o.Type = 'THD';
        insert o;
        
        Product2 objproduct = new Product2 (Name='Test Product', IsActive=true);
       
        insert objproduct;
        
         /*Pricebook2 objPriceBook= new Pricebook2(Name = 'Behr/Kilz Pro Pricing',
                                                  IsActive = true);
           insert objPriceBook;                                     */
           
        Pricebook2 objPriceBook = [select id from Pricebook2 where isStandard=true limit 1];  
       
        
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@'+objPriceBook);
        
        PricebookEntry objPriceBookEntry = new PricebookEntry(Pricebook2Id =objPriceBook.Id,
                                           Product2Id = objproduct.Id,UnitPrice = 100,IsActive = true,
                                           UseStandardPrice=false);
        insert objPriceBookEntry;
        
         OpportunityLineItem oplineitem=new OpportunityLineItem();
        
        oplineitem.OpportunityId=o.id ;
        oplineitem.PricebookEntryId=objPriceBookEntry .id;
        oplineitem.Quantity=2;
        oplineitem.TotalPrice=10.00;
        oplineitem.Zone1__c ='1';
        //oplineitem.UnitPrice=12.00;
        insert oplineitem;
        delete oplineitem;
        
        Quote q = new Quote();
        q.name = 'Q-001';
        q.OpportunityId = o.id;
        q.Tax = 10;
        q.ShippingHandling = 20000;  
        //q.phone = c.phone;
        q.Email =  c.Email;  
        q.Pricebook2Id = objPriceBook.id;
        q.ShippingState='Oregon';
        insert q;
        
        QuoteLineItem ql = new QuoteLineItem ();       
        ql.QuoteId = q.id;
        ql.UnitPrice = 10;
        ql.Quantity = 2;
        ql.PricebookEntryId = objPriceBookEntry.id;
        insert ql;
        
        //For Behr_QuoteAll trigger
        
        q.Converted_to_Order__c=true;
        update q;
         Test.StopTEst();
         
     }
 /*   static testMethod void createdummyoptyTest() {
        test.startTest();
         RecordType rt = [select id, name 
         from Recordtype 
         where sobjectType ='Account' and name = 'Standard Account'];
        Account objparentacc = new Account();
        objparentacc.RecordTypeid = rt.id;
        objparentacc.Name = 'Test Parent Account000';
        objparentacc.Estimated_Annual_Spend__c = 1200;
        objparentacc.Market_Segment__c = 'Exporter';
        objparentacc.Lead_Source__c = 'ARCAT';   
        objparentacc.BillingStreet ='24,marg';
        objparentacc.BillingCity = 'kolkata';
        objparentacc.BillingState = 'Iowa';
        objparentacc.BillingPostalCode = '700061';
        objparentacc.BillingCountry ='United States';
        objparentacc.Tier_Level__c = 'Tier 1';
        insert objparentacc ;     
         //for  Behr_createdummyopty_us class
      Behr_createdummyopty_us.createopty(objparentacc.Id);            
        test.STopTest();
    }*/
     static testMethod void AccountControllerTest() {
         Test.StartTest();
         UserRole ur=new UserRole(Name='CM'); 
         Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        rpsm__c='test',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
        RecordType rt = [select id, name 
         from Recordtype 
         where sobjectType ='Account' and name = 'Standard Account'];
        Account objparentacc = new Account();
        objparentacc.RecordTypeid = rt.id;
        objparentacc.Name = 'Test Parent Account000';
        objparentacc.Estimated_Annual_Spend__c = 1200;
        objparentacc.Market_Segment__c = 'Exporter';
        objparentacc.Lead_Source__c = 'ARCAT';   
        objparentacc.BillingStreet ='24,marg';
        objparentacc.BillingCity = 'kolkata';
        objparentacc.BillingState = 'Iowa';
        objparentacc.BillingPostalCode = '700061';
        objparentacc.BillingCountry ='United States';
        objparentacc.Tier_Level__c = 'Tier 1';
        insert objparentacc ;           
        Account a = new Account();
        a.RecordTypeid = rt.id;
        a.ParentId = objparentacc.id;
        a.Name = 'Test Account9';
        a.Estimated_Annual_Spend__c = 1200;
        a.Market_Segment__c = 'Exporter';
        a.Lead_Source__c = 'ARCAT';   
        a.BillingStreet ='24,marg';
        a.BillingCity = 'kolkata';
        a.BillingState = 'Iowa';
        a.BillingPostalCode = '700061';
        a.BillingCountry ='United States';
        a.Tier_Level__c = 'Tier 1';
        a.ownerid=u.id;
        insert a;
        
        Opportunity o =new Opportunity();
        o.AccountId =a.id;
        o.StageName = 'Position/Prepare';
        o.CloseDate = system.today() + 10;
        o.Amount = 765;
        o.Behr_Rep_Contact_Number__c = '9876543210';
        o.Behr_Rep_Email__c = 'testopp@gmail.com';
        o.Behr_Rep_Name__c = 'test rep';
        o.Name = 'test Opp';
        o.Opportunity_Type__c = 'Bid';
        insert o;
        System.currentPageReference().getParameters().put('id', a.id);
         ApexPages.currentPage().getParameters().put('retURL',a.id);
        ApexPages.StandardController controller1=new ApexPages.StandardController(a);  
       // Behr_AccountController_US acc1 = new Behr_AccountController_US(controller1);  
      //  acc1.getAccount();
      //  acc1.getContact();
     //   acc1.getOpportunity();
        o.Opportunity_Type__c = 'Potential';
        update o;
       // acc1.getOpportunity(); 
        o.StageName = 'Lost';
        o.Opportunity_Lost_Reason__c = 'Price';
        o.Competitors__c = 'ICI';
        update o;
        
      //  acc1.getOpportunity(); 
   //     acc1.getActivity();
    //    acc1.getAccountteam();
    //    acc1.getCustomerPayoyts();
   //     acc1.getReasonforLostOpp();
    //    acc1.getDashboard();
    //    acc1.getOrder();       
       // acc1.getoppdashboard();
         Test.StopTest();
     }
     static testMethod void myUnitTest1() {
         Test.StartTest();
         UserRole ur=new UserRole(Name='CM'); 
         Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        rpsm__c='test',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
         RecordType rt = [select id, name 
         from Recordtype 
         where sobjectType ='Account' and name = 'Standard Account'];
         Account objparentacc = new Account();
        objparentacc.RecordTypeid = rt.id;
        objparentacc.Name = 'Test Parent Account000';
        objparentacc.Estimated_Annual_Spend__c = 1200;
        objparentacc.Market_Segment__c = 'Exporter';
        objparentacc.Lead_Source__c = 'ARCAT';   
        objparentacc.BillingStreet ='24,marg';
        objparentacc.BillingCity = 'kolkata';
        objparentacc.BillingState = 'Iowa';
        objparentacc.BillingPostalCode = '700061';
        objparentacc.BillingCountry ='United States';
        objparentacc.Tier_Level__c = 'Tier 1';
        insert objparentacc ;         
        Account a = new Account();
        a.RecordTypeid = rt.id;
        a.ParentId = objparentacc.id;
        a.Name = 'Test Account9';
        a.Estimated_Annual_Spend__c = 1200;
        a.Market_Segment__c = 'Exporter';
        a.Lead_Source__c = 'ARCAT';   
        a.BillingStreet ='24,marg';
        a.BillingCity = 'kolkata';
        a.BillingState = 'Iowa';
        a.BillingPostalCode = '700061';
        a.BillingCountry ='United States';
        a.Tier_Level__c = 'Tier 1';
        a.ownerid=u.id;
        insert a;
        Product2 objproduct = new Product2 (Name='Test Product', IsActive=true);
       
       // insert objproduct;
          //For AddPriceforProduct trigger (**REMOVED 12/3/14 to allow for removal of trial object)
       //   Trial_Paint__c objtrial =  new Trial_Paint__c();
     //     objtrial.Account__c = objparentacc.id;
      //    objtrial.Product__c =objproduct.id;
 
      //    insert objtrial;  
          
    //      objtrial.Price__c =0;
     //     objtrial.Product__c = null;
    //      update objtrial;
          
           //Direct To Pro sales 
           Direct_To_Pro_Sales__c dtp=new Direct_To_Pro_Sales__c();
           dtp.Account_Name__c=a.id;
           dtp.Account_Updated__c=true;
           dtp.Contact_Name__c='fhfbgjhgj';
           dtp.Contact_Phone__c='4689';
           dtp.Contact_Phone_HD_Store__c=true;
           dtp.Current_Year__c=true;
           dtp.Notes_Comments__c='skjhiuyfd';
           dtp.Ordered_By__c='aaaaaaa';
           insert dtp;
         Test.StopTest();
         
     }
}