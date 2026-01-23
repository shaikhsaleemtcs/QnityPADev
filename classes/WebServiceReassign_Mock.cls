@isTest
// This class will sent fake response to test class webservice call outs

global class WebServiceReassign_Mock implements WebServiceMock 
{

    global void doInvoke(Object ob,Object obj, MAP<String,Object> response, String a, String b, String c, String d , String e, String f) 
    {
        System.debug('Object Type : -'+ob);
        System.debug('Object Type ob : -'+ob);
        if(ob instanceof WebServiceReassign.reAssign_element)
        {
             //Map<String, WebServiceReassign.reAssignResponse_element> respElem = new Map<String, WebServiceReassign.reAssignResponse_element>();
             response.put('response_x', new WebServiceReassign.reAssignResponse_element()); 
        }
        if(ob instanceof WebServiceReassign.recallRequest_element)
        {
            //Map<String, WebServiceReassign.recallRequestResponse_element> respElem = new Map<String, WebServiceReassign.recallRequestResponse_element>();
            response.put('response_x', new WebServiceReassign.recallRequestResponse_element() ); 
        }
        if(ob instanceof NpcserviceVARKEY.NPCService )
        {
            //MAP<String,NpcserviceVARKEY.calculateNetPriceResponse_element> respElem= new MAP<String,NpcserviceVARKEY.calculateNetPriceResponse_element>();
            //NpcserviceVARKEY.calculateNetPriceResponse_element resp = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            response.put('response_x', new NpcserviceVARKEY.calculateNetPriceResponse_element());
        }
        if(ob instanceof partnerSoapSforceCom.Soap)
        {
            //Map<String, partnerSoapSforceCom.convertLeadResponse_element> respElem = new Map<String, partnerSoapSforceCom.convertLeadResponse_element>();
            if(obj instanceof partnerSoapSforceCom.login_element){
           
           
            partnerSoapSforceCom.loginResponse_element loginResponse= new partnerSoapSforceCom.loginResponse_element();
            partnerSoapSforceCom.LoginResult res = new partnerSoapSforceCom.LoginResult();
            res.sessionId='ABSCHHSJAJ1';
            loginResponse.result = res;
            //partnerSoapSforceCom.LoginResult loginResult=new partnerSoapSforceCom.LoginResult();
            //loginResult.sessionId='12345';
            
                response.put('response_x',loginResponse);
                }
            else
                response.put('response_x', new partnerSoapSforceCom.convertLeadResponse_element());
        }
        if(ob instanceof WebServiceReassign.PAReassign )
        {
            WebServiceReassign.reAssignResponse_element resp = new WebServiceReassign.reAssignResponse_element();
            resp.result ='error';
            response.put('response_x',resp );
        }
       
        
    }
    
   
}