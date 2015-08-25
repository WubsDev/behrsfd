trigger updateAccountZone on Direct_Onboarding__c (After Update) {


    BEHR_QuotetoOrder_US.accountZoneUpdate(Trigger.new);
       

}