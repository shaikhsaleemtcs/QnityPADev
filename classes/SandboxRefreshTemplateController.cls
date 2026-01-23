/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 12th Feb 2020
Description: This controller class is being used for Refresh Template which uses SandboxPostCopy interface. Whenever the Sandbox
             will refresh/Create then this controller will get called and it will update records on multiple objects using multiple batch classes
**********************************************************************************************/
global class SandboxRefreshTemplateController implements SandboxPostCopy {
    global void runApexClass(SandboxContext context) {
        if (context != null) {
        	DD_SandboxPostscript.Init();
            run();
        }
    }
    
    global static void run() {
        ID batchProcessID;
        
        BatchUpdate_ERPCustomer erpc = new BatchUpdate_ERPCustomer();
        BatchUpdate_Materials mat = new BatchUpdate_Materials();
        BatchUpdate_MaterialConversion matc = new BatchUpdate_MaterialConversion();
        BatchUpdate_ERPRelationship erpr = new BatchUpdate_ERPRelationship();
        BatchUpdate_PricingProcedure pp = new BatchUpdate_PricingProcedure();
        BatchUpdate_PricingCondition pc = new BatchUpdate_PricingCondition();
        BatchUpdate_KeyCombinition kc = new BatchUpdate_KeyCombinition();
        BatchUpdate_PricingRequest pr = new BatchUpdate_PricingRequest ();
        BatchUpdate_PricingRequestItem pri = new BatchUpdate_PricingRequestItem();
        BatchUpdate_CustomerLocalization cl = new BatchUpdate_CustomerLocalization();
        BatchUpdate_MaterialLocalization ml = new BatchUpdate_MaterialLocalization();
        BatchUpdate_ExportSap_Timeline et = new BatchUpdate_ExportSap_Timeline();
        BatchUpdate_SalesPriceNonSAP sp = new BatchUpdate_SalesPriceNonSAP();
        BatchUpdate_PricesSAP ps = new BatchUpdate_PricesSAP();
        
        batchProcessID = Database.executeBatch(erpc, 200);
        batchProcessID = Database.executeBatch(mat, 200);
        batchProcessID = Database.executeBatch(matc, 200);
        batchProcessID = Database.executeBatch(erpr, 200);
        batchProcessID = Database.executeBatch(pp, 200);
        batchProcessID = Database.executeBatch(pc, 200);
        batchProcessID = Database.executeBatch(kc, 200);
        batchProcessID = Database.executeBatch(pr, 200);
        batchProcessID = Database.executeBatch(pri, 200);
        batchProcessID = Database.executeBatch(cl, 200);
        batchProcessID = Database.executeBatch(ml, 200);
        batchProcessID = Database.executeBatch(et, 200);
        batchProcessID = Database.executeBatch(sp, 200);
        batchProcessID = Database.executeBatch(ps, 200);
    }
}