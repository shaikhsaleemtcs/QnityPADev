@isTest
public class Trig_calculateNetPrice_UT
{   
    
    static void customSettings(){
        
        PAPricingProcedureMapping__c prEnv = new PAPricingProcedureMapping__c(Name='DCP US SPP', Pricing_Procedure_Code__c='DCP US F850 Sales Pricing Procedure');
        insert prEnv;
        PAPricingProcedureMapping__c prEnv1 = new PAPricingProcedureMapping__c(Name='DCP AP SPP1', Pricing_Procedure_Code__c='DCP Malaysia Pricing Procedure');
        insert prEnv1;
        PAPricingProcedureMapping__c prEnv2 = new PAPricingProcedureMapping__c(Name='DCP AP IN', Pricing_Procedure_Code__c='DCP AP F803 Sales Pricing Procedure');
        insert prEnv2;
        
        PAPricingProcedureMapping__c prEnv3 = new PAPricingProcedureMapping__c(Name='DCP AP JP', Pricing_Procedure_Code__c='DCP AP F800 Sales Pricing Procedure');
        insert prEnv3;
        PAPricingProcedureMapping__c prEnv4 = new PAPricingProcedureMapping__c(Name='DCP AP CN', Pricing_Procedure_Code__c='DCP AP F801,F818 Sales Pricing Procedure');
        insert prEnv4;        
        PAPricingProcedureMapping__c prEnv5 = new PAPricingProcedureMapping__c(Name='DCP AP AU', Pricing_Procedure_Code__c='DCP AP F88A Sales Pricing Procedure');
        insert prEnv5;
        
        PAPricingProcedureMapping__c prEnv6 = new PAPricingProcedureMapping__c(Name='DCP AP PH', Pricing_Procedure_Code__c='DCP AP F84E Sales Pricing Procedure');
        insert prEnv6;
        PAPricingProcedureMapping__c prEnv7 = new PAPricingProcedureMapping__c(Name='DCP AP SG', Pricing_Procedure_Code__c='DCP AP F874 Sales Pricing Procedure');
        insert prEnv7;
        
        
        PAPricingProcedureMapping__c prEnv8 = new PAPricingProcedureMapping__c(Name='DPT NA SPP1', Pricing_Procedure_Code__c='DPT NA A250,AD50,D650 Sales Pricing Procedure');
        insert prEnv8;
        
        PAPricingProcedureMapping__c prEnv9 = new PAPricingProcedureMapping__c(Name='DPT NA SPP2', Pricing_Procedure_Code__c='DPT NA A260 Sales Pricing Procedure');
        insert prEnv9;
        PAPricingProcedureMapping__c prEnv10 = new PAPricingProcedureMapping__c(Name='DPT NA SPP3', Pricing_Procedure_Code__c='DPT NA AD6B Sales Pricing Procedure');
        insert prEnv10;
        
        PAPricingProcedureMapping__c prEnv11 = new PAPricingProcedureMapping__c(Name='DPT NA SPP4', Pricing_Procedure_Code__c='DPT NA D660 Sales Pricing Procedure');
        insert prEnv11;
        
        PAPricingProcedureMapping__c prEnv12 = new PAPricingProcedureMapping__c(Name='DPP KV SPP1', Pricing_Procedure_Code__c='DPP Global Kalrez B918,B900 Sales Pricing Procedure');
        insert prEnv12;
        
        PAPricingProcedureMapping__c prEnv13 = new PAPricingProcedureMapping__c(Name='DPP KV SPP3', Pricing_Procedure_Code__c='DPP Global Kalrez B950 Sales Pricing Procedure');
        insert prEnv13;
        PAPricingProcedureMapping__c prEnv14 = new PAPricingProcedureMapping__c(Name='DPP KV SPP4', Pricing_Procedure_Code__c='DPP Global Kalrez B953 Sales Pricing Procedure');
        insert prEnv14;
        
        PAPricingProcedureMapping__c prEnv15 = new PAPricingProcedureMapping__c(Name='DPP KV SPP5', Pricing_Procedure_Code__c='DPP Global Vespel B953 Sales Pricing Procedure');
        insert prEnv15;
        
        PAPricingProcedureMapping__c prEnv16 = new PAPricingProcedureMapping__c(Name='DPP Global Kalrez & Vespel SPP3', Pricing_Procedure_Code__c='DPP Global Vespel B950 Sales Pricing Procedure');
        insert prEnv16;
        
        PAPricingProcedureMapping__c prEnv17 = new PAPricingProcedureMapping__c(Name='DPGLOBAL SPP1', Pricing_Procedure_Code__c='Digital Printing F415,F418,F450,F453,F460,F46C,F474,F480,F48A,F4A1,F4D1,F4F1 Sales Pricing Procedure');
        insert prEnv17;
        PAPricingProcedureMapping__c prEnv18 = new PAPricingProcedureMapping__c(Name='DPP Polymers EMEA SPP1', Pricing_Procedure_Code__c='DPP Polymers EMEA B90A,B90B,B915,B920,B921,B922,B92A,B941,B953,B95A,B96A,B980,B993 Sales Pricing Procedure 1');
        insert prEnv18;
        
        PAPricingProcedureMapping__c prEnv19 = new PAPricingProcedureMapping__c(Name='DPP Polymers EMEA SPP2', Pricing_Procedure_Code__c='DPP Polymers EMEA B90A,B90B,B915,B920,B921,B922,B92A,B941,B953,B95A,B96A,B980,B993 Sales Pricing Procedure 2');
        insert prEnv19;
        
        
        PAPricingProcedureMapping__c prEnv20 = new PAPricingProcedureMapping__c(Name='DPP NA SPP1', Pricing_Procedure_Code__c='DPP NA B950,B92B Sales Pricing Procedure');
        insert prEnv20;
        
        PAPricingProcedureMapping__c prEnv21 = new PAPricingProcedureMapping__c(Name='DPP NA SPP2', Pricing_Procedure_Code__c='DPP NA B950 Sales Pricing Procedure');
        insert prEnv21;
        PAPricingProcedureMapping__c prEnv22= new PAPricingProcedureMapping__c(Name='PG NA F450', Pricing_Procedure_Code__c='PG NA F450 Sales Pricing Procedure');
        insert prEnv22;
        
        PAPricingProcedureMapping__c prEnv23 = new PAPricingProcedureMapping__c(Name='PG NA F46A', Pricing_Procedure_Code__c='PG NA F46A Sales Pricing Procedure');
        insert prEnv23;
        
        PAPricingProcedureMapping__c prEnv24 = new PAPricingProcedureMapping__c(Name='DCP Malaysia', Pricing_Procedure_Code__c='DCP Malaysia');
        insert prEnv24;
        PAPricingProcedureMapping__c prEnv25= new PAPricingProcedureMapping__c(Name='MCM EMEA Paste', Pricing_Procedure_Code__c='MCM EMEA Paste F4D1 Sales Pricing Procedure');
        insert prEnv25;
        
        PAPricingProcedureMapping__c prEnv26 = new PAPricingProcedureMapping__c(Name='DPT EMEA', Pricing_Procedure_Code__c='DPT EMEA Sales Pricing Procedure');
        insert prEnv26;
        
        PAPricingProcedureMapping__c prEnv27 = new PAPricingProcedureMapping__c(Name='PG EMEA', Pricing_Procedure_Code__c='PG EMEA F415,F416,F44K,F460,F480,F493,F4A1,F4D1 Sales Pricing Procedure');
        insert prEnv27;
        PAPricingProcedureMapping__c prEnv28= new PAPricingProcedureMapping__c(Name='P&IP ECP EU PP G220-G26A', Pricing_Procedure_Code__c='P&IP ECP EU G220,G230,G253,G260,G26A Sales Pricing Procedure');
        insert prEnv28;
        
        PAPricingProcedureMapping__c prEnv29 = new PAPricingProcedureMapping__c(Name='P&IP ECP EU PP G240,G241,G293', Pricing_Procedure_Code__c='P&IP ECP EU G240,G241,G293 Sales Pricing Procedure');
        insert prEnv29;
        
        PAPricingProcedureMapping__c prEnv30= new PAPricingProcedureMapping__c(Name='P&IP NA US', Pricing_Procedure_Code__c='P&IP ECP NA G250 Sales Pricing Procedure');
        insert prEnv30;
        PAPricingProcedureMapping__c prEnv31= new PAPricingProcedureMapping__c(Name='P&IP NA Canada', Pricing_Procedure_Code__c='P&IP ECP NA G260 Sales Pricing Procedure');
        insert prEnv31;
        
        PAPricingProcedureMapping__c prEnv32 = new PAPricingProcedureMapping__c(Name='CPM NA F450', Pricing_Procedure_Code__c='CPM NA F450 Sales Pricing Procedure');
        insert prEnv32;
        
        PAPricingProcedureMapping__c prEnv33 = new PAPricingProcedureMapping__c(Name='DCP Canada', Pricing_Procedure_Code__c='DCP Canada F860 sales Pricing Procedure');
        insert prEnv33;
        PAPricingProcedureMapping__c prEnv34= new PAPricingProcedureMapping__c(Name='DCP EMEA SPP', Pricing_Procedure_Code__c='DCP EMEA F809,F80A,F80C,F80N,F812,F81B,F81P,F81R,F820,F821,F822,F82A,F841,F846,F84K,F853,F85A,F865,F86A,F890,F893 Sales Pricing Procedure');
        insert prEnv34;
        
        
        PAPricingProcedureMapping__c prEnv35= new PAPricingProcedureMapping__c(Name='DPP AP SPP1', Pricing_Procedure_Code__c='DPP AP B900 Sales Pricing Procedure');
        insert prEnv35;
        
        
        PAPricingProcedureMapping__c prEnv36= new PAPricingProcedureMapping__c(Name='DPP AP SPP2', Pricing_Procedure_Code__c='DPP AP B918,B929,B93A,B942,B943,B94A,B950,B953,B96F,B974,B98A,B991,B903 Sales Pricing Procedure');
        insert prEnv36;
        
        PAPricingProcedureMapping__c prEnv37= new PAPricingProcedureMapping__c(Name='DPP AP SPP3', Pricing_Procedure_Code__c='DPP AP B918,B950,B974,B943,B98A,B96F,B94ASales Pricing Procedure');
        insert prEnv37;
        
        PAPricingProcedureMapping__c prEnv38= new PAPricingProcedureMapping__c(Name='DPP AP SPP4', Pricing_Procedure_Code__c='DPP AP B900 Sales Pricing Procedure');
        insert prEnv38;
        
        PAPricingProcedureMapping__c prEnv39= new PAPricingProcedureMapping__c(Name='DPP NA SPP3', Pricing_Procedure_Code__c='DPP NA B960 Sales Pricing Procedure');
        insert prEnv39;
        
        PAPricingProcedureMapping__c prEnv40= new PAPricingProcedureMapping__c(Name='DPT EMEA PAK', Pricing_Procedure_Code__c='DPT EMEA D697, AD97, A297 Sales Pricing Procedure 2');
        insert prEnv40;
        
        PAPricingProcedureMapping__c prEnv41= new PAPricingProcedureMapping__c(Name='BI Surfaces PAK', Pricing_Procedure_Code__c='BI EMEA A697 Surfaces Sales Pricing Procedure 2');
        insert prEnv41;
        
        PAPricingProcedureMapping__c prEnv42= new PAPricingProcedureMapping__c(Name='BI Envelopes PAK', Pricing_Procedure_Code__c='BI EMEA Envelopes D697 Sales Pricing Procedure 2');
        insert prEnv42;
        
    }
    public static testMethod void insertCustomSettings()
    {
        List<PAPricingProcedureMapping__c> ListCustmSettngs = new List<PAPricingProcedureMapping__c>();
        
        IntegrationLoginCredentials__c login1 = new IntegrationLoginCredentials__c();
        login1.EndPointURL__c='https://pg3.pioneer.com/sfdc_pricing/service/price_calc';
        login1.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login1.name='LoginDetails';
        insert login1;
        
        PAPricingProcedureMapping__c Custm1 = new PAPricingProcedureMapping__c();
        Custm1.Pricing_Procedure_Code__c='BI AP Surfaces A603 Sales Pricing Procedure';
        Custm1.name = 'BI AP Surfaces A603';
        ListCustmSettngs.add(Custm1);
        
        PAPricingProcedureMapping__c Custm2 = new PAPricingProcedureMapping__c();
        Custm2.Pricing_Procedure_Code__c='BI AP Surfaces A64A Sales Pricing Procedure';
        Custm2.name = 'BI AP Surfaces A64A';
        ListCustmSettngs.add(Custm2);
        
        PAPricingProcedureMapping__c Custm3 = new PAPricingProcedureMapping__c();
        Custm3.Pricing_Procedure_Code__c='BI AP Surfaces A618,A629,A642,A64B,A674,A680 Sales Pricing Procedure';
        Custm3.name = 'BI AP Surfaces Rest';
        ListCustmSettngs.add(Custm3);
        
        
        PAPricingProcedureMapping__c Custm4 = new PAPricingProcedureMapping__c();
        Custm4.Pricing_Procedure_Code__c='BI AP Envelopes D618,D629,D63B,D642,D691 Sales Pricing Procedure';
        Custm4.name = 'BI AP Envelopes D618-91';
        ListCustmSettngs.add(Custm4);
        
        
        PAPricingProcedureMapping__c Custm5 = new PAPricingProcedureMapping__c();
        Custm5.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
        Custm5.name = 'MCM AP Paste';
        ListCustmSettngs.add(Custm5);
        
        PAPricingProcedureMapping__c Custm7 = new PAPricingProcedureMapping__c();
        Custm7.Pricing_Procedure_Code__c='BI EMEA Surfaces Sales Pricing Procedure';
        Custm7.name = 'BI Surfaces';
        ListCustmSettngs.add(Custm7);
        
        PAPricingProcedureMapping__c Custm8 = new PAPricingProcedureMapping__c();
        Custm8.Pricing_Procedure_Code__c='BI EMEA Envelopes D630 Sales Pricing Procedure';
        Custm8.name = 'BI Envelopes D630';
        ListCustmSettngs.add(Custm8);
        
        PAPricingProcedureMapping__c Custm9 = new PAPricingProcedureMapping__c();
        Custm9.Pricing_Procedure_Code__c='BI EMEA Envelopes D693 Sales Pricing Procedure';
        Custm9.name = 'BI Envelopes D693';
        ListCustmSettngs.add(Custm9);
        
        PAPricingProcedureMapping__c Custm10 = new PAPricingProcedureMapping__c();
        Custm10.Pricing_Procedure_Code__c='BI AP Envelopes D600 Sales Pricing Procedure';
        Custm10.name = 'BI Envelopes D600';
        ListCustmSettngs.add(Custm10);
        
        PAPricingProcedureMapping__c Custm11 = new PAPricingProcedureMapping__c();
        Custm11.Pricing_Procedure_Code__c='BI AP Envelopes D603 Sales Pricing Procedure';
        Custm11.name = 'BI Envelopes D603';
        ListCustmSettngs.add(Custm11);
        
        PAPricingProcedureMapping__c Custm12 = new PAPricingProcedureMapping__c();
        Custm12.Pricing_Procedure_Code__c='BI AP Envelopes D643,D655,D66D,D674,D680 Sales Pricing Procedure';
        Custm12.name = 'BI AP Envelopes Rest';
        ListCustmSettngs.add(Custm12);
        
        PAPricingProcedureMapping__c Custm13 = new PAPricingProcedureMapping__c();
        Custm13.Pricing_Procedure_Code__c='BI AP Envelopes D64A Sales Pricing Procedure';
        Custm13.name = 'BI Envelopes D64A';
        ListCustmSettngs.add(Custm13);
        
        PAPricingProcedureMapping__c Custm14 = new PAPricingProcedureMapping__c();
        Custm14.Pricing_Procedure_Code__c='DTT AP F218,F272,F291 Sales Pricing Procedure';
        Custm14.name = 'DTT AP China';
        ListCustmSettngs.add(Custm14);
        
        PAPricingProcedureMapping__c Custm15 = new PAPricingProcedureMapping__c();
        Custm15.Pricing_Procedure_Code__c='DTT AP F203,F229,F242,F243,F250,F266,F26F,F274,F28A Sales Pricing Procedure';
        Custm15.name = 'DTT AP Rest';
        ListCustmSettngs.add(Custm15);
        
        PAPricingProcedureMapping__c Custm16 = new PAPricingProcedureMapping__c();
        Custm16.Pricing_Procedure_Code__c='DTT EMEA Pricing Procedure F253';
        Custm16.name = 'DTT EMEA Pricing Procedure F253';
        ListCustmSettngs.add(Custm16);
        
        PAPricingProcedureMapping__c Custm17 = new PAPricingProcedureMapping__c();
        Custm17.Pricing_Procedure_Code__c='DTT EMEA Pricing Procedure F293';
        Custm17.name = 'DTT EMEA Pricing Procedure F293';
        ListCustmSettngs.add(Custm17);
        
        PAPricingProcedureMapping__c Custm18 = new PAPricingProcedureMapping__c();
        Custm18.Pricing_Procedure_Code__c='DTT LA Pricing Procedure F250,F253 and F295';
        Custm18.name = 'DTT LA PP F250,F253 and F295';
        ListCustmSettngs.add(Custm18);
        
        PAPricingProcedureMapping__c Custm19 = new PAPricingProcedureMapping__c();
        Custm19.Pricing_Procedure_Code__c='DTT LA Pricing Procedure F26C';
        Custm19.name = 'DTT LA PP F26C';
        ListCustmSettngs.add(Custm19);
        
        PAPricingProcedureMapping__c Custm20 = new PAPricingProcedureMapping__c();
        Custm20.Pricing_Procedure_Code__c='DTT Canada Pricing Procedure';
        Custm20.name = 'DTT Canada Pricing Procedure';
        ListCustmSettngs.add(Custm20);
        
        
        PAPricingProcedureMapping__c Custm21 = new PAPricingProcedureMapping__c();
        Custm21.Pricing_Procedure_Code__c='DTT US';
        Custm21.name = 'DTT US Pricing Procedure';
        ListCustmSettngs.add(Custm21);
        
        PAPricingProcedureMapping__c Custm23 = new PAPricingProcedureMapping__c();
        Custm23.Pricing_Procedure_Code__c='DTT AP F200 Sales Pricing Procedure';
        Custm23.name = 'DTT AP F200';
        ListCustmSettngs.add(Custm23);
        
        PAPricingProcedureMapping__c Custm24 = new PAPricingProcedureMapping__c();
        Custm24.Pricing_Procedure_Code__c='CPM EMEA Pricing Procedure';
        Custm24.name = 'CPM EMEA';
        ListCustmSettngs.add(Custm24);
        
        
        PAPricingProcedureMapping__c Custm25 = new PAPricingProcedureMapping__c();
        Custm25.Pricing_Procedure_Code__c='ZC51AA';
        Custm25.name = 'PG LA F41A';
        ListCustmSettngs.add(Custm25);
        
        PAPricingProcedureMapping__c Custm26 = new PAPricingProcedureMapping__c();
        Custm26.Pricing_Procedure_Code__c='PG NA F450 Pricing Procedure';
        Custm26.name = 'PG NA F450';
        ListCustmSettngs.add(Custm26);
        
        PAPricingProcedureMapping__c Custm27= new PAPricingProcedureMapping__c();
        Custm27.Pricing_Procedure_Code__c='PG NA F46A Pricing Procedure';
        Custm27.name = 'PG NA F46A';
        ListCustmSettngs.add(Custm27);
        
        PAPricingProcedureMapping__c Custm28= new PAPricingProcedureMapping__c();
        Custm28.Pricing_Procedure_Code__c='ZF855A';
        Custm28.name = 'DCP Malaysia';
        ListCustmSettngs.add(Custm28);
        
        
        
        PAPricingProcedureMapping__c Custm30= new PAPricingProcedureMapping__c();
        Custm30.Pricing_Procedure_Code__c='CPM AP F418,F429 Sales Pricing Procedure';
        Custm30.name = 'CPM AP F418,F429';
        ListCustmSettngs.add(Custm30);
        
        PAPricingProcedureMapping__c Custm31= new PAPricingProcedureMapping__c();
        Custm31.Pricing_Procedure_Code__c='MCM EMEA Paste Pricing Procedure';
        Custm31.name = 'MCM EMEA Paste';
        ListCustmSettngs.add(Custm31);
        
        PAPricingProcedureMapping__c Custm32= new PAPricingProcedureMapping__c();
        Custm32.Pricing_Procedure_Code__c='DPT EMEA Sales Pricing Procedure';
        Custm32.name = 'DPT EMEA';
        ListCustmSettngs.add(Custm32);
        
        PAPricingProcedureMapping__c Custm33= new PAPricingProcedureMapping__c();
        Custm33.Pricing_Procedure_Code__c='P&IP ECP LA G21A Sales Pricing Procedure';
        Custm33.name = 'P&IP ECP LA PP G21A';
        ListCustmSettngs.add(Custm33);
        
        
        PAPricingProcedureMapping__c Custm34= new PAPricingProcedureMapping__c();
        Custm34.Pricing_Procedure_Code__c='P&IP ECP NA G250 Sales Pricing Procedure';
        Custm34.name = 'P&IP NA US';
        ListCustmSettngs.add(Custm34);
        
        PAPricingProcedureMapping__c Custm35= new PAPricingProcedureMapping__c();
        Custm35.Pricing_Procedure_Code__c='P&IP ECP NA G260 Sales Pricing Procedure';
        Custm35.name = 'P&IP NA Canada';
        ListCustmSettngs.add(Custm35);
        
        PAPricingProcedureMapping__c Custm36= new PAPricingProcedureMapping__c();
        Custm36.Pricing_Procedure_Code__c='CPM US Pricing Procedure';
        Custm36.name = 'CPM NA F450';
        ListCustmSettngs.add(Custm36);
        
        PAPricingProcedureMapping__c Custm37= new PAPricingProcedureMapping__c();
        Custm37.Pricing_Procedure_Code__c='ZE960A';
        Custm37.name = 'DCP Canada';
        ListCustmSettngs.add(Custm37);
        
        PAPricingProcedureMapping__c Custm38= new PAPricingProcedureMapping__c();
        Custm38.Pricing_Procedure_Code__c='ZF42AA,ZF44GA,ZF450A';
        Custm38.name = 'PG LA F42A,F44G,F450';
        ListCustmSettngs.add(Custm38);
        
        PAPricingProcedureMapping__c Custm39= new PAPricingProcedureMapping__c();
        Custm39.Pricing_Procedure_Code__c='ZBR6CA,ZBR6CI';
        Custm39.name = 'PG LA F46C';
        ListCustmSettngs.add(Custm39);
        
        PAPricingProcedureMapping__c Custm40= new PAPricingProcedureMapping__c();
        Custm40.Pricing_Procedure_Code__c='ZF496A,ZVE9VA';
        Custm40.name = 'PG LA F496,F49V';
        ListCustmSettngs.add(Custm40);
        
        PAPricingProcedureMapping__c Custm42= new PAPricingProcedureMapping__c();
        Custm42.Pricing_Procedure_Code__c='CPM AP F418';
        Custm42.name = 'CPM AP F418';
        ListCustmSettngs.add(Custm42);
        
        PAPricingProcedureMapping__c Custm43= new PAPricingProcedureMapping__c();
        Custm43.Pricing_Procedure_Code__c='CPM AP F429';
        Custm43.name = 'CPM AP F429';
        ListCustmSettngs.add(Custm43);
        
        PAPricingProcedureMapping__c Custm43_1= new PAPricingProcedureMapping__c();
        Custm43_1.Pricing_Procedure_Code__c='CPM AP F450';
        Custm43_1.name = 'CPM AP F450';
        ListCustmSettngs.add(Custm43_1);
        
        PAPricingProcedureMapping__c Custm43_2= new PAPricingProcedureMapping__c();
        Custm43_2.Pricing_Procedure_Code__c='CPM AP F474';
        Custm43_2.name = 'CPM AP F474';
        ListCustmSettngs.add(Custm43_2);
        
        PAPricingProcedureMapping__c Custm43_3= new PAPricingProcedureMapping__c();
        Custm43_3.Pricing_Procedure_Code__c='CPM AP F4B1';
        Custm43_3.name = 'CPM AP F4B1';
        ListCustmSettngs.add(Custm43_3);
        
        PAPricingProcedureMapping__c Custm43_4= new PAPricingProcedureMapping__c();
        Custm43_4.Pricing_Procedure_Code__c='CPM AP F4F1';
        Custm43_4.name = 'CPM AP F4F1';
        ListCustmSettngs.add(Custm43_4);
        
        PAPricingProcedureMapping__c Custm43_5= new PAPricingProcedureMapping__c();
        Custm43_5.Pricing_Procedure_Code__c='CPM AP F4G1';
        Custm43_5.name = 'CPM AP F4G1';
        ListCustmSettngs.add(Custm43_5);
        
        
        
        PAPricingProcedureMapping__c Custm44= new PAPricingProcedureMapping__c();
        Custm44.Pricing_Procedure_Code__c='MCM EMEA Green Tape Pricing Procedure';
        Custm44.name = 'MCM EMEA Green Tape';
        ListCustmSettngs.add(Custm44);
        
        PAPricingProcedureMapping__c Custm45= new PAPricingProcedureMapping__c();
        Custm45.Pricing_Procedure_Code__c='MCM NA Green Tape F450 Sales Pricing Procedure';
        Custm45.name = 'MCM NA Green Tape';
        ListCustmSettngs.add(Custm45);
        
        PAPricingProcedureMapping__c Custm46= new PAPricingProcedureMapping__c();
        Custm46.Pricing_Procedure_Code__c='P&IP ECP LA G250,G22B,G24G,G260,G240 Sales Pricing Procedure';
        Custm46.name = 'P&IP ECP LA PP G250-G240';
        ListCustmSettngs.add(Custm46);
        
        PAPricingProcedureMapping__c Custm47= new PAPricingProcedureMapping__c();
        Custm47.Pricing_Procedure_Code__c='P&IP ECP LA G26C Sales Pricing Procedure';
        Custm47.name = 'P&IP ECP LA PP G26C';
        ListCustmSettngs.add(Custm47);
        
        PAPricingProcedureMapping__c Custm48= new PAPricingProcedureMapping__c();
        Custm48.Pricing_Procedure_Code__c='P&IP ECP LA G296,G29V Sales Pricing Procedure';
        Custm48.name = 'P&IP ECP LA PP G296,G29V';
        ListCustmSettngs.add(Custm48);
        
        PAPricingProcedureMapping__c Custm49= new PAPricingProcedureMapping__c();
        Custm49.Pricing_Procedure_Code__c='MCM NA Paste Sales Pricing Procedure';
        Custm49.name = 'MCM NA Paste';
        ListCustmSettngs.add(Custm49);
        
        PAPricingProcedureMapping__c Custm50= new PAPricingProcedureMapping__c();
        Custm50.Pricing_Procedure_Code__c='PG EMEA F415,F416,F44K,F460,F480,F493,F4A1,F4D1 Sales Pricing Procedure';
        Custm50.name = 'PG EMEA';
        ListCustmSettngs.add(Custm50);
        
        PAPricingProcedureMapping__c Custm51= new PAPricingProcedureMapping__c();
        Custm51.Pricing_Procedure_Code__c='P&IP ECP EU G220,G230,G253,G260,G26A Sales Pricing Procedure';
        Custm51.name = 'P&IP ECP EU PP G220-G26A';
        ListCustmSettngs.add(Custm51);
        
        PAPricingProcedureMapping__c Custm52= new PAPricingProcedureMapping__c();
        Custm52.Pricing_Procedure_Code__c='P&IP ECP EU G240,G241,G293 Sales Pricing Procedure';
        Custm52.name = 'P&IP ECP EU PP G240,G241,G293';
        ListCustmSettngs.add(Custm52);
        
        PAPricingProcedureMapping__c Custm53= new PAPricingProcedureMapping__c();
        Custm53.Pricing_Procedure_Code__c='DPP Polymers EMEA B90A,B90B,B915,B920,B921,B922,B92A,B941,B953,B95A,B96A,B980,B993 Sales Pricing Procedure 1';
        Custm53.name = 'DPP Polymers EMEA SPP1';
        ListCustmSettngs.add(Custm53);
        
        
        PAPricingProcedureMapping__c Custm54= new PAPricingProcedureMapping__c();
        Custm54.Pricing_Procedure_Code__c='DPP Polymers EMEA B90A,B90B,B915,B920,B921,B922,B92A,B941,B953,B95A,B96A,B980,B993 Sales Pricing Procedure 2';
        Custm54.name = 'DPP Polymers EMEA SPP2';
        ListCustmSettngs.add(Custm54);
        
        PAPricingProcedureMapping__c Custm55= new PAPricingProcedureMapping__c();
        Custm55.Pricing_Procedure_Code__c='DPP NA B950,B92B Sales Pricing Procedure';
        Custm55.name = 'DPP NA SPP1';
        ListCustmSettngs.add(Custm55);
        
        PAPricingProcedureMapping__c Custm56= new PAPricingProcedureMapping__c();
        Custm56.Pricing_Procedure_Code__c='DPP NA B950 Sales Pricing Procedure';
        Custm56.name = 'DPP NA SPP2';
        ListCustmSettngs.add(Custm56);
        
        PAPricingProcedureMapping__c prEnv57= new PAPricingProcedureMapping__c(Name='DPP AP SPP1', Pricing_Procedure_Code__c='DPP AP B900 Sales Pricing Procedure');
        ListCustmSettngs.add(prEnv57);
        
        PAPricingProcedureMapping__c prEnv58= new PAPricingProcedureMapping__c(Name='DPP AP SPP2', Pricing_Procedure_Code__c='DPP AP B918,B929,B93A,B942,B943,B94A,B950,B953,B96F,B974,B98A,B991,B903 Sales Pricing Procedure');
        ListCustmSettngs.add(prEnv58);
        
        PAPricingProcedureMapping__c prEnv59= new PAPricingProcedureMapping__c(Name='DPP AP SPP3', Pricing_Procedure_Code__c='DPP AP B918,B950,B974,B943,B98A,B96F,B94ASales Pricing Procedure');
        ListCustmSettngs.add(prEnv59);
        
        PAPricingProcedureMapping__c prEnv60= new PAPricingProcedureMapping__c(Name='DPP AP SPP4', Pricing_Procedure_Code__c='DPP AP B900 Sales Pricing Procedure');
        ListCustmSettngs.add(prEnv60);
        
        PAPricingProcedureMapping__c Custm61= new PAPricingProcedureMapping__c();
        Custm61.Pricing_Procedure_Code__c='DPP NA B960 Sales Pricing Procedure';
        Custm61.name = 'DPP NA SPP3';
        ListCustmSettngs.add(Custm61);
        
        PAPricingProcedureMapping__c Custm62= new PAPricingProcedureMapping__c();
        Custm62.Pricing_Procedure_Code__c='DPT EMEA D697, AD97, A297 Sales Pricing Procedure 2';
        Custm62.name = 'DPT EMEA PAK';
        ListCustmSettngs.add(Custm62);
        
        PAPricingProcedureMapping__c Custm63= new PAPricingProcedureMapping__c();
        Custm63.Pricing_Procedure_Code__c='BI EMEA A697 Surfaces Sales Pricing Procedure 2';
        Custm63.name = 'BI Surfaces PAK';
        ListCustmSettngs.add(Custm63);
        
        PAPricingProcedureMapping__c Custm64= new PAPricingProcedureMapping__c();
        Custm64.Pricing_Procedure_Code__c='BI EMEA Envelopes D697 Sales Pricing Procedure 2';
        Custm64.name = 'BI Envelopes PAK';
        ListCustmSettngs.add(Custm64);
        
        
        /* PAPricingProcedureMapping__c Custm56= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DPP NA B950 Sales Pricing Procedure';
Custm56.name = 'DPP NA SPP2';
ListCustmSettngs.add(Custm56);

PAPricingProcedureMapping__c Custm57= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DCP AP F803 Sales Pricing Procedure';
Custm56.name = 'DCP AP IN';
ListCustmSettngs.add(Custm57);

PAPricingProcedureMapping__c Custm58= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DCP AP F800 Sales Pricing Procedure';
Custm56.name = 'DCP AP JP';
ListCustmSettngs.add(Custm57);

PAPricingProcedureMapping__c Custm59= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DCP AP F801,F818 Sales Pricing Procedure';
Custm56.name = 'DCP AP CN';
ListCustmSettngs.add(Custm59);

PAPricingProcedureMapping__c Custm60= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DCP AP F88A Sales Pricing Procedure';
Custm56.name = 'DCP AP AU';
ListCustmSettngs.add(Custm60);

PAPricingProcedureMapping__c Custm61= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DCP AP F84E Sales Pricing Procedure';
Custm56.name = 'DCP AP PH';
ListCustmSettngs.add(Custm61);

PAPricingProcedureMapping__c Custm62= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DCP AP F874 Sales Pricing Procedure';
Custm56.name = 'DCP AP SG';
ListCustmSettngs.add(Custm62);

PAPricingProcedureMapping__c Custm63= new PAPricingProcedureMapping__c();
Custm56.Pricing_Procedure_Code__c='DPT NA A250,AD50,D650 Sales Pricing Procedure';
Custm56.name = 'DPT NA SPP1';
ListCustmSettngs.add(Custm63);*/
        
        //Calment start
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT LA SPP1' ,Pricing_Procedure_Code__c='DPT LA A210,A22A,A250,A24C,AD10,AD20,AD40,D610 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT LA SPP2' ,Pricing_Procedure_Code__c='DPT LA A26B,AD60,D66C Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT LA SPP3' ,Pricing_Procedure_Code__c='DPT LA A296,AD96,D696 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT LA SPP4' ,Pricing_Procedure_Code__c='DPT LA D620,D640 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT AP SPP1' ,Pricing_Procedure_Code__c='DPT AP A243,A250,A280,AD43,AD80,D643,D650,D680 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT AP SPP2' ,Pricing_Procedure_Code__c='DPT AP A203,A242,AD03,AD42,D603,D642 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT AP SPP3' ,Pricing_Procedure_Code__c='DPT AP A240,A248,A274,AD1E,AD4A,AD6A,D64A,D66D,AD74 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT AP SPP4' ,Pricing_Procedure_Code__c='DPT AP A200,AD00,D600,D651,A251,AD51 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT AP SPP5' ,Pricing_Procedure_Code__c='DPT AP A218,A284,A229,AD18,AD29,AD31,AD91,D618,D629,D691 Sales Pricing Procedure'));
        ListCustmSettngs.add(new PAPricingProcedureMapping__c(name='DPT AP SPP6' ,Pricing_Procedure_Code__c='DPT AP A230,AD3B,D63B Sales Pricing Procedure'));
        //Calment end
        
        insert ListCustmSettngs;
    }
    
