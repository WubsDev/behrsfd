<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_owner_RPSM_LA</fullName>
        <description>Account owner updated to Manager LA</description>
        <field>OwnerId</field>
        <lookupValue>jwysor@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM LA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_Mid_Altantic</fullName>
        <field>OwnerId</field>
        <lookupValue>brjones@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM Mid Altantic</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_Midwest</fullName>
        <description>Update the account owner to the Midwest RPSM</description>
        <field>OwnerId</field>
        <lookupValue>dmcguire@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM Midwest</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_North_Atlantic</fullName>
        <description>Account owner update to Manager</description>
        <field>OwnerId</field>
        <lookupValue>asuleiman@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM North Atlantic</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_Northeast</fullName>
        <description>Account owner updated to manager Northeast</description>
        <field>OwnerId</field>
        <lookupValue>szorbas@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM Northeast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_Pac_North</fullName>
        <description>Account owner updated to manager Pac North</description>
        <field>OwnerId</field>
        <lookupValue>lmarkes@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM Pac North</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_Pac_South</fullName>
        <description>Account owner changed to manager Pac South</description>
        <field>OwnerId</field>
        <lookupValue>bemmert@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM Pac South</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_South_Atlantic</fullName>
        <description>Account owner to manager South Atlantic</description>
        <field>OwnerId</field>
        <lookupValue>ggoodwin@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM South Atlantic</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_South_Central</fullName>
        <description>Account owner to RPSM of South Central</description>
        <field>OwnerId</field>
        <lookupValue>rrivers@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM South Central</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_RPSM_Southwest</fullName>
        <description>Update account owner to manger Southwest</description>
        <field>OwnerId</field>
        <lookupValue>bmahoney@behrpaint.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner RPSM Southwest</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_owner_to_Data_Admin</fullName>
        <description>Change the account owner to Data Admin</description>
        <field>OwnerId</field>
        <lookupValue>data.administrator@behr.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Account owner to Data Admin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Inactive account to LA</fullName>
        <actions>
            <name>Account_owner_RPSM_LA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is LA, update the owner to the LA manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM LA&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to Mid Altantic</fullName>
        <actions>
            <name>Account_owner_RPSM_Mid_Altantic</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is Mid Altantic , update the owner to the Mid Altantic  manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM Mid Altantic&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to Midwest</fullName>
        <actions>
            <name>Account_owner_RPSM_Midwest</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is Midwest, update the owner to the midwest manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM Midwest&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to North Altantic</fullName>
        <actions>
            <name>Account_owner_RPSM_North_Atlantic</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is North Altantic , update the owner to the North Altantic  manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM North Atlantic&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to Northeast</fullName>
        <actions>
            <name>Account_owner_RPSM_Northeast</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is Northeast, update the owner to the Northeast manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM Northeast&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to Pac North</fullName>
        <actions>
            <name>Account_owner_RPSM_Pac_North</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is Pac North, update the owner to the Pac North manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM Pac North&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to Pac South</fullName>
        <actions>
            <name>Account_owner_RPSM_Pac_South</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is Pac South, update the owner to the Pac South manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM Pac South&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to South Atlantic</fullName>
        <actions>
            <name>Account_owner_RPSM_South_Atlantic</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is South Atlantic, update the owner to the South Atlantic manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM South Atlantic&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to South Central</fullName>
        <actions>
            <name>Account_owner_RPSM_South_Central</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is South Central, update the owner to the South Central manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM South Central&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to Southwest</fullName>
        <actions>
            <name>Account_owner_RPSM_Southwest</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update  - When account status is changed to inactive and the manager is Southwest, update the owner to the Southwest manager.  This will need to be updated if manger changes</description>
        <formula>ISPICKVAL(Account_Status__c, &quot;Inactive&quot;)  &amp;&amp;   Owner.Manager.UserRole.Name  = &quot;ROM/RPSM Southwest&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactive account to data admin</fullName>
        <actions>
            <name>Account_owner_to_Data_Admin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Account_Status__c</field>
            <operation>equals</operation>
            <value>Inactive</value>
        </criteriaItems>
        <description>Field Update  - When account status is changed to inactive, update the owner to data admin user</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
