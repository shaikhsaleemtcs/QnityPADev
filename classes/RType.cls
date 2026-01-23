/*******************************************************************************
Copyright © 2009 DuPont. All rights reserved. 
Author: Thomas Snyder
Email: thomas.snyder@usa.dupont.com, tom@3ddd.com
Description:  RecordType library 

20110127:   added ALL getRecordType... methods, 
            added getInfoByDevName(string obj, string devnm)
            
20110602:  added getIdByDevName
            prevoiusly the getIdByName method was used to obtain a recordtype id via code,
            because this did not require a SOQL hit.  However due to an issue of translation
            causing this not to function as expected and the increase of SOQL limits the prefered
            method is now to use getIdByDevName over getIdByName

TES110928:  getSettingsByFullName: bug fix quering for missing records 

TES111021: Added Bulk Methods for working with trigger)(getRecordTypesByIds(), getSettingsByFullNames() ,getRecordTypeByDevNames()
getDevNameMapBySObjectType, getRTMapBySObjectType)
Added two new classes SObjectRTypes and FullNameFactory

<20161221> Merge&Spin: Remove hard code ID and replace it with label "Master_Record_Type_ID" (Agile Accelerator Work ID: W000023)

********************************************************************************/

public class RType {

    private static final Map<String, Schema.SObjectType> OTypes = Schema.getGlobalDescribe();
    private static MAP<string,Map<String, Schema.RecordTypeInfo>> RTypeInfos = new MAP<string,Map<String, Schema.RecordTypeInfo>>();
    //<20161221> START Merge&Spin: Remove hard code ID and replace it with label
    public static final Id MASTERTYPE = System.Label.Master_Record_Type_ID;
    //<20161221> END Merge&Spin
    public static Map<String, Schema.RecordTypeInfo> getInfosByObj(string obj) {
        if (OTypes.containskey(obj)) {
            if (! RTypeInfos.containskey(obj) ) {
                Map<String, Schema.RecordTypeInfo> infos  = OTypes.get(obj).getDescribe().getRecordTypeInfosByName();
                RTypeInfos.put(obj, infos);
                return infos;
            }
            else 
                return RTypeInfos.get(obj);
        }
        return null;
    }
    
    public static Schema.RecordTypeInfo getInfoByDevName(string obj, string devnm) {
        RecordType rt = getRecordTypeByDevName(obj,devnm,true);
        Map<String, Schema.RecordTypeInfo> infos = getInfosByObj(rt.sObjectType);
        if (infos!=null)
            if (infos.containskey(rt.Name))
                return infos.get(rt.Name);
        return null;
    }   
    
    public static Schema.RecordTypeInfo getInfoByName(string obj, string nm) {
        Map<String, Schema.RecordTypeInfo> infos = getInfosByObj(obj);
        if (infos!=null)
            if (infos.containskey(nm))
                return infos.get(nm);
        return null;
    }
 
/////////////////////////////////////////////////////////////////////////////////////////////
//  The Id returned is as follows:
//  If Name (label not developername :<) exists (!!!case sensitive) then return id for this name.  
//  ELSE return default for this users
//  ELSE return MASTERTYPE
///////////////////////////////////////////////////////////////////////////////////////////////
    public static Id getIdByName(string obj, string nm) {
        //This does not work when rtype names are translated
        Schema.RecordTypeInfo info = getInfoByName(obj,nm);
        if (info==null)
            info = getDefault(obj);
        return (info!=null) ? info.recordtypeid : MASTERTYPE;
        }



    public static Id getIdByDevName(string obj, string devnm) {
        RecordType rtype = getRecordTypeByDevName(obj, devnm);
        if (rtype==null) 
            return getIdByName(obj,devnm);
        else 
            return rtype.id;
        }
        
        
    
    public static Schema.RecordTypeInfo getDefault(string obj) {
        for (Schema.RecordTypeInfo i : getInfosByObj(obj).values())
            if (i.isDefaultRecordTypeMapping())
                return i;
        return null;
    }
    