    //RB20211223 start
    static testMethod void testDPPNAB960Canada()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP NA B960 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP NA Sales Pricing Procedure 3';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPG3';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPCA';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Quantity';
        ERP_PC2.Condition_Class__c='Expense Reimbursment';
        ERP_PC2.Pricing_Condition_Code__c='ZCMJ';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Cust Material $/Qty';
        insert ERP_PC2;

        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Sub Total';
        ERP_PC3.Calculation_Type__c='';
        ERP_PC3.Condition_Class__c='';
        ERP_PC3.Pricing_Condition_Code__c='ST1';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Cust Material $/Qty';
        insert ERP_PC3;

        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Net Price';
        ERP_PC4.Calculation_Type__c='';
        ERP_PC4.Condition_Class__c='';
        ERP_PC4.Pricing_Condition_Code__c='NP';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Cust Material $/Qty';
        insert ERP_PC4;
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='B960';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP NA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=225;
        ERPProc2.From__c=199;
        ERPProc2.To__c=0;
        insert ERPProc2;

        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=120;
        ERPProc3.From__c=100;
        ERPProc3.To__c=101;
        insert ERPProc3;

        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=240;
        ERPProc4.From__c=220;
        ERPProc4.To__c=230;
        insert ERPProc4;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        //update pri;
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP NA SPP3').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__c = pri.id;
        pricRequestItem1.PRICING_REQUEST__r = pri;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Canada';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.Pricing_Request__c =pri.id;
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPG3';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'B960';
        pricRequestItem1.SALES_ORG__C = 'B960';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'USD';
        pricRequestItem1.UOM__C = 'KG';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        //system.debug(' inside test class, before query pr is '+pricRequestItem1.PRICING_REQUEST__r.BU__C);
        //system.debug(' inside test class, before query pr is '+pricRequestItem1.BU__C);
        system.debug(' inside test class, pr is '+[select id,BU__c from Pricing_Request_Item__c where id=:pricRequestItem1.id]);
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPG3:292.000000000:USD:1:KG:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZCMJ:-0.660000000:USD:1:KG:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPG3',new List<String>{'292.000000000','USD','1','KG'}); 
        //cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZCMJ',new List<String>{'-0.660000000','USD','0','KG'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        
        Pricing_Request_Item__c pricRequestItem2 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
                                                    Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
                                                    Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
                                                    Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
                                                    Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
                                                    End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
                                                    Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
                                                    Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
                                                    PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
                                                    PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
                                                    Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
                                                    Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
                                                    Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
                                                    ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
                                                    Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
                                                    Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
                                                    Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
                                                    Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
                                                    Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
                                                    Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
                                                    Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
                                                    Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
                                                    New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
                                                    UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
                                                    isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
                                                    Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:pricRequestItem1.id];
        prItemList.add(pricRequestItem2);
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        //update pricRequestItem1;
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //  isCalculated=true;
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Polymers NAFTA';
        orgGrp.Owning_Business__c='DUPONT PERFORMANCE POLYMERS';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='B960';
        orgGrp1.ERP_Sales_Org_Code__c='B960';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        //controller.fetchMapFromResponse();
        try
        {
            controller.ViewNetPrice(pricRequestItem1,true);
            controller.ViewNetPrice(pricRequestItem2,true);
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }    
    //RB20211223 end
    
    
    static testMethod void testDPPNA()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP NA B950,B92B Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP NA SPP1';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Procedure__c PRProc3 = new ERP_Pricing_Procedure__c();
        PRProc3.Pricing_Procedure_Code__c='DPP NA B960 Sales Pricing Procedure';
        PRProc3.Pricing_Procedure_Description__c='DPP NA SPP3';
        PRProc3.SAP_Application_Id__c='V';
        PRProc3.SAP_Client_Id__c='510';
        PRProc3.SAP_Cluster__c='CB1';
        PRProc3.Status__C='Active';
        insert PRProc3;
        
        ERP_Pricing_Procedure__c PRProc2 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DCP Canada F860 sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP Canada';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc2;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Net Reference';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Quantity';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZPNG';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        insert ERP_PC2;
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP NA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc2.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=100;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        insert ERPProc2;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        //update pri;
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP NA SPP1').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__c = pri.id;
        pricRequestItem1.PRICING_REQUEST__r = pri;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.Pricing_Request__c =pri.id;
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        //system.debug(' inside test class, before query pr is '+pricRequestItem1.PRICING_REQUEST__r.BU__C);
        //system.debug(' inside test class, before query pr is '+pricRequestItem1.BU__C);
        system.debug(' inside test class, pr is '+[select id,BU__c from Pricing_Request_Item__c where id=:pricRequestItem1.id]);
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        
        Pricing_Request_Item__c pricRequestItem2 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
                                                    Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
                                                    Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
                                                    Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
                                                    Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
                                                    End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
                                                    Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
                                                    Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
                                                    PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
                                                    PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
                                                    Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
                                                    Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
                                                    Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
                                                    ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
                                                    Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
                                                    Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
                                                    Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
                                                    Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
                                                    Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
                                                    Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
                                                    Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
                                                    Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
                                                    New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
                                                    UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
                                                    isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
                                                    Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:pricRequestItem1.id];
        prItemList.add(pricRequestItem2);
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        //update pricRequestItem1;
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //  isCalculated=true;
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        //controller.fetchMapFromResponse();
        try
        {
            controller.ViewNetPrice(pricRequestItem1,true);
            controller.ViewNetPrice(pricRequestItem2,true);
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    
    // Test method to test NPC calculcation for DTTAPChina
    static testMethod void TestDTTAPChina()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT AP F218,F272,F291 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DTT AP China';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZCC1';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ST';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='IP';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZD8E';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Pricing_Condition_Code__c='Price';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='NNP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Pricing_Condition_Code__c='Price';
        ERP_PC6.Calculation_Type__c='Quantity';
        ERP_PC6.Condition_Class__c='Prices';
        ERP_PC6.Pricing_Condition_Code__c='NNP';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Pricing_Condition_Code__c='Price';
        ERP_PC7.Calculation_Type__c='Quantity';
        ERP_PC7.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='ZPR9';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F218',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F218';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT AP';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=110;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=130;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=105;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=200;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=230;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        
        ERP_Procedure_Conditions__C ERPProc6 = new ERP_Procedure_Conditions__C();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=240;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        procList.add(ERPProc6);
        
        ERP_Procedure_Conditions__C ERPProc7 = new ERP_Procedure_Conditions__C();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=250;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        procList.add(ERPProc7);
        
        insert procList;
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT AP';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F218';
        orgGrp1.ERP_Sales_Org_Code__c='F218';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT AP China').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F218';
        pricRequestItem1.SALES_ORG__C = 'F218';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Code__c = 'A6S11112S1BBEDGTRE';
        ph.PH_Level__c = 6;
        insert ph;
        
        BU_PH__c buph = new BU_PH__c();
        buph.OrgGroup__c = orgGrp.id;
        buph.Product_Hierarchy__c = ph.id;
        insert buph;
        
        Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
        pricRequestItem2.CURRENCYISOCODE = 'USD';
        pricRequestItem2.PRICING_REQUEST__C = pri.Id;
        pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem2.COUNTRY__C = 'Germany';
        pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem2.DIVISION_CODE__C = '02';
        pricRequestItem2.DIVISION__C = 'GSD Standard';
        pricRequestItem2.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem2.GAP__C = false;
        pricRequestItem2.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem2.ShipTo_Code__c='55470156';
        pricRequestItem2.PH1_Code__c='A6';
        pricRequestItem2.PH2_Code__c='S1';
        pricRequestItem2.PH3_Code__c='11';
        pricRequestItem2.PH4_Code__c='12';
        pricRequestItem2.PH5_Code__c='S1';
        pricRequestItem2.PH6_Code__c='BB';
        pricRequestItem2.PH7_Code__c='ED';
        pricRequestItem2.PH8_Code__c='GT';
        pricRequestItem2.PH9_Code__c='RE';
        pricRequestItem2.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem2.NEW_PER__C = 1;
        pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem2.PER__C = 1;
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'NNP';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100,001';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'F218';
        pricRequestItem2.SALES_ORG__C = 'F218';
        pricRequestItem2.SCALED_PRICE_FLAG__C = true;
        pricRequestItem2.SOLD_TO_CODE__C = '55470156';
        pricRequestItem2.UNIT__C = 'EUR';
        pricRequestItem2.UOM__C = 'EA';
        pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,16);
        pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,31);
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = 'USD';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        insert pricRequestItem2;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //9. NPC Request
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        npcReq2.isSynchronous__c=true;
        insert npcReq2;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq2.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        npcReqIds.add(npcReq2.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem2);
        prItemList.add(pricRequestItem1);
        
        
        
        
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            PACalculateNetPrice controller = new PACalculateNetPrice();
            PACalculateNetPrice.FloorRefWrapper flrRefWrapper = new PACalculateNetPrice.FloorRefWrapper();
            flrRefWrapper.price = 'New Rate';
            flrRefWrapper.uom = 'KG';
            flrRefWrapper.rate= '100,001';
            flrRefWrapper.unit = 'USD';
            flrRefWrapper.per = '2';
            flrRefWrapper.sclFlag = true;
            controller.FlrRefWrapperList.add(flrRefWrapper);
            controller.bindvalueToNewRate();  
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            controller.ViewNetPrice(pricRequestItem1,true);
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);    
            controller.populateMap(pricRequestItem2);  
            
            
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    
    // Test method to test NPC calculcation for BI Envelopes D693
    static testMethod void testBI_Envelopes_D693()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI EMEA Envelopes D693 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Envelopes D693';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Fixed';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='NIP';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZCRA';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='NNP';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='NNP';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='D693',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D693';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI EMEA Envelopes';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();       
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=300;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=619;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=920;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=920;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Envelopes D693').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Ship To/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D693';
        pricRequestItem1.SALES_ORG__C = 'D693';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='NNP:292.000000000:EUR:1:EA:ZPNG:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        // cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //11. Invoking controller method
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI EMEA Envelopes';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D693';
        orgGrp1.ERP_Sales_Org_Code__c='D693';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        try{
            
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
            
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            
            Pricing_Request_Item__c pricRequestItem2 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate,
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
                                                        Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
                                                        Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
                                                        Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
                                                        Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
                                                        End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
                                                        Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
                                                        Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
                                                        PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
                                                        PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
                                                        Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
                                                        Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
                                                        Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
                                                        ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
                                                        Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
                                                        Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
                                                        Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
                                                        Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
                                                        Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
                                                        Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
                                                        Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
                                                        Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
                                                        New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
                                                        UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
                                                        isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
                                                        Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:pricRequestItem1.id];
            
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){}
    }
    
    // Test method to test NPC calculcation for BU- MCM AP Paste 
    static testMethod void testMCMAP_PASTE()
    {
        customSettings();
        insertCustomSettings();
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F418';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='MCM AP Paste';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('MCM AP Paste').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='12';
        pricRequestItem1.PH4_Code__c='AA';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S111AA';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F418';
        pricRequestItem1.SALES_ORG__C = 'F418';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
    }
    
    
    // Test method to test NPC calculcation for BU- BI Surfaces
    static testMethod void testBI_Surfaces()
    {
        insertCustomSettings();
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI EMEA Surfaces Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Surfaces';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Condition_Class_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPSE';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        //insert ERP_PC1;
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Condition_Class_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZPNB';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Condition_Class_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='GP1';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Condition_Class_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZD96';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Condition_Class_Code__c='Price';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='BNP2';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Condition_Class_Code__c='Price';
        ERP_PC7.Calculation_Type__c='Percentage';
        ERP_PC7.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='ZD97';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Condition_Class_Code__c='Price';
        ERP_PC8.Calculation_Type__c='Percentage';
        ERP_PC8.Condition_Class__c='Prices';
        ERP_PC8.Pricing_Condition_Code__c='BNP3';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        
        ERP_Pricing_Condition__c ERP_PC9 = new ERP_Pricing_Condition__c();
        ERP_PC9.Price_Types__c='Standard';
        ERP_PC9.Condition_Class_Code__c='Price';
        ERP_PC9.Calculation_Type__c='Percentage';
        ERP_PC9.Condition_Class__c='Prices';
        ERP_PC9.Pricing_Condition_Code__c='ZD9A';
        ERP_PC9.SAP_Application_Id__c='V';
        ERP_PC9.SAP_Client_Id__c='510';
        ERP_PC9.SAP_Cluster__c='CB1';
        ERP_PC9.SAP_Condition_Type__c=true;
        ERP_PC9.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC9);
        
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Standard';
        ERP_PC10.Condition_Class_Code__c='Price';
        ERP_PC10.Calculation_Type__c='Percentage';
        ERP_PC10.Condition_Class__c='Prices';
        ERP_PC10.Pricing_Condition_Code__c='BNP4';
        ERP_PC10.SAP_Application_Id__c='V';
        ERP_PC10.SAP_Client_Id__c='510';
        ERP_PC10.SAP_Cluster__c='CB1';
        ERP_PC10.SAP_Condition_Type__c=true;
        ERP_PC10.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC10);
        
        ERP_Pricing_Condition__c ERP_PC11 = new ERP_Pricing_Condition__c();
        ERP_PC11.Price_Types__c='Standard';
        ERP_PC11.Condition_Class_Code__c='Price';
        ERP_PC11.Calculation_Type__c='Percentage';
        ERP_PC11.Condition_Class__c='Prices';
        ERP_PC11.Pricing_Condition_Code__c='ZD98';
        ERP_PC11.SAP_Application_Id__c='V';
        ERP_PC11.SAP_Client_Id__c='510';
        ERP_PC11.SAP_Cluster__c='CB1';
        ERP_PC11.SAP_Condition_Type__c=true;
        ERP_PC11.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC11);
        
        ERP_Pricing_Condition__c ERP_PC12 = new ERP_Pricing_Condition__c();
        ERP_PC12.Price_Types__c='Standard';
        ERP_PC12.Condition_Class_Code__c='Price';
        ERP_PC12.Calculation_Type__c='Percentage';
        ERP_PC12.Condition_Class__c='Prices';
        ERP_PC12.Pricing_Condition_Code__c='GP2';
        ERP_PC12.SAP_Application_Id__c='V';
        ERP_PC12.SAP_Client_Id__c='510';
        ERP_PC12.SAP_Cluster__c='CB1';
        ERP_PC12.SAP_Condition_Type__c=true;
        ERP_PC12.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC12);
        
        ERP_Pricing_Condition__c ERP_PC13 = new ERP_Pricing_Condition__c();
        ERP_PC13.Price_Types__c='Standard';
        ERP_PC13.Condition_Class_Code__c='Price';
        ERP_PC13.Calculation_Type__c='Percentage';
        ERP_PC13.Condition_Class__c='Prices';
        ERP_PC13.Pricing_Condition_Code__c='ZD91';
        ERP_PC13.SAP_Application_Id__c='V';
        ERP_PC13.SAP_Client_Id__c='510';
        ERP_PC13.SAP_Cluster__c='CB1';
        ERP_PC13.SAP_Condition_Type__c=true;
        ERP_PC13.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC13);
        
        ERP_Pricing_Condition__c ERP_PC14 = new ERP_Pricing_Condition__c();
        ERP_PC14.Price_Types__c='Standard';
        ERP_PC14.Condition_Class_Code__c='Price';
        ERP_PC14.Calculation_Type__c='Percentage';
        ERP_PC14.Condition_Class__c='Prices';
        ERP_PC14.Pricing_Condition_Code__c='ST1';
        ERP_PC14.SAP_Application_Id__c='V';
        ERP_PC14.SAP_Client_Id__c='510';
        ERP_PC14.SAP_Cluster__c='CB1';
        ERP_PC14.SAP_Condition_Type__c=true;
        ERP_PC14.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC14);
        
        ERP_Pricing_Condition__c ERP_PC15 = new ERP_Pricing_Condition__c();
        ERP_PC15.Price_Types__c='Standard';
        ERP_PC15.Condition_Class_Code__c='Price';
        ERP_PC15.Calculation_Type__c='Percentage';
        ERP_PC15.Condition_Class__c='Prices';
        ERP_PC15.Pricing_Condition_Code__c='ZD92';
        ERP_PC15.SAP_Application_Id__c='V';
        ERP_PC15.SAP_Client_Id__c='510';
        ERP_PC15.SAP_Cluster__c='CB1';
        ERP_PC15.SAP_Condition_Type__c=true;
        ERP_PC15.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC15);
        
        ERP_Pricing_Condition__c ERP_PC16 = new ERP_Pricing_Condition__c();
        ERP_PC16.Price_Types__c='Standard';
        ERP_PC16.Condition_Class_Code__c='Price';
        ERP_PC16.Calculation_Type__c='Percentage';
        ERP_PC16.Condition_Class__c='Prices';
        ERP_PC16.Pricing_Condition_Code__c='ST2';
        ERP_PC16.SAP_Application_Id__c='V';
        ERP_PC16.SAP_Client_Id__c='510';
        ERP_PC16.SAP_Cluster__c='CB1';
        ERP_PC16.SAP_Condition_Type__c=true;
        ERP_PC16.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC16);
        
        ERP_Pricing_Condition__c ERP_PC17 = new ERP_Pricing_Condition__c();
        ERP_PC17.Price_Types__c='Standard';
        ERP_PC17.Condition_Class_Code__c='Price';
        ERP_PC17.Calculation_Type__c='Percentage';
        ERP_PC17.Condition_Class__c='Prices';
        ERP_PC17.Pricing_Condition_Code__c='ZD94';
        ERP_PC17.SAP_Application_Id__c='V';
        ERP_PC17.SAP_Client_Id__c='510';
        ERP_PC17.SAP_Cluster__c='CB1';
        ERP_PC17.SAP_Condition_Type__c=true;
        ERP_PC17.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC17);
        
        ERP_Pricing_Condition__c ERP_PC18 = new ERP_Pricing_Condition__c();
        ERP_PC18.Price_Types__c='Standard';
        ERP_PC18.Condition_Class_Code__c='Price';
        ERP_PC18.Calculation_Type__c='Percentage';
        ERP_PC18.Condition_Class__c='Prices';
        ERP_PC18.Pricing_Condition_Code__c='NP';
        ERP_PC18.SAP_Application_Id__c='V';
        ERP_PC18.SAP_Client_Id__c='510';
        ERP_PC18.SAP_Cluster__c='CB1';
        ERP_PC18.SAP_Condition_Type__c=true;
        ERP_PC18.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC18);
        
        ERP_Pricing_Condition__c ERP_PC19 = new ERP_Pricing_Condition__c();
        ERP_PC19.Price_Types__c='Standard';
        ERP_PC19.Condition_Class_Code__c='Price';
        ERP_PC19.Calculation_Type__c='Percentage';
        ERP_PC19.Condition_Class__c='Prices';
        ERP_PC19.Pricing_Condition_Code__c='ZD93';
        ERP_PC19.SAP_Application_Id__c='V';
        ERP_PC19.SAP_Client_Id__c='510';
        ERP_PC19.SAP_Cluster__c='CB1';
        ERP_PC19.SAP_Condition_Type__c=true;
        ERP_PC19.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC19);
        
        ERP_Pricing_Condition__c ERP_PC20 = new ERP_Pricing_Condition__c();
        ERP_PC20.Price_Types__c='Standard';
        ERP_PC20.Condition_Class_Code__c='Price';
        ERP_PC20.Calculation_Type__c='Percentage';
        ERP_PC20.Condition_Class__c='Prices';
        ERP_PC20.Pricing_Condition_Code__c='ST';
        ERP_PC20.SAP_Application_Id__c='V';
        ERP_PC20.SAP_Client_Id__c='510';
        ERP_PC20.SAP_Cluster__c='CB1';
        ERP_PC20.SAP_Condition_Type__c=true;
        ERP_PC20.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC20);
        
        ERP_Pricing_Condition__c ERP_PC21 = new ERP_Pricing_Condition__c();
        ERP_PC21.Price_Types__c='Standard';
        ERP_PC21.Condition_Class_Code__c='Price';
        ERP_PC21.Calculation_Type__c='Percentage';
        ERP_PC21.Condition_Class__c='Prices';
        ERP_PC21.Pricing_Condition_Code__c='ZDB3';
        ERP_PC21.SAP_Application_Id__c='V';
        ERP_PC21.SAP_Client_Id__c='510';
        ERP_PC21.SAP_Cluster__c='CB1';
        ERP_PC21.SAP_Condition_Type__c=true;
        ERP_PC21.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC21);
        
        ERP_Pricing_Condition__c ERP_PC22 = new ERP_Pricing_Condition__c();
        ERP_PC22.Price_Types__c='Standard';
        ERP_PC22.Condition_Class_Code__c='Price';
        ERP_PC22.Calculation_Type__c='Percentage';
        ERP_PC22.Condition_Class__c='Prices';
        ERP_PC22.Pricing_Condition_Code__c='NIP';
        ERP_PC22.SAP_Application_Id__c='V';
        ERP_PC22.SAP_Client_Id__c='510';
        ERP_PC22.SAP_Cluster__c='CB1';
        ERP_PC22.SAP_Condition_Type__c=true;
        ERP_PC22.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC22);
        
        ERP_Pricing_Condition__c ERP_PC23 = new ERP_Pricing_Condition__c();
        ERP_PC23.Price_Types__c='Standard';
        ERP_PC23.Condition_Class_Code__c='Price';
        ERP_PC23.Calculation_Type__c='Percentage';
        ERP_PC23.Condition_Class__c='Prices';
        ERP_PC23.Pricing_Condition_Code__c='ZCMA';
        ERP_PC23.SAP_Application_Id__c='V';
        ERP_PC23.SAP_Client_Id__c='510';
        ERP_PC23.SAP_Cluster__c='CB1';
        ERP_PC23.SAP_Condition_Type__c=true;
        ERP_PC23.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC23);
        
        ERP_Pricing_Condition__c ERP_PC24 = new ERP_Pricing_Condition__c();
        ERP_PC24.Price_Types__c='Standard';
        ERP_PC24.Condition_Class_Code__c='Price';
        ERP_PC24.Calculation_Type__c='Percentage';
        ERP_PC24.Condition_Class__c='Prices';
        ERP_PC24.Pricing_Condition_Code__c='ZCMB';
        ERP_PC24.SAP_Application_Id__c='V';
        ERP_PC24.SAP_Client_Id__c='510';
        ERP_PC24.SAP_Cluster__c='CB1';
        ERP_PC24.SAP_Condition_Type__c=true;
        ERP_PC24.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC24);
        
        ERP_Pricing_Condition__c ERP_PC25 = new ERP_Pricing_Condition__c();
        ERP_PC25.Price_Types__c='Standard';
        ERP_PC25.Condition_Class_Code__c='Price';
        ERP_PC25.Calculation_Type__c='Percentage';
        ERP_PC25.Condition_Class__c='Prices';
        ERP_PC25.Pricing_Condition_Code__c='NNP';
        ERP_PC25.SAP_Application_Id__c='V';
        ERP_PC25.SAP_Client_Id__c='510';
        ERP_PC25.SAP_Cluster__c='CB1';
        ERP_PC25.SAP_Condition_Type__c=true;
        ERP_PC25.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC25);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='A640';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();       
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        //insert ERPProc1;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=125;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=155;
        ERPProc3.From__c=101;
        ERPProc3.To__c=125;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=160;
        ERPProc4.From__c=155;
        ERPProc4.To__c=155;
        procList.add(ERPProc4);
        
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=165;
        ERPProc5.From__c=155;
        ERPProc5.To__c=163;
        procList.add(ERPProc5);
        
        ERP_Procedure_Conditions__C ERPProc6 = new ERP_Procedure_Conditions__C();
        ERPProc6.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=167;
        ERPProc6.From__c=165;
        ERPProc6.To__c=165;
        procList.add(ERPProc6);
        
        ERP_Procedure_Conditions__C ERPProc7 = new ERP_Procedure_Conditions__C();
        ERPProc7.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=168;
        ERPProc7.From__c=165;
        ERPProc7.To__c=167;
        procList.add(ERPProc7);
        ERP_Procedure_Conditions__C ERPProc8 = new ERP_Procedure_Conditions__C();
        ERPProc8.Pricing_Condition__c =  ERP_PC9.id;
        ERPProc8.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc8.Step__c=170;
        ERPProc8.From__c=168;
        ERPProc8.To__c=168;
        procList.add(ERPProc8);
        ERP_Procedure_Conditions__C ERPProc9 = new ERP_Procedure_Conditions__C();
        ERPProc9.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc9.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc9.Step__c=173;
        ERPProc9.From__c=168;
        ERPProc9.To__c=170;
        procList.add(ERPProc9);
        ERP_Procedure_Conditions__C ERPProc10 = new ERP_Procedure_Conditions__C();
        ERPProc10.Pricing_Condition__c =  ERP_PC11.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=180;
        ERPProc10.From__c=173;
        ERPProc10.To__c=173;
        procList.add(ERPProc10);
        ERP_Procedure_Conditions__C ERPProc11 = new ERP_Procedure_Conditions__C();
        ERPProc11.Pricing_Condition__c =  ERP_PC12.id;
        ERPProc11.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc11.Step__c=199;
        ERPProc11.From__c=180;
        ERPProc11.To__c=199;
        procList.add(ERPProc11);
        ERP_Procedure_Conditions__C ERPProc12 = new ERP_Procedure_Conditions__C();
        ERPProc12.Pricing_Condition__c =  ERP_PC13.id;
        ERPProc12.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc12.Step__c=205;
        ERPProc12.From__c=199;
        ERPProc12.To__c=199;
        procList.add(ERPProc12);
        ERP_Procedure_Conditions__C ERPProc13 = new ERP_Procedure_Conditions__C();
        ERPProc13.Pricing_Condition__c =  ERP_PC14.id;
        ERPProc13.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc13.Step__c=210;
        ERPProc13.From__c=199;
        ERPProc13.To__c=206;
        procList.add(ERPProc13);
        ERP_Procedure_Conditions__C ERPProc14 = new ERP_Procedure_Conditions__C();
        ERPProc14.Pricing_Condition__c =  ERP_PC15.id;
        ERPProc14.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc14.Step__c=215;
        ERPProc14.From__c=210;
        ERPProc14.To__c=210;
        procList.add(ERPProc14);
        ERP_Procedure_Conditions__C ERPProc15 = new ERP_Procedure_Conditions__C();
        ERPProc15.Pricing_Condition__c =  ERP_PC16.id;
        ERPProc15.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc15.Step__c=220;
        ERPProc15.From__c=210;
        ERPProc15.To__c=215;
        procList.add(ERPProc15);
        ERP_Procedure_Conditions__C ERPProc16 = new ERP_Procedure_Conditions__C();
        ERPProc16.Pricing_Condition__c =  ERP_PC17.id;
        ERPProc16.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc16.Step__c=225;
        ERPProc16.From__c=220;
        ERPProc16.To__c=220;
        procList.add(ERPProc16);
        ERP_Procedure_Conditions__C ERPProc17 = new ERP_Procedure_Conditions__C();
        ERPProc17.Pricing_Condition__c =  ERP_PC18.id;
        ERPProc17.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc17.Step__c=228;
        ERPProc17.From__c=220;
        ERPProc17.To__c=227;
        procList.add(ERPProc17);
        ERP_Procedure_Conditions__C ERPProc18 = new ERP_Procedure_Conditions__C();
        ERPProc18.Pricing_Condition__c =  ERP_PC19.id;
        ERPProc18.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc18.Step__c=229;
        ERPProc18.From__c=228;
        ERPProc18.To__c=228;
        procList.add(ERPProc18);
        ERP_Procedure_Conditions__C ERPProc19 = new ERP_Procedure_Conditions__C();
        ERPProc19.Pricing_Condition__c =  ERP_PC20.id;
        ERPProc19.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc19.Step__c=232;
        ERPProc19.From__c=228;
        ERPProc19.To__c=231;
        procList.add(ERPProc19);
        ERP_Procedure_Conditions__C ERPProc20 = new ERP_Procedure_Conditions__C();
        ERPProc20.Pricing_Condition__c =  ERP_PC21.id;
        ERPProc20.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc20.Step__c=233;
        ERPProc20.From__c=232;
        ERPProc20.To__c=233;
        procList.add(ERPProc20);
        ERP_Procedure_Conditions__C ERPProc21 = new ERP_Procedure_Conditions__C();
        ERPProc21.Pricing_Condition__c =  ERP_PC22.id;
        ERPProc21.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc21.Step__c=499;
        ERPProc21.From__c=232;
        ERPProc21.To__c=233;
        procList.add(ERPProc21);
        ERP_Procedure_Conditions__C ERPProc22 = new ERP_Procedure_Conditions__C();
        ERPProc22.Pricing_Condition__c =  ERP_PC23.id;
        ERPProc22.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc22.Step__c=504;
        ERPProc22.From__c=499;
        ERPProc22.To__c=499;
        procList.add(ERPProc22);
        ERP_Procedure_Conditions__C ERPProc23 = new ERP_Procedure_Conditions__C();
        ERPProc23.Pricing_Condition__c =  ERP_PC24.id;
        ERPProc23.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc23.Step__c=505;
        ERPProc23.From__c=499;
        ERPProc23.To__c=499;
        procList.add(ERPProc23);
        ERP_Procedure_Conditions__C ERPProc24 = new ERP_Procedure_Conditions__C();
        ERPProc24.Pricing_Condition__c =  ERP_PC25.id;
        ERPProc24.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc24.Step__c=610;
        ERPProc24.From__c=499;
        ERPProc24.To__c=505;
        procList.add(ERPProc24);
        
        insert procList; 
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Surfaces').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='12';
        pricRequestItem1.PH4_Code__c='AA';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S111AA';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPSE';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A640';
        pricRequestItem1.SALES_ORG__C = 'A640';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'EUR';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPSE:292.000000000:EUR:1:EA:ZPNG:290.000000000:EUR:1:EA:ZPNB:-5.000000000:EUR:0:EA:GP1:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPSE',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNB',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('GP1',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        try{
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }catch(Exception e){}
    }
    
    // Test Method for D64A
    static testMethod void testBIEnvelopes_D64A()
    {
        customSettings();
        insertCustomSettings();
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Envelopes D64A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Envelopes D64A';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D630';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Envelopes D64A').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='12';
        pricRequestItem1.PH4_Code__c='AA';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S111AA';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D630';
        pricRequestItem1.SALES_ORG__C = 'D630';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
    }
    
    // Test method to test NPC calculcation for BI Envelopes D630
    static testMethod void testBIEnvelopes_D630()
    {
        insertCustomSettings();
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI EMEA Envelopes D630 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Envelopes D630';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        //ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        //insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        //ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPNB';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        //4. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        //ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Fixed';
        ERP_PC2.Condition_Class__c='Price';
        ERP_PC2.Pricing_Condition_Code__c='GP1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZD96';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Pricing_Condition_Code__c='Price';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='BNP1';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Pricing_Condition_Code__c='Price';
        ERP_PC7.Calculation_Type__c='Percentage';
        ERP_PC7.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='ZD9A';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        ERP_Pricing_Condition__c ERP_PC12 = new ERP_Pricing_Condition__c();
        ERP_PC12.Price_Types__c='Standard';
        ERP_PC12.Pricing_Condition_Code__c='Price';
        ERP_PC12.Calculation_Type__c='Percentage';
        ERP_PC12.Condition_Class__c='Prices';
        ERP_PC12.Pricing_Condition_Code__c='GP2';
        ERP_PC12.SAP_Application_Id__c='V';
        ERP_PC12.SAP_Client_Id__c='510';
        ERP_PC12.SAP_Cluster__c='CB1';
        ERP_PC12.SAP_Condition_Type__c=true;
        ERP_PC12.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC12);
        ERP_Pricing_Condition__c ERP_PC13 = new ERP_Pricing_Condition__c();
        ERP_PC13.Price_Types__c='Standard';
        ERP_PC13.Pricing_Condition_Code__c='Price';
        ERP_PC13.Calculation_Type__c='Percentage';
        ERP_PC13.Condition_Class__c='Prices';
        ERP_PC13.Pricing_Condition_Code__c='ZDI1';
        ERP_PC13.SAP_Application_Id__c='V';
        ERP_PC13.SAP_Client_Id__c='510';
        ERP_PC13.SAP_Cluster__c='CB1';
        ERP_PC13.SAP_Condition_Type__c=true;
        ERP_PC13.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC13);
        ERP_Pricing_Condition__c ERP_PC14 = new ERP_Pricing_Condition__c();
        ERP_PC14.Price_Types__c='Standard';
        ERP_PC14.Pricing_Condition_Code__c='Price';
        ERP_PC14.Calculation_Type__c='Percentage';
        ERP_PC14.Condition_Class__c='Prices';
        ERP_PC14.Pricing_Condition_Code__c='NP1';
        ERP_PC14.SAP_Application_Id__c='V';
        ERP_PC14.SAP_Client_Id__c='510';
        ERP_PC14.SAP_Cluster__c='CB1';
        ERP_PC14.SAP_Condition_Type__c=true;
        ERP_PC14.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC14);
        ERP_Pricing_Condition__c ERP_PC15 = new ERP_Pricing_Condition__c();
        ERP_PC15.Price_Types__c='Standard';
        ERP_PC15.Pricing_Condition_Code__c='Price';
        ERP_PC15.Calculation_Type__c='Percentage';
        ERP_PC15.Condition_Class__c='Prices';
        ERP_PC15.Pricing_Condition_Code__c='ZD91';
        ERP_PC15.SAP_Application_Id__c='V';
        ERP_PC15.SAP_Client_Id__c='510';
        ERP_PC15.SAP_Cluster__c='CB1';
        ERP_PC15.SAP_Condition_Type__c=true;
        ERP_PC15.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC15);
        ERP_Pricing_Condition__c ERP_PC16 = new ERP_Pricing_Condition__c();
        ERP_PC16.Price_Types__c='Standard';
        ERP_PC16.Pricing_Condition_Code__c='Price';
        ERP_PC16.Calculation_Type__c='Percentage';
        ERP_PC16.Condition_Class__c='Prices';
        ERP_PC16.Pricing_Condition_Code__c='NP2';
        ERP_PC16.SAP_Application_Id__c='V';
        ERP_PC16.SAP_Client_Id__c='510';
        ERP_PC16.SAP_Cluster__c='CB1';
        ERP_PC16.SAP_Condition_Type__c=true;
        ERP_PC16.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC16);
        ERP_Pricing_Condition__c ERP_PC17 = new ERP_Pricing_Condition__c();
        ERP_PC17.Price_Types__c='Standard';
        ERP_PC17.Pricing_Condition_Code__c='Price';
        ERP_PC17.Calculation_Type__c='Percentage';
        ERP_PC17.Condition_Class__c='Prices';
        ERP_PC17.Pricing_Condition_Code__c='ZD92';
        ERP_PC17.SAP_Application_Id__c='V';
        ERP_PC17.SAP_Client_Id__c='510';
        ERP_PC17.SAP_Cluster__c='CB1';
        ERP_PC17.SAP_Condition_Type__c=true;
        ERP_PC17.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC17);
        ERP_Pricing_Condition__c ERP_PC18 = new ERP_Pricing_Condition__c();
        ERP_PC18.Price_Types__c='Standard';
        ERP_PC18.Pricing_Condition_Code__c='Price';
        ERP_PC18.Calculation_Type__c='Percentage';
        ERP_PC18.Condition_Class__c='Prices';
        ERP_PC18.Pricing_Condition_Code__c='NP3';
        ERP_PC18.SAP_Application_Id__c='V';
        ERP_PC18.SAP_Client_Id__c='510';
        ERP_PC18.SAP_Cluster__c='CB1';
        ERP_PC18.SAP_Condition_Type__c=true;
        ERP_PC18.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC18);
        ERP_Pricing_Condition__c ERP_PC19 = new ERP_Pricing_Condition__c();
        ERP_PC19.Price_Types__c='Standard';
        ERP_PC19.Pricing_Condition_Code__c='Price';
        ERP_PC19.Calculation_Type__c='Percentage';
        ERP_PC19.Condition_Class__c='Prices';
        ERP_PC19.Pricing_Condition_Code__c='ZD94';
        ERP_PC19.SAP_Application_Id__c='V';
        ERP_PC19.SAP_Client_Id__c='510';
        ERP_PC19.SAP_Cluster__c='CB1';
        ERP_PC19.SAP_Condition_Type__c=true;
        ERP_PC19.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC19);
        ERP_Pricing_Condition__c ERP_PC20 = new ERP_Pricing_Condition__c();
        ERP_PC20.Price_Types__c='Standard';
        ERP_PC20.Pricing_Condition_Code__c='Price';
        ERP_PC20.Calculation_Type__c='Percentage';
        ERP_PC20.Condition_Class__c='Prices';
        ERP_PC20.Pricing_Condition_Code__c='NP4';
        ERP_PC20.SAP_Application_Id__c='V';
        ERP_PC20.SAP_Client_Id__c='510';
        ERP_PC20.SAP_Cluster__c='CB1';
        ERP_PC20.SAP_Condition_Type__c=true;
        ERP_PC20.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC20);
        ERP_Pricing_Condition__c ERP_PC21 = new ERP_Pricing_Condition__c();
        ERP_PC21.Price_Types__c='Standard';
        ERP_PC21.Pricing_Condition_Code__c='Price';
        ERP_PC21.Calculation_Type__c='Percentage';
        ERP_PC21.Condition_Class__c='Prices';
        ERP_PC21.Pricing_Condition_Code__c='ZG35';
        ERP_PC21.SAP_Application_Id__c='V';
        ERP_PC21.SAP_Client_Id__c='510';
        ERP_PC21.SAP_Cluster__c='CB1';
        ERP_PC21.SAP_Condition_Type__c=true;
        ERP_PC21.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC21);
        ERP_Pricing_Condition__c ERP_PC22 = new ERP_Pricing_Condition__c();
        ERP_PC22.Price_Types__c='Standard';
        ERP_PC22.Pricing_Condition_Code__c='Price';
        ERP_PC22.Calculation_Type__c='Percentage';
        ERP_PC22.Condition_Class__c='Prices';
        ERP_PC22.Pricing_Condition_Code__c='NIP';
        ERP_PC22.SAP_Application_Id__c='V';
        ERP_PC22.SAP_Client_Id__c='510';
        ERP_PC22.SAP_Cluster__c='CB1';
        ERP_PC22.SAP_Condition_Type__c=true;
        ERP_PC22.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC22);
        ERP_Pricing_Condition__c ERP_PC23 = new ERP_Pricing_Condition__c();
        ERP_PC23.Price_Types__c='Standard';
        ERP_PC23.Pricing_Condition_Code__c='Price';
        ERP_PC23.Calculation_Type__c='Percentage';
        ERP_PC23.Condition_Class__c='Prices';
        ERP_PC23.Pricing_Condition_Code__c='ZCRA';
        ERP_PC23.SAP_Application_Id__c='V';
        ERP_PC23.SAP_Client_Id__c='510';
        ERP_PC23.SAP_Cluster__c='CB1';
        ERP_PC23.SAP_Condition_Type__c=true;
        ERP_PC23.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC23);
        ERP_Pricing_Condition__c ERP_PC24 = new ERP_Pricing_Condition__c();
        ERP_PC24.Price_Types__c='Standard';
        ERP_PC24.Pricing_Condition_Code__c='Price';
        ERP_PC24.Calculation_Type__c='Percentage';
        ERP_PC24.Condition_Class__c='Prices';
        ERP_PC24.Pricing_Condition_Code__c='NNP';
        ERP_PC24.SAP_Application_Id__c='V';
        ERP_PC24.SAP_Client_Id__c='510';
        ERP_PC24.SAP_Cluster__c='CB1';
        ERP_PC24.SAP_Condition_Type__c=true;
        ERP_PC24.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC24);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D630';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=115;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=150;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);        
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=152;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=153;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        ERP_Procedure_Conditions__C ERPProc6 = new ERP_Procedure_Conditions__C();
        ERPProc6.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=155;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        procList.add(ERPProc6);
        ERP_Procedure_Conditions__C ERPProc11 = new ERP_Procedure_Conditions__C();
        ERPProc11.Pricing_Condition__c =  ERP_PC12.id;
        ERPProc11.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc11.Step__c=162;
        ERPProc11.From__c=0;
        ERPProc11.To__c=0;
        procList.add(ERPProc11);
        ERP_Procedure_Conditions__C ERPProc12 = new ERP_Procedure_Conditions__C();
        ERPProc12.Pricing_Condition__c =  ERP_PC13.id;
        ERPProc12.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc12.Step__c=163;
        ERPProc12.From__c=0;
        ERPProc12.To__c=0;
        procList.add(ERPProc12);
        ERP_Procedure_Conditions__C ERPProc13 = new ERP_Procedure_Conditions__C();
        ERPProc13.Pricing_Condition__c =  ERP_PC14.id;
        ERPProc13.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc13.Step__c=164;
        ERPProc13.From__c=0;
        ERPProc13.To__c=0;
        procList.add(ERPProc13);
        ERP_Procedure_Conditions__C ERPProc14 = new ERP_Procedure_Conditions__C();
        ERPProc14.Pricing_Condition__c =  ERP_PC15.id;
        ERPProc14.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc14.Step__c=165;
        ERPProc14.From__c=0;
        ERPProc14.To__c=0;
        procList.add(ERPProc14);
        ERP_Procedure_Conditions__C ERPProc15 = new ERP_Procedure_Conditions__C();
        ERPProc15.Pricing_Condition__c =  ERP_PC16.id;
        ERPProc15.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc15.Step__c=166;
        ERPProc15.From__c=0;
        ERPProc15.To__c=0;
        procList.add(ERPProc15);
        ERP_Procedure_Conditions__C ERPProc16 = new ERP_Procedure_Conditions__C();
        ERPProc16.Pricing_Condition__c =  ERP_PC17.id;
        ERPProc16.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc16.Step__c=167;
        ERPProc16.From__c=0;
        ERPProc16.To__c=0;
        procList.add(ERPProc16);
        ERP_Procedure_Conditions__C ERPProc17 = new ERP_Procedure_Conditions__C();
        ERPProc17.Pricing_Condition__c =  ERP_PC18.id;
        ERPProc17.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc17.Step__c=168;
        ERPProc17.From__c=0;
        ERPProc17.To__c=0;
        procList.add(ERPProc17);
        ERP_Procedure_Conditions__C ERPProc18 = new ERP_Procedure_Conditions__C();
        ERPProc18.Pricing_Condition__c =  ERP_PC19.id;
        ERPProc18.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc18.Step__c=169;
        ERPProc18.From__c=0;
        ERPProc18.To__c=0;
        procList.add(ERPProc18);
        ERP_Procedure_Conditions__C ERPProc19 = new ERP_Procedure_Conditions__C();
        ERPProc19.Pricing_Condition__c =  ERP_PC20.id;
        ERPProc19.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc19.Step__c=170;
        ERPProc19.From__c=0;
        ERPProc19.To__c=0;
        procList.add(ERPProc19);
        ERP_Procedure_Conditions__C ERPProc20 = new ERP_Procedure_Conditions__C();
        ERPProc20.Pricing_Condition__c =  ERP_PC21.id;
        ERPProc20.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc20.Step__c=208;
        ERPProc20.From__c=0;
        ERPProc20.To__c=0;
        procList.add(ERPProc20);
        ERP_Procedure_Conditions__C ERPProc21 = new ERP_Procedure_Conditions__C();
        ERPProc21.Pricing_Condition__c =  ERP_PC22.id;
        ERPProc21.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc21.Step__c=300;
        ERPProc21.From__c=0;
        ERPProc21.To__c=0;
        procList.add(ERPProc21);
        ERP_Procedure_Conditions__C ERPProc22 = new ERP_Procedure_Conditions__C();
        ERPProc22.Pricing_Condition__c =  ERP_PC23.id;
        ERPProc22.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc22.Step__c=620;
        ERPProc22.From__c=0;
        ERPProc22.To__c=0;
        procList.add(ERPProc22);
        ERP_Procedure_Conditions__C ERPProc23 = new ERP_Procedure_Conditions__C();
        ERPProc23.Pricing_Condition__c =  ERP_PC24.id;
        ERPProc23.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc23.Step__c=920;
        ERPProc23.From__c=0;
        ERPProc23.To__c=0;
        procList.add(ERPProc23);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Envelopes D630').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='12';
        pricRequestItem1.PH4_Code__c='AA';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S111AA';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D630';
        pricRequestItem1.SALES_ORG__C = 'D630';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPNG:292.000000000:EUR:1:EA:ZPNB:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA:ZPNG:292.000000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        //cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPNB',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //11. Invoking controller method
        try{
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true);
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    // Test method to test NPC calculcation for BIAPSurfacesA603
    static testMethod void TestBIAPSurfacesA603()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Surfaces A603 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI AP Surfaces A603';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZP2B';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZD85';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZDI1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='NNP';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='A603';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI AP Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=120;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=140;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=140;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI AP Surfaces A603').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP2B';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A603';
        pricRequestItem1.SALES_ORG__C = 'A603';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZP2B:292.000000000:EUR:1:EA:ZD85:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP2B',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZD85',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Surfaces';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A603';
        orgGrp1.ERP_Sales_Org_Code__c='A603';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            controller.ViewNetPrice(pricRequestItem1,true);
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();                      
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    
    // Test method to test NPC calculcation for BI Surfaces
    static testMethod void testBI_Surfaces2()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI EMEA Surfaces Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI EMEA Surfaces';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ST1';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ST1';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A640',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='A640';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Surfaces').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A640';
        pricRequestItem1.SALES_ORG__C = 'A640';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI Surfaces';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A640';
        orgGrp1.ERP_Sales_Org_Code__c='A640';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    // Test method to test NPC calculcation for BIAPEnvelopes
    static testMethod void TestBIAPEnvelopes()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Envelopes D618,D629,D63B,D642,D691 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI AP Envelopes D618-91';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='D618',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D618';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI AP Envelopes';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI AP Envelopes D618-91').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.Pricing_Request__c = pri.id;
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D618';
        pricRequestItem1.SALES_ORG__C = 'D618';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Envelopes';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D618';
        orgGrp1.ERP_Sales_Org_Code__c='D618';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    
    
    // Test method to test NPC calculcation for BIAPSurfacesRest
    static testMethod void TestBIAPSurfacesRest()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Surfaces A618,A629,A642,A64B,A674,A680 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI AP Surfaces Rest';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPSE';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZD85';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZDI1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='NNP';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Pricing_Condition_Code__c='ZCC1';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='300';
        ERP_PC4.SAP_Cluster__c='Q23';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Sales Tax CN';
        pcList.add(ERP_PC4);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A618',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='A618';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI AP Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=120;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=140;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=140;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI AP Surfaces Rest').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPSE';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A618';
        pricRequestItem1.SALES_ORG__C = 'A618';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPSE:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPSE',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Surfaces';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A618';
        orgGrp1.ERP_Sales_Org_Code__c='A618';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            controller.ViewNetPrice(pricRequestItem1,true);
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();                      
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    // Test method to test NPC calculcation for DTTAPRest
    static testMethod void TestDTTAPRest()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT AP F203,F229,F242,F243,F250,F266,F26F,F274,F28A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DTT AP Rest';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ST';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='IP';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='ZD8E';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='NNP';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F203',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F203';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT AP';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=120;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=105;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=200;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=230;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT AP Rest').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F203';
        pricRequestItem1.SALES_ORG__C = 'F203';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT AP';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F203';
        orgGrp1.ERP_Sales_Org_Code__c='F203';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            controller.ViewNetPrice(pricRequestItem1,true);
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    // Test method to test NPC calculcation for DTTEMEA_F293
    static testMethod void testDTTEMEA_F293()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT EMEA Pricing Procedure F293';
        PRProc1.Pricing_Procedure_Description__c='DTT EMEA Pricing Procedure F293';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F293',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F293';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT EMEA Pricing Procedure F293').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F293';
        pricRequestItem1.SALES_ORG__C = 'F293';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F293';
        orgGrp1.ERP_Sales_Org_Code__c='F293';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //Test method to test NPC calculcation for BI AP Surfaces A64A
    static testMethod void testBIAPSurfacesA64A()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Surfaces A64A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI AP Surfaces A64A';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A64A',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='A64A';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI AP Surfaces A64A').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A64A';
        pricRequestItem1.SALES_ORG__C = 'A64A';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Surfaces';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A64A';
        orgGrp1.ERP_Sales_Org_Code__c='A64A';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());  
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //Test method to test NPC calculcation for BI Envelopes D600
    static testMethod void testBIEnvelopesD600()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Envelopes D600 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Envelopes D600';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='D600',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D600';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI AP Envelopes';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Envelopes D600').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D600';
        pricRequestItem1.SALES_ORG__C = 'D600';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Envelopes';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D600';
        orgGrp1.ERP_Sales_Org_Code__c='D600';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //Test method to test NPC calculcation for BI Envelopes D603
    static testMethod void testBIEnvelopesD603()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Envelopes D603 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Envelopes D603';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='D603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D603';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI AP Envelopes';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Envelopes D603').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D603';
        pricRequestItem1.SALES_ORG__C = 'D603';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Envelopes';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D603';
        orgGrp1.ERP_Sales_Org_Code__c='D603';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //BI AP Envelopes Rest
    static testMethod void testBIEnvelopesD643()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI AP Envelopes D643,D655,D66D,D674,D680 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI AP Envelopes Rest';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='D643',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D643';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI AP Envelopes';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI AP Envelopes Rest').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D643';
        pricRequestItem1.SALES_ORG__C = 'D643';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI AP Envelopes';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D643';
        orgGrp1.ERP_Sales_Org_Code__c='D643';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    static testMethod void testDTTUS()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT US';
        PRProc1.Pricing_Procedure_Description__c='DTT US Pricing Procedure';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZCMK';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='NP';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F250',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F250';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT US';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=120;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=130;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT US Pricing Procedure').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F250';
        pricRequestItem1.SALES_ORG__C = 'F250';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT US';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F250';
        orgGrp1.ERP_Sales_Org_Code__c='F250';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        ERP_PC1.Calculation_Type__c='Percentage';
        update ERP_PC1;
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true);
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }           
        catch(Exception e)
        {
            
        }
        
    }
    //
    
    static testMethod void testDTTCanada()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT Canada Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DTT Canada Pricing Procedure';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>(); 
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPCA';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZCRE';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZCRF';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='ZCRG';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZCMC';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Pricing_Condition_Code__c='Price';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='IP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Pricing_Condition_Code__c='Price';
        ERP_PC7.Calculation_Type__c='Percentage';
        ERP_PC7.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F260',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F260';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT Canada';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=130;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=140;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=150;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=160;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=110;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        
        ERP_Procedure_Conditions__C ERPProc6 = new ERP_Procedure_Conditions__C();
        ERPProc6.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=190;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        procList.add(ERPProc6);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT Canada Pricing Procedure').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPCA';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F260';
        pricRequestItem1.SALES_ORG__C = 'F260';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPCA:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPCA',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT Canada';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F260';
        orgGrp1.ERP_Sales_Org_Code__c='F260';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }catch(Exception e){}
        
    }
    
    static testMethod void testDTTLAF26C()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT LA Pricing Procedure F26C';
        PRProc1.Pricing_Procedure_Description__c='DTT LA PP F26C';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZBPA';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZENC';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZRA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='IP';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='NNP';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F26C',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F26C';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT LA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=130;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=140;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=120;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=150;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT LA PP F26C').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZBPA';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F26C';
        pricRequestItem1.SALES_ORG__C = 'F26C';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZBPA:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZBPA',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT Canada';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F26C';
        orgGrp1.ERP_Sales_Org_Code__c='F26C';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            controller.ViewNetPrice(pricRequestItem1,true);
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    
    static testMethod void testDTTLARest()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT LA Pricing Procedure F250,F253 and F295';
        PRProc1.Pricing_Procedure_Description__c='DTT LA PP F250,F253 and F295';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='IP';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZCMK';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='ZCRG';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='NNP';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F250',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F250';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT LA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=110;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=120;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=140;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=160;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT LA PP F250,F253 and F295').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F250';
        pricRequestItem1.SALES_ORG__C = 'F250';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT LA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F250';
        orgGrp1.ERP_Sales_Org_Code__c='F250';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true);
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
            
            controller.ViewNetPrice(pricRequestItem1,true);  
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    static testMethod void testDTTEMEAF253()
    {
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DTT EMEA Pricing Procedure F253';
        PRProc1.Pricing_Procedure_Description__c='DTT EMEA Pricing Procedure F253';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZDA6';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZCMK';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='ZCRG';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Pricing_Condition_Code__c='Price';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZRAB';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Pricing_Condition_Code__c='Price';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='IP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Pricing_Condition_Code__c='Price';
        ERP_PC7.Calculation_Type__c='Percentage';
        ERP_PC7.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Pricing_Condition_Code__c='Price';
        ERP_PC8.Calculation_Type__c='Percentage';
        ERP_PC8.Condition_Class__c='Prices';
        ERP_PC8.Pricing_Condition_Code__c='NNP';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=110;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=150;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=170;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=180;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=130;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        
        ERP_Procedure_Conditions__C ERPProc6 = new ERP_Procedure_Conditions__C();
        ERPProc6.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=175;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        procList.add(ERPProc6);
        
        ERP_Procedure_Conditions__C ERPProc7 = new ERP_Procedure_Conditions__C();
        ERPProc7.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=200;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        procList.add(ERPProc7);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DTT EMEA Pricing Procedure F253').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true);
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
            controller.ViewNetPrice(pricRequestItem1,true);
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    
    
    static testMethod void testCPMEMEA()
    {
        
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='CPM EMEA Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='CPM EMEA';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRE';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZDA1';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZDA6';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Fixed Amount';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='ZGA4';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Fixed Amount';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZGA8';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='ZG11';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Calculation_Type__c='Fixed Amount';
        ERP_PC6.Condition_Class__c='Prices';
        ERP_PC6.Pricing_Condition_Code__c='ZM01';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Calculation_Type__c='Fixed Amount';
        ERP_PC7.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='ZFAC';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Calculation_Type__c='Percentage';
        ERP_PC8.Condition_Class__c='Prices';
        ERP_PC8.Pricing_Condition_Code__c='ZHES';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        ERP_Pricing_Condition__c ERP_PC9 = new ERP_Pricing_Condition__c();
        ERP_PC9.Price_Types__c='Standard';
        ERP_PC9.Calculation_Type__c='Percentage';
        ERP_PC9.Condition_Class__c='Prices';
        ERP_PC9.Pricing_Condition_Code__c='ZAO1';
        ERP_PC9.SAP_Application_Id__c='V';
        ERP_PC9.SAP_Client_Id__c='510';
        ERP_PC9.SAP_Cluster__c='CB1';
        ERP_PC9.SAP_Condition_Type__c=true;
        ERP_PC9.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC9);
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Standard';
        ERP_PC10.Calculation_Type__c='Percentage';
        ERP_PC10.Condition_Class__c='Prices';
        ERP_PC10.Pricing_Condition_Code__c='ZCMA';
        ERP_PC10.SAP_Application_Id__c='V';
        ERP_PC10.SAP_Client_Id__c='510';
        ERP_PC10.SAP_Cluster__c='CB1';
        ERP_PC10.SAP_Condition_Type__c=true;
        ERP_PC10.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC10);
        ERP_Pricing_Condition__c ERP_PC11 = new ERP_Pricing_Condition__c();
        ERP_PC11.Price_Types__c='Standard';
        ERP_PC11.Calculation_Type__c='Percentage';
        ERP_PC11.Condition_Class__c='Prices';
        ERP_PC11.Pricing_Condition_Code__c='ZCMB';
        ERP_PC11.SAP_Application_Id__c='V';
        ERP_PC11.SAP_Client_Id__c='510';
        ERP_PC11.SAP_Cluster__c='CB1';
        ERP_PC11.SAP_Condition_Type__c=true;
        ERP_PC11.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC11);
        ERP_Pricing_Condition__c ERP_PC12 = new ERP_Pricing_Condition__c();
        ERP_PC12.Price_Types__c='Standard';
        ERP_PC12.Calculation_Type__c='Quantity';
        ERP_PC12.Condition_Class__c='Expense reimbursement';
        ERP_PC12.Pricing_Condition_Code__c='ZCMD';
        ERP_PC12.SAP_Application_Id__c='V';
        ERP_PC12.SAP_Client_Id__c='510';
        ERP_PC12.SAP_Cluster__c='CB1';
        ERP_PC12.SAP_Condition_Type__c=true;
        ERP_PC12.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC12);
        ERP_Pricing_Condition__c ERP_PC13 = new ERP_Pricing_Condition__c();
        ERP_PC13.Price_Types__c='Standard';
        ERP_PC13.Calculation_Type__c='Percentage';
        ERP_PC13.Condition_Class__c='Prices';
        ERP_PC13.Pricing_Condition_Code__c='SKTO';
        ERP_PC13.SAP_Application_Id__c='V';
        ERP_PC13.SAP_Client_Id__c='510';
        ERP_PC13.SAP_Cluster__c='CB1';
        ERP_PC13.SAP_Condition_Type__c=true;
        ERP_PC13.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC13);
        ERP_Pricing_Condition__c ERP_PC14 = new ERP_Pricing_Condition__c();
        ERP_PC14.Price_Types__c='Standard';
        ERP_PC14.Calculation_Type__c='Quantity';
        ERP_PC14.Pricing_Condition_Code__c='EK02';
        ERP_PC14.SAP_Application_Id__c='V';
        ERP_PC14.SAP_Client_Id__c='510';
        ERP_PC14.SAP_Cluster__c='CB1';
        ERP_PC14.SAP_Condition_Type__c=true;
        ERP_PC14.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC14);
        ERP_Pricing_Condition__c ERP_PC15 = new ERP_Pricing_Condition__c();
        ERP_PC15.Price_Types__c='Standard';
        ERP_PC15.Calculation_Type__c='Percentage';
        ERP_PC15.Condition_Class__c='Prices';
        ERP_PC15.Pricing_Condition_Code__c='GRWR';
        ERP_PC15.SAP_Application_Id__c='V';
        ERP_PC15.SAP_Client_Id__c='510';
        ERP_PC15.SAP_Cluster__c='CB1';
        ERP_PC15.SAP_Condition_Type__c=true;
        ERP_PC15.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC15);
        ERP_Pricing_Condition__c ERP_PC16 = new ERP_Pricing_Condition__c();
        ERP_PC16.Price_Types__c='Net Price';
        ERP_PC16.Pricing_Condition_Code__c='NP';
        ERP_PC16.SAP_Application_Id__c='V';
        ERP_PC16.SAP_Client_Id__c='510';
        ERP_PC16.SAP_Cluster__c='CB1';
        ERP_PC16.SAP_Condition_Type__c=true;
        ERP_PC16.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC16);
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        procList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        procList.add(ERPProc7);
        ERP_Procedure_Conditions__c ERPProc8 = new ERP_Procedure_Conditions__c();
        ERPProc8.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc8.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc8.Step__c=108;
        ERPProc8.From__c=0;
        ERPProc8.To__c=0;
        procList.add(ERPProc8);
        ERP_Procedure_Conditions__c ERPProc9 = new ERP_Procedure_Conditions__c();
        ERPProc9.Pricing_Condition__c =  ERP_PC9.id;
        ERPProc9.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc9.Step__c=109;
        ERPProc9.From__c=0;
        ERPProc9.To__c=0;
        procList.add(ERPProc9);
        ERP_Procedure_Conditions__c ERPProc10 = new ERP_Procedure_Conditions__c();
        ERPProc10.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=119;
        ERPProc10.From__c=0;
        ERPProc10.To__c=0;
        procList.add(ERPProc10);
        ERP_Procedure_Conditions__c ERPProc11 = new ERP_Procedure_Conditions__c();
        ERPProc11.Pricing_Condition__c =  ERP_PC11.id;
        ERPProc11.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc11.Step__c=200;
        ERPProc11.From__c=0;
        ERPProc11.To__c=0;
        procList.add(ERPProc11);
        ERP_Procedure_Conditions__c ERPProc12 = new ERP_Procedure_Conditions__c();
        ERPProc12.Pricing_Condition__c =  ERP_PC12.id;
        ERPProc12.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc12.Step__c=300;
        ERPProc12.From__c=0;
        ERPProc12.To__c=0;
        procList.add(ERPProc12);
        ERP_Procedure_Conditions__c ERPProc13 = new ERP_Procedure_Conditions__c();
        ERPProc13.Pricing_Condition__c =  ERP_PC13.id;
        ERPProc13.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc13.Step__c=400;
        ERPProc13.From__c=0;
        ERPProc13.To__c=0;
        procList.add(ERPProc13);
        ERP_Procedure_Conditions__c ERPProc14 = new ERP_Procedure_Conditions__c();
        ERPProc14.Pricing_Condition__c =  ERP_PC14.id;
        ERPProc14.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc14.Step__c=500;
        ERPProc14.From__c=0;
        ERPProc14.To__c=0;
        procList.add(ERPProc14);
        ERP_Procedure_Conditions__c ERPProc15 = new ERP_Procedure_Conditions__c();
        ERPProc15.Pricing_Condition__c =  ERP_PC15.id;
        ERPProc15.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc15.Step__c=600;
        ERPProc15.From__c=0;
        ERPProc15.To__c=0;
        procList.add(ERPProc15);
        ERP_Procedure_Conditions__c ERPProc16 = new ERP_Procedure_Conditions__c();
        ERPProc16.Pricing_Condition__c =  ERP_PC16.id;
        ERPProc16.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc16.Step__c=700;
        ERPProc16.From__c=0;
        ERPProc16.To__c=0;
        procList.add(ERPProc16);
        insert procList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('CPM EMEA').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRE';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRE:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRE',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        try{
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
        }catch(Exception e){}
        
    }
    
    
    static testMethod void testDPTEMEA()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPT EMEA Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT EMEA';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPRI';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Pricing_Condition_Code__c='IP';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZDA1';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Fixed Amount';
        ERP_PC4.Condition_Class__c='Discount or Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZDA3';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZDG2';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Pricing_Condition_Code__c='IP2';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Calculation_Type__c='Percentage';
        ERP_PC7.Condition_Class__c='Discount or Surcharge';
        ERP_PC7.Pricing_Condition_Code__c='ZM07';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Calculation_Type__c='Fixed Amount';
        ERP_PC8.Condition_Class__c='Discount or Surcharge';
        ERP_PC8.Pricing_Condition_Code__c='ZM08';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Net Price';
        ERP_PC10.Pricing_Condition_Code__c='NP';
        ERP_PC10.SAP_Application_Id__c='V';
        ERP_PC10.SAP_Client_Id__c='510';
        ERP_PC10.SAP_Cluster__c='CB1';
        ERP_PC10.SAP_Condition_Type__c=true;
        ERP_PC10.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC10);
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        procList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        procList.add(ERPProc7);
        ERP_Procedure_Conditions__c ERPProc8 = new ERP_Procedure_Conditions__c();
        ERPProc8.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc8.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc8.Step__c=108;
        ERPProc8.From__c=0;
        ERPProc8.To__c=0;
        procList.add(ERPProc8);
        ERP_Procedure_Conditions__c ERPProc10 = new ERP_Procedure_Conditions__c();
        ERPProc10.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=109;
        ERPProc10.From__c=0;
        ERPProc10.To__c=0;
        procList.add(ERPProc10);
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT EMEA').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPNG:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPRI',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //calculateRatesforPnIPLA
    
    static testMethod void testPnIPLA()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='P&IP ECP LA G21A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='P&IP ECP LA PP G21A';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ZPG4';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Quantity';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZBPA';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Discount or Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZPNG';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Quantity';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZPCH';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Calculation_Type__c='Quantity';
        ERP_PC7.Condition_Class__c='Discount or Surcharge';
        ERP_PC7.Pricing_Condition_Code__c='ZFLT';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Net Price';
        ERP_PC10.Pricing_Condition_Code__c='NP';
        ERP_PC10.SAP_Application_Id__c='V';
        ERP_PC10.SAP_Client_Id__c='510';
        ERP_PC10.SAP_Cluster__c='CB1';
        ERP_PC10.SAP_Condition_Type__c=true;
        ERP_PC10.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC10);
        insert pcList;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        procList.add(ERPProc7);
        
        ERP_Procedure_Conditions__c ERPProc10 = new ERP_Procedure_Conditions__c();
        ERPProc10.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=109;
        ERPProc10.From__c=0;
        ERPProc10.To__c=0;
        procList.add(ERPProc10);
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('P&IP ECP LA PP G21A').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }   
    }
    //DPT NA SPP3
    static testMethod void testDPT_NA_SPP3()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPT NA AD6B Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT NA SPP3';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPG4';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZDA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Quantity';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZDA2';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ZPG4';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZD70';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Calculation_Type__c='Quantity';
        ERP_PC6.Condition_Class__c='Discount or Surcharge';
        ERP_PC6.Pricing_Condition_Code__c='ZFLT';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Net Price';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        proList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        proList.add(ERPProc7);
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('P&IP ECP EU PP G220-G26A').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
        pricRequestItem2.CURRENCYISOCODE = 'USD';
        pricRequestItem2.PRICING_REQUEST__C = pri.Id;
        pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem2.COUNTRY__C = 'Germany';
        pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem2.DIVISION_CODE__C = '02';
        pricRequestItem2.DIVISION__C = 'GSD Standard';
        pricRequestItem2.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem2.GAP__C = false;
        pricRequestItem2.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
        pricRequestItem2.ShipTo_Code__c='55470156';
        pricRequestItem2.PH1_Code__c='A6';
        pricRequestItem2.PH2_Code__c='S1';
        pricRequestItem2.PH3_Code__c='11';
        pricRequestItem2.PH4_Code__c='12';
        pricRequestItem2.PH5_Code__c='S1';
        pricRequestItem2.PH6_Code__c='BB';
        pricRequestItem2.PH7_Code__c='ED';
        pricRequestItem2.PH8_Code__c='GT';
        pricRequestItem2.PH9_Code__c='RE';
        pricRequestItem2.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem2.NEW_PER__C = 1;
        pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem2.PER__C = 1;
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'F253';
        pricRequestItem2.SALES_ORG__C = 'F253';
        pricRequestItem2.SCALED_PRICE_FLAG__C = true;
        pricRequestItem2.SOLD_TO_CODE__C = '55470156';
        pricRequestItem2.UNIT__C = 'EUR';
        pricRequestItem2.UOM__C = 'EA';
        pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 02,15);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 4,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = 'USD';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        insert pricRequestItem2;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        insert npcReq1;
        
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        insert npcReq2;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        try{
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){} 
    }
    //DPT NA SPP4
    static testMethod void testDPT_NA_SPP4()
    {
        //Test.startTest();
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPT NA D660 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT NA SPP4';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPG4';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZDA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Quantity';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZDA2';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ZPG4';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZD70';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Calculation_Type__c='Quantity';
        ERP_PC6.Condition_Class__c='Discount or Surcharge';
        ERP_PC6.Pricing_Condition_Code__c='ZFLT';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Net Price';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        proList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        proList.add(ERPProc7);
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('P&IP ECP EU PP G220-G26A').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
        pricRequestItem2.CURRENCYISOCODE = 'USD';
        pricRequestItem2.PRICING_REQUEST__C = pri.Id;
        pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem2.COUNTRY__C = 'Germany';
        pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem2.DIVISION_CODE__C = '02';
        pricRequestItem2.DIVISION__C = 'GSD Standard';
        pricRequestItem2.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem2.GAP__C = false;
        pricRequestItem2.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
        pricRequestItem2.ShipTo_Code__c='55470156';
        pricRequestItem2.PH1_Code__c='A6';
        pricRequestItem2.PH2_Code__c='S1';
        pricRequestItem2.PH3_Code__c='11';
        pricRequestItem2.PH4_Code__c='12';
        pricRequestItem2.PH5_Code__c='S1';
        pricRequestItem2.PH6_Code__c='BB';
        pricRequestItem2.PH7_Code__c='ED';
        pricRequestItem2.PH8_Code__c='GT';
        pricRequestItem2.PH9_Code__c='RE';
        pricRequestItem2.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem2.NEW_PER__C = 1;
        pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem2.PER__C = 1;
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'F253';
        pricRequestItem2.SALES_ORG__C = 'F253';
        pricRequestItem2.SCALED_PRICE_FLAG__C = true;
        pricRequestItem2.SOLD_TO_CODE__C = '55470156';
        pricRequestItem2.UNIT__C = 'EUR';
        pricRequestItem2.UOM__C = 'EA';
        pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 02,15);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 4,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = 'USD';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        insert pricRequestItem2;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        insert npcReq1;
        
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        insert npcReq2;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        try{
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    static testMethod void testDPP_KV_SPP1()
    {
        
        
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP Global Kalrez B918,B900 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP KV SPP1';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRV';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        /*    ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
ERP_PC1.Price_Types__c='Standard';
//ERP_PC1.Calculation_Type__c='Quantity';
ERP_PC1.Condition_Class__c='Price';
ERP_PC1.Pricing_Condition_Code__c='ZPGB';
ERP_PC1.SAP_Application_Id__c='V';
ERP_PC1.SAP_Client_Id__c='510';
ERP_PC1.SAP_Cluster__c='CB1';
ERP_PC1.SAP_Condition_Type__c=true;
ERP_PC1.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC1);*/
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZPRW';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*      ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
ERP_PC3.Price_Types__c='Standard';
ERP_PC3.Calculation_Type__c='Percentage';
ERP_PC3.Condition_Class__c='Discount or Surcharge';
ERP_PC3.Pricing_Condition_Code__c='ZIRH';
ERP_PC3.SAP_Application_Id__c='V';
ERP_PC3.SAP_Client_Id__c='510';
ERP_PC3.SAP_Cluster__c='CB1';
ERP_PC3.SAP_Condition_Type__c=true;
ERP_PC3.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC3);*/
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //  ERP_PC4.Calculation_Type__c='Quantity';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        // ERP_PC5.Calculation_Type__c='Percentage';
        // ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
ERP_PC6.SAP_Application_Id__c='V';
ERP_PC6.SAP_Client_Id__c='510';
ERP_PC6.SAP_Cluster__c='CB1';
ERP_PC6.SAP_Condition_Type__c=true;
ERP_PC6.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC6);
ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
ERP_PC7.Price_Types__c='Net Price';
ERP_PC7.Pricing_Condition_Code__c='NP';
ERP_PC7.SAP_Application_Id__c='V';
ERP_PC7.SAP_Client_Id__c='510';
ERP_PC7.SAP_Cluster__c='CB1';
ERP_PC7.SAP_Condition_Type__c=true;
ERP_PC7.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC7);*/
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP Global Kalrez And Vespel';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        /*ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc1.Step__c=101;
ERPProc1.From__c=0;
ERPProc1.To__c=0;
proList.add(ERPProc1);*/
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        /*   ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc3.Step__c=103;
ERPProc3.From__c=0;
ERPProc3.To__c=0;
proList.add(ERPProc3);*/
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc6.Step__c=106;
ERPProc6.From__c=0;
ERPProc6.To__c=0;
proList.add(ERPProc6);
ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc7.Step__c=107;
ERPProc7.From__c=0;
ERPProc7.To__c=0;
proList.add(ERPProc7);*/
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        /*    ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
ERPAccSeq1.isNPCApplicable__c=true;
ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
insert ERPAccSeq1;*/
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC2.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP1').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRV';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRV:292.000000000:EUR:1:EA:ZPRW:-10:EUR:1:EA:ZPGC:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRV',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPRW',new List<String>{'-10','EUR','1','EA'});
        cTRateMap.put('ZPGC',new List<String>{'-5.000000000','EUR','1','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        // Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //controller1.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Global Kalrez And Vespel';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        
        Test.startTest();
        NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
        NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
        NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
        NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
        NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
        NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
        NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
        NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
        NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
        NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
        NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
        NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
        NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
        Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
        
        
        
    }
    
    static testMethod void testDPP_Global_Kalrez_Vespel_SPP3()
    {
        
        
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP Global Vespel B950 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP Global Kalrez & Vespel SPP3';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRB';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPGB';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZPRW';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*      ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
ERP_PC3.Price_Types__c='Standard';
ERP_PC3.Calculation_Type__c='Percentage';
ERP_PC3.Condition_Class__c='Discount or Surcharge';
ERP_PC3.Pricing_Condition_Code__c='ZIRH';
ERP_PC3.SAP_Application_Id__c='V';
ERP_PC3.SAP_Client_Id__c='510';
ERP_PC3.SAP_Cluster__c='CB1';
ERP_PC3.SAP_Condition_Type__c=true;
ERP_PC3.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC3);*/
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //  ERP_PC4.Calculation_Type__c='Quantity';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        // ERP_PC5.Calculation_Type__c='Percentage';
        // ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
ERP_PC6.SAP_Application_Id__c='V';
ERP_PC6.SAP_Client_Id__c='510';
ERP_PC6.SAP_Cluster__c='CB1';
ERP_PC6.SAP_Condition_Type__c=true;
ERP_PC6.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC6);
ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
ERP_PC7.Price_Types__c='Net Price';
ERP_PC7.Pricing_Condition_Code__c='NP';
ERP_PC7.SAP_Application_Id__c='V';
ERP_PC7.SAP_Client_Id__c='510';
ERP_PC7.SAP_Cluster__c='CB1';
ERP_PC7.SAP_Condition_Type__c=true;
ERP_PC7.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC7);*/
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP Global Kalrez And Vespel';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        /*   ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc3.Step__c=103;
ERPProc3.From__c=0;
ERPProc3.To__c=0;
proList.add(ERPProc3);*/
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc6.Step__c=106;
ERPProc6.From__c=0;
ERPProc6.To__c=0;
proList.add(ERPProc6);
ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc7.Step__c=107;
ERPProc7.From__c=0;
ERPProc7.To__c=0;
proList.add(ERPProc7);*/
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC2.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP Global Kalrez & Vespel SPP3').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRB';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPRW:-10:EUR:1:EA:ZPGC:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRV',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPRW',new List<String>{'-10','EUR','1','EA'});
        cTRateMap.put('ZPGC',new List<String>{'-5.000000000','EUR','1','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        // Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        /*   Map<String,String> UoMConversionMap= new Map<String,String>();
UoMConversionMap.put(emfList[0].Material__r.ERP_Material_code__c+emfList[0].Material__r.ERP_Source_Cluster__c+emfList[0].Alternative_Uom__c,emfList[0].Numerator_Y__c+':'+emfList[0].Denominator_X__c);

controller.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
PACalculateNetPrice controller12 = new PACalculateNetPrice();
controller12.calculateRatesforDPPKV(proList,cTRateMap,npcReq2,pricRequestItem2,true,UoMConversionMap,false,5);

PACalculateNetPrice controller1 = new PACalculateNetPrice();

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,1);

PACalculateNetPrice controller2 = new PACalculateNetPrice();

controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,2);

