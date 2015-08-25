<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Actual_Sales_Carryout</fullName>
        <description>Update Sale Type to Carryout</description>
        <field>Sale_Type__c</field>
        <literalValue>Carryout</literalValue>
        <name>Actual Sales Carryout</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actual_Sales_DTP</fullName>
        <description>Update actual sales type to dtp</description>
        <field>Sale_Type__c</field>
        <literalValue>DTP</literalValue>
        <name>Actual Sales DTP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actual_Sales_Direct</fullName>
        <description>Update actual sales type to Direct</description>
        <field>Sale_Type__c</field>
        <literalValue>Direct</literalValue>
        <name>Actual Sales Direct</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actual_Sales_HD_store</fullName>
        <description>If the HD store is the same as the contact phone, mark this flag as true.</description>
        <field>Contact_Phone_HD_Store__c</field>
        <literalValue>1</literalValue>
        <name>Actual Sales HD store</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LMTD_DTP_Field_Update</fullName>
        <field>LMTD_Currency_DTP__c</field>
        <formula>LMTD_Formula_DTP__c</formula>
        <name>LMTD DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LMTD_POS_Field_Update</fullName>
        <field>LMTD_Currency__c</field>
        <formula>LMTD_Formula_POS__c</formula>
        <name>LMTD POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LYTD_DTP_Field_Update</fullName>
        <field>LYTD_Currency_DTP__c</field>
        <formula>LYTD_Formula_DTP__c</formula>
        <name>LYTD DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LYTD_POS_Field_Update</fullName>
        <field>LYTD_Currency__c</field>
        <formula>LYTD_Formula_POS__c</formula>
        <name>LYTD POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LY_DTP_Field_Update</fullName>
        <field>LY_Currency_DTP__c</field>
        <formula>LY_Formula_DTP__c</formula>
        <name>LY DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LY_POS_Field_Update</fullName>
        <field>LY_Currency__c</field>
        <formula>LY_Formula_POS__c</formula>
        <name>LY POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Managed_Sales</fullName>
        <description>updates managed sales amounts</description>
        <field>Managed_Amount__c</field>
        <formula>Managed_Sale_Amount__c</formula>
        <name>Managed Sales</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rolling_Year_DTP_Field_Update</fullName>
        <field>Rolling_year_Currency_DTP__c</field>
        <formula>DTP_Rollling_Year_Formula__c</formula>
        <name>Rolling Year DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rolling_Year_POS_Field_Update</fullName>
        <field>Rolling_year_Currency__c</field>
        <formula>CC_Rollling_Year_Formula__c</formula>
        <name>Rolling Year POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TMTD_DTP_Field_Update</fullName>
        <field>TMTD_Currency_DTP__c</field>
        <formula>TMTD_Formula_DTP__c</formula>
        <name>TMTD DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TMTD_POS_Field_Update</fullName>
        <field>TMTD_Currency__c</field>
        <formula>TMTD_Formula_POS__c</formula>
        <name>TMTD POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TYTD_DTP_Field_Update</fullName>
        <field>TYTD_Currency_DTP__c</field>
        <formula>TYTD_Formula_DTP__c</formula>
        <name>TYTD DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TYTD_POS_Field_Update</fullName>
        <field>TYTD_Currency__c</field>
        <formula>TYTD_Formula_POS__c</formula>
        <name>TYTD POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TY_DTP_Field_Update</fullName>
        <field>TY_Currency_DTP__c</field>
        <formula>TY_Formula_DTP__c</formula>
        <name>TY DTP Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TY_POS_Field_Update</fullName>
        <field>TY_Currency__c</field>
        <formula>TY_Formula_POS__c</formula>
        <name>TY POS Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Actual Sales Carryout</fullName>
        <actions>
            <name>Actual_Sales_Carryout</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Actual_Sales__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>POS Sales</value>
        </criteriaItems>
        <description>Update Sales Type to Carryout</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actual Sales DTP</fullName>
        <actions>
            <name>Actual_Sales_DTP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Actual_Sales__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>DTP Orders</value>
        </criteriaItems>
        <criteriaItems>
            <field>Actual_Sales__c.Direct_order__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Update Sales Type to DTP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actual Sales Direct</fullName>
        <actions>
            <name>Actual_Sales_Direct</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Actual_Sales__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>DTP Orders</value>
        </criteriaItems>
        <criteriaItems>
            <field>Actual_Sales__c.Direct_order__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Update Sales Type to Direct</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actual Sales HD store</fullName>
        <actions>
            <name>Actual_Sales_HD_store</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If the HD store is the same # as the contact</description>
        <formula>Phone__c = Store_of_Purchase__r.store_phone_clean__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actual Sales Rollup DTP field Update</fullName>
        <actions>
            <name>LMTD_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LYTD_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LY_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Rolling_Year_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TMTD_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TYTD_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TY_DTP_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Actual_Sales__c.CreatedDate</field>
            <operation>greaterThan</operation>
            <value>1/1/2012 1:30 PM</value>
        </criteriaItems>
        <description>To update the DTP number fields from formulas created for rollup calculations</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Actual Sales Rollup fields Update</fullName>
        <actions>
            <name>LMTD_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LYTD_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LY_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Rolling_Year_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TMTD_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TYTD_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TY_POS_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Actual_Sales__c.CreatedDate</field>
            <operation>greaterOrEqual</operation>
            <value>1/1/2012 1:30 PM</value>
        </criteriaItems>
        <description>To update the number fields from formulas created . These number fields will be used for rollup</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Managed Sales</fullName>
        <actions>
            <name>Managed_Sales</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Update Managed sales amounts</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
