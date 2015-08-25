@isTest(SeeAllData=true)
private class Test_BEHR_QuoteClone_US{
Static testmethod void test_Quote_clone(){
   /*Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
        UserRole ur=new UserRole(Name='CM'); 
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
        
        RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Account' and name = 'Standard Account'];
                     
         RecordType rt1 = [select id, name from Recordtype where sobjectType ='Quote' and name = 'Order'];
                     
        Account acc = new Account();
        acc.RecordTypeid = rt.id;
        acc.Name = 'Test Parent Accountnvbhdbffn';
        acc.Estimated_Annual_Spend__c = 1200;
        acc.Market_Segment__c = 'Exporter';
        acc.Lead_Source__c = 'ARCAT';   
        acc.BillingStreet ='24,marg';
        acc.BillingCity = 'kolkata';
        acc.BillingState = 'Iowa';
        acc.BillingPostalCode = '700061';
        acc.BillingCountry ='United States';
        acc.Tier_Level__c = 'Tier 1';
        insert acc ; 
        
        Opportunity o =new Opportunity();
        o.AccountId =acc.id;
        o.StageName = 'Position/Prepare';
        o.CloseDate = system.today() + 10;
        o.Amount = 765;
        o.Behr_Rep_Contact_Number__c = '9876543210';
        o.Behr_Rep_Email__c = 'testopp@gmail.com';
        o.Behr_Rep_Name__c = 'test rep';
        o.Name = 'test Opp';
        o.Opportunity_Type__c = 'Bid';
        insert o;
        
        Quote q = new Quote();
        q.name = 'Q-001';
        q.recordtypeId=rt1.id;
        q.OpportunityId = o.id;
        q.Tax = 10;
        q.ShippingHandling = 20000;  
        q.Mobile_Number__c = '9876543210';
        q.Email_Address__c =  'testopp@gmail.com';  
        //q.Pricebook2Id = objPriceBook.id;
        q.ShippingState='Iowa';
        insert q;
        q.ShippingState='California';
        update q;
        
        Eco_Fee_State__c state = new Eco_Fee_State__c();
        state.Per_Gallon__c=0.75;
        state.Per_5_Gallon__c=1.60;
        state.State__c='California';
        insert state;
        Product2 objproduct = new Product2 (Name='Test Product', IsActive=true, Size__c='1');
         insert objproduct;
         
        
        
        List<Pricebook2> objPriceBook = [select id from Pricebook2 where isStandard=true limit 1];
        PricebookEntry objPriceBookEntry;
        
        if(objPriceBook.size()>= 0) 
        {    
            objPriceBookEntry = new PricebookEntry(Pricebook2Id =objPriceBook[0].Id,
                                           Product2Id = objproduct.Id,UnitPrice = 100,IsActive = true,
                                           UseStandardPrice=false);
                                insert objPriceBookEntry; 
                           
        }
        quotelineitem ql = new quotelineitem();
        ql.QuoteId = q.id;
        ql.UnitPrice = 10;
        ql.Quantity = 2;
        ql.Color_Vendor__c='Color Formula';
        ql.X384ths_1__c=1;
        ql.X384ths_2__c=1;
        ql.X384ths_3__c=1;
        ql.X384ths_4__c=1;
        ql.X384ths_5__c=1;
        ql.Colorant__c='AXL';
        ql.Colorant1__c='RUL';
        ql.Colorant2__c='VUL';
        ql.Colorant3__c='DL';
        ql.Colorant4__c='EL';
        ql.OZ_1__c=1;
        ql.OZ_2__c=1;
        ql.OZ_3__c=1;
        ql.OZ_4__c=1;
        ql.OZ_5__c=11;
        ql.PricebookEntryId =objPriceBookEntry.id;
         //ql.ProductId =objobjproduct.id;
        insert ql;
        
         
        BEHR_QuoteClone_US quoteclone=new BEHR_QuoteClone_US();
        id quoteid=BEHR_QuoteClone_US.cloneQuote(q.id);
        
        Task t1 = new Task(WhatId=q.Id,Subject='Test',ActivityDate=Date.Today(),Status='In Progress',Update_Lead_Status__c='contact made',Priority='Normal');
          ApexPages.StandardController sc = new ApexPages.StandardController(q);        
          Behr_QuotePDF_Controller mycontrl=new Behr_QuotePDF_Controller(sc);
        insert t1;
        mycontrl.viewPDF();
        mycontrl.savePDF();*/
       
    }

}