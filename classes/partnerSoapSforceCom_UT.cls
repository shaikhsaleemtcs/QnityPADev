@isTest

public class partnerSoapSforceCom_UT{
    static testMethod void partnerSoapSforceComTestMethod(){
        partnerSoapSforceCom instance = new partnerSoapSforceCom();
        partnerSoapSforceCom.DescribeSoftphoneLayoutResult desSoLaRes = new partnerSoapSforceCom.DescribeSoftphoneLayoutResult();
        partnerSoapSforceCom.queryMore_element queryEle = new partnerSoapSforceCom.queryMore_element();
        partnerSoapSforceCom.DescribeAppMenuResult desAppMenuRes = new partnerSoapSforceCom.DescribeAppMenuResult();
        partnerSoapSforceCom.DescribeSoftphoneLayoutItem desSoLaItem = new partnerSoapSforceCom.DescribeSoftphoneLayoutItem();
        partnerSoapSforceCom.DescribeSoftphoneLayoutSection desSoLaSection = new partnerSoapSforceCom.DescribeSoftphoneLayoutSection();
        partnerSoapSforceCom.PerformQuickActionRequest perQuickActionReq = new partnerSoapSforceCom.PerformQuickActionRequest();
        partnerSoapSforceCom.describeQuickActionsResponse_element desQuickActionRes_Ele = new partnerSoapSforceCom.describeQuickActionsResponse_element();
        partnerSoapSforceCom.ReportChartComponent rcc = new partnerSoapSforceCom.ReportChartComponent();
        partnerSoapSforceCom.loginResponse_element loginRes_ele = new partnerSoapSforceCom.loginResponse_element();
        partnerSoapSforceCom.describeAppMenuResponse_element desAppMenuRes_ele = new partnerSoapSforceCom.describeAppMenuResponse_element();
        partnerSoapSforceCom.Email email = new partnerSoapSforceCom.Email();
        partnerSoapSforceCom.describeSoftphoneLayout_element desSoLa_ele = new partnerSoapSforceCom.describeSoftphoneLayout_element();
        partnerSoapSforceCom.getServerTimestamp_element serverTimestamp_ele = new partnerSoapSforceCom.getServerTimestamp_element();
        partnerSoapSforceCom.ChildRelationship cr = new partnerSoapSforceCom.ChildRelationship();
        partnerSoapSforceCom.process_element proc_ele = new partnerSoapSforceCom.process_element();
        partnerSoapSforceCom.DescribeLayoutComponent desLaComp = new partnerSoapSforceCom.DescribeLayoutComponent();
        partnerSoapSforceCom.LimitInfo limitInfo = new partnerSoapSforceCom.LimitInfo();
        partnerSoapSforceCom.LimitInfoHeader_element limitIntoHeader_ele = new partnerSoapSforceCom.LimitInfoHeader_element();
        partnerSoapSforceCom.QueryOptions_element queryOpt_ele = new partnerSoapSforceCom.QueryOptions_element();
        partnerSoapSforceCom.CallOptions_element callOpt_ele = new partnerSoapSforceCom.CallOptions_element();
        partnerSoapSforceCom.describeAvailableQuickActions_element desAvailableQuickAct_ele = new partnerSoapSforceCom.describeAvailableQuickActions_element();
        partnerSoapSforceCom.AllOrNoneHeader_element allOrNoneHeader_ele = new partnerSoapSforceCom.AllOrNoneHeader_element();
        partnerSoapSforceCom.DescribeSoftphoneLayoutInfoField desSoLaInfoField = new partnerSoapSforceCom.DescribeSoftphoneLayoutInfoField();
        partnerSoapSforceCom.describeTabsResponse_element desTabRes_ele = new partnerSoapSforceCom.describeTabsResponse_element();
        partnerSoapSforceCom.describeTabs_element desTabs_ele = new partnerSoapSforceCom.describeTabs_element();
        partnerSoapSforceCom.DescribeLayoutButton dlb = new partnerSoapSforceCom.DescribeLayoutButton();
        partnerSoapSforceCom.describeGlobalResponse_element desGlobalRes_ele = new partnerSoapSforceCom.describeGlobalResponse_element();
        partnerSoapSforceCom.SendEmailError sendEmailError = new partnerSoapSforceCom.SendEmailError();
        partnerSoapSforceCom.DescribeLayoutItem desLayoutItem = new partnerSoapSforceCom.DescribeLayoutItem();
        partnerSoapSforceCom.emptyRecycleBin_element emptyRecBin_ele = new partnerSoapSforceCom.emptyRecycleBin_element();
        partnerSoapSforceCom.DisableFeedTrackingHeader_element disFeedTrackingHeader_ele = new partnerSoapSforceCom.DisableFeedTrackingHeader_element();
        partnerSoapSforceCom.MergeResult mergeRes = new partnerSoapSforceCom.MergeResult();
        partnerSoapSforceCom.describeAppMenu_element desAppMenu_ele = new partnerSoapSforceCom.describeAppMenu_element();
        partnerSoapSforceCom.searchResponse_element searchRes_ele = new partnerSoapSforceCom.searchResponse_element();
        partnerSoapSforceCom.sendEmail_element sendEmail_ele = new partnerSoapSforceCom.sendEmail_element();
        partnerSoapSforceCom.delete_element del_ele = new partnerSoapSforceCom.delete_element();
        partnerSoapSforceCom.DescribeQuickActionListResult desQuickActionListRes = new partnerSoapSforceCom.DescribeQuickActionListResult();
        partnerSoapSforceCom.DescribeLayoutButtonSection dseLayoutButtonSec = new partnerSoapSforceCom.DescribeLayoutButtonSection();
        partnerSoapSforceCom.updateResponse_element updateRes_ele = new partnerSoapSforceCom.updateResponse_element();
        partnerSoapSforceCom.DescribeComponentInstanceProperty desCompInsProperty = new partnerSoapSforceCom.DescribeComponentInstanceProperty();
        partnerSoapSforceCom.retrieve_element retrieve_ele = new partnerSoapSforceCom.retrieve_element();
        partnerSoapSforceCom.RelatedList relatedList = new partnerSoapSforceCom.RelatedList();
        partnerSoapSforceCom.describeGlobalThemeResponse_element desGlobalThemeRes_ele = new partnerSoapSforceCom.describeGlobalThemeResponse_element();
        partnerSoapSforceCom.describeSearchScopeOrderResponse_element desSearchScopeOrderRes_ele = new partnerSoapSforceCom.describeSearchScopeOrderResponse_element();
        partnerSoapSforceCom.DescribeThemeItem desThemeItem = new partnerSoapSforceCom.DescribeThemeItem();
        partnerSoapSforceCom.create_element create_ele = new partnerSoapSforceCom.create_element();
        partnerSoapSforceCom.DescribeFlexiPageRegion desFlexiPageRegion = new partnerSoapSforceCom.DescribeFlexiPageRegion();
        partnerSoapSforceCom.describeThemeResponse_element desThemeRes_ele = new partnerSoapSforceCom.describeThemeResponse_element();
        partnerSoapSforceCom.createResponse_element createRes_ele = new partnerSoapSforceCom.createResponse_element();
        partnerSoapSforceCom.ProcessRequest processReq = new partnerSoapSforceCom.ProcessRequest();
        partnerSoapSforceCom.LeadConvert leadConvert = new partnerSoapSforceCom.LeadConvert();
        partnerSoapSforceCom.DescribeQuickActionListItemResult desQuickActionListItemRes = new partnerSoapSforceCom.DescribeQuickActionListItemResult();
        partnerSoapSforceCom.LocaleOptions_element localeOpt_ele = new partnerSoapSforceCom.LocaleOptions_element();
        partnerSoapSforceCom.DescribeSoftphoneScreenPopOption desSoScreenPopOpt = new partnerSoapSforceCom.DescribeSoftphoneScreenPopOption();
        partnerSoapSforceCom.getUpdatedResponse_element updateResponse_ele = new partnerSoapSforceCom.getUpdatedResponse_element();
        partnerSoapSforceCom.StreamingEnabledHeader_element streamingEnableHeader_ele = new partnerSoapSforceCom.StreamingEnabledHeader_element();
        partnerSoapSforceCom.DescribeDataCategoryGroupResult desDataCategoryGrpRes = new partnerSoapSforceCom.DescribeDataCategoryGroupResult();
        partnerSoapSforceCom.DataCategory dataCat = new partnerSoapSforceCom.DataCategory();
        partnerSoapSforceCom.GetDeletedResult deletedRes = new partnerSoapSforceCom.GetDeletedResult();
        partnerSoapSforceCom.DescribeLayoutResult desLayoutRes = new partnerSoapSforceCom.DescribeLayoutResult();
        partnerSoapSforceCom.DescribeLayoutSection desLayoutSec = new partnerSoapSforceCom.DescribeLayoutSection();
        partnerSoapSforceCom.AssignmentRuleHeader_element assignmentRuleHeader_ele = new partnerSoapSforceCom.AssignmentRuleHeader_element();
        partnerSoapSforceCom.PackageVersionHeader_element packageVersionHeader_ele = new partnerSoapSforceCom.PackageVersionHeader_element();
        partnerSoapSforceCom.login_element login_ele = new partnerSoapSforceCom.login_element();
        partnerSoapSforceCom.SendEmailResult sendEmailRes = new partnerSoapSforceCom.SendEmailResult();
        partnerSoapSforceCom.getUpdated_element updated_ele = new partnerSoapSforceCom.getUpdated_element();
        partnerSoapSforceCom.PicklistForRecordType picklistForRecType = new partnerSoapSforceCom.PicklistForRecordType();
        partnerSoapSforceCom.upsertResponse_element upsertRes_ele = new partnerSoapSforceCom.upsertResponse_element();
        partnerSoapSforceCom.Field field = new partnerSoapSforceCom.Field();
        partnerSoapSforceCom.describeFlexiPagesResponse_element desFlexiPagesRes_ele = new partnerSoapSforceCom.describeFlexiPagesResponse_element();
        partnerSoapSforceCom.describeSObjectsResponse_element desSObjRes = new partnerSoapSforceCom.describeSObjectsResponse_element();
        partnerSoapSforceCom.undeleteResponse_element undeletedRes_ele = new partnerSoapSforceCom.undeleteResponse_element();
        partnerSoapSforceCom.setPasswordResponse_element passwordRes_ele = new partnerSoapSforceCom.setPasswordResponse_element();
        partnerSoapSforceCom.describeLayout_element desLayout_ele = new partnerSoapSforceCom.describeLayout_element();
        partnerSoapSforceCom.DescribeLayout desLayout = new partnerSoapSforceCom.DescribeLayout();
        partnerSoapSforceCom.sendEmailResponse_element sendEmailRes_ele = new partnerSoapSforceCom.sendEmailResponse_element();
        partnerSoapSforceCom.PicklistEntry pickListEntry = new partnerSoapSforceCom.PicklistEntry();
        partnerSoapSforceCom.UserTerritoryDeleteHeader_element userTerritoryDelHeader_ele = new partnerSoapSforceCom.UserTerritoryDeleteHeader_element();
        partnerSoapSforceCom.SearchRecord searchRec = new partnerSoapSforceCom.SearchRecord();
        partnerSoapSforceCom.describeSObjectResponse_element desSObjRes_ele = new partnerSoapSforceCom.describeSObjectResponse_element();
        partnerSoapSforceCom.GetUpdatedResult getUpdatesRes = new partnerSoapSforceCom.GetUpdatedResult();
        partnerSoapSforceCom.RelatedListColumn relatedListCol = new partnerSoapSforceCom.RelatedListColumn();
        partnerSoapSforceCom.EmailHeader_element emailHeader_ele = new partnerSoapSforceCom.EmailHeader_element();
        partnerSoapSforceCom.DescribeQuickActionDefaultValue desQuickActionDefaultValue = new partnerSoapSforceCom.DescribeQuickActionDefaultValue();
        partnerSoapSforceCom.performQuickActionsResponse_element performQuickActionsRes_ele = new partnerSoapSforceCom.performQuickActionsResponse_element();
        partnerSoapSforceCom.resetPassword_element resetPwd_ele = new partnerSoapSforceCom.resetPassword_element();
        partnerSoapSforceCom.UndeleteResult undelRes = new partnerSoapSforceCom.UndeleteResult();
        partnerSoapSforceCom.Error erroe= new partnerSoapSforceCom.Error();
        partnerSoapSforceCom.DebuggingHeader_element debuggingHeader_ele = new partnerSoapSforceCom.DebuggingHeader_element();
        partnerSoapSforceCom.SetPasswordResult pwdRes = new partnerSoapSforceCom.SetPasswordResult();
        partnerSoapSforceCom.describeSearchScopeOrder_element desSearchScopeOrder_ele = new partnerSoapSforceCom.describeSearchScopeOrder_element();
        partnerSoapSforceCom.getUserInfo_element userInfo_ele = new partnerSoapSforceCom.getUserInfo_element();
        partnerSoapSforceCom.LoginResult loginResult = new partnerSoapSforceCom.LoginResult();
        partnerSoapSforceCom.describeCompactLayouts_element desCompactLayouts_ele = new partnerSoapSforceCom.describeCompactLayouts_element();
        partnerSoapSforceCom.ProcessResult processResult = new partnerSoapSforceCom.ProcessResult();
        partnerSoapSforceCom.logout_element logout_ele = new partnerSoapSforceCom.logout_element();
        partnerSoapSforceCom.describeDataCategoryGroupsResponse_element desDataCatGrpRes_ele = new partnerSoapSforceCom.describeDataCategoryGroupsResponse_element();
        partnerSoapSforceCom.PerformQuickActionResult performQuickActionRes = new partnerSoapSforceCom.PerformQuickActionResult();
        partnerSoapSforceCom.ResetPasswordResult resetPwdRes = new partnerSoapSforceCom.ResetPasswordResult();
        partnerSoapSforceCom.DescribeColor describeColor = new partnerSoapSforceCom.DescribeColor();
        partnerSoapSforceCom.merge_element merge_ele = new partnerSoapSforceCom.merge_element();
        partnerSoapSforceCom.describeTheme_element desTheme_ele = new partnerSoapSforceCom.describeTheme_element();
        partnerSoapSforceCom.describeSoftphoneLayoutResponse_element desSoLayoutResponse_ele = new partnerSoapSforceCom.describeSoftphoneLayoutResponse_element();
        partnerSoapSforceCom.describeGlobal_element desGlobal_ele = new partnerSoapSforceCom.describeGlobal_element();
        partnerSoapSforceCom.RecordTypeInfo recTypeInfo = new partnerSoapSforceCom.RecordTypeInfo();
        partnerSoapSforceCom.DescribeColumn desColumn = new partnerSoapSforceCom.DescribeColumn();
        partnerSoapSforceCom.queryResponse_element queryRes_ele = new partnerSoapSforceCom.queryResponse_element();
        partnerSoapSforceCom.emptyRecycleBinResponse_element emptyRecBinResponse_ele = new partnerSoapSforceCom.emptyRecycleBinResponse_element();
        partnerSoapSforceCom.EmptyRecycleBinResult emptyRecBinResult = new partnerSoapSforceCom.EmptyRecycleBinResult();
        partnerSoapSforceCom.RelatedContent relatedContent = new partnerSoapSforceCom.RelatedContent();
        partnerSoapSforceCom.describeDataCategoryGroupStructures_element desDataCatGrpStructures_ele = new partnerSoapSforceCom.describeDataCategoryGroupStructures_element();
        partnerSoapSforceCom.DescribeComponentInstance desCompInst = new partnerSoapSforceCom.DescribeComponentInstance();
        partnerSoapSforceCom.DescribeRelatedContentItem desRelatedContentitem = new partnerSoapSforceCom.DescribeRelatedContentItem();
        partnerSoapSforceCom.GetUserInfoResult userInfoResult = new partnerSoapSforceCom.GetUserInfoResult();
        partnerSoapSforceCom.QueryResult queryResult = new partnerSoapSforceCom.QueryResult();
        partnerSoapSforceCom.performQuickActions_element performQuickActions_ele = new partnerSoapSforceCom.performQuickActions_element();
        partnerSoapSforceCom.LeadConvertResult leadConvertResult = new partnerSoapSforceCom.LeadConvertResult();
        partnerSoapSforceCom.sendEmailMessage_element sendEmailMsg_ele = new partnerSoapSforceCom.sendEmailMessage_element();
        partnerSoapSforceCom.processResponse_element processResponse_ele = new partnerSoapSforceCom.processResponse_element();
        partnerSoapSforceCom.MruHeader_element mruHeader_ele = new partnerSoapSforceCom.MruHeader_element();
        partnerSoapSforceCom.DescribeSearchScopeOrderResult desSearchScopeOrderResult = new partnerSoapSforceCom.DescribeSearchScopeOrderResult();
        partnerSoapSforceCom.Soap soap = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.ProcessWorkitemRequest processWorkItemReq = new partnerSoapSforceCom.ProcessWorkitemRequest();
        partnerSoapSforceCom.SessionHeader_element sessionHeader_ele = new partnerSoapSforceCom.SessionHeader_element();
        partnerSoapSforceCom.DescribeDataCategoryGroupStructureResult desDataCatGrpStructureRes = new partnerSoapSforceCom.DescribeDataCategoryGroupStructureResult();
        partnerSoapSforceCom.DescribeFlexiPageResult desFlexiPageResult = new partnerSoapSforceCom.DescribeFlexiPageResult();
        partnerSoapSforceCom.describeDataCategoryGroups_element desDataCatGrps_ele = new partnerSoapSforceCom.describeDataCategoryGroups_element();
        partnerSoapSforceCom.AllowFieldTruncationHeader_element allowFieldTruncationHeader_ele = new partnerSoapSforceCom.AllowFieldTruncationHeader_element();
        partnerSoapSforceCom.SaveResult saveResult = new partnerSoapSforceCom.SaveResult();
        partnerSoapSforceCom.getDeletedResponse_element deleResponse_ele = new partnerSoapSforceCom.getDeletedResponse_element();
        partnerSoapSforceCom.deleteResponse_element deleteResponse_ele = new partnerSoapSforceCom.deleteResponse_element();
        partnerSoapSforceCom.describeSObjects_element desSObj_ele = new partnerSoapSforceCom.describeSObjects_element();
        partnerSoapSforceCom.RecordTypeCompactLayoutMapping recTypeCompactLayoutMapping = new partnerSoapSforceCom.RecordTypeCompactLayoutMapping();
        partnerSoapSforceCom.describeDataCategoryGroupStructuresResponse_element desDataCatGrpStructuresResponse_ele = new partnerSoapSforceCom.describeDataCategoryGroupStructuresResponse_element();
        partnerSoapSforceCom.convertLead_element convertLead_ele = new partnerSoapSforceCom.convertLead_element();
        partnerSoapSforceCom.update_element update_ele = new partnerSoapSforceCom.update_element();
        partnerSoapSforceCom.search_element  search_ele = new partnerSoapSforceCom.search_element();
        partnerSoapSforceCom.DescribeAvailableQuickActionResult desAvailableQuickActionRes = new partnerSoapSforceCom.DescribeAvailableQuickActionResult();
        partnerSoapSforceCom.describeQuickActions_element desQuickActions_ele = new partnerSoapSforceCom.describeQuickActions_element();
        partnerSoapSforceCom.RelatedListSort relatedListSort = new partnerSoapSforceCom.RelatedListSort();
        partnerSoapSforceCom.describeSObject_element desSObject_ele = new partnerSoapSforceCom.describeSObject_element();
        partnerSoapSforceCom.invalidateSessionsResponse_element invalidateSessionResponse_ele = new partnerSoapSforceCom.invalidateSessionsResponse_element();
        partnerSoapSforceCom.LoginScopeHeader_element loginScopeHeader_ele = new partnerSoapSforceCom.LoginScopeHeader_element();
        partnerSoapSforceCom.EmailFileAttachment emailFileAtt = new partnerSoapSforceCom.EmailFileAttachment();
        partnerSoapSforceCom.convertLeadResponse_element convertLeadRes_ele = new partnerSoapSforceCom.convertLeadResponse_element();
        partnerSoapSforceCom.describeSearchLayoutsResponse_element desSearchlayoutRes_ele = new partnerSoapSforceCom.describeSearchLayoutsResponse_element();
        partnerSoapSforceCom.queryAll_element queryAll_ele = new partnerSoapSforceCom.queryAll_element();
        partnerSoapSforceCom.GetServerTimestampResult serverTimeStampResult = new partnerSoapSforceCom.GetServerTimestampResult();
        partnerSoapSforceCom.retrieveResponse_element retrieveResponse_ele = new partnerSoapSforceCom.retrieveResponse_element();
        partnerSoapSforceCom.queryAllResponse_element queryAllResponse_ele = new partnerSoapSforceCom.queryAllResponse_element();
        partnerSoapSforceCom.invalidateSessions_element invalidateSessions_ele = new partnerSoapSforceCom.invalidateSessions_element();
        partnerSoapSforceCom.ProcessSubmitRequest processSubmitRequest = new partnerSoapSforceCom.ProcessSubmitRequest();
        partnerSoapSforceCom.describeLayoutResponse_element desLayoutResponse_ele = new partnerSoapSforceCom.describeLayoutResponse_element();
        partnerSoapSforceCom.DescribeSearchLayoutResult desSearchLayoutResult = new partnerSoapSforceCom.DescribeSearchLayoutResult();
        partnerSoapSforceCom.getServerTimestampResponse_element getServerTimeStampRes_ele = new partnerSoapSforceCom.getServerTimestampResponse_element();
        partnerSoapSforceCom.DescribeIcon describeIcon = new partnerSoapSforceCom.DescribeIcon();
        partnerSoapSforceCom.DeletedRecord deletedRecord = new partnerSoapSforceCom.DeletedRecord();
        partnerSoapSforceCom.SearchResult searchResult = new partnerSoapSforceCom.SearchResult();
        partnerSoapSforceCom.describeGlobalTheme_element desGlobalTheme_ele = new partnerSoapSforceCom.describeGlobalTheme_element();
        partnerSoapSforceCom.query_element query1_ele = new partnerSoapSforceCom.query_element();
        partnerSoapSforceCom.DataCategoryGroupSobjectTypePair datacatGrpSObjTypePair = new partnerSoapSforceCom.DataCategoryGroupSobjectTypePair();
        partnerSoapSforceCom.getDeleted_element getDel_ele = new partnerSoapSforceCom.getDeleted_element();
        partnerSoapSforceCom.PackageVersion packagever= new partnerSoapSforceCom.PackageVersion();
        partnerSoapSforceCom.DescribeGlobalResult desGlobalResult = new partnerSoapSforceCom.DescribeGlobalResult();
        partnerSoapSforceCom.DescribeGlobalTheme desGlobalTheme = new partnerSoapSforceCom.DescribeGlobalTheme();
        partnerSoapSforceCom.describeCompactLayoutsResponse_element desCompactLayoutResponse_ele = new partnerSoapSforceCom.describeCompactLayoutsResponse_element();
        partnerSoapSforceCom.describeSearchLayouts_element desSearchLayouts_ele = new partnerSoapSforceCom.describeSearchLayouts_element();
        partnerSoapSforceCom.SingleEmailMessage singleEmailMessage = new partnerSoapSforceCom.SingleEmailMessage();
        partnerSoapSforceCom.MassEmailMessage massEmailMsg = new partnerSoapSforceCom.MassEmailMessage();
        partnerSoapSforceCom.mergeResponse_element mergeResp_ele = new partnerSoapSforceCom.mergeResponse_element();
        partnerSoapSforceCom.DescribeAppMenuItem descAppMenuItem = new partnerSoapSforceCom.DescribeAppMenuItem();
        partnerSoapSforceCom.DescribeTabSetResult desTebSetResult = new partnerSoapSforceCom.DescribeTabSetResult();
        partnerSoapSforceCom.DescribeCompactLayoutsResult descCompactLayoutResult = new partnerSoapSforceCom.DescribeCompactLayoutsResult();
        partnerSoapSforceCom.getUserInfoResponse_element userInfoResponse_ele = new partnerSoapSforceCom.getUserInfoResponse_element();
        partnerSoapSforceCom.UpsertResult upsertResult = new partnerSoapSforceCom.UpsertResult();
        partnerSoapSforceCom.DescribeSObjectResult describeSObjectResult = new partnerSoapSforceCom.DescribeSObjectResult();
        partnerSoapSforceCom.logoutResponse_element logoutResp_ele = new partnerSoapSforceCom.logoutResponse_element();
        partnerSoapSforceCom.InvalidateSessionsResult invalidateSessionsResult = new partnerSoapSforceCom.InvalidateSessionsResult();
        partnerSoapSforceCom.RecordTypeMapping recordTypeMapping = new partnerSoapSforceCom.RecordTypeMapping();
        partnerSoapSforceCom.DescribeGlobalSObjectResult describeGlobalSObjectResult = new partnerSoapSforceCom.DescribeGlobalSObjectResult();
        partnerSoapSforceCom.DescribeQuickActionResult describeQuickActionResult = new partnerSoapSforceCom.DescribeQuickActionResult();
        partnerSoapSforceCom.DebuggingInfo_element debuggingInfo_ele = new partnerSoapSforceCom.DebuggingInfo_element();
        partnerSoapSforceCom.undelete_element undelete_ele = new partnerSoapSforceCom.undelete_element();
        partnerSoapSforceCom.DeleteResult deleteResult = new partnerSoapSforceCom.DeleteResult();
        partnerSoapSforceCom.queryMoreResponse_element queryMoreResp_ele = new partnerSoapSforceCom.queryMoreResponse_element();
        partnerSoapSforceCom.upsert_element upsert_ele = new partnerSoapSforceCom.upsert_element();
        partnerSoapSforceCom.OwnerChangeOptions_element ownerChangeOptions_ele = new partnerSoapSforceCom.OwnerChangeOptions_element();
        partnerSoapSforceCom.DescribeLayoutRow describeLayoutRow = new partnerSoapSforceCom.DescribeLayoutRow();
        partnerSoapSforceCom.DescribeCompactLayout describeCompactLayout = new partnerSoapSforceCom.DescribeCompactLayout();
        partnerSoapSforceCom.describeAvailableQuickActionsResponse_element descAvailableQuickActionsResp_ele= new partnerSoapSforceCom.describeAvailableQuickActionsResponse_element();
        partnerSoapSforceCom.setPassword_element setPasswrd_ele = new partnerSoapSforceCom.setPassword_element();
        partnerSoapSforceCom.DescribeSoftphoneLayoutCallType descSoLayoutCallType = new partnerSoapSforceCom.DescribeSoftphoneLayoutCallType();
        partnerSoapSforceCom.DescribeThemeResult descThemeRes = new partnerSoapSforceCom.DescribeThemeResult();
        partnerSoapSforceCom.describeFlexiPages_element descFlexiPages_ele = new partnerSoapSforceCom.describeFlexiPages_element();
        partnerSoapSforceCom.sendEmailMessageResponse_element sendEmailMsgResponse_ele = new partnerSoapSforceCom.sendEmailMessageResponse_element();
        partnerSoapSforceCom.resetPasswordResponse_element resetPwdResponse_ele = new partnerSoapSforceCom.resetPasswordResponse_element();
        partnerSoapSforceCom.MergeRequest mergeRequest = new partnerSoapSforceCom.MergeRequest();
        partnerSoapSforceCom.DescribeTab describeTab = new partnerSoapSforceCom.DescribeTab();
    }
    
