/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ProRegistrationSyncTest {

    static testMethod void testSaveProInfo() {
        
        
        /*
        Contact contact = new Contact();
        Account account = new Account();
        contact.AssistantName = 'Assistant';
        contact.AssistantPhone = '714-545-7010';
        contact.FirstName = 'Pro';
        contact.LastName = 'Contractor';
        contact.Email = 'contractor@pchbuilders.com';
        contact.Phone = '714-545-7010';
        lead.Company = 'PCH Builders';
        contact.MailingStreet = '3400 Segerstrom Ave';
        contact.MailingCity = 'Santa Ana';
        contact.MailingState = 'CA';
        contact.MailingPostalCode = '92704';
        contact.Primary_Occupation__c = 'Architect';
        //contact.EstimatedUsage = '40';
        contact.Like_to_Receive_Behr_News_Offers__c = 'Yes';
   */     

        Lead lead = new Lead(
            Company = 'Aron Builders',
            Phone = '814-545-7010',
            FirstName = 'New',
            LastName = 'Pro',            
            Services_Requested__c = 'Job Specification',
            Estimated_Monthly_Paint_Usage__c = '>125 Gallons',
            Behr_Rep_Contact__c = 'Yes',
            Street = '3100 Segerstrom Ave',
            City = 'Newport Beach',
            State = 'CA',
            PostalCode = '92660',
            Type_of_Profession__c = 'Remodeler',
            HasOptedOutOfEmail = true            
            
            
        );

        lead.WOD_Active_User__c = false;
        lead.WOD_Address__c = 'http://www.aronbuilders.com';
        lead.Website = 'http://www.aronbuilders.com';
        
        
        String leadid = ProRegistrationSync.updateProContactInfo(lead);
        System.assert(leadid != null);
        
        String id = ProRegistrationSync.saveProContactInfo(lead);
        
        System.debug('@@@@@@lead:'+lead);
        System.debug('Id of the lead:'+id);
        
        
    }
}