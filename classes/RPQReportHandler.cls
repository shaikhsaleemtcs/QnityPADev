/*    Ver.            Developer           Changes                                    Tag                         Dependencies    
      1             Ibtesam            New Class to handle RPQ Data                  IM20150217                     None   */
public class RPQReportHandler implements IPAServiceComponent{
	public List<SelectOption> reportList{get; set;}
	public String selectedReport{get; set;}
	public PAOrganizationalGroupItems ogitems{get; set;}
	public PAServiceState rpqServiceState;
	public List<QuoteWrapper> quotes{get; set;}
	public Map<String,List<String>> distenduserMap{get; set;}
	public List<SelectOption> dists{get; set;}
	public Pricing_Request__c dummyreq{get; set;}
	public String selectedBUName{get; set;}
	public String businessaction{get; set;}
	public String csvString{get; set;}
	public Map<String,String> mtrlMap{get; set;}
	public Map<String,String> soldToMap{get; set;}
	/* public List<SelectOption> endusers{
		get{
			endusers = new List<SelectOption>();
			if(selectedDist!=null){
				For(String endus: distenduserMap.get(selectedDist)){
					endusers.add(new SelectOption(endus,endus));
				}
			}
			RunReport1();
			return endusers;
		}
		set;
	} */
	public Date ValidOnFilter{
		get{
			if(dummyreq.Due_Date__c==null)
				ValidOnFilter = system.today();
			else
				ValidOnFilter = dummyreq.Due_Date__c;
			return ValidOnFilter;
		}
		set;
	}

	public QuoteHighlight quoteHighlightrep1{get; set;}
	public QuoteHighlight quoteHighlightrep2{get; set;}
	public QuoteHighlight quoteHighlightrep3{get; set;}
	public QuoteHighlight quoteHighlightrep4{get; set;}
	public QuoteHighlight quoteHighlight1{get; set;}
	public QuoteHighlight quoteHighlight2{get; set;}
	public QuoteHighlight quoteHighlight3{get; set;}
	public QuoteHighlight quoteHighlight4{get; set;}

	public List<Rebate_Quote_Price__c> higestvalueQuotePrices{get; set;}

	public RPQReportHandler(){

		//higestvalueQuotePrices = new List<Rebate_Quote_Price__c>();

	}
	public RPQReportHandler(PAServiceState rpqServiceState){
		this.rpqServiceState = rpqServiceState;
		this.rpqServiceState.erpCustomer = new PAERPCustomer(rpqServiceState);
		selectedBUName = rpqServiceState.ogitems.buIdToNameMap.get(rpqServiceState.ogitems.SelectedBU);
		selectedReport = '0';
		dummyreq = new Pricing_Request__c();
		dummyreq.Due_Date__c = system.today();

		//chartData = new List<Data>();
		dists = new List<SelectOption>();
		quotes = new List<QuoteWrapper>();
		distenduserMap = new Map<String,List<String>>();
		quoteHighlightrep1 = new QuoteHighlight();
		quoteHighlightrep2 = new QuoteHighlight();
		quoteHighlightrep3 = new QuoteHighlight();
		quoteHighlightrep4 = new QuoteHighlight();
		reportList = new List<SelectOption>();
		reportList.add(new SelectOption('0', '-Select-'));
		reportList.add(new SelectOption('1', 'Total Active Quotes By Customer'));
		reportList.add(new SelectOption('2', 'Top Requested Material (By Qty)'));
		reportList.add(new SelectOption('3', 'Most Discounted Material'));
		reportList.add(new SelectOption('4', 'Highest Valued Quote'));
		mtrlMap = new Map<String,String>();
		soldToMap = new Map<String,String>();
		//reportList.add(new SelectOption('5', 'Total Active Quotes By Sales Rep'));

	}
	public void loadState(){
		system.debug('inside loadState');
		//quoteHighlights = new QuoteHighlight();

		//runReport4();

	}
	public class QuoteWrapper{
		public Rebate_Quote_Price__c quotepricerep{get; set;}
		public List<Rebate_Quote_Price__c> quote{ get; set;}
		public Pricing_Request__c associatedRequest{get; set;}
		public QuoteWrapper(){
			system.debug('initializing QuoteWrapper');
			quote = new List<Rebate_Quote_Price__c>();
			quotepricerep = new Rebate_Quote_Price__c();
			associatedRequest = new Pricing_Request__c();
		}
	}
	public class QuoteHighlight{
		public QuoteWrapper qw{get; set;}
		public Map<String,QuoteWrapper> mostDiscountedSKU{get; set;}
		public Map<String,QuoteWrapper> topRequestedSKU{get; set;}
		public List<QuoteWrapper> higestvalueQuotesList{get; set;}
		public QuoteWrapper totalActiveQuotesList{get; set;}
		public QuoteWrapper higestvalueQuote{get; set;}
		public QuoteWrapper topRequestedSKUs{get; set;}
		public QuoteWrapper topDiscountedSKUs{get; set;}
		public QuoteHighlight(){
			higestvalueQuote = new QuoteWrapper();
			qw = new QuoteWrapper();
			system.debug('initializing QuoteHighlight');
			higestvalueQuotesList = new List<QuoteWrapper>();
			totalActiveQuotesList = new QuoteWrapper();
			topDiscountedSKUs = new QuoteWrapper();
			topRequestedSKUs = new QuoteWrapper();
			mostDiscountedSKU = new Map<String,QuoteWrapper>();
			topRequestedSKU = new Map<String,QuoteWrapper>();
		}
	}

