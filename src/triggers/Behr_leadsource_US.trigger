trigger Behr_leadsource_US on Lead (before insert,before update) {
    
    Map<Id,Home_Depot_Store__c> hdsmap = new 
    Map<Id,Home_Depot_Store__c>([SELECT Id,name FROM Home_Depot_Store__c]);
    
    for(Integer i=0;i<Trigger.new.size();i++) {
       
       If(Trigger.new[i].Primary_Store__c == null && 
       Trigger.new[i].Primary_Store_Number__c != null) {  
           Trigger.new[i].Primary_Store__c = hdsmap.get(Trigger.new[i].Primary_Store_Number__c).name;               
       } 
         
       If(Trigger.new[i].Primary_Store__c != null && 
           Trigger.new[i].Primary_Store_Number__c == null) {
           for(Id hdid : hdsmap.keyset()) {
               If(Trigger.new[i].Primary_Store__c == hdsmap.get(hdid).name) {
                   Trigger.new[i].Primary_Store_Number__c = hdsmap.get(hdid).id;    
               } 
           }      
       }
    }
    
}