<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Direct_Onboarding_Approval_Status_SVP</fullName>
        <description>Direct Onboarding Approval Status SVP</description>
        <protected>false</protected>
        <recipients>
            <field>SVP_User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Account_Onboarding_Approval_SVP</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_Email_Alert_RPSM_2_hours</fullName>
        <description>Direct Onboarding Email Alert RPSM 2 hours</description>
        <protected>false</protected>
        <recipients>
            <field>RPSM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_RPSM_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_FI_Alert</fullName>
        <description>Direct Onboarding FI Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>kbonnevie@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Finance_Alert_less_Z7</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_Finance_alert_of_sync</fullName>
        <description>Direct Onboarding Finance alert of sync</description>
        <protected>false</protected>
        <recipients>
            <recipient>Finance</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Finance_Notice_of_sync</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_RPSM_2hr_Reminder</fullName>
        <description>Direct Onboarding RPSM 2hr Reminder</description>
        <protected>false</protected>
        <recipients>
            <field>RPSM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_RPSM_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_RVP_delegate_alert_JS</fullName>
        <description>Direct Onboarding RVP delegate alert JS</description>
        <protected>false</protected>
        <recipients>
            <recipient>mwaszkowski@behrpaint.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Delegate_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_RVP_delegate_alert_MF</fullName>
        <description>Direct Onboarding RVP delegate alert MF</description>
        <protected>false</protected>
        <recipients>
            <recipient>jseidensticker@behrpaint.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Delegate_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_RVP_delegate_alert_MW</fullName>
        <description>Direct Onboarding RVP delegate alert MW</description>
        <protected>false</protected>
        <recipients>
            <recipient>mfaber@behrpaint.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Delegate_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_SVP_alert</fullName>
        <description>Direct Onboarding SVP alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>kkambs@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_SVP_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_SVP_delegate_alert</fullName>
        <description>Direct Onboarding SVP delegate alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>vhobson@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_SVP_Delegate_Notice</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_Sales_Admin_Alert</fullName>
        <description>Direct Onboarding Sales Admin Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sales_Admin_Direct</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Sales_Admin_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_Setup_Complete</fullName>
        <description>Notify PSR Account Setup Complete</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Setup_Complete</template>
    </alerts>
    <alerts>
        <fullName>Direct_Onboarding_email_reminder_not_submitted</fullName>
        <description>Direct Onboarding email reminder not submitted</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Records_not_submitted_onboard</template>
    </alerts>
    <alerts>
        <fullName>Direct_onboarding_RPSM_Delegate_Alert</fullName>
        <description>Direct onboarding RPSM Delegate Alert</description>
        <protected>false</protected>
        <recipients>
            <field>RVP_User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_Delegate_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Direct_onboarding_RVP_Reminder</fullName>
        <description>Direct onboarding RVP Reminder</description>
        <protected>false</protected>
        <recipients>
            <field>RVP_User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Direct_Onboarding_VP_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Notify_PSR_of_Status</fullName>
        <description>Notify PSR of Status</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Onboarding_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Rejected_Status_Email_Alert</fullName>
        <description>Rejected Status Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>RVP_User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Onboarding_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Rejected_by_SVP_status_email</fullName>
        <description>Notify RVP of Status</description>
        <protected>false</protected>
        <recipients>
            <field>RVP_User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Onboarding_Status_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Status_Email_Alert</fullName>
        <description>Notify Finance of SVP Approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>Finance</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Account_Onboarding_Email_Templates/Onboarding_Approved_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Onboarding_Zone</fullName>
        <description>Account onboarding zone from requested zone</description>
        <field>Approved_Account_Zone__c</field>
        <formula>IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;1&quot;), 1,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;2&quot;), 2,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;3&quot;), 3,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;4&quot;), 4,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;5&quot;), 5,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;6&quot;), 6,7))))))</formula>
        <name>Account Onboarding Zone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Setup_Complete_Status</fullName>
        <field>Status__c</field>
        <literalValue>Account Setup Complete</literalValue>
        <name>Account Setup Complete Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_Account_Zone_Update</fullName>
        <field>Approved_Account_Zone__c</field>
        <formula>Account_Name__r.Zone__c</formula>
        <name>Approved Account Zone Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_Status_Field_Update</fullName>
        <field>Status__c</field>
        <literalValue>Account Setup Complete</literalValue>
        <name>Approved Status Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Direct_Onboard_Description_Field_Update</fullName>
        <field>Description__c</field>
        <formula>Account_Name__r.Description__c</formula>
        <name>Direct Onboard Description Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Direct_Onboarding_Approved_zone</fullName>
        <description>Updates approved shop zone with the requested zone</description>
        <field>Approved_Account_Zone__c</field>
        <formula>If(isblank( Approved_Account_Zone__c ),  IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;1&quot;), 1,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;2&quot;), 2,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;3&quot;), 3,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;4&quot;), 4,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;5&quot;), 5,IF( ISPICKVAL( Requested_Shop_Zone__c , &quot;6&quot;), 6,7)))))), Approved_Account_Zone__c )</formula>
        <name>Direct Onboarding Approved zone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Direct_Onboarding_Rejected_by_RPSM</fullName>
        <field>Status__c</field>
        <literalValue>Rejected by RPSM</literalValue>
        <name>Direct Onboarding Rejected by RPSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Direct_onboarding_Pending_RPSM_Status</fullName>
        <description>changes status to pending RPSM</description>
        <field>Status__c</field>
        <literalValue>Pending RPSM Approval</literalValue>
        <name>Direct onboarding Pending RPSM Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Direct_onboarding_approval_time</fullName>
        <description>update approval time with now date</description>
        <field>Sales_approved_date__c</field>
        <formula>now()</formula>
        <name>Direct onboarding approval time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Direct_onboarding_submit_time</fullName>
        <description>date and time the submit happened</description>
        <field>Submit_date__c</field>
        <formula>Now()</formula>
        <name>Direct onboarding submit time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Not_Submitted</fullName>
        <field>Status__c</field>
        <literalValue>Not Submitted</literalValue>
        <name>Not Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_Account_Setup</fullName>
        <field>Status__c</field>
        <literalValue>Pending Account Setup</literalValue>
        <name>Pending Account Setup</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_Credit_Review</fullName>
        <field>Status__c</field>
        <literalValue>Pending Credit Review</literalValue>
        <name>Pending Credit Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_RVP_Approval_Field_Update</fullName>
        <field>Status__c</field>
        <literalValue>Pending RVP Approval</literalValue>
        <name>Pending RVP Approval Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_SVP_Approval_Field_Update</fullName>
        <field>Status__c</field>
        <literalValue>Pending SVP Approval</literalValue>
        <name>Pending SVP Approval Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RVP_Approved_Checkbox_Update</fullName>
        <field>RVP_Approved__c</field>
        <literalValue>1</literalValue>
        <name>RVP Approved Checkbox Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejected_By_SVP_Field_Update</fullName>
        <field>Status__c</field>
        <literalValue>Rejected by SVP</literalValue>
        <name>Rejected By SVP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejected_by_Finance_Field_Update</fullName>
        <description>When rejection by finance occurs, status updates direct onboarding</description>
        <field>Status__c</field>
        <literalValue>Rejected by Finance</literalValue>
        <name>Rejected by Finance Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejected_by_RVP_Field_Update</fullName>
        <field>Status__c</field>
        <literalValue>Rejected by RVP</literalValue>
        <name>Rejected by RVP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Direct Onboarding Admin Alert</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RPSM Approval,Pending RVP Approval</value>
        </criteriaItems>
        <description>Email Sales admin queue when direct onboarding by RPSM or RVP has not been approved in 6 hours</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_Sales_Admin_Alert</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RPSM 2 hr Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RPSM Approval</value>
        </criteriaItems>
        <description>Remind RPSM in 2 hours</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_RPSM_2hr_Reminder</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RPSM Delegate alert</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RPSM Approval</value>
        </criteriaItems>
        <description>email RPSM delegate after 4 hours</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_onboarding_RPSM_Delegate_Alert</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RPSM Reminder</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RPSM Approval</value>
        </criteriaItems>
        <description>reminds RPSM to approve after 2 hours</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_Email_Alert_RPSM_2_hours</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RVP Delegate JS Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RVP Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>Direct_Onboarding__c.RVP_User__c</field>
            <operation>equals</operation>
            <value>John Seidensticker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_RVP_delegate_alert_JS</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RVP Delegate MF Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RVP Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>Direct_Onboarding__c.RVP_User__c</field>
            <operation>equals</operation>
            <value>Mark Faber</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_RVP_delegate_alert_MF</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RVP Delegate MW Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RVP Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>Direct_Onboarding__c.RVP_User__c</field>
            <operation>equals</operation>
            <value>Matt Waszkowski</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_RVP_delegate_alert_MW</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding RVP Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending RVP Approval</value>
        </criteriaItems>
        <description>Reminder email after 2 hours to RVP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_onboarding_RVP_Reminder</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct Onboarding SVP Delegate Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending SVP Approval</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_SVP_alert</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_SVP_delegate_alert</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_Sales_Admin_Alert</name>
                <type>Alert</type>
            </actions>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Direct onboarding FI notice</fullName>
        <actions>
            <name>Direct_Onboarding_FI_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending Credit Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Direct_Onboarding__c.Max_Zone__c</field>
            <operation>equals</operation>
            <value>8</value>
        </criteriaItems>
        <description>Finance notification if direct onboarding is off price below zone 7</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Direct onboarding email reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Direct_Onboarding__c.Status__c</field>
            <operation>equals</operation>
            <value>Not Submitted</value>
        </criteriaItems>
        <description>Direct onboarding email reminder not submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Direct_Onboarding_email_reminder_not_submitted</name>
                <type>Alert</type>
            </actions>
            <timeLength>16</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
