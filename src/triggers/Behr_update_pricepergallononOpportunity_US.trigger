trigger Behr_update_pricepergallononOpportunity_US on OpportunityLineItem (after insert,after update , after delete) {
    try
    {
         set<id> Oppidset = new set<id>();
         list <Opportunity> opplist = new list<Opportunity>();
        if(trigger.isinsert || trigger.isupdate)
        for(OpportunityLineItem OppLine:Trigger.new)
    {
        Oppidset .add(OppLine.Opportunityid);
    }
     if(trigger.isdelete)
      for(OpportunityLineItem  opp:Trigger.old)
    {
        Oppidset.add(opp.Opportunityid);
    }
    
    map<id,string > oppmap = new map<id,string>();
 
     for(AggregateResult oppi :[select opportunityid ,SUM(Price_per_Gallon__c) tot from OpportunityLineItem 
                                    where Opportunityid in :Oppidset group by Opportunityid])
     {
         oppmap .put((id)oppi.get('Opportunityid'),oppi.get('tot')+'');
     }  
     
     for(id i :Oppidset)
    {
        Opportunity opp = new Opportunity(id=i);
        opp.Price_per_Gallon__c=decimal.valueOf(oppmap.get(i));
        opplist .add(opp) ;
    }
    
    if(opplist.size()>0)
    {
        update opplist;
    }
 
    }
    catch(exception e)
    {
         system.debug('error'+e);
    }                          
}