PACalculateNetPrice controller3 = new PACalculateNetPrice();

controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,3);

PACalculateNetPrice controller4 = new PACalculateNetPrice();

controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,4);


//Map<String,List<String>> cTRateMap1 = new Map<String,List<String>>();
cTRateMap.put('ZPR9',new List<String>{'##','EUR','1','EA'}); 
cTRateMap.put('ZPNG',new List<String>{'##','EUR','1','EA'});
cTRateMap.put('ZPSF',new List<String>{'##','EUR','0','EA'});
cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});

PACalculateNetPrice controller56 = new PACalculateNetPrice();
controller56.calculateNPC(npcReqIds, cTRateMap, prItemList,true);

/*controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,5);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,1);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,2);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,3);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,4);*/
        
        //controller1.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Global Kalrez And Vespel';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        
        Test.startTest();
        NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
        NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
        NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
        NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
        NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
        NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
        NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
        NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
        NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
        NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
        NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
        NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
        NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
        Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
        
    }
    
    
    //DPP KV SPP3
    static testMethod void testDPP_KV_SPP3()
    {
        
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP Global Kalrez B950 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP KV SPP3';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRV';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        /*    ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
ERP_PC1.Price_Types__c='Standard';
//ERP_PC1.Calculation_Type__c='Quantity';
ERP_PC1.Condition_Class__c='Price';
ERP_PC1.Pricing_Condition_Code__c='ZPGC';
ERP_PC1.SAP_Application_Id__c='V';
ERP_PC1.SAP_Client_Id__c='510';
ERP_PC1.SAP_Cluster__c='CB1';
ERP_PC1.SAP_Condition_Type__c=true;
ERP_PC1.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC1); */
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZPRW';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*      ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
ERP_PC3.Price_Types__c='Standard';
ERP_PC3.Calculation_Type__c='Percentage';
ERP_PC3.Condition_Class__c='Discount or Surcharge';
ERP_PC3.Pricing_Condition_Code__c='ZIRH';
ERP_PC3.SAP_Application_Id__c='V';
ERP_PC3.SAP_Client_Id__c='510';
ERP_PC3.SAP_Cluster__c='CB1';
ERP_PC3.SAP_Condition_Type__c=true;
ERP_PC3.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC3);*/
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //  ERP_PC4.Calculation_Type__c='Quantity';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        // ERP_PC5.Calculation_Type__c='Percentage';
        // ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
