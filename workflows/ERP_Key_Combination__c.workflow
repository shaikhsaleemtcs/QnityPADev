<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Concatenate_Key_Combination_Type_Field</fullName>
        <description>Used to Concatenate the Key Combination Type feld values and use it in Criteria Based Sharing,</description>
        <field>Key_Combination_Type_Text__c</field>
        <formula>IF(INCLUDES( Key_Combination_Type__c , &quot;Floor&quot;), &quot;Floor, &quot;, &quot;&quot;) + 
 IF(INCLUDES(Key_Combination_Type__c , &quot;Reference&quot;), &quot;Reference, &quot;, &quot;&quot;) + 
 IF(INCLUDES(Key_Combination_Type__c , &quot;Standard&quot;), &quot;Standard, &quot;, &quot;&quot;) +
  IF(INCLUDES(Key_Combination_Type__c , &quot;Net Reference&quot;), &quot;Net Reference, &quot;, &quot;&quot;) + 
 IF(INCLUDES(Key_Combination_Type__c , &quot;Net Floor&quot;), &quot;Net Floor, &quot;, &quot;&quot;)+
IF(INCLUDES(Key_Combination_Type__c , &quot;Spot&quot;), &quot;Spot, &quot;, &quot;&quot;)</formula>
        <name>Concatenate Key Combination Type Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Concatenate ERP Key Combination Key</fullName>
        <actions>
            <name>Concatenate_Key_Combination_Type_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT( ISNULL( Key_Combination_Type__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
