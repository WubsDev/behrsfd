trigger Behr_AccountOwnerUpdate on Ownership_Approval_Account__c (After Insert, After Update)
{
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        BehrClass.accountOwnerUpdate(Trigger.New);
    }
}