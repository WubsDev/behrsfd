/**** This Trigger is written to enable all functionalities on Opportunity Object***/
trigger OpportunityTrigger on Opportunity(Before Insert, Before Update, After Insert, After Update) {


    if (trigger.isBefore) {
        
          if (trigger.isInsert) {
    
        BehrClass.opportunityRecordFields(Trigger.new);
        BEHR_QuotetoOrder_US.OpptyMultipick(Trigger.new);
        }
    }


    if (trigger.isAfter&&trigger.isInsert) {

        BEHR_QuotetoOrder_US.OpptyTeamMember(Trigger.new);
    }
}