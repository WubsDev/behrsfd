trigger BEHR_updatecaseorigin_China on Case (after insert,after update) {

set<id> cidset = new set<id>();
set<id> aidset = new set<id>();
list<Case> clist = new list<Case>();
list<Account> alist = new list<Account>();
list<Case> updatelist = new list<Case>();


RecordType rt=[SELECT r.Id, r.Name, r.SobjectType 
                 FROM RecordType r 
                 WHERE SobjectType='Case' AND r.Name='China Issue Case'];
 RecordType rt1=[SELECT r.Id, r.Name, r.SobjectType 
                 FROM RecordType r 
                 WHERE SobjectType='Case' AND r.Name='China Inquiry Case']; 

for(Case c :Trigger.new){
if((c.RecordTypeId==rt.id || c.RecordTypeId == rt1.id) && c.Origin== 'None')
  {
  cidset.add(c.id);
  aidset.add(c.AccountId);
}

}
alist= [SELECT id, Source__c from Account Where id in: aidset];
clist= [SELECT id, AccountId, Origin from Case Where id in: cidset];

    for (Case c3: clist){
        for( Account a1:alist){
        if(c3.AccountId== a1.id)
        {
            c3.Origin = a1.Source__c;
            updatelist.add(c3);
        }
        Update updatelist;
        
    
    }

}


}