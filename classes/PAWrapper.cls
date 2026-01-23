/*
 * Name      :   PAWrapper
 * Description  :   Holds all the Wrapper Classes.
 * Author      :   Infosys Limited
 * Created Date :   18-01-2013
 *
 * Version    Modified Date    Modified By   Modification
 *  1.0     18-01-2013         Utkarsh       Created
 *  1.1     26-02-2013         Priyanka     Created stringList variable
 *    1.2       27-02-2013         Priyanka     Created sObject variable
 *    1.3       03-03-2013         Priyanka     Created fieldSet variable for template component
 * --------------------------------------------------------------------------------------------------------
 ***************************************************************************************************************
<SP20140505>
Last Modified By    :   Shiva
Last Modified Date  :   05 May 2014
Description         :   CAPITAL PROJECT - Created a Map Variable stringMapSelectoptions
*****************************************************************************************************************
<TJ20140903>
Last Modified By    :   Tarun
Last Modified Date  :   03 September 2014
Description         :   Created 2 boolean varialbles for massive changes for scale prices and sales volume
*****************************************************************************************************************
<SH20221125>
Last Modified By   :   Sapneet Kaur Hora
Last Modified Date :   25 November 2022
Description        :   Modified Code to Resolve errors while using 'Send To Xls' under Price Lists - Created variable IsERPPrice
Issue #            :   IS SC-00105625
****************************************************************************************************************
<MS20221215>
Last Modified By   :   Manav Sharma
Last Modified Date :   15 December 2022
Description        :   Modified Code to Resolve errors while using 'Send To Xls' - Assign IsERPPrice to True in Constructor
Issue #            :   IS TI-00095286
*****************************************************************************************************************/
 
global class PAWrapper {
    //All sObject have to be mapped to this sObject variables
    public List<sObject> sobjectList {get;set;}
    //Ver 1.2
    public sObject sobjectRecord {get;set;}
    public Boolean IsERPPrice {get;set;} //<SH20221125>
    //Create a map of String name and String Value. For boolean create tha values with "True" or "False".
    //Also do not provide NULL in the map else it may throw error. Instead use ' ' if necessary in that case.
    public map<String, String> stringMap {get;set;}
    
    //<SP20140505>  - Multiple customers - CAPITAL PROJECT
    public map<String, list<SelectOption>> stringMapSelectoptions {get;set;}
    
    //
    public List<String> stringList {get;set;} // version 1.1

    public String dummy {get;set;}
    //This variable is used to show the value in the checkBox
    public boolean isSelected {get;set;}
    //This is used in the approver List Display
    public List<SelectOption> selectApprover {get;set;}
    //Ver 1.3added for template component
    public List<Schema.FieldSetMember> fieldSetList {get;set;} 
    //<TJ20140903>
    public boolean changeScale{get;set;}
    public boolean changeVolume{get;set;}
    public String quantity{get;set;}
    public Boolean cloneFlag{get; set;}
    public String nQuantity{get;set;}
    public PAWrapper()
    {
        cloneFlag = false;
        stringMap = new map<String, String>();
             stringMapSelectoptions = new map<String, list<SelectOption>>();
        sObjectList = new List<sObject>();
        stringList = new List<String>();
        IsERPPrice = true;
    }
    //CLASSES UNDER THIS HAS NOT TO BE USED. USE ONLY THE ABOVE VARIABLES
}