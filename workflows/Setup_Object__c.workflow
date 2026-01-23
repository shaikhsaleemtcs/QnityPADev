<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Unique_Key_in_Setup_Object_Update</fullName>
        <field>Unique_Key__c</field>
        <formula>BU__c+Sales_Organisation__c+Distribution_Channel__c+	Division__c+TEXT(Key_Field__c)+TEXT(Approver_Role__c)+Key_Field_Id__c+Key_Field_Value__c+Access_Id__c+Approver_Id__c+All_Other_Values__c+Mixed_Values__c</formula>
        <name>Unique Key in Setup Object Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Unique Key in Setup Object</fullName>
        <actions>
            <name>Unique_Key_in_Setup_Object_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
