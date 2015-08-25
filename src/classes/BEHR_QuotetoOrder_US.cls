/*Class Name: BEHR_QuotetoOrder_US 
@Author Name: Prasanna C
@Purpose: This class has methods being called by triggers and button click events
@Created Date: 25/11/2014
@Last modified by: Prasanna
@Last modified date: 04/12/2014 */
/*** Apex class written to achieve the functionalities of triggers and Custom button click actions***/
Global with sharing class BEHR_QuotetoOrder_US {
    public BEHR_QuotetoOrder_US() {}


    //Request-071
    /*** Purpose : To update the Competitor multiselect picklist from the Account Behr Competitor field ***/    
    public static void opptyMultipick(List < opportunity > opportunityMultiField) {
        try{
            set < id > accountIdSet = new set < id > ();
            
            for (Opportunity opportunity: opportunityMultiField) {
                accountIdSet.add(opportunity.Accountid);
            }
            Map < id, Account > parentAccountMap = new Map < id, Account > ([select id, parentid, Current_Supplier__c from account where id IN: accountIdSet]);
            
            if (parentAccountMap.size() > 0) {
                for (Opportunity OpportunityMulti: opportunityMultiField) {
                    
                    if (parentAccountMap.containsKey(OpportunityMulti.Accountid)) {
                        String mutiselectpick = parentAccountMap.get(OpportunityMulti.Accountid).Current_Supplier__c;
                        OpportunityMulti.Competitors__c = mutiselectpick;
                    
                    }
                }

            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
    }


    //Request-067
    /*** Purpose : To update the Opportunity Team Members from Parent Account Team members and Grand Parent Account Team members ***/   
    public static void opptyTeamMember(List < opportunity > opportunityTeam) {
        try{
            list < OpportunityTeamMember > opportunityMemberList = new list < OpportunityTeamMember > ();           
            Map < Id, Id > opportunityIdToAccountId = new Map < Id, Id > ();

            for (Opportunity opportunitySource: opportunityTeam) {
                opportunityIdToAccountId.put(opportunitySource.Id, opportunitySource.AccountId);
            }
            if(opportunityIdToAccountId.size() > 0){
                Map < id, List < AccountTeamMember > > accountIdToAccountTeamMembers = new Map < id, List < AccountTeamMember > > ();
                for (AccountTeamMember accountTeamMember: [SELECT a.UserId, a.User.Name, a.TeamMemberRole, a.Id, a.AccountId
                FROM AccountTeamMember a
                WHERE a.AccountId in : opportunityIdToAccountId.values()]) {

                    List < AccountTeamMember > accountTeamMembers = (accountIdToAccountTeamMembers.get(accountTeamMember.Accountid) == null) ? new List < AccountTeamMember > () : accountIdToAccountTeamMembers.get(accountTeamMember.Accountid);
                    accountTeamMembers.add(accountTeamMember);
                    accountIdToAccountTeamMembers.put(accountTeamMember.Accountid, accountTeamMembers);

                }

                if (accountIdToAccountTeamMembers.size() > 0) {
                    for (Opportunity opportunityAccount: opportunityTeam) {
                        Id accountID = opportunityIdToAccountId.get(opportunityAccount.Id);
                        for (AccountTeamMember acct1: accountIdToAccountTeamMembers.get(accountID)) {
                            OpportunityTeamMember newOpportunityTeamMember = new OpportunityTeamMember();
                            newOpportunityTeamMember.UserId = acct1.UserId;
                            newOpportunityTeamMember.TeamMemberRole = acct1.TeamMemberRole;
                            newOpportunityTeamMember.OpportunityId = opportunityAccount.ID;
                            opportunityMemberList.add(newOpportunityTeamMember);
                        }

                    }

                }
            }
            Map < Id, Id > opportunityIdToParAccountId = new Map < Id, Id > ();
            Map < Id, Account > mapIdToAcc = new Map < Id, Account > ([SELECT Id, ParentId FROM Account WHERE Id IN: opportunityIdToAccountId.values()]);
            if(mapIdToAcc.size() > 0){
                for (Id oppId: opportunityIdToAccountId.keySet()) {
                    Id accId = opportunityIdToAccountId.get(oppId);
                    Id parId = mapIdToAcc.get(accId).ParentId;
                    opportunityIdToParAccountId.put(oppId, parId);
                }

                Map < id, List < AccountTeamMember > > accountIdToParAccountTeamMembers = new Map < id, List < AccountTeamMember > > ();
                for (AccountTeamMember parentAccountTeamMember: [SELECT a.UserId, a.User.Name, a.TeamMemberRole, a.Id, a.AccountId
                FROM AccountTeamMember a
                WHERE a.AccountId in : opportunityIdToParAccountId.values()]) {

                    List < AccountTeamMember > parentAccountTeamMembers = (accountIdToParAccountTeamMembers.get(parentAccountTeamMember.Accountid) == null) ? new List < AccountTeamMember > () : accountIdToParAccountTeamMembers.get(parentAccountTeamMember.Accountid);
                    parentAccountTeamMembers.add(parentAccountTeamMember);
                    accountIdToParAccountTeamMembers.put(parentAccountTeamMember.Accountid, parentAccountTeamMembers);

                }
                if (accountIdToParAccountTeamMembers.size() > 0) {
                    for (Opportunity opportunityParAccount: opportunityTeam) {
                        Id parAccountID = opportunityIdToParAccountId.get(opportunityParAccount.Id);
                        for (AccountTeamMember acct2: accountIdToParAccountTeamMembers.get(parAccountID)) {
                            OpportunityTeamMember newOpportunityTeamMemberParent = new OpportunityTeamMember();
                            newOpportunityTeamMemberParent.UserId = acct2.UserId;
                            newOpportunityTeamMemberParent.TeamMemberRole = acct2.TeamMemberRole;
                            newOpportunityTeamMemberParent.OpportunityId = opportunityParAccount.ID;
                            opportunityMemberList.add(newOpportunityTeamMemberParent);
                        }
                    }
                }
            }
            try {
                Database.insert(opportunityMemberList);
            } Catch(DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
    }
    



    //Request-059
    /***Purpose : To send Email to users dynamically on send email button in case layout***/   
    public static void sendTestEmail1(String Email, String documentName) {
        try{
            // Global class for sending EMail with Attachment from Documents 
            //Create a new single email message object
            Messaging.SingleEmailMessage creditApplicationMail = new Messaging.SingleEmailMessage();
            //Address
            creditApplicationMail.setToAddresses(new String[] {Email});
            creditApplicationMail.setSubject(Label.Behr_Credit_Application_Subject);
            creditApplicationMail.setPlainTextBody(Label.Behr_Credit_Application_Body);

            //Attachments
            Document creditDocument = [select id, name, body, contenttype, developername, type from Document where name = : documentName];

            if (creditDocument != null) {
                Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
                attach.setContentType(creditDocument.contentType);
                attach.setFileName(creditDocument.name + '.' + creditDocument.type);
                attach.setInline(false);
                attach.Body = creditDocument.Body;
                creditApplicationMail.setFileAttachments(new Messaging.EmailFileAttachment[] {attach});

                //Send
                List < Messaging.Sendemailresult > objER = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {creditApplicationMail});
            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
    }


    //Request-126    
    /***Purpose : To Clone a Quote Record with all the properties and Quote Line items***/      
    webservice static Id cloneQuotes(id qid) {
        String quoteName;
        Id finalQuoteId;
        List < QuoteLineItem > clonedQuoteLineList = new List < QuoteLineItem > ();
        Id oppId;
        string quoteIds = 'id=\'' + qid + '\'';
        Quote qlst;
        try{
            qlst = [select Account__r.name, RecordtypeID, OpportunityID, name from Quote where id = : qid limit 100];


            if (qlst != null) {
                oppId = qlst.OpportunityID;

                String soql = BEHR_QuoteClone_US.getCreatableFieldsSOQL('Quote', quoteIds);

                Quote sourceQuote = (Quote) Database.query(soql);
                Quote clonedQuote = sourceQuote.clone(false, true);
                clonedQuote.OpportunityId = oppId;
                clonedQuote.Sent_To_HD__c = false;
                try {
                    Database.insert(clonedQuote);
                } catch (DmlException e) {
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }

                for (Quotelineitem qli: [SELECT Your_Price__c, Vendor__c, Use__c, UnitPrice, TotalPrice, Subtotal, SortOrder, Size__c, Sheen__c, QuoteId, Quantity, PricebookEntryId, Price_per_Gallon__c, ListPrice, LineNumber, Discount, Description, Color_Vendor__c, Color_Name_Code__c, Base__c, X384ths_1__c, X384ths_2__c, X384ths_3__c, X384ths_4__c, X384ths_5__c, Colorant__c, Colorant1__c, Colorant2__c, Colorant3__c, Colorant4__c, Color_Name_Code1__c, OZ_1__c, OZ_2__c, OZ_3__c, OZ_4__c, OZ_5__c
                FROM QuoteLineItem
                WHERE QuoteId = : sourceQuote.id limit 500]) {
                    Quotelineitem insertqli;
                    insertqli = qli.clone(false, true);
                    insertqli.QuoteId = clonedQuote.id;
                    clonedQuoteLineList.add(insertqli);

                }
                try {
                    Database.insert(clonedQuoteLineList);
                } catch (DmlException e) {
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }


                quoteName = clonedQuote.name;
                clonedQuote.name = System.Now().format('MM/dd/yy HH:mm a', 'PST') + '_' + quoteName;
                
                try {
                    Database.update(clonedQuote);
                } catch (DmlException e) {
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }
                finalQuoteId = clonedQuote.id;

            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return finalQuoteId;
    }


    //Request-991    
    /***Purpose : To Convert the quote Record type to order "Convert to Order" Button Click***/     
    webservice static Id convertQuote(id qid) {
        try{
            Schema.DescribeSObjectResult quoteSchema = Schema.SObjectType.Quote;
            Map < String, Schema.RecordTypeInfo > rtNameCsrec = quoteSchema.getRecordTypeInfosByName();
            Schema.RecordTypeInfo orderRTName = rtNameCsrec.get(Label.Order_RT);
            Id orderId = orderRTName.getRecordTypeId();

            Quote quoteRTChange;
            quoteRTChange = [select id, Recordtypeid from Quote where id = : qid limit 100];

            if (quoteRTChange != null) {
                quoteRTChange.Recordtypeid = orderId;
                quoteRTChange.Converted_to_Order__c = True;

            }
            try {
                Database.update(quoteRTChange);
            } catch (DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return qid;

    }

    //- Request - 181    
    /***Method is used to create a Case with Book/Board Recordtype on click of Book/Board custom button on Scheme layout***/    
    webservice static Id createBookCase(id qid) {
        Scheme__c schemecase;
        Id caseId;
        Date dateNeeded;
        Id sourceCase;
        try{
            schemecase = [select name, Case__c from Scheme__c where id = : qid limit 100];
            if (schemecase != null) {
                sourceCase = schemecase.Case__c;
            }
            dateNeeded = System.TODAY();
            String caseRType = Label.Color_Book_Board_Label;
            String schemeRType = Label.Book_Board_Scheme;
            caseId = createSchemeCase(dateNeeded, caseRType, qid, schemeRType, sourceCase);
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return caseId;

    }

    //- Request - 181   
    /***Method is used to create a Case with DigitalRendering Recordtype on click of Book/Board custom button on Scheme layout***/      
    webservice static Id createDigitalRendering(id qid) {
        Scheme__c schemecase;
        Id caseId;
        Date dateNeeded;
        Id sourceCase;
        try{
            schemecase = [select name, Case__c from Scheme__c where id = : qid limit 100];
            if (schemecase != null) {
                sourceCase = schemecase.Case__c;
            }
            dateNeeded = system.TODAY() + 3;
            String caseRType = Label.Digital_Renderings;
            String schemeRType = Label.Digital_Rendering_Scheme;
            caseId = createSchemeCase(dateNeeded, caseRType, qid, schemeRType, sourceCase);
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return caseId;

    }


    //- Request - 181    
    /*** Method is used to create a Case with DrawDowns Recordtype on click of Draw Down custom button on Scheme layout***/     
    webservice static Id createDrawDowns(id qid) {
        Scheme__c schemecase;
        Id caseId;
        Date dateNeeded;
        Id sourceCase;
        try{
            schemecase = [select name, Case__c from Scheme__c where id = : qid limit 100];
            if (schemecase != null) {
                sourceCase = schemecase.Case__c;
            }
            dateNeeded = system.TODAY() + 3;
            String caseRType = Label.Draw_Downs;
            String schemeRType = Label.Draw_Down_Scheme;
            caseId = createSchemeCase(dateNeeded, caseRType, qid, schemeRType, sourceCase);
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return caseId;

    }



    // Request - 181    
    /*** Standard method called by three methods for creation of case along with source scheme record.***/      
    public static id createSchemeCase(Date dateNeeded, String caseRType, Id Schemeid, String stype, Id Sourcecasid) {

        Schema.DescribeSObjectResult caseSchema = Schema.SObjectType.Case;
        Map < String, Schema.RecordTypeInfo > rtNameCsrec = caseSchema.getRecordTypeInfosByName();
        Schema.RecordTypeInfo caseRTName = rtNameCsrec.get(caseRType);
        Id caseRTId = caseRTName.getRecordTypeId();

        Schema.DescribeSObjectResult schemeSchema = Schema.SObjectType.Scheme__c;
        Map < String, Schema.RecordTypeInfo > rtNameCsrec1 = schemeSchema.getRecordTypeInfosByName();
        Schema.RecordTypeInfo schemeRTName = rtNameCsrec1.get(stype);
        Id schemeRT = schemeRTName.getRecordTypeId();
        
        Database.DMLOptions dmo = new Database.DMLOptions();
        List < competitor_colors__c> clonedColorSelectionList= new List < competitor_colors__c> ();
        case newCaseRecord = new case ();
        try{
            Case sourceCase = [select Opportunity__c, AccountID, ContactID, Color_BookBoard_Type__c, Requester__c, Ship_To__c, Ship_To_City__c, Ship_To_Zip__c, Ship_To_State__c, Ship_To_Street__c,Description from case where id = : Sourcecasid limit 100];
            newCaseRecord = sourceCase.clone(false, true);
            newCaseRecord.RecordTypeId = caseRTId;
            newCaseRecord.Status = Label.Case_Open_Status;
            dmo.assignmentRuleHeader.useDefaultRule = true;
            newCaseRecord.setOptions(dmo);

            if (sourceCase.Color_BookBoard_Type__c != null && caseRType.equalsIgnoreCase(Label.Color_Book_Board_Label)) {
                if (sourceCase.Color_BookBoard_Type__c.equalsIgnoreCase(Label.Color_Book)) {
                    newCaseRecord.Date_Needed_By__c = dateNeeded + 4;
                } else if (sourceCase.Color_BookBoard_Type__c.equalsIgnoreCase(Label.Color_Board)) {
                    newCaseRecord.Date_Needed_By__c = dateNeeded + 14;
                }

            } else {
                newCaseRecord.Date_Needed_By__c = dateNeeded;
            }

            try {
                Database.insert(newCaseRecord);
            } catch (DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }

            Scheme__c schemeSource = [select name, EFB_requests__c, of_color_formula_requests__c, of_colors__c, of_draw_downs__c, Account__c, Origin__c, Color_Name__c, Color_Number__c, Color_Placement__c, Custom_Links__c, EFB_Upload__c, Elevation__c, Formula_Needed__c, InteriorExterior__c, Manufacturer__c, Picture_Angle__c, Priority__c, Product_Line__c, Scheme__c, Sheen__c, Subject__c, Type__c, WebEmail__c
            from Scheme__c where id = : Schemeid limit 100];
            Scheme__c clonedScheme = schemeSource.clone(false, true);
            clonedScheme.Case__c = newCaseRecord.id;
            clonedScheme.RecordTypeId = schemeRT;
            try {
                Database.insert(clonedScheme);
            } catch (DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
            
            for (competitor_colors__c colorSelection: [SELECT Name,Scheme__c,CurrencyIsoCode,of_draw_downs__c,Competitor_Color__c,Color_Formula_needed__c,Type__c,EFB__c,Other_placement__c,Placement__c,Product__c,Type_of_location__c
            FROM competitor_colors__c
            WHERE Scheme__c = : Schemeid limit 500]) {
                competitor_colors__c clonedColorSelection;
                clonedColorSelection = colorSelection.clone(false, true);
                clonedColorSelection.Scheme__c = clonedScheme.id;
                clonedColorSelectionList.add(clonedColorSelection);

            }
            try {
                Database.insert(clonedColorSelectionList);
            } catch (DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
            
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return newCaseRecord.id;

    }

    //Request - 178    
    /***To update opportunity record after the update event on Case***/
    public static void updateopptyCase(List <case> caseRecord) {
        try{
            set < id > opportunityIdSet = new set < id > ();
            List < Opportunity > caseOpportunity = new List < Opportunity > ();
            for (Case Cases: caseRecord) {
                opportunityIdSet.add(Cases.Opportunity__c);
            }
            if (opportunityIdSet.size() > 0) {
                caseOpportunity = [select id from Opportunity where id IN: opportunityIdSet];
                try {
                    Database.update(caseOpportunity);
                } catch (DmlException e) {
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }
            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
    }
    
    /***To update opportunity record after the update event on Quote***/
    public static void updateopptyQuote(List < Quote > Quote1) {
        try{
            set < id > opportunityIdSet = new set < id > ();

            List < Opportunity > quoteOpportunity = new List < Opportunity > ();

            if (trigger.isInsert || trigger.isUpdate) {

                for (Quote Quotes: Quote1) {

                    opportunityIdSet.add(Quotes.Opportunityid);
                }
                if (opportunityIdSet.size() > 0) {

                    quoteOpportunity = [select id from Opportunity where id IN: opportunityIdSet];
                    try {
                        Database.update(quoteOpportunity);
                    } catch (DmlException e) {
                        System.debug('The following exception has occurred: ' + e.getMessage());
                    }
                }
                
            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
    }
    
    /***To update opportunity record after the update event on Task***/
    public static void updateopptyTask(List < Task > Task) {
        try{
            set < id > opportunityIdSet = new set < id > ();
            List < Opportunity > taskOpportunity = new List < Opportunity > ();
            for (Task Task1: Task) {
                opportunityIdSet.add(Task1.whatid);
            }
            taskOpportunity = [select id from Opportunity where id IN: opportunityIdSet];

            if (taskOpportunity.size() > 0) {
                Try {
                    Database.update(taskOpportunity);
                } catch (DmlException e) {
                    System.debug('The following exception has occurred: ' + e.getMessage());
                }
            }
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
    }
    
    //Defect - D-0236
    /*** Updating Quote Line items when Color for Orders record is created ***/
    public static void colorsQuoteUpdate(List < Color_for_orders__c> colorOrdersList) {
        try{ 
            Boolean limitColors=false;
            Set<Id> competitorIdSet = new set<id>();
            QuoteLineItem line; 
            QuoteLineItem  quoteLine;
            List<QuoteLineItem> quoteLineList = new List<QuoteLineItem>(); 
            Set<Id> quoteLineSet = new Set<id>(); 
            
            for(Color_for_orders__c colors: colorOrdersList){
                
                quoteLineSet.add(colors.Quote_Line_Item__c);
               
            }
            
            list<QuoteLineItem> quoteLineItemsList = new list<QuoteLineItem>([select id, (Select name,Brand__c,Competitor_Color__r.name,createdDate from Color_for_orders__r ORDER BY createdDate Asc limit 1 ) from QuoteLineItem where id IN: quoteLineSet]);
            
           for(QuoteLineItem q1:quoteLineItemsList ){
               if(q1.Color_for_orders__r.size() > 0){
                   for(Color_for_orders__c c1:q1.Color_for_orders__r ){
                        
                            QuoteLineItem q2 = new QuoteLineItem (id= q1.id);
                            q2.Color_Vendor__c = c1.Brand__c;
                            q2.Color_Name_Code1__c= c1.competitor_Color__r.name;
                            quoteLineList.add(q2);
                            
                     
                   }
               }
               else{
                   QuoteLineItem q2 = new QuoteLineItem (id= q1.id);
                   q2.Color_Vendor__c = null;
                   q2.Color_Name_Code1__c= null;
                   quoteLineList.add(q2);
               
               }
               
           }   
            
            
            try{
                Database.Update(quoteLineList);
            }
            Catch(Exception e){
                system.debug('Color for Order Error message is'+ e.getMessage());
            }
        }
        Catch(Exception e){
            system.debug('Color for Order Error message is'+ e.getMessage());
        }
     
    }
    
    
     //Defect - D-0265
    /*** Updating Account Zone when Direct Onboarding record is updated ***/
    public static void accountZoneUpdate(List < Direct_Onboarding__c > directOnboardList) {
        try{
            Set<Id> accountIdSet = new set<id>();   
            Account accountItem;
            List<Account> accountList = new List<Account>();  
            for(Direct_Onboarding__c accountOnboardRec : directOnboardList){
                accountIdSet.add(accountOnboardRec .Account_Name__c);
            }
            
            Map<id,Account> accountMap = new Map<id,Account>([select id,name from Account where id IN: accountIdSet]);
            
            
            for(Direct_Onboarding__c accountOnboard: directOnboardList){
                if(accountMap .containsKey(accountOnboard.Account_Name__c)){
                    if(accountOnboard.Status__c.equalsIgnoreCase(Label.Pending_Credit_Review)){         
                        accountItem = accountMap.get(accountOnboard.Account_Name__c);
                        accountItem.Zone__c= accountOnboard.Approved_Account_Zone__c;
                        accountList.add(accountItem);
                    
                    }
                }   
            }
            
            
            
            try{
                Database.Update(accountList);
            }
            Catch(Exception e){
                system.debug('Account Zone Error message is'+ e.getMessage());
            }
        }
        Catch(Exception e){
            system.debug('Account Zone Error message is'+ e.getMessage());
        }
    }
    
    //Req 177,178,179,988    
    /***Regarding updating opportunity stage field as per the requirements***/
    public static void updateOpptyStage(List < opportunity > opportunityStage) {
        try{
            Set < Id > opportunitySetId = new Set < Id > ();
            Boolean convertQuote;
            Integer explored = 0; 
            Integer educate = 0;   
            Integer recommend = 0;
            for (Opportunity opp: opportunityStage) {

                opportunitySetId.add(opp.id);
                
            }
            List < OpportunityLineItem > opportunityLineList = new List < OpportunityLineItem > ([select id from opportunityLineItem where OpportunityId in : opportunitySetId]);
            List < Quote > quoteList = new List < Quote > ([select id, Convert_to_Order__c, Converted_to_Order__c from Quote where OpportunityId IN: opportunitySetId]);
            List <case > newCase = new List <case >();
            List <task> opportunityActivity = new List < task > ([SELECT Id, Subject,whatid  FROM task where whatid IN: opportunitySetId Limit 500]);


            for (case c:[select id, RecordType.Name from case where Opportunity__C IN: opportunitySetId]) {
                if (c.RecordType.Name.equalsIgnoreCase(Label.Color_Recommendation) || c.RecordType.Name.equalsIgnoreCase(Label.Color_Matching) || c.RecordType.Name.equalsIgnoreCase(Label.Digital_Renderings) || c.RecordType.Name.equalsIgnoreCase(Label.Color_Book_Board_Label) || c.RecordType.Name.equalsIgnoreCase(Label.Specification)) {
                    newCase.add(c);
                }
            }

            for (Quote quoteRecord: quoteList) {
                if (quoteRecord.Converted_to_Order__c == True) {
                    convertQuote = True;
                }
            }


            for (Opportunity opp2: opportunityStage) {
            
                if(opp2.StageName != Label.Lost){
              
                    if (opportunityActivity.size() > 0) {
        
                            for (task task1: opportunityActivity) {
                                if ((task1.whatid == opp2.id) && (task1.Subject.equalsIgnoreCase(Label.Text_Msg) ||task1.Subject.equalsIgnoreCase(Label.Call_Task) || task1.Subject.equalsIgnoreCase(Label.Phone_Call) || task1.Subject.equalsIgnoreCase(Label.Email)) ) {
                                    explored = explored + 1;
                                    
                                } 

                                if (((task1.Subject.equalsIgnoreCase(Label.Job_Site_Visit) || task1.Subject.equalsIgnoreCase(Label.Create_Draw_Down) || task1.Subject.equalsIgnoreCase(Label.Office_Visit) || task1.Subject.equalsIgnoreCase(Label.Sit_Down_Meeting)) ) ) {
                                    educate = educate + 1;
                                }   
                                
                                if (((task1.Subject.equalsIgnoreCase(Label.Job_Walk) || task1.Subject.equalsIgnoreCase(Label.Store_Visit) || task1.Subject.equalsIgnoreCase(Label.Submit_Bid) ) ) ) {
                                    recommend = recommend + 1;
                                }
                                                                                            
                            }
                        }                    
                       
                    
                    if ( explored > 0 && (opp2.StageName != Label.Educate && opp2.StageName != Label.Recommend && opp2.StageName != Label.Won_Satisfy ) ) {
                        opp2.StageName = Label.Explore;
                        //opp2.Current_Stage__c = Label.Explore ;                       
                    }
    
    
                    if (((educate > 0)||(opportunityLineList.size() > 0)) && ( opp2.StageName != Label.Recommend && opp2.StageName != Label.Won_Satisfy)) {
                        opp2.StageName = Label.Educate; 
                       // opp2.Current_Stage__c = Label.Educate ;
                                                  
                    }
    
                    if (( recommend>0 || quoteList.size() > 0 || newCase.size() > 0) && (opp2.StageName != Label.Won_Satisfy)) {
                        opp2.StageName = Label.Recommend; 
                        //opp2.Current_Stage__c = Label.Recommend ;                     
    
                    }
    
                    if ((convertQuote == True || opp2.Actual_Purchase_Amount__c != 0)) {
                        opp2.StageName = Label.Won_Satisfy;
                        //opp2.Current_Stage__c = Label.Won_Satisfy ;
                    }  
        
                    
        
               } 
            }
        }
        Catch(Exception e){
             system.debug('Opportunity Stages Error message is'+ e.getMessage());
        }

    }
}