@isTest 

public class WebServiceReassign_UT
{

static testMethod void recallRequest()
{
    WebServiceReassign inst = new WebServiceReassign ();
    WebServiceReassign.LogInfo login = new WebServiceReassign.LogInfo(); 
    WebServiceReassign.AllowFieldTruncationHeader_element  afthe = new WebServiceReassign.AllowFieldTruncationHeader_element();
    //WebServiceReassign.WebServiceReassign reassign = new WebServiceReassign.WebServiceReassign();
    WebServiceReassign.DebuggingHeader_element debugHeader = new WebServiceReassign.DebuggingHeader_element();
    WebServiceReassign.CallOptions_element  callOptns = new WebServiceReassign.CallOptions_element();
    WebServiceReassign.reAssign_element  reassignele = new WebServiceReassign.reAssign_element();
    WebServiceReassign.recallRequest_element  recalReq = new WebServiceReassign.recallRequest_element();
    WebServiceReassign.reAssignResponse_element  reasignRes = new WebServiceReassign.reAssignResponse_element();
    WebServiceReassign.SessionHeader_element sessionHeader = new WebServiceReassign.SessionHeader_element();
    WebServiceReassign.DebuggingInfo_element debugInfo = new WebServiceReassign.DebuggingInfo_element();
    WebServiceReassign.recallRequestResponse_element  recallReqRes = new WebServiceReassign.recallRequestResponse_element();
    
    try
    {
        Test.startTest();
        WebServiceReassign.PAReassign reassignInvoke = new WebServiceReassign.PAReassign();
        Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
        reassignInvoke.recallRequest('TestParam1','TestParam2');
        Test.Stoptest();
    }
    catch(Exception e)
    {
    }    
    
}

static testMethod void reAssign()
{
    WebServiceReassign inst = new WebServiceReassign ();
    WebServiceReassign.LogInfo login = new WebServiceReassign.LogInfo(); 
    WebServiceReassign.AllowFieldTruncationHeader_element  afthe = new WebServiceReassign.AllowFieldTruncationHeader_element();
    //WebServiceReassign.WebServiceReassign reassign = new WebServiceReassign.WebServiceReassign();
    WebServiceReassign.DebuggingHeader_element debugHeader = new WebServiceReassign.DebuggingHeader_element();
    WebServiceReassign.CallOptions_element  callOptns = new WebServiceReassign.CallOptions_element();
    WebServiceReassign.reAssign_element  reassignele = new WebServiceReassign.reAssign_element();
    WebServiceReassign.recallRequest_element  recalReq = new WebServiceReassign.recallRequest_element();
    WebServiceReassign.reAssignResponse_element  reasignRes = new WebServiceReassign.reAssignResponse_element();
    WebServiceReassign.SessionHeader_element sessionHeader = new WebServiceReassign.SessionHeader_element();
    WebServiceReassign.DebuggingInfo_element debugInfo = new WebServiceReassign.DebuggingInfo_element();
    WebServiceReassign.recallRequestResponse_element  recallReqRes = new WebServiceReassign.recallRequestResponse_element();

    Try
    {
        Test.startTest();
        Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
        WebServiceReassign.PAReassign reassignInvoke = new WebServiceReassign.PAReassign();
        reassignInvoke.reAssign('TestParam1','TestParam2','TestParam3');
        Test.Stoptest();
    }
    catch(Exception e)
    {
    }            
}
}