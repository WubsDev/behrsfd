/*Class Name: BehrClass
@Author Name: Pratheepa Sudarsanam
@Purpose: This class holds various Methods which is accessed from triggers on different objects
@Created Date: 20/11/2014
@Last modified by: pratheepa Req-989
@Last modified date: 31/12/2014*/

//Request- 165
/***Purpose/Overview: To update the Approvers on direct onboarding object***/
    public with sharing class BehrClass{
    
    public static void updateApprovers(List<Direct_Onboarding__c> directOnboardRecords)
      {
        try{
        set<id> ownerIdSet = new set<id>();
        List<Direct_Onboarding__c> directOnbordList = new  List<Direct_Onboarding__c>(); 
        for(Direct_Onboarding__c directOnboarRecord: directOnboardRecords)
            {
               ownerIdSet.add(directOnboarRecord.ownerId);
               directOnbordList.add(directOnboarRecord);             
            }   
             if(ownerIdSet.size()>0)
                {
                 Map<id,User> userMap = new Map<Id,User>([select id,RVP__c,SVP__c,RPSM_New__c from User where id IN : ownerIdSet]);
                 for(Direct_Onboarding__c userInfoToDirectOnboaring :directOnbordList)
                   {
                    if(userMap.containsKey(userInfoToDirectOnboaring.ownerId))
                        {  
                            userInfoToDirectOnboaring.RVP_User__c = userMap.get(userInfoToDirectOnboaring.ownerId).RVP__c;
                            userInfoToDirectOnboaring.SVP_User__c =  userMap.get(userInfoToDirectOnboaring.ownerId).SVP__c;
                            userInfoToDirectOnboaring.RPSM__c =  userMap.get(userInfoToDirectOnboaring.ownerId).RPSM_New__c;   
                        }   
                    }  
                }
        } 
          catch(Exception e){
          system.debug('Error message is'+ e.getMessage());
        }
        }
//Req-019/022             
/***purpose/overview: To update the RPSM user from User Approval process ***/
        public static void updateApproversRPSM(List<Case> updcaseRecToUpdate)
        {
            try{
            set<id> ownerIdSet = new set<id>();
            List<Case> caseList = new  List<Case>(); 
                for(Case caseRecord : updcaseRecToUpdate)
                 {
                   ownerIdSet.add(caseRecord.ownerId);
                   caseList.add(caseRecord);             
                 }   
                   if(ownerIdSet.size()>0)
                    {
                        Map<id,User> userMapRPSM = new Map<Id,User>([select id,RPSM_New__c from User where id IN : ownerIdSet]);
                        for(Case caseRecToUpdate :caseList)
                           {
                            if(userMapRPSM.containsKey(caseRecToUpdate.ownerId))
                              {              
                                caseRecToUpdate.RPSM_user__c = userMapRPSM.get(caseRecToUpdate.ownerId).RPSM_New__c;
                              }   
                           }  
                    } 
          }     
           catch(Exception e){
           system.debug('Error message is'+ e.getMessage());
        }
        }
       
//R-051 
/***Purpose/Overview: To insert a credit review record when Direct onboarding Status = "Approved" ***/  
        public static void insertCreditCase(List<Direct_Onboarding__c> directOnboardRecords)
        { 
           try{
           Schema.DescribeSObjectResult des = Schema.SObjectType.Case; 
           Map<String,Schema.RecordTypeInfo> rtNamecaseRecToUpdaterec= des.getRecordTypeInfosByName();
           Schema.RecordTypeInfo rtNamecaseRecToUpdate=  rtNamecaseRecToUpdaterec.get(Label.Credit_Review);
           Id caseCreditrt = rtNamecaseRecToUpdate.getRecordTypeId();
           List<Direct_Onboarding__c> directOnboardList = new  List<Direct_Onboarding__c>();  
           List<Case> creditCaseList = new List<Case>();  
           Database.DMLOptions dmo = new Database.DMLOptions();
             for(Direct_Onboarding__c directOnBoardRec: directOnboardRecords)
              {
                if(directOnBoardRec.Status__c.equalsIgnoreCase(Label.Pending_Credit_Review))  
                 {
                    directOnboardList.add(directOnBoardRec);
                 }
              }    
                 if(directOnboardList.size()>0)
                  {
                    
                       for(Direct_Onboarding__c directOnBoardToCreditCase :directOnboardList)
                         {
                            Case creditcase = new Case();
                            creditcase.RecordTypeId = caseCreditrt;
                            creditcase.Direct_Onboarding__c =  directOnBoardToCreditCase.id;                     
                            creditcase.Accountid =  directOnBoardToCreditCase.Account_Name__c;
                            creditcase.Requester__c = directOnBoardToCreditCase.ownerid;                        
                            creditcase.Contactid = directOnBoardToCreditCase.Primary_Contact__c; 
                            
                            dmo.assignmentRuleHeader.useDefaultRule = true;
                            creditcase.setOptions(dmo);
                            creditCaseList.add(creditcase);
                           
                         }  
                        try{
                         Database.insert(creditCaseList);  
                        }
                        catch(DmlException e) {
                         System.debug('The following exception has occurred: ' + e.getMessage());
                        }
                        
                      }     
                  }  
                    catch(Exception e){
                    system.debug('Error message is'+ e.getMessage());
        }
        }   
        
                  
 //Req- 028            
 /*** Purpose/Overview:To Update the case fields from opportunity fields ***/       
        public static void caseFields(List<case> caseRecords)
          {
             try{
           Schema.DescribeSObjectResult des = Schema.SObjectType.Case; 
           Map<String,Schema.RecordTypeInfo> rtNamecaseRecToUpdaterec= des.getRecordTypeInfosByName();
           Schema.RecordTypeInfo rtNamecaseRecToUpdate=  rtNamecaseRecToUpdaterec.get(Label.Yard_Sign_Pro_Rewards_Card);
           Id caseYardSign = rtNamecaseRecToUpdate.getRecordTypeId();
             set<id> opportunitySet = new set<id>();
             List<Case> caseList = new  List<Case>(); 
             Set<id> accountSet = new Set<id>();          
             for(Case caseRec: caseRecords)
               {
                    opportunitySet.add(caseRec.Opportunity__c); 
                    accountSet.add(caseRec.Accountid);
                    caseList.add(caseRec);
               }
                  if(opportunitySet.size()>0)
                   { 
                     Map<id,Opportunity>  opportunityMap = new Map<id,Opportunity>([select id,name,Accountid,Ownerid,Primary_Contact__c from Opportunity where id IN:opportunitySet]);        
                     for(Case caseRecToUpdate:caseList)
                        {
                           if(opportunityMap.containsKey(caseRecToUpdate.Opportunity__c)&& caseRecToUpdate.RecordTypeId!= caseYardSign)
                             {
                                 //caseRecToUpdate.Accountid = opportunityMap.get(caseRecToUpdate.Opportunity__c).Accountid;
                                 caseRecToUpdate.Requester__c = opportunityMap.get(caseRecToUpdate.Opportunity__c).Ownerid;
                                 //caseRecToUpdate.Contactid =  opportunityMap.get(caseRecToUpdate.Opportunity__c).Primary_Contact__c;
                             }      
                         }
                      }   
                  if(accountSet.size()>0)
                   {
                     Map<id,Account>  accountMap = new Map<id,Account>([select id,name,Ownerid from Account where id IN:accountSet]);  
                     for(Case caseYardSignRec : caseList)
                        {
                          if(accountMap.containsKey(caseYardSignRec.Accountid)&& caseYardSignRec.RecordTypeId==caseYardSign)
                            {
                              //caseYardSignRec.Accountid = accountMap.get(caseYardSignRec.Accountid).id;
                               caseYardSignRec.Requester__c = accountMap.get(caseYardSignRec.Accountid).Ownerid;
                            }
                        }
                        
                   }
        }
           catch(Exception e){
           system.debug('Error message is'+ e.getMessage());
        }
        }
          
 //Request- 990
 /*** Purpose: To add opportunityTeamMembers to CaseTeamMember when opportunity exist on creation of case ***/   
        public static void caseTeamMembers(List <Case> CaseTeam) 
        {  
             try{
             list<CaseTeamMember> caseTeammemberList  = new list<CaseTeamMember>();                                               
             Set <id> optyids = New Set <id> ();
             CaseTeamRole role = [select id,Name from CaseTeamRole where Name = :Label.Full_Access];
             Map< Id , Id > opportunityIdToAccountId = new Map< Id , Id >();
             Map< Id , Id > AccountIdToAccountId = new Map< Id , Id >();
             for(Case ct: CaseTeam)
                {
                    opportunityIdToAccountId.put(ct.id,ct.Opportunity__c);
                    AccountIdToAccountId.put(ct.id,ct.Accountid);  
                    //system.debug('!!!!!!!!!!!!!!!'+opportunityIdToAccountId);
                    //system.debug('%%%%%%%%%%%%%%%%%%%%%'+AccountIdToAccountId);
                }
             Map<id,List<OpportunityTeamMember> > opportunityRecordIdToCaseTeamMembers = new    Map<id,  List<OpportunityTeamMember> > ();
             List<OpportunityTeamMember> opportunityTeammemberList = new List<OpportunityTeamMember>([Select id, UserId, User.Name, TeamMemberRole, Opportunityid 
             from OpportunityTeamMember where Opportunityid IN :opportunityIdToAccountId.values()]);
             if(opportunityTeammemberList.size()>0)
                {  
                 for(OpportunityTeamMember opportunityRecordTeamMember : opportunityTeammemberList)
                     {
                         List<OpportunityTeamMember> OpportunityTeamMember = ( opportunityRecordIdToCaseTeamMembers.get(opportunityRecordTeamMember.Opportunityid) == null) ?
                         new  List<OpportunityTeamMember>() : opportunityRecordIdToCaseTeamMembers.get(opportunityRecordTeamMember.Opportunityid);
                         OpportunityTeamMember.add(opportunityRecordTeamMember);
                         opportunityRecordIdToCaseTeamMembers.put(opportunityRecordTeamMember.Opportunityid, OpportunityTeamMember);   
                     }       
                           if(opportunityRecordIdToCaseTeamMembers.size() > 0)
                            {   
                              for(Case ct1: CaseTeam)
                                    {  
                                      Id opportunityRecordid = opportunityIdToAccountId.get(ct1.id);
                                      for(OpportunityTeamMember opportunityTeammemberList1: opportunityRecordIdToCaseTeamMembers.get(opportunityRecordid ))
                                        {
                                            CaseTeamMember casetmcopy = new CaseTeamMember();
                                            casetmcopy.MemberId =opportunityTeammemberList1.User.Id;
                                            casetmcopy.ParentId = ct1.id;
                                            casetmcopy.TeamRoleId = role.id ;
                                            caseTeammemberList.add(casetmcopy);
                                        }   
                                        
                                            
                                    }
                                try{
                                    Database.insert(caseTeammemberList);
                                }
                                catch(DmlException e) {
                                    System.debug('The following exception has occurred: ' + e.getMessage());
                                }
                           
                        }    
               }
               else /**Purpose: To add AccountTeamMembers to CaseTeamMember when opportunity doesnt exist on creation of case  ***/      
               { 
                   Map<id,List<AccountTeamMember> > AccIdToCaseTeamMembers = new    Map<id,  List<AccountTeamMember> > ();
                   List<AccountTeamMember> AccountTeammemberList = new List<AccountTeamMember>([Select id, UserId, User.Name, TeamMemberRole,AccountId
                   From AccountTeamMember where AccountId IN :AccountIdToAccountId.values()]);
                   if(AccountTeammemberList.size()>0)
                     {
                      for(AccountTeamMember AcctTeamMember : AccountTeammemberList) 
                         {
                            List<AccountTeamMember > AccountTeamMember = (AccIdToCaseTeamMembers.get(AcctTeamMember.AccountId) == null) ?
                            new  List<AccountTeamMember>() :  AccIdToCaseTeamMembers.get(AcctTeamMember.AccountId);
                            AccountTeamMember.add(AcctTeamMember);
                            AccIdToCaseTeamMembers.put(AcctTeamMember.AccountId, AccountTeamMember);   
                         }       
                            if(AccIdToCaseTeamMembers.size() > 0)
                              {   
                                for(Case ct1: CaseTeam)
                                {   
                                    Id Acctid = AccountIdToAccountId.get(ct1.id);
                                    for(AccountTeamMember AccountTeammemberList1 : AccIdToCaseTeamMembers.get(Acctid))
                                    {
                                        CaseTeamMember casetmcopy = new CaseTeamMember();
                                        casetmcopy.MemberId =AccountTeammemberList1.User.Id;
                                        casetmcopy.ParentId = ct1.id;
                                        casetmcopy.TeamRoleId = role.id ;
                                        caseTeammemberList.add(casetmcopy);
                                    }   
                                }
                                try{
                                    Database.insert(caseTeammemberList);
                                }
                                catch(DmlException e) {
                                    System.debug('The following exception has occurred: ' + e.getMessage());
                                }
                           
                             }    
                      }
                 }
                           
        }    
        catch(Exception e){
           system.debug('Error message is'+ e.getMessage());
        }
        }
                    
          
          
 //Request-001 , Defect : D-0357
 /***Purpose : To update the Opportunity THD store field and Ship To fields from corresponding Account on creation of Opportunity ***/     
        public static void opportunityRecordFields(List<opportunity> opportunityRecords)
        {  
           try{
           Set<Id> accountIdSet = new Set<Id>();
           List<opportunity> opportunityList = new  List<opportunity>();
           List<opportunity> opportunityFieldsList = new  List<opportunity>();
           for(opportunity op: opportunityRecords)
             {
                accountIdSet.add(op.Accountid);
                if(op.THD_Store__c==null)
                {
                  opportunityList.add(op);
                }
                opportunityFieldsList.add(op);
             }
                if(accountIdSet.size()>0)
                   {
                     Map<id,Account> accountMap = new Map<id,Account>([select id, ShippingStreet,Lead_Source__c,Sub_Lead_Source__c, ShippingCountry, ShippingCity, ShippingPostalCode, ShippingState, THD_Home_Store__c from Account where id IN:accountIdSet]);
                     for(opportunity opportunityRecord :  opportunityList)
                        {     
                         if(accountMap.containsKey(opportunityRecord.Accountid))
                            {
                               opportunityRecord.THD_Store__c = accountMap.get(opportunityRecord.Accountid).THD_Home_Store__c;                               
                            }
                        } 
                        
                        for(opportunity opportunityFieldRecord :  opportunityFieldsList)
                        {     
                         if(accountMap.containsKey(opportunityFieldRecord.Accountid))
                            {                              
                               opportunityFieldRecord.City__c = accountMap.get(opportunityFieldRecord.Accountid).ShippingCity;
                               opportunityFieldRecord.Country_Picklist__c = accountMap.get(opportunityFieldRecord.Accountid).ShippingCountry;
                               opportunityFieldRecord.State_Picklist__c = accountMap.get(opportunityFieldRecord.Accountid).ShippingState;
                               opportunityFieldRecord.Street__c = accountMap.get(opportunityFieldRecord.Accountid).ShippingStreet;
                               opportunityFieldRecord.Zipcode__c = accountMap.get(opportunityFieldRecord.Accountid).ShippingPostalCode;
                               opportunityFieldRecord.LeadSource = accountMap.get(opportunityFieldRecord.Accountid).Lead_Source__c;
                               opportunityFieldRecord.Sub_Lead_Source__c = accountMap.get(opportunityFieldRecord.Accountid).Sub_Lead_Source__c; 
                            }
                        } 
                    }
        }
           catch(Exception e){
           system.debug('Error message is'+ e.getMessage());
        }
        }
        
        
//Defect : D-0357
 /***Purpose : To update the Contact Lead Source and Sub-Lead source fields***/     
        public static void contactRecordFields(List<contact> contactRecords)
        {  
           try{
           Set<Id> accountIdSet = new Set<Id>();
           List<contact> contactList = new  List<contact>();    
           for(contact ct: contactRecords)
             {
                accountIdSet.add(ct.Accountid);
                contactList.add(ct);
             }
                if(accountIdSet.size()>0)
                   {
                     Map<id,Account> accountMap = new Map<id,Account>([select id,Lead_Source__c,Sub_Lead_Source__c from Account where id IN:accountIdSet]);
                     for(contact contactRecord :  contactList)
                        {     
                         if(accountMap.containsKey(contactRecord.Accountid))
                            {
                               contactRecord.LeadSource = accountMap.get(contactRecord.Accountid).Lead_Source__c;
                               contactRecord.Sub_Lead_Source__c = accountMap.get(contactRecord.Accountid).Sub_Lead_Source__c;   
                               
                            }
                        } 
                    }
        }
           catch(Exception e){
           system.debug('Error message is'+ e.getMessage());
        }
        }       
          
   
/*** Purpose: To Update case address fields with user object address fields depending on the SHIP TO Picklist values -- REQ - 040    ***/             
            public static void insertAddress(List<case> newCase){     // This is for updating the ShipTo address fields of the case record based on the values of the Ship_to__c Picklist values
             try{
             Set<id> requestorIdSet = new Set<id>();
             Set<id> opportunityIdSet = new Set<id>();
             Set<id> accountIdSet = new Set<id>();   
                
                for(Case caseRecord : newCase)                //Fetching the Ids of requestor and Owner so as to compare and update the address fields
                {
                    requestorIdSet.add(caseRecord.Requester__c);
                    opportunityIdSet.add(caseRecord.Opportunity__c);
                    if(caseRecord.Opportunity__c == NULL){
                        accountIdSet.add(caseRecord.AccountId);
                    }
                }
            
            Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([select Id, Street__c, City__c, State_Picklist__c, Country_Picklist__c, Zipcode__c from Opportunity where Id in: opportunityIdSet]);
            Map<Id, User> requestorMap = new Map<Id, User>([Select Id, Name,City,Country,PostalCode,State,Street from User where id in: requestorIdSet]);
            Map<Id, Account> accountMap;
            if(accountIdSet.size() > 0){
                accountMap = new Map<Id, Account>([select Id, ShippingCountry, ShippingCity, ShippingState, ShippingStreet, ShippingPostalCode from Account where id IN: accountIdSet]);
                }
                
            Opportunity sampleOpportunity = new Opportunity();
            User sampleUser = new User();
            Account sampleAccount = new Account();
            
                for(Case caseRecord : newCase)           //Looping through Trigger.New for updating the corresponding address fields
                {
                    if(caseRecord.Ship_To__c != NULL)
                    {
                     if(caseRecord.Ship_To__c.equalsIgnoreCase(Label.Ship_to_Rep) && requestorMap.size() > 0)  //if ship to is ship to rep, address fields get updated with address of requestor.
                     {
                          if(requestorMap.containsKey(caseRecord.Requester__c) && caseRecord.Requester__c != NULL){
                              
                              sampleUser = requestorMap.get(caseRecord.Requester__c);
                              caseRecord.Ship_To_Street__c = sampleUser.Street ;
                              caseRecord.Ship_To_City__c = sampleUser.City ;
                              caseRecord.Ship_To_State__c = sampleUser.State ;
                              caseRecord.Ship_To_Zip__c = sampleUser.PostalCode ;
                              caseRecord.Ship_To_Country__c = sampleUser.Country ;
                          }
                    
                        
                     }
                    
                    
                    if(caseRecord.Ship_To__c.equalsIgnoreCase(Label.Ship_to_Customer) && (opportunityMap.size()>0 || accountMap.size()>0))    //if ship to is ship to rep, address fields get updated with address of Case Owner.
                    {
                          if(opportunityMap.containsKey(caseRecord.Opportunity__c) && caseRecord.Opportunity__c != NULL){
                               
                              sampleOpportunity = opportunityMap.get(caseRecord.Opportunity__c);
                              caseRecord.Ship_To_Street__c = sampleOpportunity.Street__c ;
                              caseRecord.Ship_To_City__c = sampleOpportunity.City__c ;
                              caseRecord.Ship_To_State__c = sampleOpportunity.State_Picklist__c;
                              caseRecord.Ship_To_Zip__c = sampleOpportunity.Zipcode__c ;
                              caseRecord.Ship_To_Country__c = sampleOpportunity.Country_Picklist__c;
                          }
                          
                          if(accountMap.containsKey(caseRecord.AccountId) && caseRecord.AccountId != NULL && caseRecord.Opportunity__c == NULL){
                              
                              sampleAccount = accountMap.get(caseRecord.AccountId);
                              caseRecord.Ship_To_Street__c = sampleAccount.ShippingStreet ;
                              caseRecord.Ship_To_City__c = sampleAccount.ShippingCity ;
                              caseRecord.Ship_To_State__c = sampleAccount.ShippingState ;
                              caseRecord.Ship_To_Zip__c = sampleAccount.ShippingPostalCode ;
                              caseRecord.Ship_To_Country__c = sampleAccount.ShippingCountry ;                             
                          }  
                    }
                    
                }
                
              }
                
            }
            catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        }
          
                
                
    // Request No. 040
    // For 'BEFORE UPDATE' Condition explicitly
    /*** Purpose/Overview This is for updating the SHIP TO address fields in the case object based on the SHIP TO Picklist values **/
               
                
                
                
            public static void updateAddress(List<case> newCase, Map<Id, Case> oldM){     // This is for updating the ShipTo address fields of the case record based on the values of the Ship_to__c Picklist values
            try{
            Set<id> requestorIdSet = new Set<id>();
            Set<id> opportunityIdSet = new Set<id>();
            Set<id> accountIdSet = new Set<id>(); 
            
            Case oldCase = new Case();
            
            for(Case caseRecord: newCase)                //Fetching the Ids of requestor and Owner so as to compare and update the address fields
                {
                    requestorIdSet.add(caseRecord.Requester__c);
                    opportunityIdSet.add(caseRecord.Opportunity__c);
                    if(caseRecord.Opportunity__c == NULL){
                        accountIdSet.add(caseRecord.AccountId);
                    }
                }
            Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([select Id, Street__c, City__c, State_Picklist__c, Country_Picklist__c, Zipcode__c from Opportunity where Id in: opportunityIdSet]);
            Map<Id, User> requestorMap = new Map<Id, User>([Select Id, Name,City,Country,PostalCode,State,Street from User where id in: requestorIdSet]);
            Map<Id, Account> accountMap;
            if(accountIdSet.size() > 0){
                accountMap = new Map<Id,Account>([select Id, ShippingCountry, ShippingCity, ShippingState, ShippingStreet, ShippingPostalCode from Account where id IN: accountIdSet]);
                }
                
            Opportunity sampleOpportunity = new Opportunity();
            User sampleUser = new User();
            Account sampleAccount = new Account();
            
                for(Case caseRecord: newCase)           //Looping through Trigger.New for updating the corresponding address fields
                {
                
                    oldCase = oldM.get(caseRecord.Id);
                    
                    if(caseRecord.Ship_To__c != NULL)
                    {
                    
                            if( !(oldCase.AccountId == caseRecord.AccountId) || !(oldCase.Requester__c == caseRecord.Requester__c) || !(oldCase.Opportunity__c == caseRecord.Opportunity__c) || !(oldCase.Ship_To__c == caseRecord.Ship_To__c))
                            {
                            
                                if(caseRecord.Ship_To__c.equalsIgnoreCase(Label.Ship_to_Rep) && requestorMap.size() > 0)  //if ship to is ship to rep, address fields get updated with address of requestor.
                                {
                                    
                                  if(requestorMap.containsKey(caseRecord.Requester__c) && caseRecord.Requester__c != NULL){
                                  
                                      sampleUser = requestorMap.get(caseRecord.Requester__c);
                                      caseRecord.Ship_To_Street__c = sampleUser.Street ;
                                      caseRecord.Ship_To_City__c = sampleUser.City ;
                                      caseRecord.Ship_To_State__c = sampleUser.State ;
                                      caseRecord.Ship_To_Zip__c = sampleUser.PostalCode ;
                                      caseRecord.Ship_To_Country__c = sampleUser.Country ;
                                  }
                                       
                                
                                }
                                
                                
                                if(caseRecord.Ship_To__c.equalsIgnoreCase(Label.Ship_to_Customer) && (opportunityMap.size()>0 || accountMap.size()>0))    //if ship to is ship to rep, address fields get updated with address of Case Owner.
                                {
                                 
                                  if(opportunityMap.containsKey(caseRecord.Opportunity__c) && caseRecord.Opportunity__c != NULL){
                                      
                                      sampleOpportunity = opportunityMap.get(caseRecord.Opportunity__c);
                                      caseRecord.Ship_To_Street__c = sampleOpportunity.Street__c ;
                                      caseRecord.Ship_To_City__c = sampleOpportunity.City__c ;
                                      caseRecord.Ship_To_State__c = sampleOpportunity.State_Picklist__c ;
                                      caseRecord.Ship_To_Zip__c = sampleOpportunity.Zipcode__c ;
                                      caseRecord.Ship_To_Country__c = sampleOpportunity.Country_Picklist__c;
                                  }
                                  
                                  if(accountMap.containsKey(caseRecord.AccountId) && caseRecord.AccountId != NULL && caseRecord.Opportunity__c == NULL){
                              
                                      sampleAccount = accountMap.get(caseRecord.AccountId);
                                      caseRecord.Ship_To_Street__c = sampleAccount.ShippingStreet ;
                                      caseRecord.Ship_To_City__c = sampleAccount.ShippingCity ;
                                      caseRecord.Ship_To_State__c = sampleAccount.ShippingState ;
                                      caseRecord.Ship_To_Zip__c = sampleAccount.ShippingPostalCode ;
                                      caseRecord.Ship_To_Country__c = sampleAccount.ShippingCountry ;                             
                                  }   
                                        
                                }
                                
                            }
                            
                   }
               }
                        
                }
                catch(Exception e){
                system.debug('Error message is'+ e.getMessage());
        }
        }
          
                
 //Req - 089
 /***Purpose - To Update the Account Owner, if the Account_Ownership_Approval record is approved.***/
          public static void accountOwnerUpdate(List<Ownership_Approval_Account__c> ownershipApprovalList)
          {
                try{
                set<Id> accountIdSet = new set<Id>();
                //List<Ownership_Approval_Account__c> AccApp = new List<Ownership_Approval_Account__c>();
                
                List<Account> accountList = new List<Account>();
                Account accountToUpdate = new Account();
                for(Ownership_Approval_Account__c ownershipApprovalRecord : ownershipApprovalList)
                {
                    accountIdSet.add(ownershipApprovalRecord.Account__c);
                }
                Map<Id, Account> newAccountMap = new Map<Id,Account>([Select Id, Name, Ownerid FROM Account WHERE Id =: accountIdSet]); 
               for(Ownership_Approval_Account__c ownershipApprovalRecord: ownershipApprovalList)
               {
                     if(ownershipApprovalRecord.Approval_Status__c.equalsIgnoreCase(Label.Approved) && newAccountMap.containsKey(ownershipApprovalRecord.Account__c))
                     {
                        accountToUpdate = newAccountMap.get(ownershipApprovalRecord.Account__c);
                        accountToUpdate.Ownerid = ownershipApprovalRecord.New_Owner__c;
                        accountList.add(accountToUpdate);
                     }
                }
                     
                try{     
                    Database.update(accountList);
                }
                catch(DmlException e) {
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }
          }
           catch(Exception e){
           system.debug('Error message is'+ e.getMessage());
        }
        }
          
           
           
         
//REQ - 989
/***Purpose: To update the Opportunity field of the Actual Sales Record associated with Opportunity of the related OwnerShipApproval Record, when the approval status of OwnershipApproval Record is 'APPROVED'.  ***/
                
           Public static void updateASopportunity(List<Ownership_Approval__c> ownershipApprovalList)
              {
               try{
               Set<Id> opportunityIdSet = new Set<Id>();
               Set<Id> actualSalesIdSet = new Set<Id>(); 
               List<Actual_Sales__c> newActualSales = new List<Actual_Sales__c>();
               List<Actual_Sales__c> newActualSalesAcc = new List<Actual_Sales__c>();
               List<Actual_Sales__c> actualSalesToBeUpdated = new List<Actual_Sales__c>();
               set<id> opportunityRecordSet = new set<id>();  
                  
                       for(Ownership_Approval__c ownershipApprovalRecord: ownershipApprovalList)
                       {
                           opportunityIdSet.add(ownershipApprovalRecord.New_Opportunity_Entry__c);
                           actualSalesIdSet.add(ownershipApprovalRecord.ActualSales__c);
                       }
              
               Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([SELECT AccountId FROM Opportunity where id in: opportunityIdSet]);
                
               Map<Id, Actual_Sales__c> actualSalesMap = new Map<Id, Actual_Sales__c>([select Account_Name__c,Opportunity__c,Opportunity__r.Accountid, Opportunity_change_Check__c from Actual_Sales__c where id IN: actualSalesIdSet]); 
                              
                List<Actual_Sales__c> updateActualSalesList= new List<Actual_Sales__c>();
                Actual_Sales__c actualSalesRecord; 
                  if(actualSalesMap.size()>0)
                     {
                       for(Ownership_Approval__c ownershipApprovalRecord: ownershipApprovalList)
                       {
                           if((ownershipApprovalRecord.Status__c.equalsIgnoreCase(Label.Approved)) && actualSalesMap.containsKey(ownershipApprovalRecord.ActualSales__c))
                                   {
                                      actualSalesRecord = actualSalesMap.get(ownershipApprovalRecord.ActualSales__c);
                                      actualSalesRecord.Opportunity__c = ownershipApprovalRecord.New_Opportunity_Entry__c;
                                      opportunityRecordSet.add(actualSalesRecord.Opportunity__c);                               
                                      actualSalesRecord.Opportunity_change_Check__c = True;
                                                                            
                                      if(opportunityMap.containsKey(ownershipApprovalRecord.New_Opportunity_Entry__c)){
                                        actualSalesRecord.Account_Name__c = opportunityMap.get(ownershipApprovalRecord.New_Opportunity_Entry__c).AccountId;
                                        }
                                      updateActualSalesList.add(actualSalesRecord);
                                       
                                   }
                                   
                       }
                     
                       }
                      
          
                       
                
                try{     
                    Database.update(updateActualSalesList);
                }
                catch(DmlException e){
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }
                    if(updateActualSalesList.size()>0)
                    {
                        for(Actual_Sales__c  listActualSalesRecord: updateActualSalesList){
                            listActualSalesRecord.Opportunity_change_Check__c = false;
                            actualSalesToBeUpdated.add(listActualSalesRecord);
                            
                            }
                    }
                     
           
                    try{
                        Database.update(actualSalesToBeUpdated);
                    }
                    catch(DmlException e) {
                        System.debug('The following exception has occurred: ' + e.getMessage());
                    }
              
                } 
                 
                 catch(Exception e){
                 system.debug('Error message is'+ e.getMessage());
             }
             }
             
/***Purpose: To update the Quote Ship To fields, on update of their corresponding Opportunity Shipping fields (update of child from , on update of parent)***/             
public static void updateQuoteShipTo(List <opportunity> opportunityupdated)
  {
     Set<ID> opportunityIds= new Set<ID>();
     //List<Opportunity> opportunityIds= new List<Opportunity>();
     for(opportunity opt : opportunityupdated)
     {
        opportunityIds.add(opt.Id);
     }
  List<Quote> QuoteUpdate = new List<Quote>();
  
  if(opportunityIds.size()>0)
  {
   List<Quote> QuoteToUpdate = new List<Quote>([Select Id, OpportunityId, ShippingCity, ShippingCountry, ShippingState, ShippingStreet, ShippingPostalCode from Quote where OpportunityId IN: opportunityIds]);
     
     for(Opportunity oppUpd: opportunityupdated)
      { 
       for(Quote quoteUpd : QuoteToUpdate)
        {
         if(quoteUpd.OpportunityId == oppUpd.id)
          {
            Quote quoteRec = new Quote();
                  quoteRec.id = quoteUpd.id;
                  quoteRec.ShippingCity = oppUpd.City__c;
                   quoteRec.ShippingCountry = oppUpd.Country__c;
                   quoteRec.ShippingState = oppUpd.State__c;
                   quoteRec.ShippingStreet = oppUpd.Street__c;
                   quoteRec.ShippingPostalCode = oppUpd.Zipcode__c;
                   QuoteUpdate.add(quoteRec);
          }
         }
    }
}
  Database.update(QuoteUpdate);
}               

}