    ////////////////////////////////////////////////////////////////////
    //  getRecordType Calls
    //  These results are based on a Query to the recordtype object
    //  future consideration: 
    //    caching of recordtype to reduce the SOQL calls,  however this could
    //    potentially eat up a lot of heap space
    ///////////////////////////////////////////////////////////////////
    public static RecordType getRecordTypeByDevName(string obj, string devnm) {return getRecordTypeByDevName(obj,devnm,false);}
    public static RecordType getRecordTypeByDevName(string obj, string devnm, boolean uselocalName) {
         MAP<String,RecordType> rts=getRecordTypeByDevNames(obj, new SET<string> {devnm},uselocalName);
         return (rts.size()>0) ? rts.values()[0] : null;
        } 
    ///////////////////////////////////////////////////////////////////     
    // returns: MAP<DevName,RecordType> 
    //<JM20150724> - Too Many SQL query 101 - Issue in production.
    public static MAP<String,RecordType> getRecordTypeByDevNames(string obj, SET<string> devnms) {return getRecordTypeByDevNames(obj,devnms,false);}
    public static MAP<String,RecordType> getRecordTypeByDevNames(string obj, SET<string> devnms, boolean uselocalName) {
        MAP<String,RecordType> rtn = new MAP<String,RecordType>();
            try {
                if (uselocalName)
                 {
                    List<RecordType> recordTypeList = new List<RecordType>();
                    recordTypeList = [Select r.SobjectType, r.NamespacePrefix, tolabel(r.Name),  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:obj and developername in :devnms];
                    for (RecordType rt : recordTypeList)
                    { 
                        rtn.put(rt.developername,rt);
                    }
                 }
                else
                 {
                    List<RecordType> recordTypeList = new List<RecordType>();
                    recordTypeList = [Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:obj and developername in :devnms];
                    for (RecordType rt : recordTypeList) 
                     {
                        rtn.put(rt.developername,rt);
                     }
                 }
            } catch(Exception ex) {}
        return rtn;
        } 
   //////////////////////////////////////////////////////////////////////
   // returns: MAP<DevName,RecordType>
   //<JM20150724> - Too Many SQL query 101 - Issue in production.
    public static MAP<String,RecordType> getDevNameMapBySObjectType(string objtype) {return getDevNameMapBySObjectType(objtype,false);}
    public static MAP<String,RecordType> getDevNameMapBySObjectType(string objtype, boolean uselocalName) {
        MAP<String,RecordType> rtn = new MAP<String,RecordType>();
            try {
                if (uselocalName)
                 {
                    List<RecordType> list1 = new List<RecordType>();
                     list1 = [ Select r.SobjectType, r.NamespacePrefix, tolabel(r.Name),  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:objtype ];
                    for (RecordType rt : list1) 
                     {
                        rtn.put(rt.developername,rt);
                     }
                 }
                else
                  {
                    List<RecordType> list2 = new List<RecordType>();
                    list2 = [Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:objtype];
                    for (RecordType rt : list2) 
                     {
                        rtn.put(rt.developername,rt);
                     }
                  }
            
            } catch(Exception ex) {}
        return rtn;
        }   
////////////////////////////////////////////////////////////////////////////////////
    public static RecordType getRecordTypeByName(string obj, string nm) {return getRecordTypeByName(obj,nm,false);}
    public static RecordType getRecordTypeByName(string obj, string nm, boolean uselocalName) {
        RecordType rt;
        try {
                if (uselocalName)
                    rt = [Select r.SobjectType, r.NamespacePrefix, tolabel(r.Name),  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:obj and r.name=:nm];
                else
                    rt = [Select r.SobjectType, r.NamespacePrefix, r.Name, r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:obj and r.name=:nm];               
            } catch(Exception ex) {}
        return rt;
        }       
////////////////////////////////////////////////////////////////////////////////////
   public static RecordType getRecordTypeByFullName(string fullname) {
        FullNameFactory fn = new FullNameFactory(fullname);
        RecordType rt;
            try {
                rt = [Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjecttype=:fn.sobjectType and developername=:fn.DevName ];
                
            } catch(Exception ex) {}
        return rt;
        }  
////////////////////////////////////////////////////////////////////////////////////
    public static RecordType getRecordTypeById(string id) {
        RecordType rt;
            try {
                rt = [Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where id=:id];
                
            } catch(Exception ex) {}
        return rt;
        } 
////////////////////////////////////////////////////////////////////////////////////
    public static MAP<id,RecordType> getRTMapBySObjectType(string sOType) {
        MAP<id,RecordType> rtn = new MAP<id,RecordType>([Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where sobjectType=:sOType]);

        return rtn;
        }
////////////////////////////////////////////////////////////////////////////////////
    public static MAP<id,RecordType> getRecordTypesByIds(LIST<id> ids) {
        MAP<id,RecordType> rtn = new MAP<id,RecordType>([Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where id in :ids]);

        return rtn;
        }
////////////////////////////////////////////////////////////////////////////////////
    public static MAP<id,RecordType> getRecordTypesByIds(LIST<sObject> objs) {
        
        
        MAP<id,RecordType> rtn = new MAP<id,RecordType>([Select r.SobjectType, r.NamespacePrefix, r.Name,  r.IsActive, r.Id, r.DeveloperName, r.Description, r.BusinessProcessId 
                                From RecordType r where id in :objs]);

        return rtn;
        } 
////////////////////////////////////////////////////////////////////////////////////
 
