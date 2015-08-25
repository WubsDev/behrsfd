<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Lead_Notification</fullName>
        <description>Email Lead Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Instore_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Lead_Notification/Lead_Notification_Template</template>
    </alerts>
    <alerts>
        <fullName>Email_Lead_Notification_Pro_instore</fullName>
        <description>Email Lead Notification Pro from instore</description>
        <protected>false</protected>
        <recipients>
            <field>Pro_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Lead_Notification/Lead_Notification_Template_rep</template>
    </alerts>
    <alerts>
        <fullName>Email_Lead_Notification_instore</fullName>
        <description>Email Lead Notification Instore</description>
        <protected>false</protected>
        <recipients>
            <field>Instore_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Lead_Notification/Lead_Notification_Template_instore</template>
    </alerts>
    <alerts>
        <fullName>Instore_Lead_Notification</fullName>
        <description>Instore Lead Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Instore_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Lead_Notification/Instore_Lead</template>
    </alerts>
    <alerts>
        <fullName>Lead_Email_Notify_of_dup_lead_with_conversion</fullName>
        <description>Lead Email Notify of dup lead with conversion</description>
        <protected>false</protected>
        <recipients>
            <field>Instore_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Lead_Notification/Lead_Notification_Duplicate</template>
    </alerts>
    <alerts>
        <fullName>Lead_Re_Assignment</fullName>
        <description>Lead Re-Assignment</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Lead_Notification/Leads_Re_assignment_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Advertisement</fullName>
        <field>LeadSource</field>
        <literalValue>Advertisement</literalValue>
        <name>Advertisement</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Adverttrigger</fullName>
        <field>Assign_With_Trigger__c</field>
        <literalValue>1</literalValue>
        <name>Adverttrigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Asssign_trigger</fullName>
        <field>Assign_With_Trigger__c</field>
        <literalValue>1</literalValue>
        <name>Asssign trigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Behr_Updatelastmodifieddate_US</fullName>
        <field>Last_Modified_Date__c</field>
        <formula>LastModifiedDate</formula>
        <name>Behr_Updatelastmodifieddate_US</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Behr_rep_contact_Ad</fullName>
        <field>Behr_Rep_Contact__c</field>
        <literalValue>Yes</literalValue>
        <name>Behr rep contact Ad</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Deactive_Lead</fullName>
        <field>Off_Switch__c</field>
        <literalValue>1</literalValue>
        <name>Deactive Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Do_not_apply_trigger</fullName>
        <field>Assign_With_Trigger__c</field>
        <literalValue>0</literalValue>
        <name>Do not apply trigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_Opt_in_field</fullName>
        <field>Email_Opt_In__c</field>
        <literalValue>0</literalValue>
        <name>Email Opt in field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_Optin_2</fullName>
        <field>Email_Opt_In__c</field>
        <literalValue>1</literalValue>
        <name>Email Optin 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_opt_out_false</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>0</literalValue>
        <name>Email opt out false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_opt_out_true</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Email opt out true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Instore_qualified</fullName>
        <description>Reduce the est monthly paint usage to under 124 if lead status changed to &quot;qualified instore&quot;</description>
        <field>Estimated_Monthly_Paint_Usage__c</field>
        <literalValue>&lt;124 Gallons</literalValue>
        <name>Instore qualified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Record_type_BPwebsite</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Standard_Leads</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Lead Record type_BPwebsite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Clone</fullName>
        <field>Lead_Source_Clone__c</field>
        <formula>TEXT( LeadSource )</formula>
        <name>Lead Source Clone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_record_type_nahro</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Standard_Leads</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Lead record type nahro</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_sub_Source_Clone</fullName>
        <field>sub_lead_source_clone__c</field>
        <formula>text( Sub_Lead_Source__c )</formula>
        <name>Lead sub Source Clone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Multiview_PDCA_Banner</fullName>
        <field>Advert_type__c</field>
        <literalValue>Multiview PDCA Banner</literalValue>
        <name>Multiview PDCA Banner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_Email</fullName>
        <description>Blank Email</description>
        <field>Email</field>
        <name>No Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opt_out_is_blank</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Opt out is blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pro_Rep_Email</fullName>
        <description>Pro rep email to be used in email notifiication from trigger when going from pro unassigned queue</description>
        <field>Pro_Rep_Email__c</field>
        <formula>If(isblank( Primary_Store_Number__c )||  Primary_Store_Number__r.Owner:User.Alias = &quot;instore&quot;,   Zip_Code_lookup_del__r.Store_Number_Lookup__r.Owner:User.Email , Primary_Store_Number__r.Owner:User.Email )</formula>
        <name>Pro Rep Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pro_Rep_Name</fullName>
        <description>Update the pro rep name for email notificiation on leads that are ran through the trigger</description>
        <field>Pro_Rep_Name__c</field>
        <formula>If(isblank( Primary_Store_Number__c )||  Primary_Store_Number__r.Owner:User.Alias = &quot;instore&quot;,  Zip_Code_lookup_del__r.Store_Number_Lookup__r.Owner:User.FirstName &amp; &quot; &quot; &amp; Zip_Code_lookup_del__r.Store_Number_Lookup__r.Owner:User.LastName  , Primary_Store_Number__r.Owner:User.FirstName &amp;   &quot; &quot; &amp; Primary_Store_Number__r.Owner:User.LastName   )</formula>
        <name>Pro Rep Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rep_email_store</fullName>
        <description>Populate the Instore rep email based on either primary store or zip code.  Blank if neither exist.</description>
        <field>Instore_Rep_Email__c</field>
        <formula>If(isblank( Primary_Store_Number__c ),Zip_Code_lookup_del__r.Store_Number_Lookup__r.Store_Rep_Email__c,Primary_Store_Number__r.Store_Rep_Email__c)</formula>
        <name>Rep_email_store</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rep_name</fullName>
        <description>Populate the rep name  based on store or zipcode</description>
        <field>Re_Assigned_To__c</field>
        <formula>If(isblank( Primary_Store_Number__c ), Zip_Code_lookup_del__r.Store_Number_Lookup__r.Behr_Store_Rep__c , Primary_Store_Number__r.Behr_Store_Rep__c )</formula>
        <name>Rep_name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>THD_National</fullName>
        <field>LeadSource</field>
        <literalValue>THD National Account Trade Sows</literalValue>
        <name>THD National</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>THD_National_2</fullName>
        <field>THD_National_Account_Show__c</field>
        <literalValue>Crawford Contractor Connection</literalValue>
        <name>THD National 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_leads_Connections</fullName>
        <field>LeadSource</field>
        <literalValue>THD National Account Trade Sows</literalValue>
        <name>Tradeshow leads-Connections</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_leads_Connections2</fullName>
        <field>THD_National_Account_Show__c</field>
        <literalValue>Connections Convention</literalValue>
        <name>Tradeshow leads-Connections2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_leads_NAHRO</fullName>
        <field>LeadSource</field>
        <literalValue>THD National Account Trade Sows</literalValue>
        <name>Tradeshow leads-NAHRO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_leads_NAHRO2</fullName>
        <field>THD_National_Account_Show__c</field>
        <literalValue>National Association of Housing &amp; Redevelopment (NAHRO)</literalValue>
        <name>Tradeshow leads-NAHRO2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_leads_NIGP</fullName>
        <field>LeadSource</field>
        <literalValue>THD National Account Trade Sows</literalValue>
        <name>Tradeshow leads- NIGP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_leads_NIGP2</fullName>
        <field>THD_National_Account_Show__c</field>
        <literalValue>National Institute of Government Procurement (NIGP)</literalValue>
        <name>Tradeshow leads-NIGP2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unqualified_Lead_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>UnqualifiedLeads</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Unqualified_Lead owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_UnAssigned_Lead</fullName>
        <field>Date_for_Unassigned_Lead__c</field>
        <formula>LastModifiedDate</formula>
        <name>Update UnAssigned Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>email_opt_in_1</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>email opt in_1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>email_opt_in_False</fullName>
        <field>Email_Opt_In__c</field>
        <literalValue>0</literalValue>
        <name>email opt in False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>email_opt_in_True</fullName>
        <field>Email_Opt_In__c</field>
        <literalValue>1</literalValue>
        <name>email opt in True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>sub_lead_source_clone2</fullName>
        <field>sub_lead_source_clone_2__c</field>
        <formula>text( Sub_Lead_Source__c )</formula>
        <name>sub-lead source clone2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AdvertisementLeads</fullName>
        <actions>
            <name>Adverttrigger</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Advertisement</value>
        </criteriaItems>
        <description>Field Update - When Lead Source = Advertisement,  Update Assign With Trigger = True</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>BEHR_UnAssignedQueue_US</fullName>
        <actions>
            <name>Update_UnAssigned_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>startsWith</operation>
            <value>Unassigned Leads</value>
        </criteriaItems>
        <description>Field Update -Capture those Lead which are assigned to Unassign Queue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Behr_Deactivate_Lead_US</fullName>
        <actions>
            <name>Deactive_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Unqualified Nurture</value>
        </criteriaItems>
        <description>Field Update -Any lead with status as &quot;Unqualified Nurture&quot; will be sent to Adtrack for nurturing and the Lead will be deactivated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Behr_Updatelastmodifieddate_US</fullName>
        <actions>
            <name>Behr_Updatelastmodifieddate_US</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update - update last modified date when modified</description>
        <formula>(CreatedDate  =   LastModifiedDate ||  ISCHANGED( Status)) &amp;&amp;  Check__c=False</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Blank Email</fullName>
        <actions>
            <name>Email_Opt_in_field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opt_out_is_blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Field Update -if the email is blank the email opt in should be unchecked</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>COPA</fullName>
        <actions>
            <name>Asssign_trigger</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>email_opt_in_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>COPA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Eliza Cruz</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Data Cleanup_No Email</fullName>
        <actions>
            <name>No_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>equals</operation>
            <value>na@noemail.com,none@none.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>equals</operation>
            <value>noemail@gmail.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>equals</operation>
            <value>na@behr.com,n/a,test@behr.com</value>
        </criteriaItems>
        <description>Field Update - No email is blank</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email opt 1</fullName>
        <actions>
            <name>email_opt_in_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>notEqual</operation>
            <value>MMT 2013,WEB Registrants</value>
        </criteriaItems>
        <description>If email is not blank	Email Opt Out = False 	Campaign IS NOT = MMT 2013, WEB Registrants
