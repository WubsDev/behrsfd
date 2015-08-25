trigger UpdateCaseFields on Case (Before Insert,Before Update,After Insert) {    
    if(trigger.isBefore){
        if(trigger.isInsert)
            {
                BehrClass.caseFields(Trigger.new);
                BehrClass.insertAddress(Trigger.New);
            }
        if(trigger.isUpdate)
            {
                BehrClass.updateAddress(Trigger.New, Trigger.oldMap);
            }
        BehrClass.updateApproversRPSM(Trigger.new);
    }
     
      if(trigger.isAfter)
        {
            BehrClass.CaseTeamMembers(Trigger.new);
        }

    
}