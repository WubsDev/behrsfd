/***This trigger is written to copy Lead source and Sub-Lead Source field value from Account ***/
trigger updateLeadFields on Contact (Before Insert) {

 BehrClass.contactRecordFields(Trigger.new);
 
}