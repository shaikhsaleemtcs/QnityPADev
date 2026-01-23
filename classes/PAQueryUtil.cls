public class PAQueryUtil {
	
	private static Map<String,Map<String,String>> clsQueryMap =new Map<String,Map<String,String>>();
	static Map<String,String> varQueryMap ;	
	private static void populateMap(String className){
			varQueryMap = new Map<String,String>();
			system.debug('Query not exist');
			List<PAQuery__c> qList = [Select Id,Class__c,Query__c,Variable__c from PAQuery__c where Class__c = :className];
			for(PAQuery__c qObj : qList){
				varQueryMap.put(qObj.Variable__c,qObj.Query__c);
			}
			if(varQueryMap.size()>0)
				clsQueryMap.put(className,varQueryMap);
	}
	
	public static List<SObject> query(String className, String varName, String whereCondition)
	{
		String query;
			if(!clsQueryMap.containsKey(className))
			{
				populateMap(className);
			}
			if(clsQueryMap.containsKey(className))
			{
				if( whereCondition !=null && whereCondition.contains('null')){
					//whereCondition = whereCondition.replace('null','\0');					
				}
				query = clsQueryMap.get(className).get(varName)+((whereCondition!=null&&whereCondition!='')? ' Where '+whereCondition:'');
				System.debug('From Object:'+clsQueryMap.get(className).get(varName));
				System.debug('From where condition:'+(whereCondition!=null? ' Where '+whereCondition:''));
				System.debug(logginglevel.error,'Query from PAQueryUtil:'+query);
				return Database.query(query);
			}
			else
				return new List<SObject>();
	}
	
}