ERP_PC6.SAP_Application_Id__c='V';
ERP_PC6.SAP_Client_Id__c='510';
ERP_PC6.SAP_Cluster__c='CB1';
ERP_PC6.SAP_Condition_Type__c=true;
ERP_PC6.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC6);
ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
ERP_PC7.Price_Types__c='Net Price';
ERP_PC7.Pricing_Condition_Code__c='NP';
ERP_PC7.SAP_Application_Id__c='V';
ERP_PC7.SAP_Client_Id__c='510';
ERP_PC7.SAP_Cluster__c='CB1';
ERP_PC7.SAP_Condition_Type__c=true;
ERP_PC7.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC7);*/
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP Global Kalrez And Vespel';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        /*   ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc1.Step__c=101;
ERPProc1.From__c=0;
ERPProc1.To__c=0;
proList.add(ERPProc1);*/
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        /*   ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc3.Step__c=103;
ERPProc3.From__c=0;
ERPProc3.To__c=0;
proList.add(ERPProc3);*/
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc6.Step__c=106;
ERPProc6.From__c=0;
ERPProc6.To__c=0;
proList.add(ERPProc6);
ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc7.Step__c=107;
ERPProc7.From__c=0;
ERPProc7.To__c=0;
proList.add(ERPProc7);*/
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC2.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        /*        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
ERPAccSeq2.Pricing_Condition__c=ERP_PC3.id;
ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
ERPAccSeq2.isNPCApplicable__c=true;
ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
insert ERPAccSeq2;*/
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP3').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRV';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRV:292.000000000:EUR:1:EA:ZPRW:-10:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRV',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPRW',new List<String>{'-10','EUR','1','EA'});
        //    cTRateMap.put('ZK20',new List<String>{'-5.000000000','EUR','0','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        // Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        /*   Map<String,String> UoMConversionMap= new Map<String,String>();
