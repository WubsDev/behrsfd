//Defect D-0357
/*** This trigger is written to copy the value of Primary store # field to Primary Store clone field***/
trigger updateThdStore on Lead (before Insert,before Update) {

    for(Lead l: Trigger.new){
        if(l.Primary_Store_Number__c != null){
            l.Primary_Store_Clone__c = l.Primary_Store_Number__c;
        }
    }
    
}