trigger Behr_AddTotalPayout_China on Payouts__c (before insert,before update) {
List<Payouts__c> PayList=new List<Payouts__c>();

for(Payouts__c pay:Trigger.new){
    if(pay.Payout_Type__c=='Monetary'){
   // Payouts__c p=new Payouts__c(id=pay.id);
        pay.Total_Payout_Total__c=pay.Monetary_Payout_Amount__c;
        PayList.add(pay);
        }
    
   
}


}