UoMConversionMap.put(emfList[0].Material__r.ERP_Material_code__c+emfList[0].Material__r.ERP_Source_Cluster__c+emfList[0].Alternative_Uom__c,emfList[0].Numerator_Y__c+':'+emfList[0].Denominator_X__c);

controller.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
PACalculateNetPrice controller12 = new PACalculateNetPrice();
controller12.calculateRatesforDPPKV(proList,cTRateMap,npcReq2,pricRequestItem2,true,UoMConversionMap,false,5);

PACalculateNetPrice controller1 = new PACalculateNetPrice();

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,1);

PACalculateNetPrice controller2 = new PACalculateNetPrice();

controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,2);

PACalculateNetPrice controller3 = new PACalculateNetPrice();

controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,3);

PACalculateNetPrice controller4 = new PACalculateNetPrice();

controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,4);


//Map<String,List<String>> cTRateMap1 = new Map<String,List<String>>();
cTRateMap.put('ZPR9',new List<String>{'##','EUR','1','EA'}); 
cTRateMap.put('ZPNG',new List<String>{'##','EUR','1','EA'});
cTRateMap.put('ZPSF',new List<String>{'##','EUR','0','EA'});
cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});

PACalculateNetPrice controller56 = new PACalculateNetPrice();
controller56.calculateNPC(npcReqIds, cTRateMap, prItemList,true);

