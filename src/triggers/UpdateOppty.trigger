trigger UpdateOppty on Task (After Insert) {

BEHR_QuotetoOrder_US.UpdateopptyTask(Trigger.new);


}