trigger Behr_LeadConvert_US on Lead (after update) {
List<Opportunity> updateOpp=new List<Opportunity>();
set<ID> convertedopid=new Set<Id>();
List<Opportunity> Opp=new List<Opportunity>();    
    
   /*for(Lead lead:Trigger.new) {
        if (lead.IsConverted) {
            // Assign the stageName,Opportunity type while creatng new Opportunity from Lead 
            Opportunity Opp= [SELECT Id,StageName,Opportunity_Type__c FROM Opportunity WHERE Id = :lead.ConvertedOpportunityId];
            system.debug('@@@@@@@@'+Opp);
            Opp.StageName = 'Open';
            Opp.Opportunity_Type__c='Potential';
            updateOpp.add(Opp);
           
        }
    }
     update updateOpp;*/
     
  for(Lead lead:Trigger.new) {
        if (lead.IsConverted) {
        convertedopid.add(lead.ConvertedOpportunityId);
        
        }
        }  
        
      Opp= [SELECT Id,StageName,Opportunity_Type__c FROM Opportunity WHERE Id in:convertedopid];     
     for(Opportunity O:Opp){
    // Opportunity op=new Opportunity(id=o.id);
     O.StageName = 'Open';
     O.Opportunity_Type__c='Potential';
    updateOpp.add(O);
  
     
     }
      update updateOpp;
     
}