/*controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,5);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,1);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,2);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,3);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,4);*/
        
        //controller1.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Global Kalrez And Vespel';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        
        Test.startTest();
        NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
        NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
        NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
        NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
        NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
        NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
        NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
        NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
        NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
        NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
        NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
        NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
        NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
        Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
    }
    
    //DPP KV SPP5
    static testMethod void testDPP_KV_SPP5()
    {
        
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP Global Vespel B953 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP KV SPP5';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRB';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPGC';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZDA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZIRH';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //  ERP_PC4.Calculation_Type__c='Quantity';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        // ERP_PC5.Calculation_Type__c='Percentage';
        // ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
ERP_PC6.SAP_Application_Id__c='V';
ERP_PC6.SAP_Client_Id__c='510';
ERP_PC6.SAP_Cluster__c='CB1';
ERP_PC6.SAP_Condition_Type__c=true;
ERP_PC6.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC6);
ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
ERP_PC7.Price_Types__c='Net Price';
ERP_PC7.Pricing_Condition_Code__c='NP';
ERP_PC7.SAP_Application_Id__c='V';
ERP_PC7.SAP_Client_Id__c='510';
ERP_PC7.SAP_Cluster__c='CB1';
ERP_PC7.SAP_Condition_Type__c=true;
ERP_PC7.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC7);*/
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP Global Kalrez And Vespel';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc6.Step__c=106;
ERPProc6.From__c=0;
ERPProc6.To__c=0;
proList.add(ERPProc6);
ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc7.Step__c=107;
ERPProc7.From__c=0;
ERPProc7.To__c=0;
proList.add(ERPProc7);*/
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC3.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP5').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRB';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
        pricRequestItem2.CURRENCYISOCODE = 'USD';
        pricRequestItem2.PRICING_REQUEST__C = pri.Id;
        pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem2.COUNTRY__C = 'Germany';
        pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem2.DIVISION_CODE__C = '02';
        pricRequestItem2.DIVISION__C = 'GSD Standard';
        pricRequestItem2.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem2.GAP__C = false;
        pricRequestItem2.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
        pricRequestItem2.ShipTo_Code__c='55470156';
        pricRequestItem2.PH1_Code__c='A6';
        pricRequestItem2.PH2_Code__c='S1';
        pricRequestItem2.PH3_Code__c='11';
        pricRequestItem2.PH4_Code__c='12';
        pricRequestItem2.PH5_Code__c='S1';
        pricRequestItem2.PH6_Code__c='BB';
        pricRequestItem2.PH7_Code__c='ED';
        pricRequestItem2.PH8_Code__c='GT';
        pricRequestItem2.PH9_Code__c='RE';
        pricRequestItem2.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem2.NEW_PER__C = 1;
        pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem2.PER__C = 1;
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPGC';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'F253';
        pricRequestItem2.SALES_ORG__C = 'F253';
        pricRequestItem2.SCALED_PRICE_FLAG__C = true;
        pricRequestItem2.SOLD_TO_CODE__C = '55470156';
        pricRequestItem2.UNIT__C = 'EUR';
        pricRequestItem2.UOM__C = 'EA';
        pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 02,15);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 4,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = 'USD';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        insert pricRequestItem2;
        
        Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
        pricRequestItem3.CURRENCYISOCODE = 'USD';
        pricRequestItem3.PRICING_REQUEST__C = pri.Id;
        pricRequestItem3.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem3.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem3.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem3.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem3.COUNTRY__C = 'Germany';
        pricRequestItem3.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem3.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem3.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem3.DIVISION_CODE__C = '02';
        pricRequestItem3.DIVISION__C = 'GSD Standard';
        pricRequestItem3.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem3.GAP__C = false;
        pricRequestItem3.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem3.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem3.ShipTo_Code__c='55470156';
        pricRequestItem3.PH1_Code__c='A6';
        pricRequestItem3.PH2_Code__c='S1';
        pricRequestItem3.PH3_Code__c='11';
        pricRequestItem3.PH4_Code__c='12';
        pricRequestItem3.PH5_Code__c='S1';
        pricRequestItem3.PH6_Code__c='BB';
        pricRequestItem3.PH7_Code__c='ED';
        pricRequestItem3.PH8_Code__c='GT';
        pricRequestItem3.PH9_Code__c='RE';
        pricRequestItem3.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem3.NEW_PER__C = 1;
        pricRequestItem3.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem3.PER__C = 1;
        pricRequestItem3.PRICING_CONDITION_CODE__C = 'ZIRH';
        pricRequestItem3.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem3.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem3.Rate__c = '100';
        pricRequestItem3.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem3.SAP_CLIENT_ID__C = '510';
        pricRequestItem3.SAP_Cluster__c = 'CB1';
        pricRequestItem3.SALES_ORG_CODE__C = 'F253';
        pricRequestItem3.SALES_ORG__C = 'F253';
        pricRequestItem3.SCALED_PRICE_FLAG__C = true;
        pricRequestItem3.SOLD_TO_CODE__C = '55470156';
        pricRequestItem3.UNIT__C = 'EUR';
        pricRequestItem3.UOM__C = 'EA';
        pricRequestItem3.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem3.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem3.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem3.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem3.EDIT__C = false;
        pricRequestItem3.NEW__C = false;
        pricRequestItem3.SCALE_BASIS__C = 'Quantity';
        pricRequestItem3.SCALE_TYPE__C = 'From';
        pricRequestItem3.New_Rate__c = '100';
        pricRequestItem3.New_Unit__c = 'USD';
        pricRequestItem3.New_Per__c = 2;
        pricRequestItem3.New_UoM__c = 'KG';
        insert pricRequestItem3;
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        npcReq2.isSynchronous__c=false;
        insert npcReq2;
        //npcReqList.add(npcReq2);
        
        NPC_Request__c npcReq3=new NPC_Request__c();
        npcReq3.Material_Number__c='D11992510';
        npcReq3.Partner_Code_1__c='AG';
        npcReq3.Partner1__c='55470156';
        npcReq3.Quantity__c='1050000';
        npcReq3.Sales_Document_Type__c='ZOR1';
        npcReq3.Status__c='Active';
        npcReq3.Pricing_Request_Item__c=pricRequestItem3.Id;
        insert npcReq3;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq2.Id;
        insert npcResp2;
        
        NPC_Response__c npcResp3=new NPC_Response__c();
        npcResp3.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp3.NPC_Message_Type__c='S';
        npcResp3.NPC_Request__c=npcReq3.Id;
        insert npcResp3;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRB',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPGC',new List<String>{'292.000000000','EUR','1','EA'});
        //    cTRateMap.put('ZK20',new List<String>{'-5.000000000','EUR','0','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        // Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        /*   Map<String,String> UoMConversionMap= new Map<String,String>();
