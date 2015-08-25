<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BEHR_ClientFeedbackEmailAlert_US</fullName>
        <ccEmails>mayankjain2007@gmail.com;salesfdc1@gmail.com</ccEmails>
        <description>Email Alert Client Feedback</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/BEHR_OpportunityClientFeedback_US_Template</template>
    </alerts>
    <alerts>
        <fullName>Notification_for_Sales_Admin</fullName>
        <description>Notification for Sales Admin</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sales_Admin_Direct</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Approval_Notification</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Alert_FI_below_Z7</fullName>
        <ccEmails>dfdiaz@behr.com</ccEmails>
        <ccEmails>charwood@behr.com</ccEmails>
        <ccEmails>bgubitz@behr.com</ccEmails>
        <description>Opportunity Alert FI below Z7</description>
        <protected>false</protected>
        <recipients>
            <recipient>kbonnevie@behr.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kdaley@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_ALERT_lower_than_zone_7_for_FI</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_RPSM_2</fullName>
        <description>Opportunity Zone RPSM 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>RPSM</recipient>
            <type>opportunityTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_RPSM</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_RPSM_Delegate</fullName>
        <description>Opportunity Zone RPSM Delegate</description>
        <protected>false</protected>
        <recipients>
            <recipient>RVP</recipient>
            <type>opportunityTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_Delegate</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_RVP</fullName>
        <description>Opportunity Zone RVP</description>
        <protected>false</protected>
        <recipients>
            <recipient>RVP</recipient>
            <type>opportunityTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_RVP</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_RVP_JS</fullName>
        <description>Opportunity Zone RVP JS</description>
        <protected>false</protected>
        <recipients>
            <recipient>mwaszkowski@behrpaint.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_Delegate</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_RVP_MF</fullName>
        <description>Opportunity Zone RVP MF</description>
        <protected>false</protected>
        <recipients>
            <recipient>jseidensticker@behrpaint.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_Delegate</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_RVP_MW</fullName>
        <description>Opportunity Zone RVP MW</description>
        <protected>false</protected>
        <recipients>
            <recipient>mfaber@behrpaint.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_Delegate</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_SVP</fullName>
        <description>Opportunity Zone SVP</description>
        <protected>false</protected>
        <recipients>
            <recipient>SVP</recipient>
            <type>opportunityTeam</type>
        </recipients>
        <recipients>
            <recipient>kkambs@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_SVP</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_SVP_Delegate</fullName>
        <description>Opportunity Zone SVP Delegate</description>
        <protected>false</protected>
        <recipients>
            <recipient>vhobson@behr.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_SVP_delegate</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Zone_Sales_Admin</fullName>
        <description>Opportunity Zone Sales Admin</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sales_Admin_Direct</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Opportunity_Zone_Price_Reminder_SA</template>
    </alerts>
    <alerts>
        <fullName>Opty_reminder_not_submitted_direct_only</fullName>
        <description>Opty reminder not submitted direct only</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity_Templates/Records_not_submitted_opty</template>
    </alerts>
    <fieldUpdates>
        <fullName>Behr_OptyClosedWonUpdate_US</fullName>
        <field>Behr_Closed_won_date_US__c</field>
        <formula>Today()</formula>
        <name>Behr_OptyClosedWonUpdate_US</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_Not_Submitted</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Not Submitted</literalValue>
        <name>Opportunity Status Not Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_Open</fullName>
        <description>Change from open to position prepare</description>
        <field>StageName</field>
        <literalValue>Position/Prepare</literalValue>
        <name>Opportunity Status Open</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_Pending_RPSM</fullName>
        <description>Update approval status to pending RPSM</description>
        <field>Approval_Status__c</field>
        <literalValue>Pending RPSM Approval</literalValue>
        <name>Opportunity Status Pending RPSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_Pending_RVP</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending RVP Approval</literalValue>
        <name>Opportunity Status Pending RVP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_Pending_SVP</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending SVP Approval</literalValue>
        <name>Opportunity Status Pending SVP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_Submit</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>Opportunity Status Submit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Status_approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Opportunity Status approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Type_Both</fullName>
        <description>This sets the value of Opportunity.Type as NULL if  Account.Type is Both</description>
        <field>Type</field>
        <name>Opportunity Type Both</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Type_Direct</fullName>
        <description>This sets the Type of Opportunity to Direct if the Account.Type is Direct only</description>
        <field>Type</field>
        <literalValue>Direct</literalValue>
        <name>Opportunity Type Direct</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Type_THD</fullName>
        <description>This sets the value of Opportunity.Type to THD if the Account.Type is HD only</description>
        <field>Type</field>
        <literalValue>THD</literalValue>
        <name>Opportunity Type THD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>BEHR_OpportunityClientFeedback_US</fullName>
        <actions>
            <name>BEHR_ClientFeedbackEmailAlert_US</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Behr_OptyClosedWonUpdate_US</fullName>
        <actions>
            <name>Behr_OptyClosedWonUpdate_US</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( ISNEW() || ISCHANGED( StageName )) &amp;&amp;  ISPICKVAL( StageName,&quot;Closed Won&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Alert Price below Z7</fullName>
        <actions>
            <name>Opportunity_Alert_FI_below_Z7</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Zone_item_max__c</field>
            <operation>equals</operation>
            <value>8</value>
        </criteriaItems>
        <description>Email finance if price is below z7</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Type Rule 1</fullName>
        <actions>
            <name>Opportunity_Type_Direct</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Direct Only</value>
        </criteriaItems>
        <description>This rule is to update the Type of opportunity with the Type of Account it is associated with.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Type Rule 2</fullName>
        <actions>
            <name>Opportunity_Type_THD</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>HD Only</value>
        </criteriaItems>
        <description>This rule is to update the Type of opportunity with the Type of Account it is associated with.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Type Rule 3</fullName>
        <actions>
            <name>Opportunity_Type_Both</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Both</value>
        </criteriaItems>
        <description>This rule is to update the Type of opportunity with the Type of Account it is associated with.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Zone Reminder RPSM</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Pending RPSM Approval</value>
        </criteriaItems>
        <description>Reminder for RPSM after 2 hours, delegate after 4 and admin after 6</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_Sales_Admin</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_RPSM_2</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_RPSM_Delegate</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity Zone Reminder RVP</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Pending RVP Approval</value>
        </criteriaItems>
        <description>Reminder for RVP after 2 hours, delegate after 4 and admin after 6</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_RVP</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_Sales_Admin</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity Zone Reminder RVP JS</fullName>
        <active>true</active>
        <description>Reminder for RVP  delegate John S</description>
        <formula>and( ispickval(Approval_Status__c , &quot;Pending RVP approval&quot;),  Owner.RVP__r.Alias = &quot;jseidens&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_RVP_JS</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity Zone Reminder RVP MF</fullName>
        <active>true</active>
        <description>Reminder for RVP  delegate Mark Faber</description>
        <formula>and( ispickval(Approval_Status__c , &quot;Pending RVP approval&quot;),  Owner.RVP__r.Alias = &quot;mfabe&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_RVP_MF</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity Zone Reminder RVP MW</fullName>
        <active>true</active>
        <description>Reminder for RVP  delegate Matt W</description>
        <formula>and( ispickval(Approval_Status__c , &quot;Pending RVP approval&quot;),  Owner.RVP__r.Alias = &quot;mwasz&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_RVP_MW</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity Zone Reminder SVP</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Pending SVP Approval</value>
        </criteriaItems>
        <description>Reminder for SVP after 4 hours, delegate after 8 and admin after 10</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_SVP_Delegate</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_SVP</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_Zone_Sales_Admin</name>
                <type>Alert</type>
            </actions>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opty email reminder not submitted</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Not Submitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Direct</value>
        </criteriaItems>
        <description>Opportunity Email reminder for direct opty not submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Opty_reminder_not_submitted_direct_only</name>
                <type>Alert</type>
            </actions>
            <timeLength>16</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>opportunity_status</fullName>
        <actions>
            <name>Opportunity_Status_Open</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>,Open</value>
        </criteriaItems>
        <description>Auto created opportunities to go from open to position prepare automatically</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
