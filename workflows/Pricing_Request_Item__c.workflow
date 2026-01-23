<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Field_update_on_NPC_Status</fullName>
        <field>Net_Price_Status__c</field>
        <literalValue>Net Price Received</literalValue>
        <name>Field update on NPC Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_update_on_NPC_Status_Erro</fullName>
        <field>Net_Price_Status__c</field>
        <literalValue>Error</literalValue>
        <name>Field update on NPC Status Error</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_External_Id_in_Req_Item</fullName>
        <field>External_ERP_ID__c</field>
        <formula>PCKC__c + &apos;-&apos; + BU__c + &apos;-&apos; + TEXT(Pricing_Request_Type__c)</formula>
        <name>Update External Id in Req Item</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>To identify Completion of  Net Price</fullName>
        <actions>
            <name>Field_update_on_NPC_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(Materials_with_Error_Response__c==0,  Total_Materials__c== Net_Price_Calculated_Materials__c, NOT($Setup.Global_On_Off_Switch__c.Workflow_Rules__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>To identify Error in Net Price Calculation</fullName>
        <actions>
            <name>Field_update_on_NPC_Status_Erro</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( Total_Materials__c== Net_Price_Calculated_Materials__c ,Materials_with_Error_Response__c!=0, NOT($Setup.Global_On_Off_Switch__c.Workflow_Rules__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Pricing Request Item External ID</fullName>
        <actions>
            <name>Update_External_Id_in_Req_Item</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT($Setup.Global_On_Off_Switch__c.Workflow_Rules__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
