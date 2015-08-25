trigger UpdateApprovers on Direct_Onboarding__c (Before Insert,Before Update,After Insert, After Update) {    
    if(trigger.isBefore){
        
        BehrClass.updateApprovers(Trigger.new);
         
    }
     if(trigger.isAfter){
        BehrClass.insertCreditCase(Trigger.new);  
    
    }
}