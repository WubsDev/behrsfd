trigger updateQuoteLineItem on Color_for_orders__c (after Insert,After Delete) {

    if(Trigger.isinsert){
    BEHR_QuotetoOrder_US.colorsQuoteUpdate(Trigger.new);
    }
    if(Trigger.isdelete){
     BEHR_QuotetoOrder_US.colorsQuoteUpdate(Trigger.old);
    }

}