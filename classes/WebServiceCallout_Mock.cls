@IsTest
global class WebServiceCallout_Mock implements WebServiceMock 
 {

    global void doInvoke(Object ob,Object obj, MAP<String,Object> response, String a, String b, String c, String d , String e, String f) 
    {
        
        if(ob instanceof NpcserviceVARKEY.NPCService )
        {
            //MAP<String,NpcserviceVARKEY.calculateNetPriceResponse_element> respElem= new MAP<String,NpcserviceVARKEY.calculateNetPriceResponse_element>();
            //NpcserviceVARKEY.calculateNetPriceResponse_element resp = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            response.put('response_x', new NpcserviceVARKEY.calculateNetPriceResponse_element());
        }//Calment Start CPI changes
        else if(ob instanceof NpcserviceVARKEY_CPI.NetPriceCalculationSyncPort)
        {
            //MAP<String,NpcserviceVARKEY.calculateNetPriceResponse_element> respElem= new MAP<String,NpcserviceVARKEY.calculateNetPriceResponse_element>();
            //NpcserviceVARKEY.calculateNetPriceResponse_element resp = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            response.put('response_x', new NpcserviceVARKEY_CPI.calculateNetPriceResponse_element());
        }
        // Calment end
    }

}