	public class Data {
		public String name { get; set; }
		public Integer data1 { get; set; }
		public Decimal data2 { get; set; }
		public Integer data3 { get; set; }
		public Integer data4 { get; set; }
		public String dists{get; set;}
		public Data(String name, Integer data1) {
			this.name = name;
			this.data1 = data1;
			this.data2 = 0.0;
			this.data3 = 0;
			this.data4 = 0;
			this.dists = '';
		}
		public Data(String name, Decimal data2) {
			this.name = name;
			this.data1 = 0;
			this.data2 = data2;
			this.data3 = 0;
			this.data4 = 0;
			this.dists = '';
		}
		/*public Data(String name, Integer data1, Decimal data2, Integer data3, Integer data4, String dists) {
            this.dists = dists;
            this.name = name;
            this.data1 = data1;
            this.data2 = data2;
            this.data3 = data3;
            this.data4 = data4;
        }*/
	}
	public List<Data> chartData{get; set;}
	/* public List<Data> getChartData(){
		 List<Data> myData = new List<Data>();
		if(selectedReport=='0') return new List<Data>();
		if(selectedReport=='1'){
			Map<String, Integer> quotesbydist = new Map<String,Integer>();
			quotesbydist = RunReport1();
			For(String s :quotesbydist.keyset()){
				myData.add(new Data(s,quotesbydist.get(s)));
			}
		}
		if(selectedReport=='2'){
			Map<String,Integer> distMtrlQtyMap = new Map<String,Integer>();
			distMtrlQtyMap = RunReport2();
			For(String s :distMtrlQtyMap.keyset()){
				myData.add(new Data(s,distMtrlQtyMap.get(s)));
			}
		}
		if(selectedReport=='3'){
			RunReport3();
		}
		if(selectedReport=='4'){
			RunReport4();
		} 
		return myData;
	} */
	public void ExportData(){
		system.debug('inside exportdata method');
		//csvString = 'Name\nThis is the Name';
	}
	public void GenerateExportString(List<id> rpqids){
		Map<string,string> objAPIMap = new Map<string,string>();    
		Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get('Rebate_Quote_Price__c').getDescribe().fields.getMap();

		List<Schema.FieldSetMember> fieldsToExport = Schema.SObjectType.Rebate_Quote_Price__c.fieldSets.getMap().get('RPQExportFields').getFields();

		for(Schema.SObjectField f : objectFields.Values()) {
			string Label = f.getDescribe().getLabel();
			string value = f.getDescribe().getName();
			objAPIMap.put(Label.toLowerCase(),value);
		}
		string columnseparator='\t';
		string lineseparator='\n';

		List<Rebate_Quote_Price__c> rpqsToExport = new List<Rebate_Quote_Price__c>();
		String queryString='Select Pricing_Request__r.Name,';
		csvString = 'Request Number'+columnseparator;
		For(Schema.FieldSetMember fs : fieldsToExport){
			queryString = queryString+objAPIMap.get(fs.getLabel().toLowerCase())+',';
			csvString = csvString+fs.getLabel()+columnseparator;
		}
		queryString = queryString+'Id FROM Rebate_Quote_Price__c Where Id in :rpqids';
		csvString = csvString+lineseparator;
		system.debug('queryString is '+queryString);
		system.debug('Database.Query(queryString) is '+Database.Query(queryString));
		For(Rebate_Quote_Price__c rpq: Database.Query(queryString)){
			csvString = csvString+rpq.Pricing_Request__r.Name+columnseparator;
			For(Schema.FieldSetMember fs : fieldsToExport){
				csvString = csvString+ rpq.get(objAPIMap.get(fs.getLabel().toLowerCase())) +columnseparator;
			}

			csvString = csvString+lineseparator;
		}
		system.debug('csvString is '+csvString);

	}
	public void fetchChartData() {
		chartData = new List<Data>();
		csvString='';
		//if(selectedReport=='0') return new List<Data>();
		try{
			if(selectedReport=='1'){
				Map<String, Integer> quotesbydist = new Map<String,Integer>();
				quotesbydist = RunReport1();
				For(String s :quotesbydist.keyset()){
					this.chartData.add(new Data(soldToMap.get(s),quotesbydist.get(s)));
				}
			}
			if(selectedReport=='2'){
				Map<String,Integer> distMtrlQtyMap = new Map<String,Integer>();
				distMtrlQtyMap = RunReport2();
				For(String s :distMtrlQtyMap.keyset()){
					this.chartData.add(new Data(mtrlMap.get(s),distMtrlQtyMap.get(s)));
				}
			}
			if(selectedReport=='3'){
				Map<String,Decimal> distMtrlDiscMap = new Map<String,Decimal>();
				distMtrlDiscMap = RunReport3();
				For(String s :distMtrlDiscMap.keyset()){
					this.chartData.add(new Data(mtrlMap.get(s),distMtrlDiscMap.get(s)));
				}
			}
			if(selectedReport=='4'){
				RunReport4();
			} 

		}
		Catch(Exception e){
			system.debug(' Message is '+e.getMessage()+' and Line Number is '+e.getLineNumber());
		}

	}
	public String highestValueSalesRep{get; set;}
	public String highestValueSoldto{get; set;}
	public String highestValueEndUser{get; set;}
	public Double highestValueDealTotal{get; set;}
	public String highestValueQuoteNumber{get; set;}



