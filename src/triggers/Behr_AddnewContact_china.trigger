trigger Behr_AddnewContact_china on Account (after insert) {

List<Contact> addContact =new List<Contact>();
RecordType rt=[SELECT r.Id, r.Name, r.SobjectType 
                 FROM RecordType r 
                 WHERE SobjectType='Account' AND r.Name='China Standard Account'];
 RecordType rt1=[SELECT r.Id, r.Name, r.SobjectType 
                 FROM RecordType r 
                 WHERE SobjectType='Contact' AND r.Name='China Contact'];           
for(Account acc:trigger.new){
    if(acc.recordtypeid==rt.id){
        Contact con=new Contact();
        con.LastName=acc.Name;
         
        con.Street__c=acc.Mailing_Street__c;
        con.Zip_Postal_Code__c=acc.Mailing_Zip_Postal_Code__c;
        con.Country__c=acc.Mailing_Country__c;
        con.State_Province__c=acc.State_Province__c;
        con.City__c=acc.Mailing_City__c;
        con.Fax=acc.Fax;
        con.Email=acc.Contact_Email__c;
        con.Phone=acc.Phone;
        con.Secondary_phone__c=acc.Secondary_Phone__c;
        con.Secondary_email__c=acc.Secondary_Email__c;
        con.Accountid=acc.id;
        con.Gender__c=acc.Gender__c;
        con.recordtypeid=rt1.id;
        con.HiTouchContact__c=acc.HiTouchAccount__c;
        addContact.add(con);
        }
    }
    insert addContact ;
}