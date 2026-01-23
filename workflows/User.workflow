<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>E_Pass_Id_to_LowerCase</fullName>
        <description>Update the value in E-Pass Id to Lower Case</description>
        <field>E_Pass_ID__c</field>
        <formula>LOWER( E_Pass_ID__c )</formula>
        <name>E-Pass Id to LowerCase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Federation_Id_to_LowerCase</fullName>
        <description>Update the value in Federation Id to Lower Case</description>
        <field>FederationIdentifier</field>
        <formula>LOWER( FederationIdentifier )</formula>
        <name>Federation Id to LowerCase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update to Lower Case</fullName>
        <actions>
            <name>E_Pass_Id_to_LowerCase</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Federation_Id_to_LowerCase</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.E_Pass_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.FederationIdentifier</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Modify the values in the fields E-Pass Id and Federation Id to Lower Case</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
