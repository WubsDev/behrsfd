global class ProRegistrationSync {
    
    
    webService static String saveProContactInfo(Lead lead) {
        
        String id = '';
        
        try { 
                lead.LeadSource = 'Marketing';
                lead.Sub_Lead_Source__c = 'BehrPro Website';
                lead.RecordTypeId = '012700000001Y7s'; //Standard Leads
                
                Database.SaveResult leadSaveResult = Database.Insert(lead, false);
                
                id = leadSaveResult.getId();
                
                Database.Error[] errsLead = leadSaveResult.getErrors();
                for(Database.Error err : errsLead)
                    System.debug(err.getStatusCode() + ' - ' + err.getMessage());
                
                /*
                Database.SaveResult contactSaveResult = Database.Insert(contact, false);
                                        
                Database.Error[] errsContact = contactSaveResult.getErrors();
                for(Database.Error err : errsContact)
                    System.debug(err.getStatusCode() + ' - ' + err.getMessage());
                    */                    
                } catch (Exception e) {
                    System.debug(e.getTypeName() + ' - ' + e.getCause() + ': ' + e.getMessage());
                }
        
        return id;
            }
           
    webService static String updateProContactInfo(Lead lead) {
        
        String id = '';
        
        try { 
                Lead existingLead = [SELECT Company, Phone, FirstName, LastName, 
                 Services_Requested__c, Estimated_Monthly_Paint_Usage__c, Next_Expected_Paint_Purchase__c,
                 Preferred_Brands__c, Behr_Rep_Contact__c, Street, City, State, PostalCode, Market_Segment__c, 
                 HasOptedOutOfEmail, WOD_Active_User__c, WOD_Address__c, 
                 Preferred_Language__c, Pro_Rewards_Account_Number__c, 
                 Website  FROM Lead
                 WHERE Email = :lead.Email LIMIT 1];
                                 
                //lead.Company = existingLead.Company;
                if (existingLead == NULL) {
                    saveProContactInfo(lead);
                } else {
                    existingLead.Company = lead.Company;
                    existingLead.Phone = lead.Phone;
                    existingLead.FirstName = lead.FirstName;
                    existingLead.LastName = lead.LastName;
                    existingLead.Services_Requested__c = lead.Services_Requested__c;
                    existingLead.Estimated_Monthly_Paint_Usage__c = lead.Estimated_Monthly_Paint_Usage__c;
                    existingLead.Next_Expected_Paint_Purchase__c = lead.Next_Expected_Paint_Purchase__c;
                    if (lead.Behr_Rep_Contact__c == 'NoChange'){
                        //do nothing
                    } else {
                        existingLead.Behr_Rep_Contact__c = lead.Behr_Rep_Contact__c;
                    }                
                    existingLead.Street = lead.Street;
                    existingLead.City = lead.City;
                    existingLead.State = lead.State;
                    existingLead.PostalCode = lead.PostalCode;                
                    existingLead.Market_Segment__c = lead.Market_Segment__c;
                    existingLead.HasOptedOutOfEmail = lead.HasOptedOutOfEmail;
                    existingLead.WOD_Active_User__c = lead.WOD_Active_User__c;
                    existingLead.WOD_Address__c = lead.WOD_Address__c;
                    
                    existingLead.Preferred_Language__c = lead.Preferred_Language__c;
                    existingLead.Pro_Rewards_Account_Number__c = lead.Pro_Rewards_Account_Number__c;
                    
                    existingLead.Preferred_Brands__c = lead.Preferred_Brands__c;
                    
                    //existingLead.Website = lead.Website;
                    
                    update existingLead;     
                }
                
                        
                                  
                } catch (Exception e) {
                    System.debug(e.getTypeName() + ' - ' + e.getCause() + ': ' + e.getMessage());
                }
        
        return id;
            }
}