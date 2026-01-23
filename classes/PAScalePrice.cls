public class PAScalePrice {

public string sapId{get;set;}
public boolean showScale{get;set;}
public ERP_Sales_Prices_SAP__c listOfPrices{get;set;}
public void showScale()
{
	showScale = true;
	system.debug(sapID);
	if(sapID!=null)
    {
    	listOfPrices = [select id,Pricing_Request__r.Name,Scale_Quantity_Scale_Value1__c ,ScaleRate1__c,
						Scale_Quantity_Scale_Value2__c ,ScaleRate2__c,Scale_Quantity_Scale_Value3__c ,ScaleRate3__c,
						Scale_Quantity_Scale_Value4__c ,ScaleRate4__c,Scale_Quantity_Scale_Value5__c ,ScaleRate5__c,
						Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,
						Scale_Quantity_Scale_Value9__c,	ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Quantity_Scale_Value10__c,
						Scale_UoM_Scale_Unit__c,F_Product_Hierarchy_Code__c,unit__c,pckc__C,Key_Combination__c,
						Sold_To_Code__c, Pricing_Condition_Code__c,Key_Combination_Code__c,Material_Code__c,rate__C,
						per__c, UOM__C,Valid_From__c,Valid_To__c,Scaled_Price_Flag__c,Customer_Price_Payment_Terms__c,
						Payment_Terms_Fixed_Date__c,Calculation_Type__c,Plus_Minus__c,Check_Scale__c,Product_Hierarchy__c ,Material__c,Scale_Type__c from ERP_Sales_Prices_SAP__c where isPriceHolder__c =false and id=:sapID];
		system.debug(listOfPrices);
    } 
} 

public void closeWindow()
	{
		showScale = false;
	}
}