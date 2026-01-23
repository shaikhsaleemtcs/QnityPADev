/*
 * Name			:	PAServiceState
 * Description	:	This class holds the service state variables of the application
 * Author		:	Infosys Limited
 * Created Date	:	16-01-2013
 *
 * Version		Modified Date		Modified By			Modification
 * ------------------------------------------------------------------------------
 */
public class PAServiceState
{
	//To hold the Organizational Group Item details in the service state
	public PAOrganizationalGroupItems ogItems{get;set;}
	//To hold the Customer details in the service state
	public  PAERPCustomer erpCustomer {get;set;}
	//To hold the Request details in the service state
	public PARequest currentRequest{get;set;}
	//To hold the Request Item details in the service state
	public PARequestItem currentRequestItem {get;set;}
	//To hold the Approval Process in the service state
	public PAApprovalSetup approvalSetup {get;set;}
	//To hold the Global Configuration details of BU Setup in the service state
	public PAProductHierarchy productHierarchy {get;set;}
	//To hold the Project Pricing details in the service state
	public PAProjectPrice currentProjectPrice {get;set;}
	//To hold NPC Requests in Service state -NPC
	public PANetPriceDetail currentNPCRequest {get;set;} 
	//To hold RPQ Report Handler
	public  RPQReportHandler rpqReporting{get; set;}

}