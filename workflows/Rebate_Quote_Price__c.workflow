<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_External_Id</fullName>
        <field>External_ERP_ID__c</field>
        <formula>BU__c +&apos;-&apos;+ Sales_Org_Code__c +&apos;-&apos;+ Pricing_Condition_Code__c +&apos;-&apos;+ Key_Combination_Code__c +&apos;-&apos;+ PCKC__c</formula>
        <name>Update External Id</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update Rebate Quote Price External ID</fullName>
        <actions>
            <name>Update_External_Id</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Rebate_Quote_Price__c.Approved_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
