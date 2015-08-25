trigger UpdateOpptyStage on Opportunity(Before Update) {
    BEHR_QuotetoOrder_US.UpdateOpptyStage(Trigger.new); 
}