@isTest(SeeAllData=true)
public class Test_Utility_BehrClass {
     
   public User insertUser(){ 
     Profile p = [select id from profile where name='System Administrator'];
     //       Test.startTest();     
       User RVP = new User(alias = 'standt', email='standarduser@testorg.com', 
            emailencodingkey='UTF-8', lastname='RVP', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, 
            timezonesidkey='America/Los_Angeles', username='standarduserRVP@testorg.com');
            insert RVP;
            
       User SVP = new User(alias = 'standt', email='standarduser@testorg.com', 
            emailencodingkey='UTF-8', lastname='SVP', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, 
            timezonesidkey='America/Los_Angeles', username='standarduserSVP@testorg.com');
            insert SVP;
            
       User u = new User(alias = 'standt',Country =' United States',PostalCode ='987654',State = 'Texas',City = 'Austin',Street ='Test Street', email='standarduser@testorg.com', 
            emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, RVP__c = RVP.Id, SVP__c = SVP.Id, 
            timezonesidkey='America/Los_Angeles', username='standarduserTEST@testorg.com');
            
            insert u;
    //       Test.stopTest();
            return u;
            
            }
            
       public Home_Depot_Store__c insertTHD(){
            Home_Depot_Store__c THDSt = new Home_Depot_Store__c();
            THDSt.Name ='THDStore-Test';
            THDSt.Store_Name__c = 'Store-Test';
            THDSt.SAP_Store_Label__c ='SAP-Store';
            THDSt.Street_Address__c = '8th-Street';
            THDSt.City__c = 'Chennai';
            THDSt.State__c = 'Tamilnadu';
            THDSt.Zip_Code__c = '600050';
            THDSt.Store_Phone__c = '98765436';
            THDSt.Market_Number__c = '123';
            THDSt.Market_Name__c = 'Market';
            THDSt.THD_Territory__c = 'Territory';
            THDSt.THD_Region__c = 'region';
            THDSt.THD_DM__c = 'DM';
            THDSt.THD_RMM__c = 'RMM';
            insert THDSt;
            return THDSt;
            
            } 
       
       public Account insertAccount(){
     //      Test.startTest();
           RecordType rt = [select id, name 
                         from Recordtype 
                         where sobjectType ='Account' and name = 'Standard Account'];                     
            Home_Depot_Store__c THDSt = new Home_Depot_Store__c();
            THDSt = insertTHD();
            Account acc = new Account();            
            acc.RecordTypeid = rt.id;
            acc.Name = 'Test Parent Accountnvbhdbffn';
            acc.Estimated_Annual_Spend__c = 1200;
            acc.Market_Segment__c = 'Exporter';           
            acc.BillingStreet ='24,marg';
            acc.Type = 'Direct Only';
            acc.BillingPostalCode = '700061';
            acc.BillingCountry ='Mexico';
            acc.Tier_Level__c = 'Tier 1';
            acc.THD_Home_Store__c = THDSt.id;
            acc.Current_Supplier__c = 'Glidden';
            insert acc;
      //      Test.stopTest();
            return acc;
            
            
            }     
      
       public Contact insertContact(){     
      //      Test.startTest();
            Id Accid = insertAccount().id ;
            RecordType contactRT = [select id, name from Recordtype where sobjectType ='Contact' and name = 'US Contact'];
            Contact c = new contact();
            c.AccountId = Accid;
            c.LastName = 'Tester';
            c.RecordTypeId = ContactRT.Id ;
            c.FirstName = 'TestUser' ;
            c.Salutation = 'Mr.';
            c.Phone = '1234567';
            insert c;
      //      Test.stopTest();            
            return c;
            
            
            }
            
       Public Actual_Sales__c insertActualSales(String DummyPurchase){
            
            Opportunity opp= new Opportunity();
            opp = insertOpportunity();
            
            Actual_Sales__c newActS = new Actual_Sales__c();
            newActS.Account_Name__c = opp.AccountId ;
            newActS.Opportunity__c = opp.Id ;
            newActS.Name = 'test Actual Sales' ;
            newActS.Purchase_Order__c = DummyPurchase;
            newActS.SAP_Order__c = 'Test SAP Order';
            insert newActS;
            return newActS;
            
            }
            
       public Ownership_Approval__c insertOwnershipApp(){
            Opportunity opp = new Opportunity();
            opp = insertOpportunity();
            Actual_Sales__c aSale = new Actual_Sales__c();
            String s= 'FirstTime';
            aSale = insertActualSales(s);
            Ownership_Approval__c oA = new Ownership_Approval__c();            
            oA.New_Opportunity_Entry__c = opp.Id;
            oA.ActualSales__c = aSale.id;
            oA.Status__c = 'Approved';
            insert oA;
            return oA;
            
            }
            
       public Opportunity insertOpportunity (){
            
   //        Test.startTest();            
            Contact newContact = new Contact();
            newContact = insertContact();                        
            RecordType opportunityRT = [select id, name from Recordtype where sobjectType ='Opportunity' and name = 'Opportunity'];
            Opportunity o =new Opportunity();
            o.AccountId = newContact.AccountId ;
            o.StageName = 'Position/Prepare';
            o.CloseDate = system.today() + 10;
            o.Amount = 765;
            o.Behr_Rep_Contact_Number__c = '9876543210';
            o.Behr_Rep_Email__c = 'testopp@gmail.com';
            o.Behr_Rep_Name__c = 'test rep';
            o.Name = 'test Opp';
            o.Opportunity_Type__c = 'Bid';
            o.Primary_Contact__c = newContact.Id  ;
            o.Street__c = 'Oppty Street';
            o.City__c = 'Oppty City';
            o.State__c = 'Alabama';
            o.Zipcode__c = '123456';
            o.Country__c = 'United States';
            insert o;
     //       Test.stopTest();
            return o;
            
            
            }
            
