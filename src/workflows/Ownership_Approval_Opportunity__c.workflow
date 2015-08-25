<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_New_Owner_of_Approval</fullName>
        <description>Notify New Owner of Approval</description>
        <protected>false</protected>
        <recipients>
            <field>New_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opporunity_Ownership_Approval_Approved</template>
    </alerts>
    <alerts>
        <fullName>Notify_New_Owner_of_Rejection</fullName>
        <description>Notify New Owner of Rejection</description>
        <protected>false</protected>
        <recipients>
            <field>New_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opporunity_Ownership_Approval_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Notify_Old_Owner_RPSM_of_Request</fullName>
        <description>Notify Old Owner RPSM of Request</description>
        <protected>false</protected>
        <recipients>
            <field>Old_Owner_RPSM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opportunity_Ownership_Request</template>
    </alerts>
    <alerts>
        <fullName>Notify_Old_Owner_of_Approval</fullName>
        <description>Notify Old Owner of Approval</description>
        <protected>false</protected>
        <recipients>
            <field>Old_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opportunity_Ownership_Reassigned</template>
    </alerts>
    <alerts>
        <fullName>Notify_Sales_Admin_of_approval</fullName>
        <description>Notify Sales Admin of approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sales_Admin</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opportunity_Ownership_Approval_Approved_By_RPSM</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Ownership_Approval_Request</fullName>
        <description>Opportunity Ownership Approval Request</description>
        <protected>false</protected>
        <recipients>
            <field>Old_Owner_RPSM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opporunity_Ownership_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Ownership_Approval_Status</fullName>
        <description>Opportunity Ownership Approval Status</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sales_Admin</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Opporunity_Ownership_Approval_Status</template>
    </alerts>
    <alerts>
        <fullName>Opty_owner_email_reminder_not_submitted</fullName>
        <description>Opty owner email reminder not submitted</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Ownership_Templates/Records_not_submitted_opty_own</template>
    </alerts>
    <fieldUpdates>
        <fullName>Old_Owner</fullName>
        <field>Old_Owner__c</field>
        <formula>Opportunity__r.Owner.FirstName +&quot; &quot;+ Opportunity__r.Owner.LastName</formula>
        <name>Old Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Old_Owner_Email</fullName>
        <field>Old_Owner_Email__c</field>
        <formula>Opportunity__r.Owner.Email</formula>
        <name>Old Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Old_Owner_RPSM</fullName>
        <field>Old_Owner_RPSM__c</field>
        <formula>Opportunity__r.Owner.RPSM_New__r.FirstName+&quot; &quot;+
 Opportunity__r.Owner.RPSM_New__r.LastName</formula>
        <name>Old Owner RPSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Old_Owner_RPSM_Email</fullName>
        <field>Old_Owner_RPSM_Email__c</field>
        <formula>Opportunity__r.Owner.RPSM_New__r.Email</formula>
        <name>Old Owner RPSM Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Approval_Status_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Opportunity Approval Status Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppty_Approval_Status_Change_Complete</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Change Complete</literalValue>
        <name>Oppty Approval Status Change Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppty_Approval_Status_Pending_Change</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending Ownership Change</literalValue>
        <name>Oppty Approval Status Pending Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppty_Approval_Status_Pending_RPSM</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending RPSM Approval</literalValue>
        <name>Oppty Approval Status Pending RPSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Ownership Request</fullName>
        <actions>
            <name>Old_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Old_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Old_Owner_RPSM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Old_Owner_RPSM_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opty owner email reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Ownership_Approval_Opportunity__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Not Submitted</value>
        </criteriaItems>
        <description>Opportunity owner email reminder not submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_owner_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>16</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
