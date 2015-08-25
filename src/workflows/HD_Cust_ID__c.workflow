<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>HD_Cust_ID_Needs_Added_flag</fullName>
        <description>Update field Needs added for pos load</description>
        <field>Needs_Added__c</field>
        <literalValue>1</literalValue>
        <name>HD Cust ID Needs Added flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_HD_cust_ID_Backend</fullName>
        <description>HD cust ID Backend will be populated with the value HD Cust ID.</description>
        <field>HD_cust_ID_Backend__c</field>
        <formula>Name</formula>
        <name>Populate HD cust ID Backend</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Behr_Populate HD cust ID Backend</fullName>
        <actions>
            <name>Populate_HD_cust_ID_Backend</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>HD_Cust_ID__c.Name</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Populate HD cust ID Backend whenever the standard name field is populated.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>HD Cust ID Needs Added flag</fullName>
        <actions>
            <name>HD_Cust_ID_Needs_Added_flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>HD Cust ID Update field Needs Added when account changed from Generic Account DTP to a real account.  The flag remains on until the last step of the batch job where it will turn off.  This allows for the load of new POS</description>
        <formula>ISCHANGED( Account__c)  &amp;&amp;  Account__r.Name &lt;&gt; &quot;Generic Account DTP&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
