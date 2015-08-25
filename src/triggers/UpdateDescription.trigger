trigger UpdateDescription on Direct_Onboarding__c (Before Insert) {
    Set<Id>  Accountids = new Set<Id>();
    Account MasterAccount = new Account();
    String directOnboardDescription;
    for (Direct_Onboarding__c DirectAccountid : Trigger.new) {
            
            Accountids.add(DirectAccountid.Account_Name__c); 
            directOnboardDescription = DirectAccountid.Description__c;
    }
    if(Accountids != null && directOnboardDescription == null  ){ 
        MasterAccount = [ select id,Description__c from Account where id IN: Accountids ];
            
        if(MasterAccount != null){ 
            for (Direct_Onboarding__c DirectOnboard : Trigger.new) {
                DirectOnboard.Description__c = MasterAccount.Description__c;
            }
        
          }
    }
}