Make Email opt in = True</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email opt 2</fullName>
        <actions>
            <name>email_opt_in_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>notEqual</operation>
            <value>MMT 2013,WEB Registrants</value>
        </criteriaItems>
        <description>If email is not blank	Email Opt Out = True 	Campaign IS NOT = MMT 2013, WEB Registrants
Make Email opt in = False</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email opt 3</fullName>
        <actions>
            <name>Email_opt_out_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>equals</operation>
            <value>MMT 2013,WEB Registrants</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Email_Opt_In__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>If email is not blank	Email Opt Out = False 	Campaign = MMT 2013, WEB Registrants	email opt in = False
Make Email opt out = TRUE</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email opt 4</fullName>
        <actions>
            <name>Email_opt_out_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>equals</operation>
            <value>MMT 2013,WEB Registrants</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Email_Opt_In__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If email is not blank	Email Opt Out = False 	Campaign = MMT 2013, WEB Registrants	email opt in = True 
Make Email opt out = False</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Instore Rep email_store</fullName>
        <actions>
            <name>Pro_Rep_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pro_Rep_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Rep_email_store</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Rep_name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update -populate instore rep email from the primary store</description>
        <formula>ISNEW() ||ISCHANGED( Primary_Store_Number__c ) || ISCHANGED(  Zip_Code_lookup_del__c ) || ischanged( OwnerId )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Instore lead Notification</fullName>
        <actions>
            <name>Instore_Lead_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Email alert -Instore Lead Notification if assigned to Behr Instore and not lead source of instore</description>
        <formula>(Owner:User.Alias = &quot;instore&quot;&amp;&amp;  ischanged(OwnerId)) ||(Owner:User.Alias = &quot;instore&quot;&amp;&amp;  isNEW())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Instore qualified</fullName>
        <actions>
            <name>Instore_qualified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update -Reduce the est monthly spend if the status is changed to equal qualified instore</description>
        <formula>ISPICKVAL( Status , &quot;Qualified In-store Rep&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Email Dup Merge</fullName>
        <actions>
            <name>Lead_Email_Notify_of_dup_lead_with_conversion</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email notification for duplicate lead and merge</description>
        <formula>ISPICKVAL(LeadSource, &quot;Behr In-Store Rep&quot;)&amp;&amp; Owner:Queue.QueueName = &quot;Pro Unassigned&quot; &amp;&amp;  DupeBlocker_Insert_Action__c = &quot;convert&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Email Pro from instore</fullName>
        <actions>
            <name>Email_Lead_Notification_Pro_instore</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Email_Lead_Notification_instore</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Email Alert -Email notification when new lead goes to pro from instore</description>
        <formula>(ISPICKVAL(LeadSource, &quot;Behr In-Store Rep&quot;))&amp;&amp; (Owner:Queue.QueueName = &quot;Pro Unassigned&quot;)&amp;&amp; (Pro_Rep_Name__c &lt;&gt; &quot;Behr Instore Rep&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Email Pro non instore</fullName>
        <actions>
            <name>Email_Lead_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Email Alert -Email notification when new lead goes to pro and not from instore, but assigned via queue</description>
        <formula>Not(ISPICKVAL(LeadSource, &quot;Behr In-Store Rep&quot;))&amp;&amp;  Owner:Queue.QueueName = &quot;Pro Unassigned&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Email instore from instore</fullName>
        <actions>
            <name>Email_Lead_Notification_instore</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Email Alert -Email notification when new lead goes to pro from instore</description>
        <formula>ISPICKVAL(LeadSource, &quot;Behr In-Store Rep&quot;)&amp;&amp;  Owner:Queue.QueueName = &quot;Pro Unassigned&quot;&amp;&amp; Pro_Rep_Name__c  = &quot;Behr Instore Rep&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Source Clone</fullName>
        <actions>
            <name>Lead_Source_Clone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Lead_Source_Clone__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Field Update - Lead source clone update</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead Status-PDCA Banner</fullName>
        <actions>
            <name>Advertisement</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Multiview_PDCA_Banner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Multiview PDCA Banner</value>
        </criteriaItems>
        <description>PDCA Banner Advertisement</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Lead sub Source Clone</fullName>
        <actions>
            <name>Lead_sub_Source_Clone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Sub_Lead_Source__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.sub_lead_source_clone__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Field Update - Lead source clone update</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead sub Source Clone2</fullName>
        <actions>
            <name>sub_lead_source_clone2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Sub_Lead_Source__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.sub_lead_source_clone_2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Field Update - Lead source clone 2 update</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notification%3A Re-assignment</fullName>
        <actions>
            <name>Lead_Re_Assignment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Qualified In-store Rep</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>startsWith</operation>
            <value>Re-Assign Queue</value>
        </criteriaItems>
        <description>Email Alert -When leads are re-assigned by Pro Rep</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow leads-Crawford Connection</fullName>
        <actions>
            <name>THD_National</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>THD_National_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Trade Association</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Trade_Associations__c</field>
            <operation>equals</operation>
            <value>Crawford Connection</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow leads-NAHRO</fullName>
        <actions>
            <name>Lead_record_type_nahro</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tradeshow_leads_NAHRO</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tradeshow_leads_NAHRO2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>NAHRO</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow leads-NIGP</fullName>
        <actions>
            <name>Tradeshow_leads_NIGP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tradeshow_leads_NIGP2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Trade Association</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Trade_Associations__c</field>
            <operation>equals</operation>
            <value>NIGP</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow leadsConnection</fullName>
        <actions>
            <name>Tradeshow_leads_Connections</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tradeshow_leads_Connections2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Trade Association</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Trade_Associations__c</field>
            <operation>equals</operation>
            <value>Connections</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Unqualified Lead Status</fullName>
        <actions>
            <name>Do_not_apply_trigger</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Unqualified_Lead_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Unqualified - Deleted (Non-Paint)</value>
        </criteriaItems>
        <description>Field Update - When Lead status is changed to Unqualified d automatically assign to the Unqualified Queue</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
