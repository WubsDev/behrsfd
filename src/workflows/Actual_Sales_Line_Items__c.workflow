<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Actual_Sales_Multiplier</fullName>
        <field>Multiplier__c</field>
        <formula>Multiplier2__c</formula>
        <name>Actual Sales Multiplier</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actual_Sales_Retail</fullName>
        <description>actual sales line item update retail  to update formula to field to populate est retail</description>
        <field>Retail2__c</field>
        <formula>Retail__c</formula>
        <name>Actual Sales Retail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>National_Retail</fullName>
        <description>Populate the national retail if the product is valid</description>
        <field>National_Retail__c</field>
        <formula>Product__r.Zone1__c</formula>
        <name>National Retail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Actual Sales Multiplier</fullName>
        <actions>
            <name>Actual_Sales_Multiplier</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>To update the multiplier %</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Actual Sales retail</fullName>
        <actions>
            <name>Actual_Sales_Retail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>To update the retail</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>National Retail</fullName>
        <actions>
            <name>National_Retail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>populate the national retail upon create</description>
        <formula>Not( ISNULL( Product__c ) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
