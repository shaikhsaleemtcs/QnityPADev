<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Unique_Key_in_Admin_Master_Update</fullName>
        <field>Unique_Key__c</field>
        <formula>BU__c+Sales_Organisation__c+Distribution_Channel__c+Division__c+TEXT(Request_Type__c)+Request_Class__c+TEXT(Price_Category__c)+TEXT(Pricing_Task_Type__c)+Country__c+ TEXT(  End_User_Rebate_Routing__c )</formula>
        <name>Unique Key in Admin Master Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Unique Key in Admin Master</fullName>
        <actions>
            <name>Unique_Key_in_Admin_Master_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
