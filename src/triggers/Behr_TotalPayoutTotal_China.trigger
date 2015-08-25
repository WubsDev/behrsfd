trigger Behr_TotalPayoutTotal_China on Payout_Product__c (after insert,after update,after delete)
  {
  try
  {
 set<id> pidset = new set<id>();
 map<Id,String> mapPayout=new map<Id,String>();
 list<Payouts__c> plist = new list<Payouts__c>();
 
 List<CurrencyType> RMBrate = [SELECT ConversionRate FROM CurrencyType where IsoCode = 'RMB' Limit 1] ;
 
  
 if(trigger.isinsert||trigger.isupdate)
 {
     for(Payout_Product__c p:Trigger.new)
     {
        pidset.add(p.Payouts__c);
     }
 }
 List<Payouts__c> payoutList=[select id,Payout_Type__c from Payouts__c where id in:pidset ];
 for(Payouts__c pay: payoutList){
 mapPayout.put(pay.id,pay.Payout_Type__c);
 
 
 }
 if(trigger.isdelete){
    for(Payout_Product__c  p:Trigger.old)
    {
    system.debug('deleteeeee'+p);
        pidset.add(p.Payouts__c);
    }
   }     
   
   map<id,string> pmap= new map<id,string>();
  // map<string,string> p1map = new map<string,string>();
   
   for(AggregateResult pi :[select Payouts__c,SUM(Total_Payout__c)tot from Payout_Product__c where Payouts__c in : pidset group by Payouts__c])
    {
    
    pmap.put((id)pi.get('Payouts__c'),pi.get('tot')+'');
    
    
    }
    for(id i:pidset)
    {
    system.debug('valuee for delete'+i);
    Payouts__c p = new Payouts__c(id=i);
    if(pmap.size()==0){
        p.Total_Payout_Total__c = 0;
    }
  
    
    else{
    
    //system.debug('@@@@@@@'+p.Payout_Type__c);
    if(mapPayout.get(i)!='Monetary'){
    system.debug('Inide elseIF');
     p.Total_Payout_Total__c = decimal.valueOf(pmap.get(i)) * RMBrate[0].ConversionRate;
    p.CurrencyIsoCode = 'RMB';
    }
    }
    plist.add(p);
    }
    if(plist.size()>0)
    {
    update plist;
    }
    
    }
    catch(exception e)
    {
    system.debug('error'+e);
    }
    
    }