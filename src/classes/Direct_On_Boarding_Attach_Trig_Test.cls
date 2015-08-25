@isTest(SeeAllData=true)
public class Direct_On_Boarding_Attach_Trig_Test {
	static testMethod void testAttachments()
    {
        Test.startTest();
    	//List<Direct_Onboarding__c> dobcs = new List<Direct_Onboarding__c>();
       // dobcs.add(new Direct_Onboarding__c(Name='Test Direct Acct'));
        Account acct = new Account(Name = 'Test Direct Account', Phone = '7145457101',Market_Segment__c = 'Architect',Market_Sub_Segment__c = 'New Contsruction',Property_Type__c = 'Residential: Single Family Homes',Current_Supplier__c = 'Valspar',Lead_Source__c  = 'Behr In-Store Rep' );
        insert acct;
        Direct_Onboarding__c dobc = new Direct_Onboarding__c();
        dobc.Account_Name__c=acct.Id;
        insert dobc;
        Attachment attach=new Attachment();   	
    	attach.Name='Unit Test Attachment';
    	Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    	attach.body=bodyBlob;
        attach.parentId=dobc.id;
        insert attach;
    	
    	List<Attachment> attachments=[select id, name from Attachment where parent.id=:dobc.id];
        System.assertEquals(1, attachments.size());
        
        delete attach;
        List<Attachment> attachmentsdel=[select id, name from Attachment where parent.id=:dobc.id];
        System.assertEquals(0, attachmentsdel.size());
        
        Test.stopTest();
    }
}