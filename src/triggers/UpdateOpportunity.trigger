trigger UpdateOpportunity on Quote (After Insert,After Update) {


BEHR_QuotetoOrder_US.UpdateopptyQuote(Trigger.new);

}