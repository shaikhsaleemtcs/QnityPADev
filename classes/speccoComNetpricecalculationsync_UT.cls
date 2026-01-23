@isTest 
public class speccoComNetpricecalculationsync_UT {
    static testMethod void NetPriceCalculationSync(){
        speccoComNetpricecalculationsync spec =new speccoComNetpricecalculationsync();
        speccoComNetpricecalculationsync.NetPriceCalculationSyncPort net=new speccoComNetpricecalculationsync.NetPriceCalculationSyncPort();
        NpcserviceVARKEY_CPI.NetPriceInput npc=new NpcserviceVARKEY_CPI.NetPriceInput();
        Try
        {
            Test.startTest();
            net.NetPriceCalculationSync(npc);
            Test.Stoptest();
        }
        catch(Exception e)
        {
        } 
    }
    static testMethod void calculateNetPriceResponse_elementFuture(){
        AsyncNpcserviceVARKEY_CPI asy = new AsyncNpcserviceVARKEY_CPI();
        AsyncNpcserviceVARKEY_CPI.calculateNetPriceResponse_elementFuture cal =new AsyncNpcserviceVARKEY_CPI.calculateNetPriceResponse_elementFuture();
        Try
        {
            Test.startTest();
            NpcserviceVARKEY_CPI.NetPriceOutput apc = cal.getValue();
            Test.Stoptest();
        }
        catch(Exception e)
        {
        } 
    }
    static testMethod void beginNetPriceCalculationSync(){
        AsyncSpeccoComNetpricecalculationsync asyn =new AsyncSpeccoComNetpricecalculationsync();
        AsyncSpeccoComNetpricecalculationsync.AsyncNetPriceCalculationSyncPort asyncnet = new AsyncSpeccoComNetpricecalculationsync.AsyncNetPriceCalculationSyncPort();
        system.Continuation sys =new system.Continuation(60);
        NpcserviceVARKEY_CPI.NetPriceInput inp =new NpcserviceVARKEY_CPI.NetPriceInput();
        Try
        {
            Test.startTest();
            AsyncNpcserviceVARKEY_CPI.calculateNetPriceResponse_elementFuture asy = asyncnet.beginNetPriceCalculationSync(sys,inp);
            Test.Stoptest();
        }
        catch(Exception e)
        {
        } 
    }
}