	public Map<String, Integer> RunReport1(){
		Set<String> endusercodes = new Set<String>();
		Set<String> distcodes = new Set<String>();
		List<Id> rpqIds = new List<Id>();
		Map<String, Integer> quotesbydist = new Map<String,Integer>();
		quoteHighlightrep1.totalActiveQuotesList = new QuoteWrapper();
		distenduserMap = new Map<String,List<String>>();
		Set<Id> prIds = new Set<Id>();
		system.debug('validonfilter is '+validonfilter);
		List<Pricing_Request__c> queryprList = new List<Pricing_Request__c>();
		try{
			For(Pricing_Request__c pr: [select id,name,end_user_code__c,end_user__c,soldto_code__c,Sold_To__c from Pricing_Request__c WHERE is_End_User_Rebate__c=true AND Request_Approval_Status__c='Approved' AND Sales_Org_Code__c='AD50' AND Request_Valid_From__c<=:validonfilter AND Request_Valid_To__c>:validonfilter ORDER BY SoldTo_Code__c,End_User_Code__c,Approver5_Date__c DESC NULLS LAST Limit 5000])
			{
				prIds.add(pr.id);
				if(distenduserMap.get(pr.soldto_code__c)==null){
					quotesbydist.put(pr.soldto_code__c, 1);
					dists.add(new SelectOption('','- Select -'));
					dists.add(new SelectOption(pr.soldto_code__c,pr.soldto_code__c));
					List<String> endusertemp = new List<String>();
					endusertemp.add(pr.end_user_code__c);
					distenduserMap.put(pr.soldto_code__c, endusertemp);
				}
				else{
					Integer count = quotesbydist.get(pr.soldto_code__c);
					quotesbydist.put(pr.soldto_code__c,count++);
					if(!distcodes.contains(pr.soldto_code__c)){
						distcodes.add(pr.soldto_code__c);
						distenduserMap.get(pr.soldto_code__c).add(pr.end_user_code__c);
					}
				}
				soldToMap.put(pr.soldto_code__c,pr.Sold_To__c);
			}
			List<Rebate_Quote_Price__c> rpqitems = new List<Rebate_Quote_Price__c>();
			rpqitems = [select id,Pricing_Request__r.name,Pricing_Request__r.On_Behalf_Of__r.Name,Quantity__c,Discount__c,End_User__c,End_User_Code__c,Sold_To__c,Sold_To_Code__c,Material_Code__c,Material__c,Valid_From__c,Valid_To__c,Rate__c from Rebate_Quote_Price__c where Pricing_Request__c In :prIds AND isPriceHolder__c=false ORDER BY Pricing_Request__c ASC NULLS LAST LIMIT 1000];
			if(rpqitems.size() > 900)
			{
				ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, System.Label.More_Than_1000_Pricing_Records_Warning);  
				ApexPages.addMessage(myMsg);
			}
			Integer limitrecs = 0;
			QuoteWrapper qw = new QuoteWrapper();
			For(Rebate_Quote_Price__c rpq : rpqitems){
				rpqIds.add(rpq.id);
				qw.quote.add(rpq);
				limitrecs++; if(limitrecs==900) break;
			}
			quoteHighlightrep1.totalActiveQuotesList = qw;
			GenerateExportString(rpqIds);
			return quotesbydist;
		}
		Catch(Exception e){
			system.debug(' Message is '+e.getMessage()+' and Line Number is '+e.getLineNumber());
			return new Map<String, Integer>();
		}

	}

	public Map<String,Integer> RunReport2(){
		Map<String,Integer> distMtrlQtyMap = new Map<String,Integer>();
		List<Id> rpqIds = new List<Id>();
		List<Rebate_Quote_Price__c> rpqitems = new List<Rebate_Quote_Price__c>();
		rpqitems = [select id,Pricing_Request__r.name,Pricing_Request__c,Quantity__c,Discount__c,End_User__c,End_User_Code__c,Sold_To__c,Sold_To_Code__c,Material_Code__c,Material__c,Valid_From__c,Valid_To__c,Rate__c from Rebate_Quote_Price__c where Sales_Org_Code__c='AD50' AND Valid_From__c<=:validonfilter AND Valid_To__c>:validonfilter AND isPriceHolder__c=false AND Quantity__c!=null AND Pricing_Request__c!=null ORDER BY Quantity__c DESC NULLS LAST  LIMIT 1000];
		Integer highestVal = Integer.ValueOf(rpqitems[0].Quantity__c);
		QuoteWrapper qw = new QuoteWrapper();
		try{
			For(Rebate_Quote_Price__c rpq : rpqitems){
				if(Integer.valueOf(rpq.Quantity__c) == highestVal){
					rpqIds.add(rpq.id);
					qw.quote.add(rpq);
					distMtrlQtyMap.put(rpq.Material_Code__c,Integer.valueOf(rpq.Quantity__c));
					mtrlMap.put(rpq.Material_Code__c,rpq.Material__c);
				}
			}
			/*
		Map<String,Integer> distMtrlQtyMap = new Map<String,Integer>();
		quoteHighlightrep2.topRequestedSKUs =  new QuoteWrapper();
		For(Pricing_Request__c pr: [select id,(select quantity__c from Pricing_Requests__r order by quantity__c DESC NULLS LAST),name,end_user_code__c,end_user__c,soldto_code__c,Sold_To__c from Pricing_Request__c WHERE is_End_User_Rebate__c=true AND Request_Approval_Status__c='Approved' AND Sales_Org_Code__c='AD50' AND Request_Valid_From__c<=:validonfilter AND Request_Valid_To__c>:validonfilter ORDER BY SoldTo_Code__c,End_User_Code__c,Approver5_Date__c DESC NULLS LAST Limit 5000])
		{
			if(pr.Pricing_Requests__r.size()!=0){
				Integer highestQty = Integer.valueOf(pr.Pricing_Requests__r[0].Quantity__c);
				reqMtrlQtyMap.put(pr.id,highestQty);
			}
		}
		List<Rebate_Quote_Price__c> rpqitems = new List<Rebate_Quote_Price__c>();
		rpqitems = [select id,Pricing_Request__r.name,Quantity__c,Discount__c,End_User__c,End_User_Code__c,Sold_To__c,Sold_To_Code__c,Material_Code__c,Material__c,Valid_From__c,Valid_To__c,Rate__c from Rebate_Quote_Price__c where Pricing_Request__c In :reqMtrlQtyMap.keyset() AND isPriceHolder__c=false ORDER BY Pricing_Request__c ASC NULLS LAST];


		QuoteWrapper qw = new QuoteWrapper();
		For(Rebate_Quote_Price__c rpq : rpqitems){
			Integer highestVal = reqMtrlQtyMap.get(rpq.Pricing_Request__c);
			if(Integer.valueOf(rpq.Quantity__c) == highestVal){
			qw.quote.add(rpq);
			distMtrlQtyMap.put(rpq.Material_Code__c,Integer.valueOf(rpq.Quantity__c));
			}
		}
			 */
			GenerateExportString(rpqIds);
			quoteHighlightrep2.topRequestedSKUs = qw;
			return distMtrlQtyMap;
		}
		Catch(Exception e){
			system.debug(' Message is '+e.getMessage()+' and Line Number is '+e.getLineNumber());
			return new Map<String, Integer>();
		}
	}

	public Map<String,Decimal> RunReport3(){
		Map<String,Decimal> MtrlDiscMap = new Map<String,Decimal>();
		List<Id> rpqIds = new List<Id>();
		List<Rebate_Quote_Price__c> rpqitems = new List<Rebate_Quote_Price__c>();
		rpqitems = [select id,Pricing_Request__r.name,Pricing_Request__c,Quantity__c,Discount__c,End_User__c,End_User_Code__c,Sold_To__c,Sold_To_Code__c,Material_Code__c,Material__c,Valid_From__c,Valid_To__c,Rate__c from Rebate_Quote_Price__c where Sales_Org_Code__c='AD50' AND Valid_From__c<=:validonfilter AND Valid_To__c>:validonfilter AND isPriceHolder__c=false AND Discount__c!=null AND Pricing_Request__c!=null ORDER BY Discount__c DESC NULLS LAST LIMIT 1000];
		Decimal highestVal = rpqitems[0].Discount__c;
		QuoteWrapper qw = new QuoteWrapper();
		try{
			For(Rebate_Quote_Price__c rpq : rpqitems){
				if(rpq.Discount__c == highestVal){
					rpqIds.add(rpq.id);
					qw.quote.add(rpq);
					MtrlDiscMap.put(rpq.Material_Code__c,rpq.Discount__c);
					mtrlMap.put(rpq.Material_Code__c,rpq.Material__c);
				}
			}
			/* Map<Id,Double> distMtrlDiscMap = new Map<Id,Double>();
		quoteHighlightrep3.topDiscountedSKUs =  new QuoteWrapper();
		For(Pricing_Request__c pr: [select id,(select Price_Reduction__c from Pricing_Requests__r order by Price_Reduction__c DESC NULLS LAST),name,end_user_code__c,end_user__c,soldto_code__c,Sold_To__c from Pricing_Request__c WHERE is_End_User_Rebate__c=true AND Request_Approval_Status__c='Approved' AND Sales_Org_Code__c='AD50' AND Request_Valid_From__c<=:validonfilter AND Request_Valid_To__c>:validonfilter ORDER BY SoldTo_Code__c,End_User_Code__c,Approver5_Date__c DESC NULLS LAST Limit 5000])
		{
			if(pr.Pricing_Requests__r.size()!=0){
				//Double highestDisc = Double.valueOf(pr.Pricing_Requests__r[0].Price_Reduction__c);
				system.debug('pr.Pricing_Requests__r[0].Price_Reduction__c is '+pr.Pricing_Requests__r[0].Price_Reduction__c);
				distMtrlDiscMap.put(pr.id,pr.Pricing_Requests__r[0].Price_Reduction__c);
			}
		}
		List<Rebate_Quote_Price__c> rpqitems = new List<Rebate_Quote_Price__c>();
		rpqitems = [select id,Pricing_Request__r.name,Quantity__c,Discount__c,End_User__c,End_User_Code__c,Sold_To__c,Sold_To_Code__c,Material_Code__c,Material__c,Valid_From__c,Valid_To__c,Rate__c from Rebate_Quote_Price__c where Pricing_Request__c In :distMtrlDiscMap.keyset() AND isPriceHolder__c=false ORDER BY Pricing_Request__c ASC NULLS LAST];
		QuoteWrapper qw = new QuoteWrapper();
		For(Rebate_Quote_Price__c rpq : rpqitems){
			system.debug('rpq.Discount__c is '+rpq.Discount__c);
			//Double highestVal = distMtrlDiscMap.get(rpq.Pricing_Request__c);
			if(rpq.Discount__c == distMtrlDiscMap.get(rpq.Pricing_Request__c)){
			MtrlDiscMap.put(rpq.Material_Code__c,rpq.Discount__c);
			qw.quote.add(rpq);
			}
		} */
			GenerateExportString(rpqIds);
			quoteHighlightrep3.topDiscountedSKUs = qw;
			return MtrlDiscMap;
		}
		Catch(Exception e){
			system.debug(' Message is '+e.getMessage()+' and Line Number is '+e.getLineNumber());
			return new Map<String, Decimal>();
		}
	}
	public void runReport4(){
		try{

			List<Id> rpqIds = new List<Id>();
			system.debug('inside loadState');
			List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
			quoteHighlightrep4.higestvalueQuote =  new QuoteWrapper();
			prList = [select id,name,total_deal_value__c,End_User__c,Sold_To__c,On_Behalf_Of__r.Name from pricing_request__c where is_End_User_Rebate__c=true and Customer_Specific__c=true AND Request_Approval_Status__c='Approved' AND Sales_Org_Code__c='AD50' order by total_deal_value__c desc NULLS Last LIMIT 1000];
			system.debug(' prList is '+prList);
			Pricing_Request__c maxValReq = prList.get(0);
			system.debug(' maxValReq is '+maxValReq);
			highestValueEndUser = maxValReq.End_User__c;
			highestValueSoldto = maxValReq.Sold_To__c;
			highestValueSalesRep = maxValReq.On_Behalf_Of__r.Name;
			highestValueQuoteNumber = maxValReq.Name;
			highestValueDealTotal = maxValReq.Total_Deal_Value__c;
			system.debug('highestValueDealTotal is '+highestValueDealTotal);
			List<Rebate_Quote_Price__c> requiredQuotePrices = [select id,Pricing_Request__r.name,Quantity__c,Discount__c,End_User__c,End_User_Code__c,Sold_To__c,Sold_To_Code__c,Material_Code__c,Material__c,Valid_From__c,Valid_To__c,Rate__c from Rebate_Quote_Price__c where pricing_request__c=:maxValReq.id and isPriceHolder__c=false LIMIT 1000];
			//QuoteWrapper qw = new QuoteWrapper();
			//qw.quote.addAll(requiredQuotePrices);
			higestvalueQuotePrices = new List<Rebate_Quote_Price__c>();
			quoteHighlight1 = new QuoteHighlight();
			quoteHighlight2 = new QuoteHighlight();
			quoteHighlight3 = new QuoteHighlight();
			quoteHighlight4 = new QuoteHighlight();
			quoteHighlight1.higestvalueQuote.quote.addAll(requiredQuotePrices);
			//system.debug('higestvalueQuote is '+quoteHighlights.higestvalueQuote);
			this.higestvalueQuotePrices.addAll(requiredQuotePrices);
			quoteHighlightrep4.higestvalueQuote.quote.addAll(requiredQuotePrices);
			system.debug('higestvalueQuotePrices after adding prices is '+higestvalueQuotePrices);
			For(Rebate_Quote_Price__c rpq:requiredQuotePrices){
				rpqIds.add(rpq.id);
			}
			GenerateExportString(rpqIds);
		}
		Catch(Exception e){
			system.debug(e.getMessage());
		}
	}
	/*
	public Map<String,Integer> getReport5(){
		Map<String,Integer> tempMap = new Map<String,Integer>();
		For(pricing_request__c pr : [select id,total_deal_value__c,End_User__c,Sold_To__c,On_Behalf_Of__r.Name from pricing_request__c where is_End_User_Rebate__c=true and Customer_Specific__c=true order by total_deal_value__c desc NULLS Last]){
			if(!tempMap.keyset().contains(pr.On_Behalf_Of__r.Name))
				tempMap.put(pr.On_Behalf_Of__r.Name,1);
				else{
					Integer count = tempMap.get(pr.On_Behalf_Of__r.Name);
					count = count+1;
					tempMap.put(pr.On_Behalf_Of__r.Name,count);
				}

		}
		return tempMap;
	}

	public Map<Id,List<Rebate_Quote_Price__c>> getActiveQuotes(){
		Map<Id,List<Rebate_Quote_Price__c>> activeQtMap = new Map<Id,List<Rebate_Quote_Price__c>>();
		return activeQtMap;
	}
	public List<SelectOption> getDists(){
		List<SelectOption> distList = new List<SelectOption>();
		Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
		List<ERP_Customer__c> erpCusList = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,
				Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
				Zip_Postal_Code__c FROM ERP_Customer__c WHERE 
				RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c ='AD50' AND Distribution_Channel_Code__c ='10' AND Division_Code__c ='02'];
		For(ERP_Customer__c cus : erpCusList){
			distList.add(new SelectOption(cus.Customer_Code__c,cus.Name));
		}
		return distList;
	}
	 */
	public List<sObject> getListBusinessComponents(){
		return new List<sObject>();
	}

	public List<SelectOption> getListOptions(){
		return new List<SelectOption>();
	}

	public List<PARelatedList> getListWrappers(){
		return new List<PARelatedList>();
	}

	public void save(){

	}

	public void deleteRecord(){

	}

	public String validate(String desiredAction){
		return 'done';
	}

	public String action(String newPagelabel,String currentPageLabel, String desiredAction){
		return 'newlabel';
	}

	public String getName(){
		return 'name';
	}
}