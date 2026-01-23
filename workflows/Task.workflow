<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Reminder_for_task</fullName>
        <description>Reminder for task</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Price_Approval_Email_Templates/Task_Reminder_VF</template>
    </alerts>
    <alerts>
        <fullName>Reminder_for_task_daily</fullName>
        <description>Reminder for task daily</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Price_Approval_Email_Templates/Task_Reminder_Daily_VF</template>
    </alerts>
</Workflow>
