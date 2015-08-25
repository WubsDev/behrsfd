@isTest
private class Test_Behr_AddnewContact_China{
static testmethod void test_ddnewContact_China(){
      Profile p=[SELECT Id FROM profile WHERE name='System Administrator'];
        UserRole ur=new UserRole(Name='CM'); 
        User u=new User(UserRoleid=ur.id,alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u; 
        RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Account' and name = 'China Standard Account'];
        Account objparentacc = new Account();
        objparentacc.RecordTypeid = rt.id;
        objparentacc.Name = '3456546vnmbmTest Accountnmbnb,';
        objparentacc.Mailing_Street__c= 'M G Road';
        objparentacc.Mailing_Zip_Postal_Code__c = '21045852';
        objparentacc.Mailing_Country__c = 'India';   
        objparentacc.State_Province__c ='WB';
        objparentacc.Mailing_City__c = 'kolkata';
        objparentacc.Fax = '465676878';
        objparentacc.Contact_Email__c = 'abc@gmail.com';
        objparentacc.Phone ='9999999999';
        objparentacc.Secondary_Phone__c = '325678412';
        objparentacc.Secondary_Email__c='xyz@gmail.com';
        objparentacc.Gender__c='Male';
        objparentacc.HiTouchAccount__c=true;
        insert objparentacc ;              
                     
                     
                     
                     
                     
                     
      
}
}