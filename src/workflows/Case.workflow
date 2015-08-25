<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_Status_ET</fullName>
        <description>Case Status ET</description>
        <protected>false</protected>
        <recipients>
            <field>Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Case_Approval_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Case_Status_Email_Alert_On_Change</fullName>
        <description>Case Status Email Alert On Change</description>
        <protected>false</protected>
        <recipients>
            <field>Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Case_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Color_Services_Request</fullName>
        <description>Color Services - color service request (color rec, digital render, color book/board...)</description>
        <protected>false</protected>
        <recipients>
            <recipient>mcomagon@behr.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nsantana@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Color_Services_Notification</template>
    </alerts>
    <alerts>
        <fullName>Color_Services_Yard_Sign_Pro_Rewards_card_notification</fullName>
        <description>Color Services - Yard Sign/Pro Rewards card notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>mcomagon@behr.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nsantana@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Color_Service_Yard_or_Card</template>
    </alerts>
    <alerts>
        <fullName>Email_notification_to_the_case_requester</fullName>
        <description>Email notification to the case requester</description>
        <protected>false</protected>
        <recipients>
            <field>Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Case_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Pro_Service_Team</fullName>
        <description>Email to Pro Service Team</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Color_Services_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>Record_not_submitted</fullName>
        <description>Record not submitted</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Records_not_submitted</template>
    </alerts>
    <alerts>
        <fullName>To_Notify_the_requestor_when_it_Approved</fullName>
        <description>To Notify the requestor when it Approved</description>
        <protected>false</protected>
        <recipients>
            <field>Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Case_Approval_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>To_notify_the_Requestor_when_the_Case_is_rejected</fullName>
        <description>To notify the Requestor when the Case is rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Managment_Email_Templates/Case_Approval_Status_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Status_Update_In_Progress</fullName>
        <field>Approval_Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>Approval Status Update In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Status_Update_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Approval Status Update Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_Field_update</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Approval Status Update Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Approval_Status_Pending_Setup</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending Account Setup</literalValue>
        <name>Case Approval Status Pending Setup</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Approval_Status_Setup_Complete</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Account Setup Complete</literalValue>
        <name>Case Approval Status Setup Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Status_Finance_Approved</fullName>
        <field>Status</field>
        <literalValue>Finance Approved</literalValue>
        <name>Case Status Finance Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Status_Finance_Rejected</fullName>
        <field>Status</field>
        <literalValue>Finance Rejected</literalValue>
        <name>Case Status Finance Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Status_SA_Closed</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Case Status SA Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>China_Case_Owner_Update</fullName>
        <description>When the status of Case is changed to Escalated an workflow rule will be configured to fire and assign that case to &apos;China Support Management&apos;.send email notification to whom the case will be assigned.</description>
        <field>OwnerId</field>
        <lookupValue>China_Support_Management_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>China Case Owner Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>China_edit_Escalate</fullName>
        <field>IsEscalated</field>
        <literalValue>1</literalValue>
        <name>China edit Escalate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reject_Approval_process</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Reject Approval process</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AccountVerificationForCreditReviewCases</fullName>
        <actions>
            <name>Email_notification_to_the_case_requester</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Behr_Escalate_Case_China</fullName>
        <actions>
            <name>China_Case_Owner_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>China_edit_Escalate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Status Change Email Alert</fullName>
        <actions>
            <name>Case_Status_Email_Alert_On_Change</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Status)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case send email not submitted</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Not Submitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>China Inquiry Case,China Issue Case,US Case,Credit Review</value>
        </criteriaItems>
        <description>Case - send email if not submitted for more than 16 hours</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>16</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Case send email not submitted urgent</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Not Submitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Hot_Rush__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>China Inquiry Case,China Issue Case,US Case,Credit Review</value>
        </criteriaItems>
        <description>Case - send email if marked as urgent and not submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Record_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Color Services Approval Request</fullName>
        <actions>
            <name>Email_to_Pro_Service_Team</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>Color Services,Pro Services</value>
        </criteriaItems>
        <description>Email for Pro Service team regarding status of the Color Services request.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
