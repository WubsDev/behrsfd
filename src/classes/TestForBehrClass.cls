@isTest
public class TestForBehrClass {

    static testMethod void updateApproversTest(){
         
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             Direct_Onboarding__c db = new Direct_Onboarding__c();
             db = tc.insertDirectOnboarding();
             List<User> UserDetail = [SELECT RVP__c, SVP__c, RPSM_New__c, City, State, Country, Street, PostalCode from USER where Id =: UserInfo.getUserId()];
             List<Direct_Onboarding__c> directob = [Select RVP_User__c, SVP_User__c, RPSM__c from Direct_Onboarding__c where Account_Name__c =: db.Account_Name__c LIMIT 1];
             System.Assert(UserDetail[0].RVP__c == directob[0].RVP_User__c, 'VALUE MISMATCH');
             
             }
         Test.stopTest();    
    }
    
    static testMethod void updateApproversRPSMTest(){
    
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
             Case nCase = new Case();
             nCase = tc.insertCase();
             List<User> userDetail2 = [SELECT RPSM_New__c from USER where Id =: UserInfo.getUserId()];
             List<CASE> caseDetail = [SELECT RPSM_user__c from CASE where Id =: nCase.Id LIMIT 1 ];
             System.Assert(caseDetail[0].RPSM_user__c == userDetail2[0].RPSM_New__c, 'RPSM USER OF CASE IS NOT THE SAME AS THE RPSM OF THE USER');
             
             }
         Test.stopTest();
         
     }
     
     static testMethod void insertAddress1(){
     
         Test.startTest();        
         Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
         User u = new user();
         u = tc.insertUser();
         
         System.runAs(u){
            Case nCase = new Case();
            nCase = tc.insertCase();
                        
            nCase.Ship_To__c = 'Ship to Rep';   
            Update nCase; 
            
            List<User> UserDetail = [SELECT RVP__c, SVP__c, City, State, Country, Street, PostalCode from USER where Id =: UserInfo.getUserId()];
            List<CASE> caseFields = [SELECT Ship_To_City__c, Ship_To_Country__c, Ship_To_State__c, Ship_To_Street__c, Ship_To_Zip__c  from CASE where Id =: nCase.Id LIMIT 1 ];
            System.Assert(((caseFields[0].Ship_To_City__c == UserDetail[0].City) && (caseFields[0].Ship_To_State__c == UserDetail[0].State) && (caseFields[0].Ship_To_Country__c == UserDetail[0].Country) && (caseFields[0].Ship_To_Street__c == UserDetail[0].Street) && (caseFields[0].Ship_To_Zip__c == UserDetail[0].PostalCode)), 'THE CASE SHIP TO FIELDS ARE NOT SAME AS THE CASE REQUESTER USER SHIPTO FIELDS'); 
                        
            }
        
        Test.stopTest();
    }
        
    static testMethod void insertAddress2(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            Case nCase = new Case();
            nCase = tc.insertCase();
            
            
            nCase.Ship_To__c = 'Ship to Customer';            
            Update nCase;
            
            Opportunity opp= new Opportunity(); 
            opp = [Select City__c, State__c, Street__c, Country_Picklist__c, State_Picklist__c, Zipcode__c from Opportunity where Id =: nCase.Opportunity__c LIMIT 1]; 
            Case caseField = new Case();
            caseField = [SELECT Ship_To_City__c, Ship_To_Country__c, Ship_To_State__c, Ship_To_Street__c, Ship_To_Zip__c  from CASE where Id =: nCase.Id LIMIT 1 ];
            System.Assert(((caseField.Ship_To_City__c == opp.City__c) && (caseField.Ship_To_State__c == opp.State_Picklist__c) && (caseField.Ship_To_Country__c == opp.Country_Picklist__c) && (caseField.Ship_To_Street__c == opp.Street__c) && (caseField.Ship_To_Zip__c == opp.Zipcode__c)), 'THE CASE SHIP TO FIELDS ARE NOT SAME AS THE OPPORTUNITY SHIPTO FIELDS');
            
            }
        Test.stopTest();
    }
    
    static testMethod void insertAddress3(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            Opportunity opp = new Opportunity();
            opp = tc.insertOpportunity();
            
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Recommendation'];
            Case newCase = new Case();   
            newCase.Opportunity__c = opp.id;              
            newCase.Date_Needed_By__c = system.today()+22 ;
            newCase.RecordTypeId = caseRT.Id;
            newCase.Ship_To__c = 'Ship to Rep';
            insert newCase;
                        
            }
            
        Test.stopTest();
    }
    
    static testMethod void insertAddress4(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            Opportunity opp = new Opportunity();
            opp = tc.insertOpportunity();
            
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Recommendation'];
                        
            Case newCase1 = new Case();   
            newCase1.Opportunity__c = opp.id;              
            newCase1.Date_Needed_By__c = system.today()+22 ;
            newCase1.RecordTypeId = caseRT.Id;
            newCase1.Ship_To__c = 'Ship to Customer';
            insert newCase1;
            
            }
            
        Test.stopTest();
    }
    
    static testMethod void insertAccountAddress(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            Account newAcc = new Account();
            newAcc = tc.insertAccount();
                        
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Recommendation'];
                        
            Case newCase1 = new Case();   
            newCase1.AccountId = newAcc.Id;              
            newCase1.Date_Needed_By__c = system.today()+22 ;
            newCase1.RecordTypeId = caseRT.Id;
            newCase1.Ship_To__c = 'Ship to Customer';            
            insert newCase1;
            
            newCase1.Ship_To__c = 'Ship to Rep';
            upsert newCase1;
            
            newCase1.Ship_To__c = 'Ship to Customer';
            upsert newCase1;
            
            }
            
        Test.stopTest();
    }
    
    static testMethod void addTeamMember(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            
            Opportunity opp = new Opportunity();
            opp = tc.insertOpportunity();
                                        
            AccountTeamMember Acctm = new AccountTeamMember();
            Acctm.AccountId = opp.AccountId;
            Acctm.UserId = UserInfo.getUserId();
            Acctm.TeamMemberRole = 'Sales Rep';
          //Acctm.AccountAccessLevel = 'Read Only';
            insert Acctm;
            
            OpportunityTeamMember oppTeam = new OpportunityTeamMember();
            oppTeam.OpportunityId = opp.id;
            oppTeam.UserId = UserInfo.getUserId();
            oppTeam.TeamMemberRole = 'Read Only';            
            Insert oppTeam;
            
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and name = 'Color Recommendation'];
            Case Caseteam1 = new Case();   
            Caseteam1.Opportunity__c = opp.id;              
            Caseteam1.Date_Needed_By__c = system.today()+22 ;
            Caseteam1.RecordTypeId = caseRT.Id;
            insert Caseteam1;
            
            Case Caseteam2 = new Case();   
            Caseteam2.AccountId = opp.AccountId;              
            Caseteam2.Date_Needed_By__c = system.today()+22 ;
            Caseteam2.RecordTypeId = caseRT.Id;
            insert Caseteam2;     
         
        }
        Test.stopTest();    
    }
    
    static testMethod void UpdateASopportunityTest(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            
            RecordType rt = [select id, name 
                         from Recordtype 
                         where sobjectType ='Account' and name = 'Standard Account'];
            Account acc = new Account();            
            acc.RecordTypeid = rt.id;
            acc.Name = 'Test Account';
            acc.Estimated_Annual_Spend__c = 1200;
            acc.Market_Segment__c = 'Exporter';           
            acc.BillingStreet ='24,marg';
            acc.Type = 'Direct Only';
            acc.BillingPostalCode = '700061';
            acc.BillingCountry ='United States';
            acc.Current_Supplier__c = 'Glidden';
            insert acc;
            
            RecordType contactRT = [select id, name from Recordtype where sobjectType ='Contact' and name = 'US Contact'];
            Contact c = new contact();
            c.AccountId = acc.id;
            c.LastName = 'Tester 123';
            c.RecordTypeId = ContactRT.Id ;
            c.FirstName = 'TestUser 123' ;
            c.Salutation = 'Mr.';
            c.Phone = '12345';
            insert c;
            
            RecordType opportunityRT = [select id, name from Recordtype where sobjectType ='Opportunity' and name = 'Opportunity'];
            Opportunity o =new Opportunity();
            o.AccountId = acc.id;
            o.StageName = 'Position/Prepare';
            o.CloseDate = system.today() + 10;
            o.Amount = 765;
            o.Behr_Rep_Contact_Number__c = '9876543210';
            o.Behr_Rep_Email__c = 'testopp@gmail.com';
            o.Behr_Rep_Name__c = 'test rep';
            o.Name = 'test Opp 2';
            o.Opportunity_Type__c = 'Bid';
            o.Primary_Contact__c = c.Id  ;
            o.Street__c = 'Oppty Street';
            o.City__c = 'Oppty City';
            o.State__c = 'Alabama';
            o.Zipcode__c = '123456';
            o.Country__c = 'United States';
            insert o;
        
            Actual_Sales__c aSale = new Actual_Sales__c();
            String s= 'FirstTime';
            aSale = tc.insertActualSales(s);
            Ownership_Approval__c oA = new Ownership_Approval__c();            
            oA.New_Opportunity_Entry__c = o.Id;
            oA.ActualSales__c = aSale.id;
            oA.Status__c = 'Approved';
            insert oA;
            Actual_Sales__c newAsales = new Actual_Sales__c();
            newAsales = [SELECT Opportunity__c, Account_Name__c from Actual_Sales__c where id=: aSale.Id];
            
            System.Assert((newAsales.Opportunity__c == o.Id && newAsales.Account_Name__c == acc.id), 'Actual Sales has not been mapped properly');
            
            }
        Test.stopTest();
    }
    
    static testMethod void accountOwnerUpdateTest(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            Account Acc = new Account();
            Acc = tc.insertAccount();
               
            Ownership_Approval_Account__c ownerAA = new Ownership_Approval_Account__c();
            ownerAA.Account__c = Acc.Id;
            ownerAA.New_Owner__c = UserInfo.getUserId();
            ownerAA.Approval_Status__c = 'Approved';
            insert ownerAA;
            Account accNew = [SELECT ownerId from Account where id=: Acc.Id];
            
            System.Assert((accNew.ownerId == UserInfo.getUserId()), 'Owner of Account has not been changed.');
            
            }
        Test.stopTest();
    }
    
    static testMethod void caseRequesterFromAccountTest(){
    
        Test.startTest();
        Test_Utility_BehrClass tc = new Test_Utility_BehrClass();
        User u = new user();
        u = tc.insertUser();
         
        System.runAs(u){
            
            Account newAccount = new Account();
            newAccount = tc.insertAccount();
            
            RecordType caseRT = [select id, name from Recordtype where sobjectType ='Case' and DeveloperName = 'Behr_Case_Yard_Sign'];
            Case newCase = new Case();
            newCase.AccountId = newAccount.Id;
            newCase.Date_Needed_By__c = system.today()+22 ;
            newCase.RecordTypeId = caseRT.Id;    
            insert newCase;
            
            Case newCaseofAccount = new Case();   
            newCaseofAccount.AccountId = newAccount.Id;              
            newCaseofAccount.Date_Needed_By__c = system.today()+22 ;
            newCaseofAccount.RecordTypeId = caseRT.Id;
            insert newCaseofAccount;
            
            Case[] insertedCase1 = [Select id, Requester__c from Case where id =: newCase.Id];
            Case[] insertedCase2 = [Select id, Requester__c from Case where id =: newCaseofAccount.Id];
                        
            System.Assert(((insertedCase1[0].Requester__c == UserInfo.getUserId()) && (insertedCase2[0].Requester__c == UserInfo.getUserId())) ,'REQUESTER IS NOT GETTING POPULATED FROM ACCOUNT');
            
            }
        Test.stopTest();
    }
    
                       
}