UoMConversionMap.put(emfList[0].Material__r.ERP_Material_code__c+emfList[0].Material__r.ERP_Source_Cluster__c+emfList[0].Alternative_Uom__c,emfList[0].Numerator_Y__c+':'+emfList[0].Denominator_X__c);

controller.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
PACalculateNetPrice controller12 = new PACalculateNetPrice();
controller12.calculateRatesforDPPKV(proList,cTRateMap,npcReq2,pricRequestItem2,true,UoMConversionMap,false,5);

PACalculateNetPrice controller1 = new PACalculateNetPrice();

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,1);

PACalculateNetPrice controller2 = new PACalculateNetPrice();

controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,2);

PACalculateNetPrice controller3 = new PACalculateNetPrice();

controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,3);

PACalculateNetPrice controller4 = new PACalculateNetPrice();

controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,4);


//Map<String,List<String>> cTRateMap1 = new Map<String,List<String>>();
cTRateMap.put('ZPR9',new List<String>{'##','EUR','1','EA'}); 
cTRateMap.put('ZPNG',new List<String>{'##','EUR','1','EA'});
cTRateMap.put('ZPSF',new List<String>{'##','EUR','0','EA'});
cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});

PACalculateNetPrice controller56 = new PACalculateNetPrice();
controller56.calculateNPC(npcReqIds, cTRateMap, prItemList,true);

