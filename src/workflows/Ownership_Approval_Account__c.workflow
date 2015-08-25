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
        <template>Account_Ownership_Templates/Account_Ownership_Approved</template>
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
        <template>Account_Ownership_Templates/Account_Ownership_Rejected</template>
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
        <template>Account_Ownership_Templates/Account_Ownership_Change_Request</template>
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
        <template>Account_Ownership_Templates/Account_Ownership_Reassigned</template>
    </alerts>
    <alerts>
        <fullName>acct_owner_email_not_submitted</fullName>
        <description>acct owner email not submitted</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Ownership_Templates/Records_not_submitted_acct</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Ownership_Old_Email</fullName>
        <field>Old_Owner_Email__c</field>
        <formula>Account__r.Owner.Email</formula>
        <name>Account Ownership Old Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ownership_Old_Owner</fullName>
        <field>Old_Owner__c</field>
        <formula>Account__r.Owner.FirstName + &quot; &quot; +  Account__r.Owner.LastName</formula>
        <name>Account Ownership Old Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ownership_Old_Owner_RPSM</fullName>
        <field>Old_Owner_RPSM__c</field>
        <formula>Account__r.Owner.RPSM_New__r.FirstName + &quot; &quot; +  Account__r.Owner.RPSM_New__r.LastName</formula>
        <name>Account Ownership Old Owner RPSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ownership_Old_Owner_RPSM_Email</fullName>
        <field>Old_Owner_RPSM_Email__c</field>
        <formula>Account__r.Owner.RPSM_New__r.Email</formula>
        <name>Account Ownership Old Owner RPSM Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ownership_Status</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Account Ownership Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ownership_Status_Pending_RPSM</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending RPSM Approval</literalValue>
        <name>Account Ownership Status Pending RPSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Ownership_Status_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Account Ownership Status Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Account Ownership Requested</fullName>
        <actions>
            <name>Account_Ownership_Old_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Account_Ownership_Old_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Account_Ownership_Old_Owner_RPSM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Account_Ownership_Old_Owner_RPSM_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>This workflow fires on Creation of an Account Ownership request.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Account owner not submitt</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Ownership_Approval_Account__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Not Submitted</value>
        </criteriaItems>
        <description>Account owner - send email if not submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>acct_owner_email_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>16</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
