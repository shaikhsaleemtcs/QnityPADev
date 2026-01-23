<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Approval_Update</fullName>
        <description>Approval Update for Project</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Price_Approval_Email_Templates/Project_Task</template>
    </alerts>
    <fieldUpdates>
        <fullName>ProjectStatusToCompleted</fullName>
        <description>To Update Status of project To Completed</description>
        <field>Project_Status__c</field>
        <literalValue>Completed</literalValue>
        <name>ProjectStatusToCompleted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Approved Project Task and Email Creation</fullName>
        <actions>
            <name>Approval_Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project_Price__c.Project_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
