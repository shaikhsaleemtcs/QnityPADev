public class ctrlBUAdminforTemplates {
public string buName {get;set;}

public string getbuadminName()
{
    return [select owner.Name from OrgGroup__c where Business__c=:buName][0].owner.name;
}

}