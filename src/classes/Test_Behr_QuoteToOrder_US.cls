@isTest(SeeAllData=true)
Public class Test_Behr_QuoteToOrder_US {

    static testMethod Void OpptyMultipickTest(){
        
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
                          
             Opportunity opp = new Opportunity();
             opp= tc.insertOpportunity();
             Opportunity opp2 = new Opportunity();
             opp2 = [SELECT id, Competitors__c from Opportunity where id =: opp.id];
             Account acc = new Account();
             acc = [SELECT id,Current_Supplier__c from Account where id =: opp.AccountId];
             System.Assert((acc.Current_Supplier__c == opp2.Competitors__c),'Competitor is not same as Current Supplier');
             
             }
         test.stopTest();
         
     }
     
     static testMethod void OpptyTeamMemberTest(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
         
             Account acc = new Account();
             acc = tc.insertParentAccount();
             
             AccountTeamMember Acctm = new AccountTeamMember();
             Acctm.AccountId = acc.ParentId;
             Acctm.UserId = UserInfo.getUserId();
             Acctm.TeamMemberRole = 'Sales Rep';
          //Acctm.AccountAccessLevel = 'Read Only';
             insert Acctm;
             
             AccountTeamMember Acctm1 = new AccountTeamMember();
             Acctm1.AccountId = acc.Id;
             Acctm1.UserId = UserInfo.getUserId();
             Acctm1.TeamMemberRole = 'Sales Rep';
          //Acctm.AccountAccessLevel = 'Read Only';
             insert Acctm1;
             
            RecordType opportunityRT = [select id, name from Recordtype where sobjectType ='Opportunity' and name = 'Opportunity'];
            Opportunity o =new Opportunity();
            o.AccountId = acc.id ;
            o.StageName = 'Position/Prepare';
            o.CloseDate = system.today() + 10;
            o.Amount = 765;
            o.Behr_Rep_Contact_Number__c = '9876543210';
            o.Behr_Rep_Email__c = 'testopp@gmail.com';
            o.Behr_Rep_Name__c = 'test rep';
            o.Name = 'test Opp';
            o.Opportunity_Type__c = 'Bid';
            o.Street__c = 'Oppty Street';
            o.City__c = 'Oppty City';
            o.State__c = 'Alabama';
            o.Zipcode__c = '123456';
            o.Country__c = 'United States';
            o.Type = 'THD';
            insert o;
            
            /*
            BEHR_QuotetoOrder_US.updateActualSales(o.AccountId);
            BEHR_QuotetoOrder_US.updateOpportunityActualSales(o.id);
            */
                        
            }
            
        Test.stopTest();
    }
    
    static testMethod void UpdateOpptyStageTest(){
    
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             List<Opportunity> opp = new List<Opportunity>();
             opp.add(tc.insertOpportunity());
             
            Task tasks = new Task();            
            tasks.ActivityDate = Date.today().addDays(7);
            tasks.Subject='Text Msg';
            tasks.WhatId = opp[0].Id;
            tasks.OwnerId = UserInfo.getUserId();
            tasks.Status='In Progress';
            insert tasks;
            
            Task tasksNew = new Task();            
            tasksNew.ActivityDate = Date.today().addDays(7);
            tasksNew.Subject='Job Site Visit';
            tasksNew.WhatId = opp[0].Id;
            tasksNew.OwnerId = UserInfo.getUserId();
            tasksNew.Status='In Progress';
            insert tasksNew;
            
            PricebookEntry pbe = new PricebookEntry(); 
            pbe = tc.insertPricebookEntry();
            OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp[0].Id, PricebookEntryId=pbe.Id, Quantity = 2.0, TotalPrice = 1000.0, Zone1__c ='Off Zone');
            insert oli;
            
            BEHR_QuotetoOrder_US.UpdateOpptyStage(Opp);
            
            }
            
        Test.stopTest();
    }
    
    static testMethod void UpdateOpptyStageTest2(){
    
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             List<Opportunity> opp = new List<Opportunity>();
             opp.add(tc.insertOpportunity());
             
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Recommendation'];
            date myDate = date.today();
            date newDate = myDate.addDays(25);            
            Case nCase = new Case();                   
            nCase.Date_Needed_By__c = newDate ;
            nCase.RecordTypeId = caseRT.Id;
            nCase.Status = 'Open';
            nCase.Opportunity__c = opp[0].Id;
            insert nCase;
            
            RecordType rt1 = [select id, name from Recordtype where sobjectType ='Quote' and name = 'Order'];
            Quote q = new Quote();
            q.name = 'Q-001';
            q.recordtypeId=rt1.id;
            q.Converted_to_Order__c = true;
            q.OpportunityId = opp[0].Id;
            q.Tax = 10;
            q.ShippingHandling = 20000;  
            q.Phone = '1234567' ;
            q.ShippingState ='Arizona';
            q.Email_Address__c =  'testopp@gmail.com';  
            insert q;
            
            BEHR_QuotetoOrder_US.UpdateOpptyStage(Opp);
            
            }
            
        Test.stopTest();
    }
    
    static testMethod void cloneQuotesTest(){
    
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             Quote newQuote = new Quote();
             newQuote = tc.insertQuote();             
             
             PricebookEntry pbe = new PricebookEntry(); 
             pbe = tc.insertPricebookEntry();
                         
             QuoteLineItem qli = new QuoteLineItem(QuoteId = newQuote.Id, PriceBookEntryId = pbe.Id, Quantity = 1, UnitPrice = 100, Color_Vendor__c ='Benjamin Moore', Color_Name_Code1__c ='TestColor');
             insert qli; 
             
             Id cloneId = BEHR_QuotetoOrder_US.cloneQuotes(newQuote.Id);
             
             Quote cloned = new Quote();
             cloned = [SELECT id, RecordType.Name, recordtypeId, OpportunityId  from Quote where id=: cloneId];
             
             System.Assert(((cloned.recordtypeId == newQuote.recordtypeId) && (cloned.id != newQuote.id) ),'Quote is cloned properly');
             
             }
         Test.stopTest();
     }
     
     static testMethod void ConvertQuoteTest(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             Quote newQuote = new Quote();
             newQuote = tc.insertQuote();
             Id convertQ = BEHR_QuotetoOrder_US.ConvertQuote(newQuote.Id);
                          
             Quote order = new Quote();
             order = [SELECT id, RecordType.Name, recordtypeId, OpportunityId, Converted_to_Order__c  from Quote where id =: convertQ];
             
             System.Assert(((order.id == newQuote.id) && (order.recordtypeId != newQuote.recordtypeId) && (order.OpportunityId == newQuote.OpportunityId) && (order.Converted_to_Order__c == true)),'Quote has not been converted into order properly');
             }
         Test.stopTest();
     }
     
     static testMethod void createBookCaseTest(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
            
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Book/Board'];
            date myDate = date.today();
            date newDate = myDate.addDays(25);            
            Case nCase = new Case();                   
            nCase.Date_Needed_By__c = newDate ;
            nCase.RecordTypeId = caseRT.Id;
            nCase.Color_BookBoard_Type__c = 'Color Book';
            insert nCase;
                         
             RecordType rt1 = [select id, name from Recordtype where sobjectType ='Scheme__c' and name = 'Book/Board Scheme'];
             Scheme__c sc = new Scheme__c();             
             sc.Case__c = nCase.Id;
             sc.Name = 'Test';
             sc.RecordTypeId = rt1.id ; 
             insert sc;
             
             Competitor_Color__c competitorColor = new Competitor_Color__c();
             RecordType ccRt = [select id, name from Recordtype where sobjectType ='Competitor_Color__c' and name = 'Color Only'];
             competitorColor.Name = 'Test competitor color';
             competitorColor.RecordTypeId = ccRt.Id;
             competitorColor.Color_code__c = '12';
             insert competitorColor;
             
             competitor_colors__c colorSelection = new competitor_colors__c();
             colorSelection.Competitor_Color__c = competitorColor.Id;
             colorSelection.Scheme__c = sc.Id;
             colorSelection.of_draw_downs__c = 1;
             insert colorSelection;
             
             Date dateneeded = Date.TODAY();
             date nDate = dateneeded.addDays(4);
             
             Id bkCaseid = BEHR_QuotetoOrder_US.CreateBookCase(sc.id);
             
             Case createdC = new case();
             createdC = [SELECT RecordTypeId, Color_BookBoard_Type__c, Date_Needed_By__c from Case where id =: bkCaseid];
             
             System.Assert((createdC.RecordTypeId == nCase.RecordTypeId && createdC.Color_BookBoard_Type__c == nCase.Color_BookBoard_Type__c && createdC.Date_Needed_By__c == nDate),'Case created is not the same as source(BOOK/BOARD) case.');
             
             }
         Test.stopTest();
     }
     
     static testMethod void createBoardCaseTest(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
            
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Book/Board'];
            date myDate = date.today();
            date newDate = myDate.addDays(25);            
            Case nCase = new Case();                   
            nCase.Date_Needed_By__c = newDate ;
            nCase.RecordTypeId = caseRT.Id;
            nCase.Color_BookBoard_Type__c = 'Color Board';
            insert nCase;
                         
             RecordType rt1 = [select id, name from Recordtype where sobjectType ='Scheme__c' and name = 'Book/Board Scheme'];
             Scheme__c sc = new Scheme__c();             
             sc.Case__c = nCase.Id;
             sc.Name = 'Test';
             sc.RecordTypeId = rt1.id ; 
             insert sc;
             
             Competitor_Color__c competitorColor = new Competitor_Color__c();
             RecordType ccRt = [select id, name from Recordtype where sobjectType ='Competitor_Color__c' and name = 'Color Only'];
             competitorColor.Name = 'Test competitor color';
             competitorColor.RecordTypeId = ccRt.Id;
             competitorColor.Color_code__c = '12';
             insert competitorColor;
             
             competitor_colors__c colorSelection = new competitor_colors__c();
             colorSelection.Competitor_Color__c = competitorColor.Id;
             colorSelection.Scheme__c = sc.Id;
             colorSelection.of_draw_downs__c = 1;
             insert colorSelection;
             
             Date dateneeded = Date.TODAY();
             date nDate = dateneeded.addDays(14);
             
             Id bkCaseid = BEHR_QuotetoOrder_US.CreateBookCase(sc.id);
             
             Case createdC = new case();
             createdC = [SELECT RecordTypeId, Color_BookBoard_Type__c, Date_Needed_By__c from Case where id =: bkCaseid];
             
             System.Assert((createdC.RecordTypeId == nCase.RecordTypeId && createdC.Color_BookBoard_Type__c == nCase.Color_BookBoard_Type__c && createdC.Date_Needed_By__c == nDate),'Case created is not the same as source(BOOK/BOARD) case.');
             
             }
         Test.stopTest();
     }
     
     
     static testMethod void CreateDigitalRenderingTest(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             
             RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Digital Renderings'];
            date myDate = date.today();
            date newDate = myDate.addDays(25);            
            Case nCase = new Case();                   
            nCase.Date_Needed_By__c = newDate ;
            nCase.RecordTypeId = caseRT.Id;
            insert nCase;
                        
            RecordType rt1 = [select id, name from Recordtype where sobjectType ='Scheme__c' and name = 'Digital Rendering Scheme'];
             Scheme__c sc = new Scheme__c();             
             sc.Case__c = nCase.Id;
             sc.Name = 'Test';
             sc.RecordTypeId = rt1.id ; 
             insert sc;
             
             Competitor_Color__c competitorColor = new Competitor_Color__c();
             RecordType ccRt = [select id, name from Recordtype where sobjectType ='Competitor_Color__c' and name = 'Color Only'];
             competitorColor.Name = 'Test competitor color';
             competitorColor.RecordTypeId = ccRt.Id;
             competitorColor.Color_code__c = '12';
             insert competitorColor;
             
             competitor_colors__c colorSelection = new competitor_colors__c();
             colorSelection.Competitor_Color__c = competitorColor.Id;
             colorSelection.Scheme__c = sc.Id;
             colorSelection.of_draw_downs__c = 1;
             insert colorSelection;
             
             Date dateneeded = Date.TODAY();
             date nDate = dateneeded.addDays(3);
             
             Id bkCaseid = BEHR_QuotetoOrder_US.CreateDigitalRendering(sc.Id);
             
             Case createdC = new case();
             createdC = [SELECT RecordTypeId, Color_BookBoard_Type__c, Date_Needed_By__c from Case where id =: bkCaseid];
             
             System.Assert((createdC.RecordTypeId == nCase.RecordTypeId && createdC.Date_Needed_By__c == nDate),'Case created is not the same as source(DIGITAl RENDERING) case.');
             
             }
         Test.stopTest();
     }
     
     static testMethod void createDrawDownsTest(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
         
             RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Draw Downs'];
            date myDate = date.today();
            date newDate = myDate.addDays(25);            
            Case nCase = new Case();                   
            nCase.Date_Needed_By__c = newDate ;
            nCase.RecordTypeId = caseRT.Id;
            insert nCase;
                        
            RecordType rt1 = [select id, name from Recordtype where sobjectType ='Scheme__c' and name = 'Draw Down Scheme'];
             Scheme__c sc = new Scheme__c();             
             sc.Case__c = nCase.Id;
             sc.Name = 'Test';
             sc.RecordTypeId = rt1.id ; 
             insert sc;
             
             Competitor_Color__c competitorColor = new Competitor_Color__c();
             RecordType ccRt = [select id, name from Recordtype where sobjectType ='Competitor_Color__c' and name = 'Color Only'];
             competitorColor.Name = 'Test competitor color';
             competitorColor.RecordTypeId = ccRt.Id;
             competitorColor.Color_code__c = '12';
             insert competitorColor;
             
             competitor_colors__c colorSelection = new competitor_colors__c();
             colorSelection.Competitor_Color__c = competitorColor.Id;
             colorSelection.Scheme__c = sc.Id;
             colorSelection.of_draw_downs__c = 1;
             insert colorSelection;
             
             Date dateneeded = Date.TODAY();
             date nDate = dateneeded.addDays(3);
             
             Id bkCaseid = BEHR_QuotetoOrder_US.CreateDrawDowns(sc.Id);
             
             Case createdC = new case();
             createdC = [SELECT RecordTypeId, Color_BookBoard_Type__c, Date_Needed_By__c from Case where id =: bkCaseid];
             
             System.Assert((createdC.RecordTypeId == nCase.RecordTypeId && createdC.Date_Needed_By__c == nDate),'Case created is not the same as source(DIGITAl RENDERING) case.');
             
             }
         Test.stopTest();
     }
     
     static testMethod void SendTestEmail1Test(){
         
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){         
         
             String email = 'testuser@sfdc.com';
             String documentname = 'Credit Application Form';
             BEHR_QuotetoOrder_US.SendTestEmail1(email,documentname);
             
             }
             
         Test.stopTest();
     }
     
     static testMethod void updateQuoteLineItemsTest(){
         
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             Quote newQuote = new Quote();
             newQuote = tc.insertQuote();             
             
             PricebookEntry pbe = new PricebookEntry(); 
             pbe = tc.insertPricebookEntry();
                         
             QuoteLineItem qli = new QuoteLineItem(QuoteId = newQuote.Id, PriceBookEntryId = pbe.Id, Quantity = 1, UnitPrice = 100, Color_Vendor__c ='Benjamin Moore', Color_Name_Code1__c ='TestColor');
             insert qli;             
         
         /** Testing the auto update of the Color Vendor and Color Brand in quote line item from the color for orders records **/
             Competitor_Color__c competition = new Competitor_Color__c();
             competition.Color_Brand__c = 'Behr';
             competition.Color_code__c = 'testXYZ';
             competition.Color_Name__c = 'Bright Morning';
             insert competition;
             
             Color_for_orders__c colorForOrder = new Color_for_orders__c();
             colorForOrder.Competitor_Color__c = competition.Id;
             colorForOrder.Quote_Line_Item__c = qli.Id;
             insert colorForOrder;
             
             delete colorForOrder;
         /** End of the auto update of color vendor and color brand **/            
             
             }
             
         Test.stopTest();
     }
     
     static testMethod void updateAccountZoneTest(){
         
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){             
                      
         /** Testing for updation of Account ZONE update when Direct Onboarding Record is updated Scenario test **/
             Direct_Onboarding__c DirOnb = new Direct_Onboarding__c();     
             DirOnb = tc.insertDirectOnboarding();             
             
             DirOnb.Description__c = ' A new account being onboarded for update ';
             DirOnb.Status__c = 'Pending Credit Review';            
             update DirOnb;
         /** END OF updation of ACCOUNT ZONE UPDATE when Direct Onboarding Record is updated **/
                   
             
             }
             
         Test.stopTest();
     }
     
        
         
}