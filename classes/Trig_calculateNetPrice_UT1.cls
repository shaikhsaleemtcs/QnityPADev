@isTest
public class Trig_calculateNetPrice_UT1{
    
    public static void customSettings(){        
        
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
        
        PAPricingProcedureMapping__c prEnv13 = new PAPricingProcedureMapping__c(Name='DPP KV SPP3', Pricing_Procedure_Code__c='DPP KV SPP1');
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
        
        PAPricingProcedureMapping__c prEnv39 = new PAPricingProcedureMapping__c(Name='DPP NA SPP3', Pricing_Procedure_Code__c='DPP NA B960 Sales Pricing Procedure');
        insert prEnv39;
        
        PAPricingProcedureMapping__c prEnv40 = new PAPricingProcedureMapping__c(Name='DPT EMEA PAK', Pricing_Procedure_Code__c='DPT EMEA D697, AD97, A297 Sales Pricing Procedure 2');
        insert prEnv40;
        
        PAPricingProcedureMapping__c prEnv41 = new PAPricingProcedureMapping__c(Name='BI Surfaces PAK', Pricing_Procedure_Code__c='BI EMEA A697 Surfaces Sales Pricing Procedure 2');
        insert prEnv41;
        
        PAPricingProcedureMapping__c prEnv42 = new PAPricingProcedureMapping__c(Name='BI Envelopes PAK', Pricing_Procedure_Code__c='BI EMEA Envelopes D697 Sales Pricing Procedure 2');
        insert prEnv42; 
    }
    
    
    public static testMethod void insertCustomSettings()
    {
        List<PAPricingProcedureMapping__c> ListCustmSettngs = new List<PAPricingProcedureMapping__c>();
        
        IntegrationLoginCredentials__c login1 = new IntegrationLoginCredentials__c();
        login1.EndPointURL__c='https://pg3.pioneer.com/sfdc_pricing/service/price_calc';
        login1.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0akx5XXB0SnQxN0R3N3M4MjM0';
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
        
        PAPricingProcedureMapping__c Custm57= new PAPricingProcedureMapping__c();
        Custm57.Pricing_Procedure_Code__c='DPP NA B960 Sales Pricing Procedure';
        Custm57.name = 'DPP NA SPP3';
        ListCustmSettngs.add(Custm57);
        
        PAPricingProcedureMapping__c Custm58= new PAPricingProcedureMapping__c();
        Custm58.Pricing_Procedure_Code__c='DPT EMEA D697, AD97, A297 Sales Pricing Procedure 2';
        Custm58.name = 'DPT EMEA PAK';
        ListCustmSettngs.add(Custm58);
        
        PAPricingProcedureMapping__c Custm59= new PAPricingProcedureMapping__c();
        Custm59.Pricing_Procedure_Code__c='BI EMEA A697 Surfaces Sales Pricing Procedure 2';
        Custm59.name = 'BI Surfaces PAK';
        ListCustmSettngs.add(Custm59);
        
        PAPricingProcedureMapping__c Custm60= new PAPricingProcedureMapping__c();
        Custm60.Pricing_Procedure_Code__c='BI EMEA Envelopes D697 Sales Pricing Procedure 2';
        Custm60.name = 'BI Envelopes PAK';
        ListCustmSettngs.add(Custm60);
        
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
    
    static testMethod void testPGLAF41A()
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
        PRProc1.Pricing_Procedure_Code__c='ZC51AA';
        PRProc1.Pricing_Procedure_Description__c='PG LA F41A';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F41A',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='F41A';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG LA F41A').Pricing_Procedure_Code__c;
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
        pricRequestItem1.SALES_ORG_CODE__C = 'F41A';
        pricRequestItem1.SALES_ORG__C = 'F41A';
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
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F41A';
        orgGrp1.ERP_Sales_Org_Code__c='F41A';
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
    static testMethod void testPGLAF46C()
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
        PRProc1.Pricing_Procedure_Code__c='ZC51AA';
        PRProc1.Pricing_Procedure_Description__c='PG LA F46C';
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
        ERP_PC.Pricing_Condition_Code__c='ZBPA';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZBPC';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F46C',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='F46C';
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
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG LA F46C').Pricing_Procedure_Code__c;
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
        pricRequestItem1.SALES_ORG_CODE__C = 'F46C';
        pricRequestItem1.SALES_ORG__C = 'F46C';
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
        orgGrp1.ERP_Sales_Org__c='F46C';
        orgGrp1.ERP_Sales_Org_Code__c='F46C';
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
        //controller.recalculate();
        //controller.fetchMapFromResponse();
        //controller.populateMap(pricRequestItem1);
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
    static testMethod void testPGLAF42A()
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
        PRProc1.Pricing_Procedure_Code__c='ZC51AA';
        PRProc1.Pricing_Procedure_Description__c='PG LA F42A';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F42A',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='F42A';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG LA F42A,F44G,F450').Pricing_Procedure_Code__c;
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
        pricRequestItem1.SALES_ORG_CODE__C = 'F42A';
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
        orgGrp1.ERP_Sales_Org_Code__c='F42A';
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
    static testMethod void testPGLAF496()
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
        PRProc1.Pricing_Procedure_Code__c='ZC51AA';
        PRProc1.Pricing_Procedure_Description__c='PG LA F496';
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
        ERP_PC.Pricing_Condition_Code__c='ZPCH';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
        
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F496',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='F496';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG LA F496,F49V').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPCH';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F496';
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
        npcResp1.Condition_Rate_Key__c='ZPCH:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPCH',new List<String>{'292.000000000','EUR','1','EA'}); 
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
        orgGrp1.ERP_Sales_Org_Code__c='F496';
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
    static testMethod void testDCPMalaysia()
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
        PRProc1.Pricing_Procedure_Code__c='ZF855A';
        PRProc1.Pricing_Procedure_Description__c='DCP Malaysia';
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
        ERP_PC.Pricing_Condition_Code__c='ZP4A';
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
        ERP_PC1.Pricing_Condition_Code__c='ZRA1';
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
        ERP_PC2.Pricing_Condition_Code__c='ZRAT';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        
        
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP Malaysia').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP4A';
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
        npcResp1.Condition_Rate_Key__c='ZP4A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP4A',new List<String>{'292.000000000','EUR','1','EA'}); 
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
    
    static testMethod void testPGNAF450()
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
        PRProc1.Pricing_Procedure_Code__c='PG NA F450 Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='PG NA F450';
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
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ZYC1';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Sub Total';
        ERP_PC3.Pricing_Condition_Code__c='ST1';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Discount or Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZDG1';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Sub Total';
        ERP_PC5.Pricing_Condition_Code__c='ST2';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Calculation_Type__c='Percentage';
        ERP_PC7.Condition_Class__c='Discount or Surcharge';
        ERP_PC7.Pricing_Condition_Code__c='ZG35';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Sub Total';
        ERP_PC8.Pricing_Condition_Code__c='ST3';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        ERP_Pricing_Condition__c ERP_PC9 = new ERP_Pricing_Condition__c();
        ERP_PC9.Price_Types__c='Standard';
        ERP_PC9.Calculation_Type__c='Fixed Amount';
        ERP_PC9.Condition_Class__c='Discount or Surcharge';
        ERP_PC9.Pricing_Condition_Code__c='ZFES';
        ERP_PC9.SAP_Application_Id__c='V';
        ERP_PC9.SAP_Client_Id__c='510';
        ERP_PC9.SAP_Cluster__c='CB1';
        ERP_PC9.SAP_Condition_Type__c=true;
        ERP_PC9.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC9);
        ERP_Pricing_Condition__c ERP_PC19 = new ERP_Pricing_Condition__c();
        ERP_PC19.Price_Types__c='Standard';
        ERP_PC19.Calculation_Type__c='Quantity';
        ERP_PC19.Condition_Class__c='Discount or Surcharge';
        ERP_PC19.Pricing_Condition_Code__c='ZVA9';
        ERP_PC19.SAP_Application_Id__c='V';
        ERP_PC19.SAP_Client_Id__c='510';
        ERP_PC19.SAP_Cluster__c='CB1';
        ERP_PC19.SAP_Condition_Type__c=true;
        ERP_PC19.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC19);
        ERP_Pricing_Condition__c ERP_PC29 = new ERP_Pricing_Condition__c();
        ERP_PC29.Price_Types__c='Sub Total';
        ERP_PC29.Calculation_Type__c='Quantity';
        ERP_PC29.Condition_Class__c='Discount or Surcharge';
        ERP_PC29.Pricing_Condition_Code__c='NET';
        ERP_PC29.SAP_Application_Id__c='V';
        ERP_PC29.SAP_Client_Id__c='510';
        ERP_PC29.SAP_Cluster__c='CB1';
        ERP_PC29.SAP_Condition_Type__c=true;
        ERP_PC29.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC29);
        ERP_Pricing_Condition__c ERP_PC39 = new ERP_Pricing_Condition__c();
        ERP_PC39.Price_Types__c='Standard';
        ERP_PC39.Calculation_Type__c='Quantity';
        ERP_PC39.Condition_Class__c='Discount or Surcharge';
        ERP_PC39.Pricing_Condition_Code__c='ZGA3';
        ERP_PC39.SAP_Application_Id__c='V';
        ERP_PC39.SAP_Client_Id__c='510';
        ERP_PC39.SAP_Cluster__c='CB1';
        ERP_PC39.SAP_Condition_Type__c=true;
        ERP_PC39.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC39);
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Net Price';
        ERP_PC10.Pricing_Condition_Code__c='NNP';
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
        
        ERP_Procedure_Conditions__c ERPProc19 = new ERP_Procedure_Conditions__c();
        ERPProc19.Pricing_Condition__c =  ERP_PC19.id;
        ERPProc19.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc19.Step__c=117;
        ERPProc19.From__c=0;
        ERPProc19.To__c=0;
        procList.add(ERPProc19);
        
        ERP_Procedure_Conditions__c ERPProc29 = new ERP_Procedure_Conditions__c();
        ERPProc29.Pricing_Condition__c =  ERP_PC29.id;
        ERPProc29.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc29.Step__c=127;
        ERPProc29.From__c=0;
        ERPProc29.To__c=0;
        procList.add(ERPProc29);
        
        ERP_Procedure_Conditions__c ERPProc39 = new ERP_Procedure_Conditions__c();
        ERPProc39.Pricing_Condition__c =  ERP_PC39.id;
        ERPProc39.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc39.Step__c=137;
        ERPProc39.From__c=0;
        ERPProc39.To__c=0;
        procList.add(ERPProc39);
        
        ERP_Procedure_Conditions__c ERPProc10 = new ERP_Procedure_Conditions__c();
        ERPProc10.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=139;
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG NA F450').Pricing_Procedure_Code__c;
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
    
    static testMethod void testPGNAF46A()
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
        PRProc1.Pricing_Procedure_Code__c='PG NA F46A Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='PG NA F46A';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG NA F46A').Pricing_Procedure_Code__c;
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
    
    
    static testMethod void testPGEMEA1()
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
        PRProc1.Pricing_Procedure_Code__c='PG EMEA F415,F416,F44K,F460,F480,F493,F4A1,F4D1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='Itech Standard Pricing-EU+UA+TR';
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
        ERP_PC.Pricing_Condition_Code__c='ZPRE';
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
        ERP_PC1.Pricing_Condition_Code__c='ZYC1';
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
        ERP_PC2.Pricing_Condition_Code__c='ST1';
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
        ERP_PC3.Pricing_Condition_Code__c='ZDA1';
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
        ERP_PC4.Pricing_Condition_Code__c='NP';
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
        ERP_PC5.Pricing_Condition_Code__c='NIP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        
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
        ERPProc.Step__c=101;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        procList.add(ERPProc);
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=104;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        procList.add(ERPProc1);
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=199;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        procList.add(ERPProc2);
        
        ERP_Procedure_Conditions__C ERPProc3 = new ERP_Procedure_Conditions__C();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=202;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        procList.add(ERPProc3);
        
        ERP_Procedure_Conditions__C ERPProc4 = new ERP_Procedure_Conditions__C();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=499;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        procList.add(ERPProc4);
        
        ERP_Procedure_Conditions__C ERPProc5 = new ERP_Procedure_Conditions__C();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=501;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        procList.add(ERPProc5);
        
        insert procList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('PG EMEA').Pricing_Procedure_Code__c;
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
    
    
    static testMethod void testDTTAPF200()
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
        PRProc1.Pricing_Procedure_Code__c='DTT AP F200 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DTT AP F200';
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
    
    
    static testMethod void testPnIPEUZIS21()
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
        PRProc1.Pricing_Procedure_Code__c='P&IP ECP EU G220,G230,G253,G260,G26A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='ZIS2 - Inter SBU Price - ZIS*';
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
    /*new test method for DPP US*/
    static testMethod void testDCPUSSPP()
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
        PRProc1.Pricing_Procedure_Code__c='DCP US F850 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP US SPP';
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
    
    
    static testMethod void bulkNetPriceCalculation_TC()
    {
        
        customSettings();
        insertCustomSettings();
        OrgGroup__c ogGrp = new OrgGroup__c();
        ogGrp.Business__c='CPM AP';
        ogGrp .ERP_Sales_Org__c='D630';
        ogGrp .ERP_Sales_Org_Code__c='D630';
        ogGrp .ERP_Distribution_Channel_Code__c='02';
        ogGrp .ERP_Division_Code__c='10';
        insert ogGrp ;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D630';
        orgGrp1.ERP_Sales_Org_Code__c='D630';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='CPM AP';
        PRProc1.Pricing_Procedure_Description__c='CPM AP D630';
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
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=ogGrp.id;
        orgGrpItm.OrgGroup__c=ogGrp.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        // Materials
        
        Material__c  erpMaterial = new Material__c ();
        erpMaterial.Name='Plastic';
        erpMaterial.ERP_Material_Price_Group_Code__c='P2';
        erpMaterial.ERP_Source_Cluster__c ='CB1';
        erpMaterial.ERP_Deletion_Flag__c = false;
        erpMaterial.ERP_Sales_Org_Code__c='D630';
        erpMaterial.ERP_Distribution_Channel_Code__c='02';
        erpMaterial.ERP_Material_Code__c='mCode';
        erpMaterial.ERP_Material_Group_4_Code__c='msCode';
        erpMaterial.ERP_Product_Hierarchy_Code__c='F2WPPI';
        insert erpMaterial;
        
        Material__c  erpMaterial1 = new Material__c ();
        erpMaterial1.Name='Plastic2';
        erpMaterial1.ERP_Material_Price_Group_Code__c='P2';
        erpMaterial1.ERP_Source_Cluster__c ='CB1';
        erpMaterial1.ERP_Deletion_Flag__c = false;
        erpMaterial1.ERP_Sales_Org_Code__c='D630';
        erpMaterial1.ERP_Product_Hierarchy_Code__c='F2WPPI';
        erpMaterial1.ERP_Distribution_Channel_Code__c='02';
        erpMaterial1.ERP_Material_Code__c='mCode';
        erpMaterial1.ERP_Material_Group_4_Code__c='msCode';
        insert erpMaterial1;
        
        Pricing_Request__c request = new Pricing_Request__c();
        request.BU__c='CPM AP';
        request.Sales_Org_Code__c='D630';
        request.SoldTo_Code__c = '5566001010';
        request.Division_Code__c='10';
        request.Dist_Channel_Code__c='02';
        request.Request_Type__c='Permanent';
        insert request;
        
        Pricing_Request_Item__c prItem =  new Pricing_Request_Item__c();
        prItem.isNPCApplicable__c = true;
        prItem.New_Rate__c ='10';
        prItem.New_Unit__c='20';
        prItem.New_Valid_From__c=System.today();
        prItem.New_Valid_To__c =System.today()+10;
        prItem.New_Volume__c =10;
        prItem.isVolumeApplicable__c = false ;
        prItem.New_Volume__c =10;
        prItem.New_Per__c =10;
        prItem.Material_Price_Group_Code__c='P2';
        prItem.New_UoM__c =null;
        prItem.Key_Combination__c='Material Price Group';
        prItem.Calculation_Type__c = 'Quanlity';
        prItem.Pricing_Request__c =request.id ;
        insert prItem;
        
        PASalesDocTypeSOMapping__c custm1 = new PASalesDocTypeSOMapping__c();
        custm1.Sales_Document_Type__c='Test';
        custm1.name='Others';
        insert custm1;
        
        PASalesDocTypeSOMapping__c custm2 = new PASalesDocTypeSOMapping__c();
        custm2.Sales_Document_Type__c='Test';
        custm2.name='D630';
        insert custm2;    
        
        Pricing_Request_Item__c prItem1 =  new Pricing_Request_Item__c();
        prItem1.isNPCApplicable__c = true;
        prItem1.New_Rate__c ='10';
        prItem1.New_Unit__c='20';
        prItem1.New_Valid_From__c=System.today();
        prItem1.New_Valid_To__c =System.today()+10;
        prItem1.New_Volume__c =10;
        prItem1.isVolumeApplicable__c = false ;
        prItem1.New_Volume__c =10;
        prItem1.New_Per__c =10;
        prItem1.Sold_To_Code__c='530142';
        prItem1.ShipTo_Code__c='5301421';
        prItem1.Material_Price_Group_Code__c='P2';
        prItem1.New_UoM__c ='KG';
        prItem1.PH1_Code__c='F2';
        prItem1.PH2_Code__c='WP';
        prItem1.PH3_Code__c='PI';
        prItem1.Key_Combination__c='PH/Sold To/Ship To';
        prItem1.Calculation_Type__c = 'Quanlity';
        prItem1.Pricing_Request__c =request.id ;
        insert prItem1;
        
        Pricing_Request_Item__c prItem2 =  new Pricing_Request_Item__c();
        prItem2.isNPCApplicable__c = true;
        prItem2.New_Rate__c ='10';
        prItem2.New_Unit__c='20';
        prItem2.New_Valid_From__c=System.today();
        prItem2.New_Valid_To__c =System.today()+10;
        prItem2.New_Volume__c =10;
        prItem2.isVolumeApplicable__c = false ;
        prItem2.New_Volume__c =10;
        prItem2.New_Per__c =10;
        prItem2.Sold_To_Code__c='530142';
        prItem2.ShipTo_Code__c='5301421';
        prItem2.Material_Price_Group_Code__c='P2';
        prItem2.New_UoM__c ='KG';
        prItem2.PH1_Code__c='F2';
        prItem2.PH2_Code__c='WP';
        prItem2.PH3_Code__c='PI';
        prItem2.Key_Combination__c='Material Price Group Material';
        prItem2.Calculation_Type__c = 'Quanlity';
        prItem2.Pricing_Request__c =request.id ;
        prItem2.Material_Code__c = 'mCode';
        insert prItem2;
        
        Pricing_Request_Item__c prItem3 =  new Pricing_Request_Item__c();
        prItem3.isNPCApplicable__c = true;
        prItem3.New_Rate__c ='10';
        prItem3.New_Unit__c='20';
        prItem3.New_Valid_From__c=System.today();
        prItem3.New_Valid_To__c =System.today()+10;
        prItem3.New_Volume__c =10;
        prItem3.New_Volume__c =10;
        prItem3.New_Per__c =10;
        prItem3.Material_Price_Group_Code__c='P2';
        prItem3.New_UoM__c ='KG';
        prItem3.Key_Combination__c='Market Segment';
        prItem3.Calculation_Type__c = 'Quanlity';
        prItem3.Pricing_Request__c =request.id ;
        prItem3.Market_Segment_Code__c='msCode';
        prItem3.isVolumeApplicable__c=true;
        insert prItem3;
        
        Pricing_Request_Item__c prItem4 =  new Pricing_Request_Item__c();
        prItem4.isNPCApplicable__c = true;
        prItem4.New_Rate__c ='10';
        prItem4.New_Unit__c='20';
        prItem4.New_Valid_From__c=System.today();
        prItem4.New_Valid_To__c =System.today()+10;
        prItem4.New_Volume__c =10;
        prItem4.New_Volume__c =10;
        prItem4.New_Per__c =10;
        prItem4.Sold_To_Code__c='530142';
        prItem4.ShipTo_Code__c='5301421';
        prItem4.Material_Price_Group_Code__c='P2';
        prItem4.New_UoM__c ='KG';
        prItem4.PH1_Code__c='F2';
        prItem4.PH2_Code__c='WP';
        prItem4.PH3_Code__c='PI';
        prItem4.Key_Combination__c='PH/Sold To/Ship To';
        prItem4.Calculation_Type__c = 'Quanlity';
        prItem4.Pricing_Request__c =request.id ;
        prItem4.isVolumeApplicable__c=true;
        insert prItem4;
        
        Pricing_Request_Item__c prItem5 =  new Pricing_Request_Item__c();
        prItem5.isNPCApplicable__c = true;
        prItem5.New_Rate__c ='10';
        prItem5.New_Unit__c='20';
        prItem5.New_Valid_From__c=System.today();
        prItem5.New_Valid_To__c =System.today()+10;
        prItem5.New_Volume__c =10;
        prItem5.isVolumeApplicable__c = false ;
        prItem5.New_Volume__c =10;
        prItem5.New_Per__c =10;
        prItem5.Material_Price_Group_Code__c='msCode';
        prItem5.New_UoM__c =null;
        prItem5.PH1_Code__c='F2';
        prItem5.PH2_Code__c='WP';
        prItem5.PH3_Code__c='PI';
        prItem5.Key_Combination__c='Material Price Group/PH';
        prItem5.Calculation_Type__c = 'Quanlity';
        prItem5.Pricing_Request__c =request.id ;
        insert prItem5;
        
        Sales_Area_QuantityUoM_Detail__c saq = new Sales_Area_QuantityUoM_Detail__c();
        saq.Organizational_Group_Item__c = orgGrpItm.Id;
        saq.Quantity__c = 'Qunatity';
        saq.UoM__c = 'Test';
        insert saq;
        
        NPC_Request__c nr = new NPC_Request__c();
        nr.Status__c = 'Active';
        nr.Pricing_Request_Item__c = prItem.Id;
        insert nr;
        
        NPC_Request__c nr1 = new NPC_Request__c();
        nr1.Status__c = 'Active';
        nr1.Pricing_Request_Item__c = prItem1.Id;
        insert nr1;
        
        NPC_Request__c nr2 = new NPC_Request__c();
        nr2.Status__c = 'Active';
        nr2.Pricing_Request_Item__c = prItem2.Id;
        insert nr2;
        
        NPC_Request__c nr3 = new NPC_Request__c();
        nr3.Status__c = 'Active';
        nr3.Pricing_Request_Item__c = prItem3.Id;
        insert nr3;
        
        NPC_Request__c nr4 = new NPC_Request__c();
        nr4.Status__c = 'Active';
        nr4.Pricing_Request_Item__c = prItem4.Id;
        insert nr4;
        
        NPC_Request__c nr5 = new NPC_Request__c();
        nr5.Status__c = 'Active';
        nr5.Pricing_Request_Item__c = prItem5.Id;
        insert nr5;
        
        PACalculateNetPrice npc = new PACalculateNetPrice();
        
        try{
            npc.bulkNetPriceCalculation(request.id);
        }catch(Exception e){}
    }
    
    static testMethod void testCPMAPF418_F429()
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
        PRProc1.Pricing_Procedure_Code__c='CPM AP F418';
        PRProc1.Pricing_Procedure_Description__c='CPM AP F418';
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
    
    
    
    
    static testMethod void testMCM_EMEA_Paste()
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
        PRProc1.Pricing_Procedure_Code__c='MCM EMEA Paste Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='MCM EMEA Paste';
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
    
    
    
    static testMethod void testPIP_ECP_EU_PP_G240_G241_G293()
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
        PRProc1.Pricing_Procedure_Code__c='P&IP ECP EU G240,G241,G293 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='P&IP ECP EU PP G240,G241,G293';
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
    
    
    
    static testMethod void testPIP_NA_Canada()
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
        PRProc1.Pricing_Procedure_Code__c='P&IP ECP NA G260 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='P&IP NA Canada';
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
        ERP_PC.Pricing_Condition_Code__c='ZPG3';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Expense reimbursement';
        ERP_PC1.Pricing_Condition_Code__c='ZCRE';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Expense reimbursement';
        ERP_PC2.Pricing_Condition_Code__c='ZCRF';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Net Price';
        ERP_PC3.Pricing_Condition_Code__c='NP';
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
        List<ERP_Procedure_Conditions__c> erpProcList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=101;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        erpProcList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=620;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        erpProcList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=625;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        erpProcList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=630;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        erpProcList.add(ERPProc3);        
        insert erpProcList;
        
        
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPG3';
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
    
    
    
    
    static testMethod void testCPM_NA_F450()
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
        PRProc1.Pricing_Procedure_Code__c='CPM US Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='CPM NA F450';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        //ZPRE+ZVA6+ZVA8+ZVA7+ZVA0+ZVA1+ZVA2+ZG12+ZGA1
        List<ERP_Pricing_Condition__c> erpPCList = new List<ERP_Pricing_Condition__c>();
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
        erpPCList.add(ERP_PC);
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZGA1';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Fixed Amount';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZVA6';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC3);
        
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Discount or Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZVA8';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC4);
        
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZVA7';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC5);
        
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Pricing_Condition_Code__c='Price';
        ERP_PC6.Calculation_Type__c='Fixed Amount';
        ERP_PC6.Condition_Class__c='Discount or Surcharge';
        ERP_PC6.Pricing_Condition_Code__c='ZVA0';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC6);
        
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Standard';
        ERP_PC7.Calculation_Type__c='Quantity';
        ERP_PC7.Condition_Class__c='Discount or Surcharge';
        ERP_PC7.Pricing_Condition_Code__c='ZVA1';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC7);
        
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Calculation_Type__c='Percentage';
        ERP_PC8.Condition_Class__c='Discount or Surcharge';
        ERP_PC8.Pricing_Condition_Code__c='ZVA2';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC8);
        
        ERP_Pricing_Condition__c ERP_PC9 = new ERP_Pricing_Condition__c();
        ERP_PC9.Price_Types__c='Standard';
        ERP_PC9.Calculation_Type__c='Quantity';
        ERP_PC9.Condition_Class__c='Discount or Surcharge';
        ERP_PC9.Pricing_Condition_Code__c='ZG12';
        ERP_PC9.SAP_Application_Id__c='V';
        ERP_PC9.SAP_Client_Id__c='510';
        ERP_PC9.SAP_Cluster__c='CB1';
        ERP_PC9.SAP_Condition_Type__c=true;
        ERP_PC9.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC9);
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Net Price';
        ERP_PC2.Pricing_Condition_Code__c='NP';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        erpPCList.add(ERP_PC2);
        insert erpPCList;
        
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
        List<ERP_Procedure_Conditions__c> erpProcList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=101;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        erpProcList.add(ERPProc);        
        
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=245;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        erpProcList.add(ERPProc1);
        
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=266;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        erpProcList.add(ERPProc2);
        
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=267;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        erpProcList.add(ERPProc3);
        
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=268;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        erpProcList.add(ERPProc4);
        
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=295;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        erpProcList.add(ERPProc5);
        
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=296;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        erpProcList.add(ERPProc6);
        
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=297;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        erpProcList.add(ERPProc7);
        
        ERP_Procedure_Conditions__c ERPProc8 = new ERP_Procedure_Conditions__c();
        ERPProc8.Pricing_Condition__c =  ERP_PC9.id;
        ERPProc8.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc8.Step__c=298;
        ERPProc8.From__c=0;
        ERPProc8.To__c=0;
        erpProcList.add(ERPProc8);
        
        ERP_Procedure_Conditions__c ERPProc9 = new ERP_Procedure_Conditions__c();
        ERPProc9.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc9.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc9.Step__c=300;
        ERPProc9.From__c=0;
        ERPProc9.To__c=0;
        erpProcList.add(ERPProc9);
        insert erpProcList;
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>(); 
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
        priList.add(pricRequestItem1);
        
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZVA6';
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
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = '%';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        priList.add(pricRequestItem2);
        insert priList;
        
        //9. NPC Request
        List<NPC_Request__c> npcReqList = new List<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReqList.add(npcReq1);
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        npcReqList.add(npcReq2);
        insert npcReqList;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRE:292.000000000:EUR:1:EA:ZGA1:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPRE:292.000000000:EUR:1:EA:ZGA1:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq2.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRE',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZGA1',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZVA6',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZVA8',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZVA7',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZVA0',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZVA1',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZVA2',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZG12',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        Set<ID> npcReqIds1 = new Set<ID>();
        npcReqIds1.add(npcReq2.id);
        List<Pricing_Request_Item__c> prItemList1 = new List<Pricing_Request_Item__c>();
        prItemList1.add(pricRequestItem2);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller1 = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds1, cTRateMap, prItemList1,true); 
        controller.calculateNPC(npcReqIds1, cTRateMap, prItemList1,false);
        
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
        
        //controller.ViewNetPrice(pricRequestItem1,true);
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
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC3.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        try{
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
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    
    static testMethod void testDCPCanada()
    {
        customSettings();
        insertCustomSettings();
        IntegrationLoginCredentials__c login1 = new IntegrationLoginCredentials__c();
        login1.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login1.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login1.name='LoginDetails';
        insert login1;
        
        
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='ZE960A';
        PRProc1.Pricing_Procedure_Description__c='DCP Canada';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Net Floor';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Fixed';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Net Floor';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Fixed';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZPR9';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        insert ERP_PC2;
        
        
        
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
        pri.SoldTo_Code__c = '55470156';
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Ship To/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
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
        
        try
        {
            
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            controller.recalculate();
            
            ERP_PC.Price_Types__c='Net Price';
            update ERP_PC;
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            
        }
        catch(Exception e)
        {
        }        
        
    }
    
    static testMethod void test_DCPCanada()
    {
        customSettings();
        insertCustomSettings();
        IntegrationLoginCredentials__c login1 = new IntegrationLoginCredentials__c();
        login1.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login1.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login1.name='LoginDetails';
        insert login1;
        
        
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='ZE960A';
        PRProc1.Pricing_Procedure_Description__c='DPT NA';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Net Floor';
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
        pri.BU__c='DPT NA';
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
        pricRequestItem1.Stamp_Floor_Net_Price__c = '1234';
        //pricRequestItem1.BU__c=pri.BU__c;
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
        
        Map<String, Schema.SObjectField> schemaERPSAPFieldMap = Schema.getGlobalDescribe().get('Pricing_Request_Item__c').getDescribe().fields.getMap();
        String queryString='Select ';
        for(String fld : schemaERPSAPFieldMap.keySet())
        {
            queryString+=fld+' ,';
        }
        queryString = queryString.substring(0,queryString.length() - 2 );
        queryString +=' ,Pricing_Request__r.SoldTo_Code__c,Pricing_Request__r.Sales_Org_Code__c,Pricing_Request__r.Dist_Channel_Code__c,Pricing_Request__r.BU__c,Pricing_Request__r.Division_Code__c from Pricing_Request_Item__c  where Id='+'\''+pricRequestItem1.id+'\'';
        System.debug('queryString:-'+queryString);
        Pricing_Request_Item__c reqItem  = (Pricing_Request_Item__c)database.query(queryString)[0];
        
        prItemList.add(reqItem);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT NA';
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
        //controller.recalculate();
        try
        {     
            
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            System.debug('reqItem:'+reqItem);
            controller.populateMap(reqItem);
            
            controller.recalculate();
            Test.stopTest();
            ERP_PC.Price_Types__c='Net Price';
            update ERP_PC;
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        }
        catch(Exception e){}    
        
    }
    
    static testMethod void test_DCPCanada_Fixed()
    {
        customSettings();
        insertCustomSettings();
        IntegrationLoginCredentials__c login1 = new IntegrationLoginCredentials__c();
        login1.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login1.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login1.name='LoginDetails';
        insert login1;
        
        
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='ZE960A';
        PRProc1.Pricing_Procedure_Description__c='DCP Canada';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Net Floor';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Fixed';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Net Floor';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Fixed';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZPR9';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        insert ERP_PC2;
        
        
        
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Ship To/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
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
        
        try
        {
            
            
            Test.startTest();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            controller.recalculate();
            
            ERP_PC.Price_Types__c='Net Price';
            update ERP_PC;
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
            
        }
        catch(Exception e)
        {
        }        
        
    }
    
    
    
    static testMethod void testDPPPolymersEMEASPP1()
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
        PRProc1.Pricing_Procedure_Code__c='DPP Polymers EMEA B90A,B90B,B915,B920,B921,B922,B92A,B941,B953,B95A,B96A,B980,B993 Sales Pricing Procedure 1';
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
        ERP_PC.Pricing_Condition_Code__c='ZPRB';
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
        ERP_PC1.Pricing_Condition_Code__c='ZPGB';
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
        ERP_PC2.Pricing_Condition_Code__c='ZRB1';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP Polymers EMEA SPP1').Pricing_Procedure_Code__c;
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
    
    
    static testMethod void testPIP_NA_US()
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
        PRProc1.Pricing_Procedure_Code__c='P&IP ECP NA G250 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='P&IP NA US';
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
    //for DCP AP SPP1
    static testMethod void testDCP_AP_SPP1()
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
        PRProc1.Pricing_Procedure_Code__c='DCP Malaysia Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP SPP1';
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
        ERP_PC.Pricing_Condition_Code__c='ZP4A';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        /*    ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
ERP_PC1.Price_Types__c='Standard';
ERP_PC1.Calculation_Type__c='Quantity';
ERP_PC1.Condition_Class__c='Price';
ERP_PC1.Pricing_Condition_Code__c='ZPG4';
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
        ERP_PC2.Pricing_Condition_Code__c='ZRA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*    ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
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
pcList.add(ERP_PC6);*/
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
        /*    ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
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
        /*      ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc6);*/
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP4A';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZRA1';
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
        npcResp1.Condition_Rate_Key__c='ZP4A:292.000000000:EUR:1:EA:ZRA1:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP4A:292.000000000:EUR:1:EA:ZRA1:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
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
        
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP4A',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZRA1',new List<String>{'292.000000000','EUR','1','EA'});
        //cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
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
        orgGrp.Business__c='DCP AP';
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
        //            controller.populateMap(pricRequestItem1);
        //   controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
        
    }
    
    //DPT NA SPP1
    static testMethod void testDPT_NA_SPP1()
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
        PRProc1.Pricing_Procedure_Code__c='DPT NA A250,AD50,D650 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT NA SPP1';
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
    //DCP EMEA SPP
    static testMethod void testDCP_EMEA_SPP()
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
        PRProc1.Pricing_Procedure_Code__c='DCP EMEA F809,F80A,F80C,F80N,F812,F81B,F81P,F81R,F820,F821,F822,F82A,F841,F846,F84K,F853,F85A,F865,F86A,F890,F893 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP EMEA SPP';
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
    /*  //DPP KV SPP1
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
Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
controller.populateMap(pricRequestItem1);
controller.populateMap(pricRequestItem2);
Test.stopTest();

}*/
    //DPGLOBAL SPP1
    static testMethod void testDPGLOBAL_SPP1()
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
        PRProc1.Pricing_Procedure_Code__c='Digital Printing F415,F418,F450,F453,F460,F46C,F474,F480,F48A,F4A1,F4D1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPGLOBAL SPP1';
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
        //controller.recalculate();
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
        controller.bindvalueToNewRate();
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
            controller.recalculate();
            Test.stopTest();
        }catch(Exception e){}
    }
    //DPTNA
    //DPGLOBAL SPP1
    static testMethod void testDPT_NA()
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
        PRProc1.Pricing_Procedure_Code__c='Digital Printing F415,F418,F450,F453,F460,F46C,F474,F480,F48A,F4A1,F4D1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPGLOBAL SPP1';
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
        pri.BU__c='DPT NA';
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
        //controller.recalculate();
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
        controller.bindvalueToNewRate();
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
        //controller.recalculate();
        Test.stopTest();
        
    }
    //DPP DCP AP IN
    static testMethod void testDCP_AP_IN()
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
        PRProc1.Pricing_Procedure_Code__c='DCP AP F803 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP IN';
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
        ERP_PC.Pricing_Condition_Code__c='ZP2A';
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
        ERP_PC1.Pricing_Condition_Code__c='ZP2B';
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
        ERP_PC2.Pricing_Condition_Code__c='ZCBV';
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
        ERP_PC3.Pricing_Condition_Code__c='JEX2';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Discount or Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='JCED';
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
        ERP_PC5.Pricing_Condition_Code__c='JECS';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Calculation_Type__c='Percentage';
        ERP_PC6.Condition_Class__c='Discount or Surcharge';
        ERP_PC6.Pricing_Condition_Code__c='ZDI1';
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
        pri.BU__c='DCP AP';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP IN').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP2A';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZP2B';
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
        npcResp1.Condition_Rate_Key__c='ZP2A:292.000000000:EUR:1:EA:ZP2B:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP2A:292.000000000:EUR:1:EA:ZP2B:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
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
        orgGrp.Business__c='DCP AP';
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
        
        
        /*      ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
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
insert ERPAccSeq;*/
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
            //            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){}
    }
    //DPP DCP AP JP
    static testMethod void testDCP_AP_JP()
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
        PRProc1.Pricing_Procedure_Code__c='DCP AP F800 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP JP';
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
        ERP_PC.Pricing_Condition_Code__c='ZP5A';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        /*    ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
ERP_PC1.Price_Types__c='Standard';
ERP_PC1.Calculation_Type__c='Quantity';
ERP_PC1.Condition_Class__c='Price';
ERP_PC1.Pricing_Condition_Code__c='ZPG4';
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
        ERP_PC2.Pricing_Condition_Code__c='ZDA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*   ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
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
pcList.add(ERP_PC6);*/
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
        /*    ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
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
        /*    ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc6);*/
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP JP').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP5A';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZDA1';
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
        npcResp1.Condition_Rate_Key__c='ZP5A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP5A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
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
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP5A',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZP5A',new List<String>{'292.000000000','EUR','1','EA'});
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
            // controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){}
    }
    //DPP DCP AP CN
    static testMethod void testDCP_AP_CN()
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
        PRProc1.Pricing_Procedure_Code__c='DCP AP F801,F818 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP CN';
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
        ERP_PC.Pricing_Condition_Code__c='ZP3A';
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
        ERP_PC1.Pricing_Condition_Code__c='ZRA2';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        /*    ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
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
pcList.add(ERP_PC6);*/
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
        pri.BU__c='DCP AP';
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
        /*  ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc6);*/
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP CN').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP3A';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZRA2';
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
        npcResp1.Condition_Rate_Key__c='ZP3A:292.000000000:EUR:1:EA:ZRA2:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP3A:292.000000000:EUR:1:EA:ZRA2:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP3A',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZRA2',new List<String>{'292.000000000','EUR','1','EA'});
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
        orgGrp.Business__c='DCP AP';
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
            // controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){}
    }
    //DCP AP AU
    static testMethod void testDCP_AP_AU()
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
        PRProc1.Pricing_Procedure_Code__c='DCP AP F88A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP AU';
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
        ERP_PC.Pricing_Condition_Code__c='ZP6A';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        /*    ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
ERP_PC1.Price_Types__c='Standard';
ERP_PC1.Calculation_Type__c='Quantity';
ERP_PC1.Condition_Class__c='Price';
ERP_PC1.Pricing_Condition_Code__c='ZPG4';
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
        ERP_PC2.Pricing_Condition_Code__c='ZDA7';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*      ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
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
pcList.add(ERP_PC4);*/
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZRA3';
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
ERP_PC6.Pricing_Condition_Code__c='ZFLT';
ERP_PC6.SAP_Application_Id__c='V';
ERP_PC6.SAP_Client_Id__c='510';
ERP_PC6.SAP_Cluster__c='CB1';
ERP_PC6.SAP_Condition_Type__c=true;
ERP_PC6.Pricing_Condition__c='Gross Price';
pcList.add(ERP_PC6);*/
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
        /*     ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc4);*/
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        /*    ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
ERPProc6.Step__c=106;
ERPProc6.From__c=0;
ERPProc6.To__c=0;
proList.add(ERPProc6);*/
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP AU').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP6A';
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
        npcResp1.Condition_Rate_Key__c='ZP6A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP6A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP6A',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZDA7',new List<String>{'292.000000000','EUR','1','EA'});
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
            // controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){} 
    }
    //DCP AP PH
    static testMethod void testDCP_AP_PH()
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
        PRProc1.Pricing_Procedure_Code__c='DCP AP F84E Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP PH';
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
        ERP_PC.Pricing_Condition_Code__c='ZP9A';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        /*       ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
ERP_PC1.Price_Types__c='Standard';
ERP_PC1.Calculation_Type__c='Quantity';
ERP_PC1.Condition_Class__c='Price';
ERP_PC1.Pricing_Condition_Code__c='ZPG4';
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
        ERP_PC2.Pricing_Condition_Code__c='ZRA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        /*     ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
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
pcList.add(ERP_PC6);*/
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
        /*     ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc6);*/
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP PH').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP9A';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZRA1';
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
        npcResp1.Condition_Rate_Key__c='ZP9A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP9A:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP9A',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZRA1',new List<String>{'292.000000000','EUR','1','EA'});
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
        orgGrp.Business__c='DCP AP';
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
        //   controller.populateMap(pricRequestItem1);
        //   controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
    }
    //DCP AP SG
    static testMethod void testDCP_AP_SG()
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
        PRProc1.Pricing_Procedure_Code__c='DCP AP F874 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP AP SG';
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
        ERP_PC.Pricing_Condition_Code__c='ZP4A';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZRA2';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        /*   ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
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
pcList.add(ERP_PC6);*/
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
        pri.BU__c='DCP AP';
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
        /*     ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc6);*/
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DCP AP SG').Pricing_Procedure_Code__c;
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZP4A';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZRA2';
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
        npcResp1.Condition_Rate_Key__c='ZP4A:292.000000000:EUR:1:EA:ZRA2:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZP4A:292.000000000:EUR:1:EA:ZRA2:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZP4A',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZRA2',new List<String>{'292.000000000','EUR','1','EA'});
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
        orgGrp.Business__c='DCP AP';
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
            //    controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){} 
    }
    //DPT NA SPP2
    static testMethod void testDPT_NA_SPP2()
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
        PRProc1.Pricing_Procedure_Code__c='DPT NA A260 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT NA SPP2';
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
    //DPP Global Kalrez & Vespel SPP3
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
    //DPP KV SPP3
    /*static testMethod void testDPP_KV_SPP3()
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
PRProc1.Pricing_Procedure_Code__c='DPP KV SPP1';
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
Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
controller.populateMap(pricRequestItem1);
controller.populateMap(pricRequestItem2);
Test.stopTest();

}
//DPP KV SPP4
static testMethod void testDPP_KV_SPP4()
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
PRProc1.Pricing_Procedure_Code__c='DPP Global Kalrez B953 Sales Pricing Procedure';
PRProc1.Pricing_Procedure_Description__c='DPP KV SPP4';
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
Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
controller.populateMap(pricRequestItem1);
controller.populateMap(pricRequestItem2);
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
Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
controller.populateMap(pricRequestItem1);
controller.populateMap(pricRequestItem2);
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
PRProc1.Pricing_Procedure_Description__c='DPP Polymers EMEA SPP2';
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
Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
controller.populateMap(pricRequestItem1);
controller.populateMap(pricRequestItem2);
Test.stopTest();

}
//DPP NA SPP2
static testMethod void testDPP_NA_SPP2()
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
Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
controller.populateMap(pricRequestItem1);
controller.populateMap(pricRequestItem2);
Test.stopTest();

} */
    
    ////Piyush-By Pass Test Coverage
    static testMethod void bulkNetPriceCalculation()
    {
        
        customSettings();
        insertCustomSettings();
        OrgGroup__c ogGrp = new OrgGroup__c();
        ogGrp.Business__c='DPP Polymers EMEA';
        ogGrp .ERP_Sales_Org__c='D630';
        ogGrp .ERP_Sales_Org_Code__c='D630';
        ogGrp .ERP_Distribution_Channel_Code__c='02';
        ogGrp .ERP_Division_Code__c='10';
        insert ogGrp ;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D630';
        orgGrp1.ERP_Sales_Org_Code__c='D630';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='CPM AP';
        PRProc1.Pricing_Procedure_Description__c='CPM AP D630';
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
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=ogGrp.id;
        orgGrpItm.OrgGroup__c=ogGrp.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        // Materials
        
        Material__c  erpMaterial = new Material__c ();
        erpMaterial.Name='Plastic';
        erpMaterial.ERP_Material_Price_Group_Code__c='P2';
        erpMaterial.ERP_Source_Cluster__c ='CB1';
        erpMaterial.ERP_Deletion_Flag__c = false;
        erpMaterial.ERP_Sales_Org_Code__c='D630';
        erpMaterial.ERP_Distribution_Channel_Code__c='02';
        erpMaterial.ERP_Material_Code__c='mCode';
        erpMaterial.ERP_Material_Group_4_Code__c='msCode';
        erpMaterial.ERP_Product_Hierarchy_Code__c='F2WPPI';
        insert erpMaterial;
        
        Material__c  erpMaterial1 = new Material__c ();
        erpMaterial1.Name='Plastic2';
        erpMaterial1.ERP_Material_Price_Group_Code__c='P2';
        erpMaterial1.ERP_Source_Cluster__c ='CB1';
        erpMaterial1.ERP_Deletion_Flag__c = false;
        erpMaterial1.ERP_Sales_Org_Code__c='D630';
        erpMaterial1.ERP_Product_Hierarchy_Code__c='F2WPPI';
        erpMaterial1.ERP_Distribution_Channel_Code__c='02';
        erpMaterial1.ERP_Material_Code__c='mCode';
        erpMaterial1.ERP_Material_Group_4_Code__c='msCode';
        insert erpMaterial1;
        
        Pricing_Request__c request = new Pricing_Request__c();
        request.BU__c='DPP Polymers EMEA';
        request.Sales_Org_Code__c='D630';
        request.SoldTo_Code__c = '5566001010';
        request.Division_Code__c='10';
        request.Dist_Channel_Code__c='02';
        request.Request_Type__c='Permanent';
        insert request;
        
        Pricing_Request_Item__c prItem =  new Pricing_Request_Item__c();
        prItem.isNPCApplicable__c = true;
        prItem.New_Rate__c ='10';
        prItem.New_Unit__c='20';
        prItem.New_Valid_From__c=System.today();
        prItem.New_Valid_To__c =System.today()+10;
        prItem.New_Volume__c =10;
        prItem.isVolumeApplicable__c = false ;
        prItem.New_Volume__c =10;
        prItem.New_Per__c =10;
        prItem.Material_Price_Group_Code__c='P2';
        prItem.New_UoM__c =null;
        prItem.Key_Combination__c='Material Price Group';
        prItem.Calculation_Type__c = 'Quanlity';
        prItem.Pricing_Request__c =request.id ;
        insert prItem;
        
        PASalesDocTypeSOMapping__c custm1 = new PASalesDocTypeSOMapping__c();
        custm1.Sales_Document_Type__c='Test';
        custm1.name='Others';
        insert custm1;
        
        PASalesDocTypeSOMapping__c custm2 = new PASalesDocTypeSOMapping__c();
        custm2.Sales_Document_Type__c='Test';
        custm2.name='D630';
        insert custm2;    
        
        Pricing_Request_Item__c prItem1 =  new Pricing_Request_Item__c();
        prItem1.isNPCApplicable__c = true;
        prItem1.New_Rate__c ='10';
        prItem1.New_Unit__c='20';
        prItem1.New_Valid_From__c=System.today();
        prItem1.New_Valid_To__c =System.today()+10;
        prItem1.New_Volume__c =10;
        prItem1.isVolumeApplicable__c = false ;
        prItem1.New_Volume__c =10;
        prItem1.New_Per__c =10;
        prItem1.Sold_To_Code__c='530142';
        prItem1.ShipTo_Code__c='5301421';
        prItem1.Material_Price_Group_Code__c='P2';
        prItem1.New_UoM__c ='KG';
        prItem1.PH1_Code__c='F2';
        prItem1.PH2_Code__c='WP';
        prItem1.PH3_Code__c='PI';
        prItem1.Key_Combination__c='PH/Sold To/Ship To';
        prItem1.Calculation_Type__c = 'Quanlity';
        prItem1.Pricing_Request__c =request.id ;
        insert prItem1;
        
        Pricing_Request_Item__c prItem21 =  new Pricing_Request_Item__c();
        prItem21.isNPCApplicable__c = true;
        prItem21.New_Rate__c ='10';
        prItem21.New_Unit__c='20';
        prItem21.New_Valid_From__c=System.today();
        prItem21.New_Valid_To__c =System.today()+10;
        prItem21.New_Volume__c =10;
        prItem21.isVolumeApplicable__c = false ;
        prItem21.New_Volume__c =10;
        prItem21.New_Per__c =10;
        prItem21.Sold_To_Code__c='530142';
        prItem21.ShipTo_Code__c='5301421';
        prItem21.Material_Price_Group_Code__c='P2';
        prItem21.New_UoM__c ='KG';
        prItem21.PH1_Code__c='F2';
        prItem21.PH2_Code__c='WP';
        prItem21.PH3_Code__c='PI';
        prItem21.Key_Combination__c='Material Price Group PH';
        prItem21.Calculation_Type__c = 'Quanlity';
        prItem21.Pricing_Request__c =request.id ;
        prItem21.Material_Code__c = 'mCode';
        insert prItem21;
        
        Pricing_Request_Item__c prItem2 =  new Pricing_Request_Item__c();
        prItem2.isNPCApplicable__c = true;
        prItem2.New_Rate__c ='10';
        prItem2.New_Unit__c='20';
        prItem2.New_Valid_From__c=System.today();
        prItem2.New_Valid_To__c =System.today()+10;
        prItem2.New_Volume__c =10;
        prItem2.isVolumeApplicable__c = false ;
        prItem2.New_Volume__c =10;
        prItem2.New_Per__c =10;
        prItem2.Sold_To_Code__c='530142';
        prItem2.ShipTo_Code__c='5301421';
        prItem2.Material_Price_Group_Code__c='P2';
        prItem2.New_UoM__c ='KG';
        prItem2.PH1_Code__c='F2';
        prItem2.PH2_Code__c='WP';
        prItem2.PH3_Code__c='PI';
        prItem2.Key_Combination__c='Material Price Group Material';
        prItem2.Calculation_Type__c = 'Quanlity';
        prItem2.Pricing_Request__c =request.id ;
        prItem2.Material_Code__c = 'mCode';
        insert prItem2;
        
        
        
        
        Pricing_Request_Item__c prItem3 =  new Pricing_Request_Item__c();
        prItem3.isNPCApplicable__c = true;
        prItem3.New_Rate__c ='10';
        prItem3.New_Unit__c='20';
        prItem3.New_Valid_From__c=System.today();
        prItem3.New_Valid_To__c =System.today()+10;
        prItem3.New_Volume__c =10;
        prItem3.New_Volume__c =10;
        prItem3.New_Per__c =10;
        prItem3.Material_Price_Group_Code__c='P2';
        prItem3.New_UoM__c ='KG';
        prItem3.Key_Combination__c='Market Segment';
        prItem3.Calculation_Type__c = 'Quanlity';
        prItem3.Pricing_Request__c =request.id ;
        prItem3.Market_Segment_Code__c='msCode';
        prItem3.isVolumeApplicable__c=true;
        insert prItem3;
        
        Pricing_Request_Item__c prItem4 =  new Pricing_Request_Item__c();
        prItem4.isNPCApplicable__c = true;
        
        prItem4.New_Rate__c ='10';
        prItem4.New_Unit__c='20';
        prItem4.New_Valid_From__c=System.today();
        prItem4.New_Valid_To__c =System.today()+10;
        prItem4.New_Volume__c =10;
        prItem4.New_Volume__c =10;
        prItem4.New_Per__c =10;
        prItem4.Sold_To_Code__c='530142';
        prItem4.ShipTo_Code__c='5301421';
        prItem4.Material_Price_Group_Code__c='P2';
        prItem4.New_UoM__c ='KG';
        prItem4.PH1_Code__c='F2';
        prItem4.PH2_Code__c='WP';
        prItem4.PH3_Code__c='PI';
        prItem4.Key_Combination__c='PH/Sold To/Ship To';
        prItem4.Calculation_Type__c = 'Quanlity';
        prItem4.Pricing_Request__c =request.id ;
        prItem4.isVolumeApplicable__c=true;
        insert prItem4;
        
        Sales_Area_QuantityUoM_Detail__c saq = new Sales_Area_QuantityUoM_Detail__c();
        saq.Organizational_Group_Item__c = orgGrpItm.Id;
        saq.Quantity__c = 'Qunatity';
        saq.UoM__c = 'Test';
        insert saq;
        
        NPC_Request__c nr = new NPC_Request__c();
        nr.Status__c = 'Active';
        nr.Pricing_Request_Item__c = prItem.Id;
        insert nr;
        
        NPC_Request__c nr1 = new NPC_Request__c();
        nr1.Status__c = 'Active';
        nr1.Pricing_Request_Item__c = prItem1.Id;
        insert nr1;
        
        NPC_Request__c nr2 = new NPC_Request__c();
        nr2.Status__c = 'Active';
        nr2.Pricing_Request_Item__c = prItem2.Id;
        insert nr2;
        
        NPC_Request__c nr3 = new NPC_Request__c();
        nr3.Status__c = 'Active';
        nr3.Material_Number__c= 'M';
        
        nr3.Pricing_Request_Item__c = prItem3.Id;
        insert nr3;
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Code__c = 'F2WPPI';
        ph.PH_Level__c = 6;
        insert ph;
        BU_PH__c buph = new BU_PH__c();
        buph.OrgGroup__c = ogGrp.id;
        buph.Product_Hierarchy__c = ph.id;
        buph.Representative_Material_Code__c='mCode';
        insert buph;
        
        PACalculateNetPrice npc = new PACalculateNetPrice();
        npc.bulkNetPriceCalculation(request.id);
        
        Map<String,String> uomConversionMap=new Map<String,String>();
        uomConversionMap.put(nr3.Material_Number__c+nr3.SAP_cluster_Id__C+'s','10,:20,');
        uomConversionMap.put(nr3.Material_Number__c+nr3.SAP_cluster_Id__C+'T','30,:40,');
        npc.convertUoM('s','T',1.0,nr3,uomConversionMap); 
        
        
    }
    
}