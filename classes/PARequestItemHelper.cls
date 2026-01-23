/***********************************************************************************************************************
<TJ20140402>
Last Modified By    :   Tarun Jain
Last Modified Date  :   2 April 2014
Description         :   Class to query and add the Default UOM & Per for a particular Product Hierarchy.
 ***********************************************************************************************************************/
public with sharing class PARequestItemHelper
{   
	public String selectedBU;
	public PARequestItemHelper(String selectBU)
	{
		selectedBU=selectBU;
	}
	//<TJ20140402> -- Queries the BU_PH Data for a Set of PH Codes
	public List<BU_PH__c> query(Set<String> pHCodes)
	{
		system.debug('#@phcodes'+pHCodes+','+selectedBU);
		List<BU_PH__c> buPHData=new List<BU_PH__c>();
		buPHData.clear();
		buPHData=[SELECT Product_Hierarchy__r.PH_Code__c,Business_Description__c,Default_UOM__c,Default_Per__c from BU_PH__c WHERE 
		          Product_Hierarchy__r.PH_Code__c in:pHCodes AND OrgGroup__c =:selectedBU ORDER BY Product_Hierarchy__r.PH_Level__c DESC];
		system.debug('@#BUPHDATA'+buPHData.size());
		return buPHData;
	}
	//<TJ20140402> -- Returns the Default UOM for a PH Code
	public map<String,String> getDefaultUOM(list<BU_PH__c> bu_ph_data)
	{
		Set<String> phSubStr=new Set<String>();
		String uom;
		list<BU_PH__c> default_UOM=new list<BU_PH__c>();
		map<String,String> defaultUOM=new map<String,String>();
		map<String,String> pHUOM=new map<String,String>();
		map<String,Set<String>> phcodesubstring=new map<String,Set<String>>();
		for(Integer i=0;i<bu_ph_data.size();i++)
		{
			for(Integer j=0;j<=bu_ph_data[i].Product_Hierarchy__r.PH_Code__c.length();j=j+2)
			{
				phSubStr.add(bu_ph_data[i].Product_Hierarchy__r.PH_Code__c.substring(0,j));
			}
			phcodesubstring.put(bu_ph_data[i].Product_Hierarchy__r.PH_Code__c,phSubStr);
		}
		default_UOM=query(phSubStr);
		Integer size=bu_ph_data.size();
		for(integer z=0;z<default_UOM.size();z++)
		{   
			if((default_UOM[z].Default_UOM__c!=null))
			{
				uom=default_UOM[z].Default_UOM__c;
				break;
			}
		}
		for(integer i=0;i<size;i++)
		{
			defaultUOM.put(bu_ph_data[i].Product_Hierarchy__r.PH_Code__c,uom);
		}
		system.debug('defaultUOM'+defaultUOM);
		system.debug('uom@@'+uom);
		system.debug('defaultUOMList'+default_UOM);
		return defaultUOM;
	}

	//<TJ20140402> -- Returns the Default Per for a PH Code
	public map<String,decimal> getDefaultPer(list<BU_PH__c> bu_ph_data)
	{
		Set<String> phSubStr=new Set<String>();
		list<BU_PH__c> default_Per=new list<BU_PH__c>();
		map<String,Decimal> defaultPer=new map<String,Decimal>();
		map<String,Decimal> pHPer=new map<String,Decimal>();
		map<String,Set<String>> phcodesubstring=new map<String,Set<String>>();
		decimal per;
		for(Integer i=0;i<bu_ph_data.size();i++)
		{
			for(Integer j=0;j<=bu_ph_data[i].Product_Hierarchy__r.PH_Code__c.length();j=j+2)
			{
				phSubStr.add(bu_ph_data[i].Product_Hierarchy__r.PH_Code__c.substring(0,j));
			}
			phcodesubstring.put(bu_ph_data[i].Product_Hierarchy__r.PH_Code__c,phSubStr);
		}
		default_Per=query(phSubStr);
		Integer size=bu_ph_data.size();
		for(integer z=0;z<default_Per.size();z++)
		{
			if(default_Per[z].Default_Per__c!=null)
			{
				per=default_Per[z].Default_Per__c;
				break;
			}
		}
		for(integer i=0;i<size;i++)
		{
			
			defaultPer.put(bu_ph_data[i].Product_Hierarchy__r.PH_Code__c,per);

		}
		system.debug('defaultPer'+defaultPer);
		return defaultPer; 
	}
}