    //case-insensitive  
    //TES110928 bug fix quering for missing records 
    public static RecordTypeSettings__c getSettingsByFullName(string fullname) {
        MAP<string,RecordTypeSettings__c> rts = getSettingsByFullNames(new LIST<string>{fullname});
        return rts.get(fullname);
        } 
////////////////////////////////////////////////////////////////////////////////////
    public static MAP<string,RecordTypeSettings__c> getSettingsByFullNames(LIST<string> fnames) {
        MAP<string,RecordTypeSettings__c> rtn=new MAP<string,RecordTypeSettings__c>();
        for (RecordTypeSettings__c s : [Select Name from RecordTypeSettings__c where FullName__c in:fnames]) {
            RecordTypeSettings__c rts = RecordTypeSettings__c.getInstance(s.Name);
            if (rts!=null) rtn.put(rts.fullname__c, rts);   
        }
        return rtn;
        } 
////////////////////////////////////////////////////////////////////////////////////
    // returns: MAP<RT.developerName,RecordTypeSettings__c>
    public static MAP<string,RecordTypeSettings__c> getSettingsBySObjectType(string sotype) {
        MAP<string,RecordTypeSettings__c> rtn=new MAP<string,RecordTypeSettings__c>();
        string strLike = sotype+'.%';
        for (RecordTypeSettings__c s : [Select Name from RecordTypeSettings__c where FullName__c like :strLike]) {
            RecordTypeSettings__c rts = RecordTypeSettings__c.getInstance(s.Name);
            
            if (rts!=null) {
                FullNameFactory ffn = new FullNameFactory(rts.fullname__c);
                rtn.put(ffn.DevName, rts);  
            }
        }
        return rtn;
        }
//////////////////////////////////////////////////////////////////////////////////// 
    public static RecordTypeSettings__c getSettingsById(string id) {
        recordType rt = getRecordTypeById(id);
        if (rt!=null) {
            string fn=rt.SobjectType+'.'+rt.DeveloperName;
            return getSettingsByFullName(fn);
        }
        else return null;
        } 
////////////////////////////////////////////////////////////////////////////////////
    //returns  MAP<recordTypeId,RecordTypeSettings__c>
    public static MAP<id,RecordTypeSettings__c> getSettingsByIds(LIST<id> ids) {
        MAP<id,RecordType> rts = getRecordTypesByIds(ids);
        MAP<id,string> mfnames = new MAP<id,string>();
        for (RecordType rt : rts.values())
            mfnames.put(rt.id,rt.SobjectType+'.'+rt.DeveloperName);
            
        MAP<string,RecordTypeSettings__c> rtsettings = getSettingsByFullNames(mfnames.values());
        MAP<id,RecordTypeSettings__c>  rtn = new MAP<id,RecordTypeSettings__c>();
        for (id rtid : mfnames.keySet())
            if (rtsettings.containsKey(mfnames.get(rtid))) 
                rtn.put(rtid,rtsettings.get(mfnames.get(rtid)));
        system.debug('getSettingsByIds:'+rtn);
        return rtn;
    }
////////////////////////////////////////////////////////////////////////////////////
           
//Create exception handling for invalid fullnames
public class FullNameFactory {
    public string sobjectType       {get; private set;}
    public string DevName           {get; private set;}

    public FullNameFactory(string fname) {
        string[] arrFn = fname.split('\\.');
        sobjectType =(arrFn.size()>0) ? arrFn[0] : null;
        DevName     =(arrFn.size()>1) ? arrFn[1] : null;
    }
    public FullNameFactory(string obj, string devnm) {
        sobjectType=obj;
        DevName=devnm;
    }   
    public string FullName {GET{return sobjectType+'.'+DevName;}} 
}


public class SObjectRTypes {

    string sObjectType;
    MAP<id,RecordType> rtmap;
    MAP<string,id> dnMap = new MAP<string,id>();  //normalized to lowercase
    
    //Constructor(sObjectType)
    public SObjectRTypes(string soType) {
        this.sObjectType=soType;
        rtmap=RType.getRTMapBySObjectType(sOType);
        for (RecordType rt : rtmap.values())
            dnMap.put(rt.developerName,rt.id);
    }

    public MAP<id,recordType> getMap() {
        return rtmap;
    }

    public  RecordType getRecordType(id id) {
        return rtmap.get(id);
    }
    public  RecordType getRecordType( string developerName) {
        return rtmap.get(devNameToId(developerName));
    }

    public id devNameToId(string dn) {
        return dnMap.get(dn);
    }
    public string IdToDevName(id id) {
        try {
            return rtmap.get(id).developerName;
        }catch(Exception ex){} 
        return null;
    }
    
