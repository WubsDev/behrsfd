trigger DirectOnBoardingAttachTrig on Attachment (after insert,before delete) {
	Set<Id> dirOnBoardIds = new Set<Id>();
    if (Trigger.isAfter) {
        for(Attachment att : trigger.New){
             dirOnBoardIds.add(att.ParentId);
        }
        List<Direct_Onboarding__c> dirOnBoardList = [select id,Need_Credit_App__c from Direct_Onboarding__c where id in : dirOnBoardIds];
        if(dirOnBoardList!=null && dirOnBoardList.size()>0){
            for(Direct_Onboarding__c acc : dirOnBoardList){
				acc.Need_Credit_App__c = false;
            }
            update dirOnBoardList;
        }
    }
    if(Trigger.isBefore){
        for(Attachment att : trigger.old){
             dirOnBoardIds.add(att.ParentId);
        }
        List<Direct_Onboarding__c> dirOnBoardList = [select id,Need_Credit_App__c from Direct_Onboarding__c where id in : dirOnBoardIds];      
        if(dirOnBoardList!=null && dirOnBoardList.size()>0){
            Integer numAtts=[select count() from attachment where parentid=:dirOnBoardIds];
            for(Direct_Onboarding__c acc : dirOnBoardList){
                if(1 == numAtts){
                    acc.Need_Credit_App__c = true;
                }                                 
            }
            update dirOnBoardList;
        }
    }
}