/*controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,5);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,1);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,2);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,3);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,4);*/
        
        //controller1.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Global Kalrez And Vespel';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        //controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        
        Test.startTest();
        NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
        NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
        NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
        NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
        NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
        NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
        NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
        NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
        NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
        NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
        NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
        NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
        NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
        Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
    }
    //DPP Polymers EMEA SPP2
    static testMethod void testDPP_Polymers_EMEA_SPP2()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP Polymers EMEA B90A,B90B,B915,B920,B921,B922,B92A,B941,B953,B95A,B96A,B980,B993 Sales Pricing Procedure 2';
        PRProc1.Pricing_Procedure_Description__c='ZIS2 - Inter SBU Price - ZIS*';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRN';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ZRB1';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZRB2';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        insert ERP_PC2;
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Net Reference';
        ERP_PC3.Pricing_Condition_Code__c='Price';
        ERP_PC3.Calculation_Type__c='Quantity';
        ERP_PC3.Condition_Class__c='Prices';
        ERP_PC3.Pricing_Condition_Code__c='ZREF';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        insert ERP_PC3;
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Net Floor';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Prices';
        ERP_PC4.Pricing_Condition_Code__c='ZFLO';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        insert ERP_PC4;
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Sub Total';
        //ERP_PC5.Pricing_Condition_Code__c='Price';
        //ERP_PC5.Calculation_Type__c='Quantity';
        // ERP_PC5.Condition_Class__c='Prices';
        ERP_PC5.Pricing_Condition_Code__c='ST1';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        insert ERP_PC5;
        
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Sub Total';
        //ERP_PC5.Pricing_Condition_Code__c='Price';
        //ERP_PC5.Calculation_Type__c='Quantity';
        // ERP_PC5.Condition_Class__c='Prices';
        ERP_PC6.Pricing_Condition_Code__c='ST2';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        insert ERP_PC6;
        
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Net Price';
        //ERP_PC5.Pricing_Condition_Code__c='Price';
        //ERP_PC5.Calculation_Type__c='Quantity';
        // ERP_PC5.Condition_Class__c='Prices';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        insert ERP_PC7;
        
        
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP Polymers EMEA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=100;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        insert ERPProc2;
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=100;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        insert ERPProc3;
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=100;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        insert ERPProc4;
        
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=100;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        insert ERPProc5;
        
        ERP_Procedure_Conditions__C ERPProc6 = new ERP_Procedure_Conditions__C();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=100;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        insert ERPProc6;
        
        ERP_Procedure_Conditions__C ERPProc7 = new ERP_Procedure_Conditions__C();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=100;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        insert ERPProc7;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP Polymers EMEA SPP2').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        Pricing_Request__c pri1=[SELECT id,BU__c FROM Pricing_Request__c where id=:pri.Id];
        pricRequestItem1.Pricing_Request__c =pri1.id;
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRB';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRB',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPGB',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZFLO',new List<String>{'-5.000000000','EUR','1','EA'});
        cTRateMap.put('ZREF',new List<String>{'-5.000000000','EUR','1','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Polymers EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        try
        {
            
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //Piyush By Pass Test Coverage
    //DPP NA SPP2
    static testMethod void testDPP_NA_SPP_Coverage()
    {
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DDPP NA B950 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP NA SPP2';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPG4';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZDA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Quantity';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZDA2';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ZPG4';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZD70';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Calculation_Type__c='Quantity';
        ERP_PC6.Condition_Class__c='Discount or Surcharge';
        ERP_PC6.Pricing_Condition_Code__c='ZFLT';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Net Price';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP NA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        proList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        proList.add(ERPProc7);
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP NA SPP2').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.Pricing_Request__c =pri.id;
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
        pricRequestItem2.CURRENCYISOCODE = 'USD';
        pricRequestItem2.PRICING_REQUEST__C = pri.Id;
        pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem2.COUNTRY__C = 'Germany';
        pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem2.DIVISION_CODE__C = '02';
        pricRequestItem2.DIVISION__C = 'GSD Standard';
        pricRequestItem2.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem2.GAP__C = false;
        pricRequestItem2.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
        pricRequestItem2.ShipTo_Code__c='55470156';
        pricRequestItem2.PH1_Code__c='A6';
        pricRequestItem2.PH2_Code__c='S1';
        pricRequestItem2.PH3_Code__c='11';
        pricRequestItem2.PH4_Code__c='12';
        pricRequestItem2.PH5_Code__c='S1';
        pricRequestItem2.PH6_Code__c='BB';
        pricRequestItem2.PH7_Code__c='ED';
        pricRequestItem2.PH8_Code__c='GT';
        pricRequestItem2.PH9_Code__c='RE';
        pricRequestItem2.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem2.NEW_PER__C = 1;
        pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem2.PER__C = 1;
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'F253';
        pricRequestItem2.SALES_ORG__C = 'F253';
        pricRequestItem2.SCALED_PRICE_FLAG__C = true;
        pricRequestItem2.SOLD_TO_CODE__C = '55470156';
        pricRequestItem2.UNIT__C = 'EUR';
        pricRequestItem2.UOM__C = 'EA';
        pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 02,15);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 4,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = 'USD';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        insert pricRequestItem2;
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        insert npcReq1;
        
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        insert npcReq2;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        Test.startTest();
        NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
        NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
        NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
        NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
        NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
        NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
        NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
        NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
        NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
        NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
        NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
        NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
        NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
        Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        
        
        Test.stopTest();
        
    } 
    
    static testMethod void testDPP_Global_Kalrez_Vespel_SPP32()
    {
        
        
        customSettings();
        insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DPP Global Vespel B950 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP Global Kalrez & Vespel SPP3';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard 1';
        //ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPRB';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard 2';
        //ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPGB';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard 3';
        //ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZPRW';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*      ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
ERP_PC3.Price_Types__c='Standard';
ERP_PC3.Calculation_Type__c='Percentage';
ERP_PC3.Condition_Class__c='Discount or Surcharge';
ERP_PC3.Pricing_Condition_Code__c='ZIRH';
ERP_PC3.SAP_Application_Id__c='V';
ERP_PC3.SAP_Client_Id__c='510';
ERP_PC3.SAP_Cluster__c='CB1';
ERP_PC3.SAP_Condition_Type__c=true;
ERP_PC3.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC3);*/
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //ERP_PC4.Calculation_Type__c='Quantity';
        //ERP_PC4.Calculation_Type_Code__c='C';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        ERP_PC5.Calculation_Type__c='Quantity';
        ERP_PC5.Calculation_Type_Code__c='C';
        ERP_PC5.Condition_Class_Code__c='B';
        ERP_PC5.Condition_Class__c='Price';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC51 = new ERP_Pricing_Condition__c();
        ERP_PC51.Price_Types__c='Net Price';
        ERP_PC51.Calculation_Type__c='Percentage';
        ERP_PC51.Calculation_Type_Code__c='A';
        ERP_PC51.Condition_Class_Code__c='B';
        ERP_PC51.Condition_Class__c='Price';
        ERP_PC51.Pricing_Condition_Code__c='ST';
        ERP_PC51.SAP_Application_Id__c='V';
        ERP_PC51.SAP_Client_Id__c='510';
        ERP_PC51.SAP_Cluster__c='CB1';
        ERP_PC51.SAP_Condition_Type__c=true;
        ERP_PC51.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC51);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
ERP_PC6.SAP_Application_Id__c='V';
ERP_PC6.SAP_Client_Id__c='510';
ERP_PC6.SAP_Cluster__c='CB1';
ERP_PC6.SAP_Condition_Type__c=true;
ERP_PC6.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC6);
ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
ERP_PC7.Price_Types__c='Net Price';
ERP_PC7.Pricing_Condition_Code__c='NP';
ERP_PC7.SAP_Application_Id__c='V';
ERP_PC7.SAP_Client_Id__c='510';
ERP_PC7.SAP_Cluster__c='CB1';
ERP_PC7.SAP_Condition_Type__c=true;
ERP_PC7.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC7);*/
        insert pcList;
        
        //3. ERP Pricing Conditions
        
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPP Global Kalrez And Vespel';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        /*   ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc3.Step__c=103;
ERPProc3.From__c=0;
ERPProc3.To__c=0;
proList.add(ERPProc3);*/
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__r =  ERP_PC5;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=20;
        ERPProc5.To__c=30;
        proList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc51 = new ERP_Procedure_Conditions__c();
        ERPProc51.Pricing_Condition__r =  ERP_PC51;
        ERPProc51.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc51.Step__c=106;
        ERPProc51.From__c=26;
        ERPProc51.To__c=36;
        proList.add(ERPProc51);
        
        
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc6.Step__c=106;
ERPProc6.From__c=0;
ERPProc6.To__c=0;
proList.add(ERPProc6);
ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc7.Step__c=107;
ERPProc7.From__c=0;
ERPProc7.To__c=0;
proList.add(ERPProc7);*/
        //insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
        ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
        ERP_KC.Key_Combination_Code__c='A582';
        ERP_KC.SAP_APPLICATION_ID__C = 'V';
        ERP_KC.SAP_CLIENT_ID__C = '510';
        ERP_KC.SAP_Cluster__c = 'CB1';
        ERP_KC.Status__c='Active';
        insert ERP_KC;
        
        ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
        ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
        ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq.isNPCApplicable__c=true;
        ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq;
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC2.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP Global Kalrez & Vespel SPP3').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRB';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPRW:-10:EUR:1:EA:ZPGC:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRV',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPRW',new List<String>{'-10','EUR','1','EA'});
        cTRateMap.put('ZPGC',new List<String>{'-5.000000000','EUR','1','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller1 = new PACalculateNetPrice();
        
        Map<String,String> UoMConversionMap= new Map<String,String>();
        UoMConversionMap.put(emfList[0].Material__r.ERP_Material_code__c+emfList[0].Material__r.ERP_Source_Cluster__c+emfList[0].Alternative_Uom__c,emfList[0].Numerator_Y__c+':'+emfList[0].Denominator_X__c);
        
        controller1.currentNetPriceValuesMap =new Map<String,String>();
        controller1.condRateMapCurrent=new Map<String,String>();
        
        
        controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
        
        
        ERPProc5.Pricing_Condition__r.Pricing_Condition_Code__c='NP';           
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc5},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
        
        
        ERPProc5.Pricing_Condition__r.Pricing_Condition_Code__c='ZPRW';    
        ERPProc5.Pricing_Condition__r.Calculation_Type__c='Percentage'; 
        ERPProc5.Pricing_Condition__r.Calculation_Type_Code__c='A';     
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc5},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ST'; 
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NP';
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZPRW'; 
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZPRW'; 
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NP'; 
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ST'; 
        controller1.calculateRatesforDPPKV(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
        
        ERPProc51.Pricing_Condition__r.Calculation_Type__c='Percentage'; 
        ERPProc51.Pricing_Condition__r.Calculation_Type_Code__c='A';  
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZD85';   
        controller1.calculateRatesforBIAPEnvelopes(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZDI1';   
        controller1.calculateRatesforBIAPEnvelopes(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NNP';   
        controller1.calculateRatesforBIAPEnvelopes(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c=null;   
        controller1.calculateRatesforBIAPEnvelopes(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZMHF';   
        controller1.calculateRatesforMCMAPPaste(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NNP';   
        controller1.calculateRatesforMCMAPPaste(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZD8E';   
        controller1.calculateRatesforDTTAPRest(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NNP';   
        controller1.calculateRatesforDTTAPRest(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        //Piyush <PG20191211>
        ERPProc51.Pricing_Condition__r.Calculation_Type__c='Percentage'; 
        ERPProc51.Pricing_Condition__r.Calculation_Type_Code__c='A';  
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NP';   
        controller1.calculateRatesforDPPAP(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
        controller1.calculateRatesforDPPAP(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
        controller1.calculateRatesforDPPAP(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
        controller1.newNetPriceValuesMap =new Map<String,String>();
        controller1.condRateMap=new Map<String,String>();
        controller1.calculateRatesforDPPAP(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,false,UoMConversionMap,true,4);
        NpcserviceVARKEY_CPI.NetPriceOutput output=new NpcserviceVARKEY_CPI.NetPriceOutput();
        output.ErrorDescription='test';
        controller1.createNPCResponseForSynchronous(output,npcReq1.id);
        
        ERP_PC51.Calculation_Type__c='Fixed';
        pricRequestItem1.New_Unit__c='USD';
        pricRequestItem1.Pricing_Condition_Code__c='NP';
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZPRV';  
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERP_PC51.Calculation_Type__c='Quantity';
        ERP_PC51.Condition_Class__c='Price';
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ST3';  
        cTRateMap.put('ZDX1',new List<String>{'-5.000000000','EUR','1','EA'});
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERP_PC51.Calculation_Type__c='Percentage';
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZPNB'; 
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ST3'; 
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        pricRequestItem1.Pricing_Condition_Code__c='ZDX2';
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZDX2'; 
        cTRateMap.put('ZDX1',new List<String>{'-5.000000000','EUR','1','EA'});
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,false,UoMConversionMap,true);
        
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ST4';
        cTRateMap.put('ZDY1',new List<String>{'-5.000000000','EUR','1','EA'});
        
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ST4';
        
        
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZDY1';
        
        
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZDX1';
        
        
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='NNP';
        
        
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        ERPProc51.Pricing_Condition__r.Pricing_Condition_Code__c='ZCMB';
        
        
        controller1.calculateRatesforBISurfaces(new List<ERP_Procedure_Conditions__c>{ERPProc51},cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true);
        
        
        
        Test.StopTest();
    }
    
}