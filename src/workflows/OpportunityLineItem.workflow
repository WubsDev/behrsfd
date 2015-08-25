<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Opportunity_Discount</fullName>
        <description>For THD opportunities, update discount accoreding to account discount</description>
        <field>Discount</field>
        <formula>If( ispickval(Opportunity.Account.Tier_Level__c , &quot;Gold&quot;),  Product2.Gold__c , If( ispickval(Opportunity.Account.Tier_Level__c , &quot;Silver&quot;),  Product2.Silver__c, If( ispickval(Opportunity.Account.Tier_Level__c , &quot;Bronze&quot;),  Product2.Bronze__c,0)))</formula>
        <name>Opportunity Discount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Zone</fullName>
        <description>To update the existing field with the selected picklist value</description>
        <field>Zone__c</field>
        <formula>if(ispickval(Zone1__c , &quot;1&quot;), 1, if(ispickval(Zone1__c , &quot;2&quot;), 2, if(ispickval(Zone1__c , &quot;3&quot;), 3, if(ispickval(Zone1__c ,&quot;4&quot;), 4, if(ispickval(Zone1__c , &quot;5&quot;), 5, if(ispickval(Zone1__c ,&quot;6&quot;), 6,if(ispickval(Zone1__c ,&quot;7&quot;), 7, 8)))))))</formula>
        <name>Opportunity Zone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Zone_Price</fullName>
        <description>update the opportunity with the correct zone price</description>
        <field>UnitPrice</field>
        <formula>if(ispickval(Zone1__c , &quot;1&quot;),  PricebookEntry.X1__c, if(ispickval(Zone1__c , &quot;2&quot;),  PricebookEntry.X2__c,if(ispickval(Zone1__c , &quot;3&quot;),  PricebookEntry.X3__c,if(ispickval(Zone1__c , &quot;4&quot;),  PricebookEntry.X4__c,if(ispickval(Zone1__c , &quot;5&quot;),  PricebookEntry.X5__c,if(ispickval(Zone1__c , &quot;6&quot;),  PricebookEntry.X6__c,PricebookEntry.X7__c))))))</formula>
        <name>Opportunity Zone Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Discount</fullName>
        <actions>
            <name>Opportunity_Discount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(isnew(), ispickval( Opportunity.Type , &quot;THD&quot;),isnull( Discount ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Zone</fullName>
        <actions>
            <name>Opportunity_Zone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>To populate existing zone field from picklist</description>
        <formula>AND(ISPICKVAL( Opportunity.Type , &quot;Direct&quot;) , ISCHANGED( Zone1__c )) || AND(ISPICKVAL( Opportunity.Type , &quot;Direct&quot;) , ISNEW( ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Zone update</fullName>
        <actions>
            <name>Opportunity_Zone_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>To populate the sales price when zone is updated</description>
        <formula>AND( ispickval(Opportunity.Type, &quot;Direct&quot;),not(ispickval( Zone1__c, &quot;Off Zone&quot;)), Ischanged(Zone1__c)) || AND(ISPICKVAL( Opportunity.Type , &quot;Direct&quot;) , ISNEW( ),not(ispickval( Zone1__c, &quot;Off Zone&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
