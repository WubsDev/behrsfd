@isTest(SeeAllData=true)
private class Test_Behr_CustomQuoteLineItemController{    

    static testMethod void CustomQuoteLineItemController() {
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
            objparentacc.Name = 'Test Parent Accounttrtyghjvf';
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
        
        Opportunity o =new Opportunity();
            o.AccountId =objparentacc.id;
            o.StageName = 'Position/Prepare';
            o.CloseDate = system.today() + 10;
            o.Amount = 765;
            o.Behr_Rep_Contact_Number__c = '9876543210';
            o.Behr_Rep_Email__c = 'testopp@gmail.com';
            o.Behr_Rep_Name__c = 'test rep';
            o.Name = 'test Opp';
            o.Opportunity_Type__c = 'Bid';
        insert o;
            o.Behr_Rep_Contact_Number__c = '1234567890';
            o.Behr_Rep_Email__c = 'abc@gmail.com';
        update o;
        
        o.StageName = 'Lost';
        o.CloseDate = system.today() + 10;

        
        
                   
          RecordType rt1 = [select id, name 
                     from Recordtype 
                     where sobjectType ='Quote' and name = 'Quote'];
        
        Product2 objproduct = new Product2 (Name='Test Product', IsActive=true);
         insert objproduct;
        
         Pricebook2 objPriceBook = [select id from Pricebook2 where isStandard=true limit 1];  
        
          PricebookEntry objPriceBookEntry = new PricebookEntry(Pricebook2Id =objPriceBook.Id,
                                           Product2Id = objproduct.Id,UnitPrice = 100,IsActive = true,
                                           UseStandardPrice=false);
         insert objPriceBookEntry;
         system.debug('#@#@#@#@#'+objPriceBookEntry);
         Quote q = new Quote();
            q.name = 'Q-001';
            q.OpportunityId = o.id;
            q.Tax = 10;
            q.ShippingHandling = 20000;  
            q.Mobile_Number__c = '9876543210';
            q.Email=  'testopp@gmail.com';
            q.recordtypeid=rt1.id;  
            q.Pricebook2Id = objPriceBook.id;
         //   q.ShippingState='Oregon';
         insert q;
         
         system.debug('#@#@#@#@#'+q);
         
         
         QuoteLineItem ql = new QuoteLineItem ();       
            ql.QuoteId = q.id;
            ql.UnitPrice = 10;
            ql.Quantity = 2;
            ql.Color_Vendor__c='Color Formula';
            ql.PricebookEntryId =objPriceBookEntry.id;
         insert ql;

         
         
         system.debug('@#@#@#@#@'+ql);
         
         pagereference pageQuoteLineitem = page.behr_OrderLineItemPage;
         
         ApexPages.currentPage().getParameters().put('id', ql.id);
         
         ApexPages.StandardController controller1=new ApexPages.StandardController(ql); 
         Behr_CustomQuoteLineItemController CustomQuoteLineItemController=new Behr_CustomQuoteLineItemController(controller1);
         CustomQuoteLineItemController.onchange1();
         
          ApexPages.StandardController controller2=new ApexPages.StandardController(ql); 
         OrderLineitemController OliControlller=new OrderLineitemController(controller2);
        OliControlller.getredirect();
        q.recordtypeId=rt1.id;
        update q;
        OliControlller.getredirect();
        delete o;
        Test.StopTest();
    
    }
    }