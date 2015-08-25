trigger UpdateCaseOppty on Case (After Insert,After Update) {

BEHR_QuotetoOrder_US.UpdateopptyCase(Trigger.new);
    
}