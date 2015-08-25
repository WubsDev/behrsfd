trigger Behr_ChangeOpportunityStatus on Task (after insert) {
set<ID> QuoteID=new Set<ID>();
List<Quote> quoteLst=new List<Quote>();
List<Opportunity> updateOpp=new List<Opportunity>();

for(Task tsk:trigger.new)
    {
    QuoteID.add(tsk.WhatId);
    }
    RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Quote' and name = 'Order'];
    
quoteLst=[select id,Name,Account__c,Subtotal,TotalPrice, Rep_Name__c,Rep_Phone__c,ContactID,Opportunityid, recordtypeid from Quote where id in: QuoteID] ;
if(quoteLst.size()>0){
for(Quote q:quoteLst)
{ if(q.recordtypeid==rt.id){
    Opportunity Op=new Opportunity(id=q.OpportunityId);
    op.StageName='Closed Won';
    updateOpp.add(Op);
    }
 



}
}
    update updateOpp;
}