         public Account insertParentAccount(){
             
            Account acc = new Account();
            acc = insertAccount();
            Account acc1 = new Account();
             RecordType rt = [select id, name 
                         from Recordtype 
                         where sobjectType ='Account' and name = 'Standard Account'];                                                 
             acc1.RecordTypeid = rt.id;
             acc1.Name = 'Test Parent Accountnvbhdbffn';
             acc1.Estimated_Annual_Spend__c = 1200;
             acc1.Market_Segment__c = 'Exporter';           
             acc1.BillingStreet ='24,marg';
             acc1.Type = 'Direct Only';
             acc1.BillingPostalCode = '700061';
             acc1.BillingCountry ='Mexico';
             acc1.Tier_Level__c = 'Tier 1';
             acc1.Current_Supplier__c = 'Glidden';
             acc1.ParentId = acc.Id; 
             insert acc1;
             return acc1;
             
             }   
            
         public Product2 insertProduct2(){   
     //       Test.startTest();
            Product2 pr = new Product2();
            pr.Name = 'TestProduct';
            pr.IsActive = true;
            insert pr;
     //       Test.stopTest();
            return pr;
            
            }
            
         public Pricebook2 insertPricebook2 (){   
    //        Test.startTest();
            Pricebook2 PrBk = new Pricebook2();
            PrBk.IsActive = true;
            PrBk.Name = 'Test PriceBook';
            insert PrBk;
     //       Test.stopTest();
            return PrBk;
            
            
            }
         
         public PricebookEntry insertPricebookEntry (){
            
      //      Test.startTest();
            Id prId = insertProduct2().Id; 
            Pricebook2 standard = [Select Id, Name, IsActive From Pricebook2 where IsStandard = true LIMIT 1];
            if (!standard.isActive) {
            standard.isActive = true;
            update standard;
            }    
         // pricebook2 standardpb = [select id from pricebook2 where isstandard = true];           
         // List<Pricebook2> PriceList = [SELECT id, Name from Pricebook2 WHERE isStandard = true LIMIT 1];
         // List<PriceBookEntry> priceBookList = [SELECT Id, Product2Id, Product2.Id, Product2.Name FROM PriceBookEntry WHERE /* Product2Id='certain_id' AND */ PriceBook2.isStandard=true LIMIT 1];
         // pricebook2 custompb = new pricebook2(name='test',isactive=true);
         // insert custompb;
       //   pricebookentry standardprice = new pricebookentry( product2id = prod.id, pricebook2id = standardpb.id, unitprice = 4.99), customprice = new pricebookentry( product2id = prod.id, pricebook2id = custompb.id, usestandardprice = true );
            
     //      PricebookEntry PBentry = new PricebookEntry();             
     //       PBentry.Pricebook2Id = standardpb.Id;
      //      PBentry.Product2Id = prId;
      //      PBentry.UnitPrice= 500;
      //      insert PBentry;
            
        
            
            PricebookEntry PBentrynew = new PricebookEntry();
            PBentrynew.IsActive = true; 
            PBentrynew.Pricebook2Id = standard.Id;
            PBentrynew.Product2Id = prId;            
       //   PBentrynew.usestandardprice = true;
            PBentrynew.UnitPrice= 500;
            insert PBentrynew;
            
            
      //      Test.stopTest();
            return PBentrynew;
            
            
            }          
            
          public Quote insertQuote(){
            
      //      Test.startTest();
            Pricebook2 standard = [Select Id, Name, IsActive From Pricebook2 where IsStandard = true AND IsActive = true LIMIT 1];
            Id oId = insertOpportunity().Id;
            RecordType rt1 = [select id, name from Recordtype where sobjectType ='Quote' and name = 'Quote'];
            Quote q = new Quote();
            q.name = 'Q-001';
            q.recordtypeId=rt1.id;
            q.OpportunityId = oid;
            q.Tax = 10;
            q.ShippingHandling = 20000;  
            q.Phone = '4443333' ;
            q.ShippingState = 'Arizona';
            q.Email_Address__c =  'testopp@gmail.com';
            q.Pricebook2Id = standard.Id;  
            insert q;
     //       Test.stopTest();
            return q;
            
            
            }
       
        public Direct_Onboarding__c insertDirectOnboarding(){
        
        //    Test.startTest();
            Id accId = insertAccount().id;         
            Direct_Onboarding__c DirOnb = new Direct_Onboarding__c();     
            DirOnb.Account_Name__c = accId;
            DirOnb.Masco_Subsidiary__c = 'true';
            DirOnb.Status__c = 'Pending Credit Review';
            insert DirOnb;
       //     Test.stopTest();
            return DirOnb;
            
            
            }
            
        public Case insertCase(){    
            
         //   Test.startTest();
            Opportunity opp= new Opportunity();
            opp = insertOpportunity();
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Book/Board'];
            date myDate = date.today();
            date newDate = myDate.addDays(25);            
            Case nCase = new Case();
            nCase.AccountId = opp.AccountId ;                   
            nCase.Date_Needed_By__c = newDate ;
            nCase.RecordTypeId = caseRT.Id;
            nCase.Color_BookBoard_Type__c = 'Color Book';
            nCase.Opportunity__c = opp.id;
            insert nCase;
        //    Test.stopTest();
            return ncase;
            
            
            }
            
        
       
       }