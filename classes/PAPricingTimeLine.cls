/*
 * Name      :   PAPricingtimeline
 * Description  :   
 * Author      :   Infosys Limited <GT20150107>
 * Created Date :   07 Jan 2015
 *
 * Version   Modified Date     Modified By                Modification
 *
 * ------------------------------------------------------------------------------------------------------------------------------------ 
 *  v1.1    13-Jan-2017       Haider Naseem              <HN01132017> Condition for LAST_N_YEARS modified from '>' to '>=' to accommodate prices 
 */
public with sharing class PAPricingTimeLine {
    public boolean displayTmLn{
        get
        { 
             if(ApexPages.currentPage().getUrl().startsWith('/apex/PACurrentPrices')||
             ApexPages.currentPage().getUrl().startsWith('/apex/PAAddReqItem')
             )
             
             {
               displayTmLn=true;
             }  
             else{
               displayTmLn=false;   
             }
             return displayTmLn;
          }        
        set;
    }
    public  string PCKC{get;set
    {
       System.debug('Display time line:'+displayTmLn);
        if(displayTmLn)
            PCKC = value;
        
    }
    }
    public  boolean showWarning{get;set;}
    public List<ERP_Export_to_SAP__c> listOfPrices{get;set;}
    public boolean scalePrice{get
        {
        if(scalePrice== null)
            scalePrice = false;
        return scalePrice;
        }
    set{
        scalePrice = value;
        system.debug('Setting scale flag:-'+scalePrice);
    }}

    public boolean isMaterial
    {
        get
        {
            if(isMaterial == null)
            {
                isMaterial = false;
            }
            return isMaterial;
        }
        set;
    } 

    public boolean showHistory{
        get
        {
            system.debug('getting value'+showHistory);
            if(showHistory ==null)
                showHistory =false;
            System.debug('Value+list:'+showHistory+'-'+listOfPrices);
            return showHistory;
        }
        set
        {
            //if(showHistory)
            {   
                System.debug('PCKC:'+PCKC);
                //<HN01132017> <IS ID-00078377><IS ID-00078467> Condition for LAST_N_YEARS modified from '>' to '>=' to accommodate prices
                // Reference: LAST_N_YEARS -> Starts 00:00:00 on January 1 of the previous year and continues through the end of December 31 of the previous nth year.
                
                listOfPrices = [select id,Pricing_Request__r.Name,Scale_Quantity_Scale_Value1__c ,ScaleRate1__c,
                Scale_Quantity_Scale_Value2__c ,ScaleRate2__c,Scale_Quantity_Scale_Value3__c ,ScaleRate3__c,
                Scale_Quantity_Scale_Value4__c ,ScaleRate4__c,Scale_Quantity_Scale_Value5__c ,ScaleRate5__c,
                Scale_UoM_Scale_Unit__c,F_Product_Hierarchy_Code__c,unit__c,pckc__C,Key_Combination__c,Sold_To_Code__c, Pricing_Condition_Code__c,Key_Combination_Code__c,Material_Code__c,rate__C,per__c, UOM__C,Valid_From__c,Valid_To__c,Scaled_Price_Flag__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Calculation_Type__c,
                Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Quantity_Scale_Value10__c,
                Plus_Minus__c,Check_Scale__c,Product_Hierarchy__c ,Material__c ,Scale_Type__c from ERP_Export_to_SAP__c where isPriceHolder__c =false and pckc__C=:PCKC and lastmodifieddate >= LAST_N_YEARS:5 order by Valid_From__c limit 200]; 
                for(ERP_Export_to_SAP__c pr:listOfPrices )
                {
                    if(pr.Material_Code__c!=null)
                        isMaterial = true;
                    if(pr.Scaled_Price_Flag__c)
                        scalePrice = true;                      
                }
            }
            System.debug('IsMaterial:'+isMaterial);
            system.debug('setting value'+value);
            if(listOfPrices.size()>0 && value)
                showHistory = true;
            else
            {
                showWarning = true;
                showHistory = false;
            }
        }
    }


    public void getPriceHistory()
    {        
        showHistory = true;
    }

    public void closeWindow()
    {
        showHistory = false;  
        showWarning = false;  
    }
}