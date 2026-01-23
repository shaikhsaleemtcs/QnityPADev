<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>COB_Send_Quere_Watcher_Email_Alert</fullName>
        <description>COB Send Quere Watcher Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Queue_Watcher</template>
    </alerts>
    <alerts>
        <fullName>Notification_After_Credit_Analysis</fullName>
        <description>Notification After Credit Analysis</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Credit_Analysis_completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_After_Credit_Analysis_Approval</fullName>
        <description>Notification After Credit Analysis Approval</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Credit_Analysis_completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_After_DOA_analysis</fullName>
        <description>Notification After DOA analysis</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_DOA_Analysis_completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_After_Destination_Credit</fullName>
        <description>Notification After Destination Credit</description>
        <protected>false</protected>
        <recipients>
            <field>Credit_Analyst_Notification_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_DCA_completion1</template>
    </alerts>
    <alerts>
        <fullName>Notification_after_Data_Gathering</fullName>
        <description>Notification after Data Gathering</description>
        <protected>false</protected>
        <recipients>
            <field>Credit_Analyst_Notification_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Data_Gathering_Completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_after_Data_Gathering_To_DCA</fullName>
        <description>Notification after Data Gathering To DCA</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Data_Gathering_Completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_after_Data_Gathering_for_Miscellaneous_and_Create</fullName>
        <description>Notification after Data Gathering for Miscellaneous and Create</description>
        <protected>false</protected>
        <recipients>
            <field>Credit_Analyst_Notification_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Data_Gathering_Completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_to_DOA_Manager</fullName>
        <description>Notification to DOA Manager</description>
        <protected>false</protected>
        <recipients>
            <field>Escalated_Approver_Name__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_for_DOA_Manager</template>
    </alerts>
    <alerts>
        <fullName>Notification_to_be_sent_after_the_completion_of_data_gathering_to_DCA_for_Miscel</fullName>
        <description>Notification to be sent after the completion of data gathering to DCA for Miscellaneous and Create Partner/link contact/link existing</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Data_Gathering_Completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_to_be_sent_after_the_completion_of_data_gathering_to_DMS</fullName>
        <description>Notification to be sent after the completion of data gathering to DMS</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Data_Gathering_Completion</template>
    </alerts>
    <alerts>
        <fullName>Notification_to_be_sent_after_the_completion_of_data_gathering_to_DMS_for_Misc_a</fullName>
        <description>Notification to be sent after the completion of data gathering to DMS for Misc and Create Partner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_After_Data_Gathering_Completion</template>
    </alerts>
    <alerts>
        <fullName>Request_sent_for_Re_work</fullName>
        <description>Request sent for Re-work</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Notification_to_DMS_team_indicating_Re_Work_on_a_Request</template>
    </alerts>
    <alerts>
        <fullName>Send_Notification_back_to_CA</fullName>
        <description>Send Notification back to CA</description>
        <protected>false</protected>
        <recipients>
            <field>Credit_Analyst_Notification_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Send_Notification_back_to_CA</template>
    </alerts>
    <alerts>
        <fullName>Send_Notification_to_Util_Requestor_after_Completion</fullName>
        <description>Send Notification to Util Requestor after Completion</description>
        <protected>false</protected>
        <recipients>
            <field>Requestor_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>COB_templates/Send_Notification_to_Util_Requestor_after_Completion</template>
    </alerts>
    <fieldUpdates>
        <fullName>Date_assigned_to_this_Queue</fullName>
        <field>Date_assigned_to_this_Queue__c</field>
        <formula>IF(ISNULL(Owner:Queue.OwnerId) ,null, NOW() )</formula>
        <name>Date assigned to this Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lock_Customer_Data_Request_Record</fullName>
        <field>Record_Locked__c</field>
        <literalValue>1</literalValue>
        <name>Lock Customer Data Request Record</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Closed_Date</fullName>
        <field>Closed_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Credit_Approver</fullName>
        <field>Credit_Approver__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <name>Update Credit Approver</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cust_Data_Req_Status_to_Closed</fullName>
        <field>Request_Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Update Cust Data Req Status to Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Customer_Data_Request_Number</fullName>
        <description>Updating CDR number with autonumber when CDRs are created in Util instance</description>
        <field>Name</field>
        <formula>Util_Customer_Data_Request_Name__c</formula>
        <name>Update Customer Data Request Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cycle_Count_Field</fullName>
        <field>Cycle_Count__c</field>
        <formula>Cycle_Count__c + 1</formula>
        <name>Update Cycle Count Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_DMS_Approver</fullName>
        <field>DMS_Approver__c</field>
        <formula>$User.FirstName  &amp; &quot; &quot; &amp; $User.LastName</formula>
        <name>Update DMS Approver</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Destination_Credit_Approver</fullName>
        <description>To update Destination Credit Approver when the request is submitted by DCA</description>
        <field>Destination_Credit_Approver__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <name>Update Destination Credit Approver</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Escalated_Approver</fullName>
        <description>To update the DOA approver when the request is sent from DOA to DMS</description>
        <field>Escalated_Approver__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <name>Update Escalated Approver</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_request_Date</fullName>
        <field>Request_Duration__c</field>
        <formula>TODAY() -  DATEVALUE(CreatedDate)</formula>
        <name>Update request Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>COB Queue Watcher</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Data_Request__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting Credit Approval,Awaiting Data Analyst (DMS Team) Approval,Awaiting Destination Credit Approval,Request Sent for Re-Work,Awaiting DOA approval</value>
        </criteriaItems>
        <description>Workflow to send an email notification to the owner of the request if the request has not been modified since three days</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>COB_Send_Quere_Watcher_Email_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Customer_Data_Request__c.LastModifiedDate</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>DCA to CA email Notification</fullName>
        <actions>
            <name>Notification_After_Destination_Credit</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>RecordType.DeveloperName = &apos;New_Customer_Creation&apos; &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Destination Credit Approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date assigned to this Queue</fullName>
        <actions>
            <name>Date_assigned_to_this_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Data_Request__c.OwnerId</field>
            <operation>contains</operation>
            <value>Customer On-boarding DMS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Data_Request__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting Data Analyst (DMS Team) Approval</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Increment Cycle Count values</fullName>
        <actions>
            <name>Update_Cycle_Count_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>To increment the cycle count values</description>
        <formula>OR( (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Destination Credit Approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Draft/Data Gathering&apos;), (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Credit Approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Draft/Data Gathering&apos;), (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Data Analyst (DMS Team) Approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Draft/Data Gathering&apos;),  (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Request Completed in SAP&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Request Sent for Re-Work&apos;), (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Data Analyst (DMS Team) Approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;), (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting DOA approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Draft/Data Gathering&apos;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notification on completion of Data Delivery</fullName>
        <actions>
            <name>Update_DMS_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Notification on the completion of data delivery phase</description>
        <formula>(RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner&apos;  || RecordType.DeveloperName = &apos;New_Customer_Creation&apos; || RecordType.DeveloperName = &apos;Modify_Credit_Data&apos; || RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos; || RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;  || RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;)  &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Data Analyst (DMS Team) Approval&apos;))  &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Request Completed in SAP&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notification on completion of Data Delivery - modify Credit %26 Miscel</fullName>
        <actions>
            <name>Send_Notification_to_Util_Requestor_after_Completion</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification on the completion of data delivery phase</description>
        <formula>(RecordType.DeveloperName = &apos;Modify_Credit_Data&apos; || RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos; &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Data Analyst (DMS Team) Approval&apos;))  &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Request Completed in SAP&apos;) &amp;&amp;  NOT(ISPICKVAL(Request_Initiator__c,&apos;CSR Initiated&apos;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Request sent for Re-work</fullName>
        <actions>
            <name>Request_sent_for_Re_work</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Sent notification to DMS team once CSR re-opens a request</description>
        <formula>(RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner&apos;  ||  RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;  || RecordType.DeveloperName = &apos;New_Customer_Creation&apos; ||RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;)  &amp;&amp; (ISPICKVAL(Request_Status__c,&apos;Request Sent for Re-Work&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Credit Analysis</fullName>
        <actions>
            <name>Notification_After_Credit_Analysis</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Credit_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Send Notification to Manager after the Credit Analysis Phase</description>
        <formula>((RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;  ||  RecordType.DeveloperName = &apos;Modify_Credit_Data&apos; || RecordType.DeveloperName = &apos;New_Customer_Creation&apos; || RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;) &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Credit Approval&apos;))  &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Credit Analysis Approval</fullName>
        <actions>
            <name>Notification_After_Credit_Analysis_Approval</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Credit_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Send Notification to Manager after the Credit Analysis Phase - Miscel &amp; New Partner</description>
        <formula>(RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner&apos; ||RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos;) &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Credit Approval&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Credit Analysis to DOA</fullName>
        <actions>
            <name>Notification_After_Credit_Analysis</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Credit_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>To send Notification after Credit Analysis phase and the request goes to DOA for Approval</description>
        <formula>((RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;  ||  RecordType.DeveloperName = &apos;Modify_Credit_Data&apos;  ||  RecordType.DeveloperName = &apos;New_Customer_Creation&apos;  ||  RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos; || RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos; || RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner	&apos;) &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Credit Approval&apos;))  &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting DOA approval&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering</fullName>
        <actions>
            <name>Notification_after_Data_Gathering</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>(RecordType.DeveloperName = &apos;New_Customer_Creation&apos;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering for Miscel %26 Create New partner for CA</fullName>
        <actions>
            <name>Notification_after_Data_Gathering_for_Miscellaneous_and_Create</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification to be sent after the completion of data gathering</description>
        <formula>((RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner&apos;)|| (RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos;))&amp;&amp; IF( ISNEW(), true, false)&amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering for Miscel %26 Create New partner for DCA</fullName>
        <actions>
            <name>Notification_to_be_sent_after_the_completion_of_data_gathering_to_DCA_for_Miscel</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification to be sent after the completion of data gathering</description>
        <formula>((RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner&apos;)|| (RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos;))&amp;&amp; IF( ISNEW(), true, false)&amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Destination Credit Approval&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering for Miscel %26 Create New partner for DMS</fullName>
        <actions>
            <name>Notification_to_be_sent_after_the_completion_of_data_gathering_to_DMS_for_Misc_a</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification to be sent after the completion of data gathering</description>
        <formula>((RecordType.DeveloperName = &apos;Create_partner_function_Link_Contact_Link_Existing_Partner&apos;)|| (RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos;))&amp;&amp; IF( ISNEW(), true, false) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering to CA</fullName>
        <actions>
            <name>Notification_after_Data_Gathering</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification to be sent after the completion of data gathering</description>
        <formula>((RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;)||  (RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;)|| (RecordType.DeveloperName = &apos;New_Customer_Creation&apos;))&amp;&amp; (IF( ISNEW(), true, false)&amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;)||(ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Draft/Data Gathering&apos;)) &amp;&amp; (ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering to DCA</fullName>
        <actions>
            <name>Notification_after_Data_Gathering_To_DCA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification to be sent after the completion of data gathering</description>
        <formula>((RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;)||  (RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;)|| (RecordType.DeveloperName = &apos;New_Customer_Creation&apos;))&amp;&amp;( IF( ISNEW(), true, false)&amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Destination Credit Approval&apos;)||(ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Draft/Data Gathering&apos;)) &amp;&amp; (ISPICKVAL(Request_Status__c,&apos;Awaiting Destination Credit Approval&apos;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification After Data Gathering to DMS</fullName>
        <actions>
            <name>Notification_to_be_sent_after_the_completion_of_data_gathering_to_DMS</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification to be sent after the completion of data gathering</description>
        <formula>((RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;)||  (RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;)|| (RecordType.DeveloperName = &apos;New_Customer_Creation&apos;))&amp;&amp; (IF( ISNEW(), true, false) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;)||(ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Draft/Data Gathering&apos;)) &amp;&amp; (ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification from DOA to DMS</fullName>
        <actions>
            <name>Notification_After_DOA_analysis</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Escalated_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Send Notification to Manager after the Credit Analysis Phase</description>
        <formula>(  ((RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;) || RecordType.DeveloperName = &apos;Modify_Credit_Data&apos;  || RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos;  || RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;  || RecordType.DeveloperName = &apos;New_Customer_Creation&apos; )  &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting DOA approval&apos;))  &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification to CA from DCA</fullName>
        <actions>
            <name>Notification_After_Destination_Credit</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Destination_Credit_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Notification to be snet on the request moving from destination credit analyst to credit analyst</description>
        <formula>((RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos;)|| (RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;)|| (RecordType.DeveloperName = &apos;New_Customer_Creation&apos;))&amp;&amp;(ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Destination Credit Approval&apos;)) &amp;&amp; (ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;) || ISPICKVAL(Request_Status__c,&apos;Awaiting DOA Approval&apos;) || ISPICKVAL(Request_Status__c,&apos;Awaiting Data Analyst (DMS Team) Approval&apos;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send notification to DOA Manager</fullName>
        <actions>
            <name>Notification_to_DOA_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Data_Request__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting DOA approval</value>
        </criteriaItems>
        <description>A notification mail is sent to the DOA Manager when a request enters DOA stage</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send request back to CA from DMS</fullName>
        <actions>
            <name>Send_Notification_back_to_CA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send request back to CA from DMS</description>
        <formula>( ((RecordType.DeveloperName = &apos;Modify_Existing_Customer_Data&apos;) &amp;&amp; (Credit_Approval_Required__c == true)) || RecordType.DeveloperName = &apos;Modify_Credit_Data&apos; || RecordType.DeveloperName = &apos;Miscellaneous_customer_data_request&apos; || RecordType.DeveloperName = &apos;Extend_Existing_Customer&apos; || RecordType.DeveloperName = &apos;New_Customer_Creation&apos;  )  &amp;&amp; (ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Awaiting Data Analyst (DMS Team) Approval&apos;))  &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Awaiting Credit Approval&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update CDR Name</fullName>
        <actions>
            <name>Update_Customer_Data_Request_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Data_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Miscellaneous customer data request,Modify Credit Data</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Data_Request__c.Request_Initiator__c</field>
            <operation>equals</operation>
            <value>CA Initiated,DMS Initiated</value>
        </criteriaItems>
        <description>Updating CDR names with auto-number when CDRs are created in Util instance</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Closed Date</fullName>
        <actions>
            <name>Update_Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(NOT(ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Request Completed in SAP&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Request Completed in SAP&apos;), NOT(ISPICKVAL(PRIORVALUE(Request_Status__c),&apos;Rejected&apos;)) &amp;&amp; ISPICKVAL(Request_Status__c,&apos;Rejected&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Customer Data Request Status</fullName>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>Customer_Data_Request__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Request Completed in SAP</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Data_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Customer Creation,Create partner function/Link Contact/Link Existing Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Data_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Extend Existing Customer,Modify Existing Customer Data</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Data_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Miscellaneous customer data request,Modify Credit Data</value>
        </criteriaItems>
        <description>To auto close the Customer Data Request after 10 days of entering into SAP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Lock_Customer_Data_Request_Record</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Update_Cust_Data_Req_Status_to_Closed</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update Days</fullName>
        <actions>
            <name>Update_request_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Data_Request__c.Request_Status__c</field>
            <operation>notEqual</operation>
            <value>Closed,Rejected</value>
        </criteriaItems>
        <description>To update days of processing when request is not in closed state or rejected state.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
