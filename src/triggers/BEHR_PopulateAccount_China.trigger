trigger BEHR_PopulateAccount_China on Payouts__c (after insert) {

 List<Payouts__c> updatepayoutlst = new List<Payouts__c>();
 Map<String, id> mapaccid = new Map<String, id>();
 Map<id, String> maprecordtype = new Map<id, String>();
 Set<String> setaccount = new Set<String>();
 List<RecordType> listrt = [SELECT id, name
                            FROM Recordtype
                            WHERE SobjectType = 'Payouts__c'];
  
  for(Recordtype rt: listrt){
      maprecordtype.put(rt.id, rt.name);  
  }       
   
  for(Payouts__c p : trigger.new){
        
     if(maprecordtype.get(p.recordtypeid) == 'China Payout'){      
        setaccount.add(p.Account1__c);     
     } 
  }
    List<Account> listaccid = [SELECT id, Name
                               FROM Account
                               WHERE Name in :setaccount];
                         
   for(Account a : listaccid)
         mapaccid.put(a.name, a.id);
   
         
   for(Payouts__c updatep : trigger.new){
      if(maprecordtype.get(updatep.recordtypeid) == 'China Payout'){
                     
           Payouts__c p1 = new Payouts__c(id = updatep.id);
           p1.Account__c = mapaccid.get(updatep.Account1__c);      
           updatepayoutlst.add(p1);                  
       
       }       
    }

    update updatepayoutlst;
    
}