    static testMethod void SoapInvoke()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.LeadConvert[] convert = new partnerSoapSforceCom.LeadConvert[]{};
            soapInvoke.convertLead( convert );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    static testMethod void describeGlobalTheme()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeGlobalTheme();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeDataCategoryGroupStructures()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            
            partnerSoapSforceCom.DataCategoryGroupSobjectTypePair[] pairs = new partnerSoapSforceCom.DataCategoryGroupSobjectTypePair[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeDataCategoryGroupStructures(pairs ,true);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void sendEmail()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            
            partnerSoapSforceCom.Email[] msg= new partnerSoapSforceCom.Email[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.sendEmail(msg);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    static testMethod void describeAvailableQuickActions()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeAvailableQuickActions('text');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeCompactLayouts()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            String[] recordTypeIds = new String[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeCompactLayouts('text',recordTypeIds  );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
     static testMethod void describeGlobal()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeGlobal();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void retrieve_x()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            String [] ids = new string[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.retrieve_x('','',ids);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeLayout()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            String [] ids = new string[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeLayout('',ids);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void emptyRecycleBin()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            String [] ids = new string[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.emptyRecycleBin(ids);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void process()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.ProcessRequest[] actions = new partnerSoapSforceCom.ProcessRequest[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.process(actions );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeAppMenu()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.describeAppMenu('actions');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void logout()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.logout();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
     static testMethod void create()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            sobjectPartnerSoapSforceCom.sObject_x[] sObjects = new sobjectPartnerSoapSforceCom.sObject_x[]{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.create(sObjects );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
     static testMethod void invalidateSessions()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            string [] sessionIds= new string []{};
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.invalidateSessions(sessionIds);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
     static testMethod void getUserInfo()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.getUserInfo();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
     static testMethod void getServerTimestamp()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            soapInvoke.getServerTimestamp();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void getDeleted()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            DateTime startDate;
            DateTime endDate;
            soapInvoke.getDeleted('',startDate,endDate);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeSearchLayouts()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] sObjectType = new String[]{};
            soapInvoke.describeSearchLayouts(sObjectType );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    
    static testMethod void describeQuickActions()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] quickActions= new String[]{};
            soapInvoke.describeQuickActions(quickActions);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    
    static testMethod void describeFlexiPages()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] flexiPages= new String[]{};
            soapInvoke.describeFlexiPages(flexiPages);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    
    static testMethod void setPassword()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] flexiPages= new String[]{};
            soapInvoke.setPassword('','');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    
    static testMethod void sendEmailMessage()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] ids= new String[]{};
            soapInvoke.sendEmailMessage(ids);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void delete_x()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] ids= new String[]{};
            soapInvoke.delete_x(ids);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void performQuickActions()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.PerformQuickActionRequest[] quickActions= new partnerSoapSforceCom.PerformQuickActionRequest[]{};
            soapInvoke.performQuickActions(quickActions);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void login()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.PerformQuickActionRequest[] quickActions= new partnerSoapSforceCom.PerformQuickActionRequest[]{};
            soapInvoke.login('','');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeTabs()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.PerformQuickActionRequest[] quickActions= new partnerSoapSforceCom.PerformQuickActionRequest[]{};
            soapInvoke.describeTabs();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    
    static testMethod void search_x()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.PerformQuickActionRequest[] quickActions= new partnerSoapSforceCom.PerformQuickActionRequest[]{};
            soapInvoke.search_x('');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void queryMore()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.PerformQuickActionRequest[] quickActions= new partnerSoapSforceCom.PerformQuickActionRequest[]{};
            soapInvoke.queryMore('');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    
    static testMethod void describeDataCategoryGroups()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] sObjectType = new String[] {};
            soapInvoke.describeDataCategoryGroups(sObjectType );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    static testMethod void describeSearchScopeOrder()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] sObjectType = new String[] {};
            soapInvoke.describeSearchScopeOrder();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeSoftphoneLayout()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] sObjectType = new String[] {};
            soapInvoke.describeSoftphoneLayout();
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    static testMethod void describeSObject()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String sObjectType ;
            soapInvoke.describeSObject(sObjectType );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeTheme()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] sObjectType = new string []{} ;
            soapInvoke.describeTheme(sObjectType);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void describeSObjects()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String[] sObjectType = new string []{} ;
            soapInvoke.describeSObjects(sObjectType );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
    static testMethod void getUpdated()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String sObjectType;
            DateTime startDate;
            DateTime endDate;
            
            soapInvoke.getUpdated(sObjectType,startDate,endDate);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void queryAll()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String sObjectType;
            DateTime startDate;
            DateTime endDate;
            
            soapInvoke.queryAll('');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void resetPassword()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            String sObjectType;
            DateTime startDate;
            DateTime endDate;
            
            soapInvoke.resetPassword('');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void merge_x()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.MergeRequest[] request = new partnerSoapSforceCom.MergeRequest[]{};
            
            soapInvoke.merge_x(request );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void query()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.MergeRequest[] request = new partnerSoapSforceCom.MergeRequest[]{};
            
            soapInvoke.query('');
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void update_x()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            sobjectPartnerSoapSforceCom.sObject_x[] sObjects = new sobjectPartnerSoapSforceCom.sObject_x[]{};
            
            soapInvoke.update_x(sObjects );
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    static testMethod void undelete_x()
    {
         try
         {
            Test.startTest();
            Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            partnerSoapSforceCom.Soap soapInvoke = new partnerSoapSforceCom.Soap();
            string [] ids;
            
            soapInvoke.undelete_x(ids);
            Test.Stoptest();
          }
          catch(Exception e)
          {
          }
        
    }
    
    
}