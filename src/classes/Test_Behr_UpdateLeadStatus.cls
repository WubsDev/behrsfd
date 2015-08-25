@isTest (Seealldata = true)
private class Test_Behr_UpdateLeadStatus{
    Static testmethod void testtrigger(){
    
        Profile p=[SELECT Id FROM profile WHERE name='Standard User Level 2'];
        Profile p1=[SELECT Id FROM profile WHERE name='System Administrator'];

        UserRole ur=new UserRole(Name='Behr Pro Rep'); 
        User u1=new User(alias = 'proxy456', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='proxy456',
        languagelocalekey='en_US',localesidkey='en_US',
        rpsm__c='test',
        UserRoleid=ur.id,
        profileid = p.Id,timezonesidkey='America/Los_Angeles',username='proxy@proxy456.com',CommunityNickname='proxy456.aaa');
        insert u1; 
  
  User u2=new User(alias = 'Behr', 
        email='proxy@proxy456.com',emailencodingkey='UTF-8', lastname='Behr Instore Rep',
        languagelocalekey='en_US',localesidkey='en_US',
        rpsm__c='test',
        UserRoleid=ur.id,
        profileid = p1.Id,timezonesidkey='America/Los_Angeles',username='abc@proxy456.com',CommunityNickname='proxy456.bbb');
        insert u2; 
    
system.runas(u2){
         Zip_Code_Assignment__c zca = new Zip_Code_Assignment__c(Zip_code__c='123458');
        insert zca;
        //Group g = new Group (name='Pro Unassigned',Type='Queue');
        //insert g;
        Home_Depot_Store__c hdt = new Home_Depot_Store__c(OWNERID=u1.id,NAME='6788888',STORE_REP_EMAIL__C='abc@gmail.com');
        insert hdt; 
        Lead l = new Lead(Company='Test',FirstName='Trigger',LastName='Test',Phone='98746513',Email='asd@as.com',PostalCode='123458' , Primary_Store_Number__c =hdt.id,  Zip_Code_lookup_del__c = zca.id,Estimated_Monthly_Paint_Usage__c='>125 Gallons',Status = 'Unqualified');
        insert l;
        l.Postalcode=null;
  
          update l;    
          List<Group> queueList = [select Id from Group where Name = 'Pro Unassigned' and Type = 'Queue'];
          id unAssignedProLeadId = null;
          if (queueList.size() >=0 )
          {
              unAssignedProLeadId = queueList[0].id;
          }
          l = new Lead(Company='Test',FirstName='Trigger',LastName='Test',Phone='98746513',Email='asd@as.com',OwnerId=unAssignedProLeadId);
        insert l;
        //l.PostalCode='123456';
        //update l;
        Task t = new Task(WhoId=l.Id,Subject='Test',ActivityDate=Date.Today(),Status='In Progress',Update_Lead_Status__c='contact made',Priority='Normal');
        insert t;
        }
  
  }      
  //l = [SELECT Id,First_Activity_Date__c FROM Lead WHERE Id = :l.Id];
        //System.assertEquals(t.ActivityDate,l.First_Activity_Date__c);
        
}