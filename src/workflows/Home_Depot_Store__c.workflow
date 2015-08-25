<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Behr_Populate_HD_Store_Number_Backend</fullName>
        <field>HD_Store_Number_Backend__c</field>
        <formula>Name</formula>
        <name>Behr_PopulateHD Store Number Backend</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Behr_Populate HD Store Number Backend</fullName>
        <actions>
            <name>Behr_Populate_HD_Store_Number_Backend</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Home_Depot_Store__c.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <description>To populate HD Store Number Backend whenever the standard name field is populated.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
