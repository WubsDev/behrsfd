<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_Update</fullName>
        <field>Account_Updated__c</field>
        <literalValue>1</literalValue>
        <name>Account Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Current_Year</fullName>
        <field>Current_Year__c</field>
        <literalValue>1</literalValue>
        <name>Current_Year</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LYTD_flag_at_create</fullName>
        <field>LY_to_date__c</field>
        <literalValue>1</literalValue>
        <name>LYTD flag at create</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LY_Flag</fullName>
        <field>Last_year_DTP_flag__c</field>
        <literalValue>1</literalValue>
        <name>LY Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rolling_Year_flag_update</fullName>
        <field>Roll_Year_Flag__c</field>
        <literalValue>1</literalValue>
        <name>Rolling Year flag update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TYTD_DTP</fullName>
        <field>TYTD__c</field>
        <literalValue>1</literalValue>
        <name>TYTD DTP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>hd_store_eq_false</fullName>
        <field>Contact_Phone_HD_Store__c</field>
        <literalValue>0</literalValue>
        <name>hd store eq false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_indicator</fullName>
        <field>Contact_Phone_HD_Store__c</field>
        <literalValue>1</literalValue>
        <name>update indicator</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Behr_AccountUpdate_US</fullName>
        <actions>
            <name>Account_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Account_Name__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Behr_Checked_currentyear</fullName>
        <actions>
            <name>Current_Year</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>YEAR(Date_of_Purchase__c)  =  YEAR( TODAY() )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LY flag at create</fullName>
        <actions>
            <name>LY_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and( Date_of_Purchase__c &gt;=   DATE(Year(today())-1,01,01) , Date_of_Purchase__c  &lt;=   DATE(Year(today())-1,12,31)  )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LYTD flag at create</fullName>
        <actions>
            <name>LYTD_flag_at_create</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Last year to date at create</description>
        <formula>and( Date_of_Purchase__c &lt;= date(year($Setup.Current_Month_POS__c.Current_Month_POS__c)-1,month($Setup.Current_Month_POS__c.Current_Month_POS__c),day($Setup.Current_Month_POS__c.Current_Month_POS__c)),Date_of_Purchase__c &gt;=date(year( $Setup.Current_Month_POS__c.Start_Month__c )-1,month( $Setup.Current_Month_POS__c.Start_Month__c ),day( $Setup.Current_Month_POS__c.Start_Month__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>RollingYear flag at create</fullName>
        <actions>
            <name>Rolling_Year_flag_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and( Date_of_Purchase__c &lt;=   today() , Date_of_Purchase__c  &gt;=   today() -365 )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TYTD DTP</fullName>
        <actions>
            <name>TYTD_DTP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and( Date_of_Purchase__c &lt;= $Setup.Current_Month_POS__c.Current_Month_POS__c ,Date_of_Purchase__c &gt;= $Setup.Current_Month_POS__c.Start_Month__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>hd eq contact %3D false</fullName>
        <actions>
            <name>hd_store_eq_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When HD store is NOT the same as the contact store, change the flag to true</description>
        <formula>Contact_Phone__c   &lt;&gt;    Store_of_Purchase__r.store_phone_clean__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>hd eq contact %3D true</fullName>
        <actions>
            <name>update_indicator</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When HD store is the same as the contact store, change the flag to true</description>
        <formula>Contact_Phone__c  =  Store_of_Purchase__r.store_phone_clean__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
