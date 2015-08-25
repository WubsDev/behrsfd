trigger Behr_UpdateLeadStatus on Task(after insert, after update) {
set<ID> leadID=new Set<ID>();
map<id,string> leadStatusMap = new map<id,string>();
for(Task tsk:trigger.new)
    {
    if (tsk.Update_Lead_Status__c != 'No Update'){
        leadID.add(tsk.WhoId);
        leadStatusMap.put(tsk.WhoId,tsk.Update_Lead_Status__c); 
    }
    }
   List<lead> leadList = [select id,status from lead where id IN :leadID];
   for (lead leadObj :leadList){
        if (leadStatusMap.containskey(leadObj.id)){
       leadObj.status = leadStatusMap.get(leadObj.id);
       }
   }
   
   //update leadList ;
   
   Database.update(leadList, false);
    
    

}