<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_for_Payout</fullName>
        <description>Send email for Payout</description>
        <protected>false</protected>
        <recipients>
            <recipient>rolivieri@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Finance_Notification_of_Payout</template>
    </alerts>
    <rules>
        <fullName>Payout Notification to Finance</fullName>
        <actions>
            <name>Send_email_for_Payout</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Payouts__c.Status__c</field>
            <operation>equals</operation>
            <value>Processed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
