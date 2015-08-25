trigger BEHR_populateaccountonpayout_China on Case (before update) {

Set<id> setcaseid = new Set<id>();
Map<id, id> accidmap = new Map<id, id>();
Map<id, id> caseaccmap = new Map<id, id>();
List<Payouts__c> payoutlist = new List<Payouts__c>();
   
    for(Case c : trigger.new){
        if(Trigger.oldMap.get(c.id).AccountID!=Trigger.newMap.get(c.id).AccountID){
            setcaseid.add(c.id);            
            caseaccmap.put(c.id, c.AccountID);
        }
    }
    
   List<Payouts__c> lstpayout = [SELECT id, Account__c, Case__c
                                 FROM Payouts__c where Case__c in :setcaseid];
   
   for(Payouts__c pay : lstpayout){
   
       pay.Account__c = caseaccmap.get(pay.Case__c);
       payoutlist.add(pay);
   }
   
   update payoutlist;
}