    private MAP<string,RecordTypeSettings__c> cacheRTSettings;
    public MAP<string,RecordTypeSettings__c> RTSettings {
        GET { 
            if (cacheRTSettings==null)
            cacheRTSettings=getSettingsBySObjectType(this.sObjectType); 
            return cacheRTSettings;
            } 
        }
    }

////////////////////////////////////////////////////////////////////////////////////
//      Test script(s)
////////////////////////////////////////////////////////////////////////////////////
    //TES_20110203 
    // coverage: RType.cls 82%
    public static testMethod void test_RType() {
         
         //commented by Brundha-- Apr-05-2013
        
        //valid Obj
       Map<String, Schema.RecordTypeInfo> infos = getInfosByObj('Account');
        string nm = infos.values()[0].getName();
        system.debug(nm+'******'+infos );
        //valid RType name (label)
        system.debug(Rtype.getIdByName('Account',nm));
        //invalid RType name (label)
        system.debug(Rtype.getIdByName('Account','BugusTypeof Record'));
    
        //invalid Obj
        infos = getInfosByObj('BogusAccount');

        //These getRecordType calls are case-insensitive
        RecordType rt = RType.getRecordTypeByName('Account',nm);
        system.debug(nm);
        system.debug(rt);
        getInfoByDevName('Account', rt.developerName);
        //These getRecordType calls are case-insensitive
        system.assertEquals(rt, RType.getRecordTypeByDevName('account',rt.developerName));
        system.assertEquals(rt, RType.getRecordTypeByFullName('account.'+rt.developerName));
        system.assertEquals(rt, RType.getRecordTypeById(rt.Id));
        
        //Create a RecordTypeSettings__c for testing retrieval
        string fn = 'Account.'+rt.developerName;
        database.upsert(new RecordTypeSettings__c(name='anyname', FullName__c=fn, SegmentationRoot__c='test'),RecordTypeSettings__c.name,false);
    
        //test retrieval
        system.debug(getSettingsById(rt.Id));
        system.debug(getSettingsByFullName('account.'+rt.developerName)); //case-insensitive
        
        
        
        //brundha --started--Apr08
        
        /*
         ERP_Customer__c customer1=new ERP_Customer__c();
         customer1.Source_Cluster__c='WB1';  
         customer1.Deletion_Flag__c=true;
         customer1.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');     
         insert customer1;
         ERP_Customer__c customer2=new ERP_Customer__c();
         customer2.Account_Group_Code__c='Z001';
         customer2.Customer_Code__c='Sample-0001';
         //customer2.Sales_Area__c='D6301002'; commented by satish yerra
         customer2.Sales_Org_Code__c='A640';
         customer2.Distribution_Channel_Code__c='10';
         customer2.Division_Code__c='02';
         customer2.street__c='street1';
         customer2.name='Test Customer';
         customer2.country__c='GERMANY';
         customer2.Sales_Office_Code__c='salesoffice1';
         customer2.State_Province__c='state1';
         customer2.City__c='city1';
         //customer1.state__c='state1';
         customer2.Source_Cluster__c='WB1';  
         customer2.Deletion_Flag__c=true;
         customer2.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');    
         insert customer2;
         
         rtype r=new rtype();
         rtype.getInfosByObj('customer');
         rtype.getInfoByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
        //brundha --ends--Apr08
        
        //testExceptions
        system.debug(getSettingsById('noid00000000001'));
        
        */
        //getIdByDevName
        //getDevNameMapBySObjectType
        
        
        //FullNameFactory class
        Rtype.FullNameFactory fnf = new Rtype.FullNameFactory('MyCustomObject__c.myField__c');
        system.assertEquals(fnf.sobjectType, 'MyCustomObject__c');
        system.assertEquals(fnf.devName, 'myField__c');
        system.assertEquals(fnf.fullName, 'MyCustomObject__c.myField__c');
        fnf = new Rtype.FullNameFactory('MyCustomObject__c','myField__c');
        
        //SObjectRTypes class       
        Rtype.SObjectRTypes ort = new Rtype.SObjectRTypes('Account');
        Map<id, RecordType> m = ort.getMap();
        if (m.size()>0) {
            string dn=m.values()[0].developerName;
            string rtid=ort.devNameToId(dn);
            system.assertEquals(ort.getRecordType(dn).id,rtid);
            system.assertEquals(ort.IdTodevName(rtid),dn);
            system.debug(getSettingsByIds(new LIST<ID>{rtid}));
            system.assertEquals(Rtype.getIdByDevName('Account',dn),rtid);
        }
        system.debug(ort.RTSettings);
        system.debug(RType.getDevNameMapBySObjectType('Account'));
        }
        


}