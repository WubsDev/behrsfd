trigger Behr_ActualSalesOAUpdate on Ownership_Approval__c (after insert, after update) {
//*-----------------------------------------------------------------------------*
//* 03/24/2014 CESTOLONIO HT 800769 - Initial Creation
//* 12/09/2014 JPATTERSON - Updated objects and variable names to match environment
//*-----------------------------------------------------------------------------*

BehrClass.UpdateASopportunity(Trigger.New);

/*    List<Ownership_Approval__c> asalesupd = new List<Ownership_Approval__c>();   
    Set<Id> asalesid = new Set<Id>();

//* Get Ownership Approval Update ID
    if(trigger.isinsert || trigger.isupdate) {
      for(Ownership_Approval__c asu : Trigger.new) { 
        asalesid.add(asu.Id);
      } 
    }
    
//System.debug('ASALESID'+ asalesid);      //DEBUG TEST
// *Get Ownership Approval Update Record    
    asalesupd = [SELECT Id, Name, ActualSales__c, Status__c, New_Opportunity_Entry__c FROM Ownership_Approval__c WHERE Id =: asalesid limit 1];
    
// *Update Acutal Sales Account name with Ownership Approval Update New Account  
    for(Ownership_Approval__c oa : asalesupd) {
      if(oa.Status__c == 'Approved') {    
       Actual_Sales__c pro=[SELECT Id, Account_Name__c FROM Actual_Sales__c WHERE id =: oa.ActualSales__c limit 1];                
       pro.Opportunity__c = oa.New_Opportunity_Entry__c;
       UPDATE pro; 
      }                   
    }     */ 
               
}