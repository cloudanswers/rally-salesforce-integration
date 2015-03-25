@isTest
private class RallySyncTests {
    
    @isTest static void testNoRecordsReturned() {
        RallyAPI.getOverride = '{"QueryResult": {"_rallyAPIMajor": "2","_rallyAPIMinor": "0","Errors": [],"Warnings": [],"TotalResultCount": 46,"StartIndex": 1,"PageSize": 100, "Results": []}}';
        // mapping to task because unlikely that dml will have issues
        RallySync b = new RallySync('asdf', 'Task', 'Subject', new Map<String, String>{}, new Map<String, String>{}, '');
        b.start(null);
        b.execute(null, new List<Integer>{0});
        b.finish(null);
    }

    @isTest static void testRecordsReturned() {
        RallyAPI.getOverride = '{"QueryResult": {"_rallyAPIMajor": "2","_rallyAPIMinor": "0","Errors": [],"Warnings": [],"TotalResultCount": 46,"StartIndex": 1,"PageSize": 100, "Results": [{"_rallyAPIMajor": "2","_rallyAPIMinor": "0","_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/hierarchicalrequirement/28141617974","_refObjectUUID": "11df8bf3-dbdc-4cc9-8665-449406ad12e5","_objectVersion": "8","_refObjectName": "Test Object Name","CreationDate": "2015-01-09T19:28:26.021Z","_CreatedAt": "Jan 9","ObjectID": 28141617974,"VersionId": "8","Subscription": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/subscription/1836867000",    "_refObjectUUID": "8c365146-bc44-4381-93ae-2f0f5d039206",    "_refObjectName": "Test Subscription",    "_type": "Subscription"},"Workspace": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/workspace/1836867012",    "_refObjectUUID": "96cc1222-f03d-445e-8633-fad8f924d1c9",    "_refObjectName": "Test Workspace",    "_type": "Workspace"},"Changesets": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Changesets",    "_type": "Changeset",    "Count": 0},"Description": "Test Description","Discussion": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Discussion",    "_type": "ConversationPost",    "Count": 0},"DisplayColor": null,"Expedite": false,"FormattedID": "US3134","LastUpdateDate": "2015-03-18T17:24:27.971Z","LatestDiscussionAgeInMinutes": null,"Milestones": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Milestones",    "_type": "Milestone",    "_tagsNameArray": [],    "Count": 0},"Name": "Test Name","Notes": "Test Notes","Owner": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/user/1836867005",    "_refObjectUUID": "484559af-fe5a-4cb4-badc-d6b3cd203af0",    "_refObjectName": "Peter",    "_type": "User"},"Project": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/project/28141266208",    "_refObjectUUID": "5d18e0af-5a16-4dcc-90f3-a1664b9dd377",    "_refObjectName": "Test Project",    "_type": "Project"},"Ready": false,"RevisionHistory": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/revisionhistory/28141617975",    "_refObjectUUID": "6e972938-21a4-43a9-95a6-aa6444a35b1e",    "_type": "RevisionHistory"},"Tags": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Tags",    "_type": "Tag",    "_tagsNameArray": [{        "Name": "CloudAnswers",        "_ref": "/tag/32343199299"    }],    "Count": 1},"ScheduleState": "Completed","Attachments": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Attachments",    "_type": "Attachment",    "Count": 0},"Package": null,"AcceptedDate": null,"Blocked": false,"BlockedReason": null,"Blocker": null,"Children": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Children",    "_type": "HierarchicalRequirement",    "Count": 0},"DefectStatus": "NONE","Defects": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Defects",    "_type": "Defect",    "Count": 0},"DirectChildrenCount": 0,"DragAndDropRank": ",~~w/)3=fE+85]IS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","HasParent": false,"InProgressDate": "2015-02-09T21:54:13.306Z","Iteration": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/iteration/31719183492",    "_refObjectUUID": "55a73f0f-0cb4-4188-9e15-68d01bd9a118",    "_refObjectName": "2015 week 10/11 ends March 22",    "_type": "Iteration"},"Parent": null,"PlanEstimate": 8.0,"Predecessors": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Predecessors",    "_type": "HierarchicalRequirement",    "Count": 0},"Recycled": false,"Release": null,"Successors": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Successors",    "_type": "HierarchicalRequirement",    "Count": 0},"TaskActualTotal": 0.0,"TaskEstimateTotal": 0.0,"TaskRemainingTotal": 0.0,"TaskStatus": "NONE","Tasks": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/Tasks",    "_type": "Task",    "Count": 0},"TestCaseStatus": "NONE","TestCases": {    "_rallyAPIMajor": "2",    "_rallyAPIMinor": "0",    "_ref": "https://rally1.rallydev.com/slm/webservice/v2.0/HierarchicalRequirement/28141617974/TestCases",    "_type": "TestCase",    "Count": 0},"c_Cust2Notify": null,"c_Cust2NotifyText": null,"Feature": null,"PortfolioItem": null,"_type": "HierarchicalRequirement"}]}}';
        // mapping to task because unlikely that dml will have issues
        Map<String, String> mappings = new Map<String, String>{
            'Name' => 'Subject',
            'Description' => 'Description'
        };
        Map<String, Object> defaults = new Map<String, Object>{
            'Status' => 'OpenX',
            'OwnerId' => UserInfo.getUserId()
        };

        RallySync b = new RallySync('asdf', 'Task', 'Subject', mappings, defaults, '');
        b.start(null);
        b.execute(null, new List<Integer>{0});
        b.finish(null);

        System.assertEquals('Test Name', [select Subject from Task limit 1].Subject);
        System.assertEquals('Test Description', [select Description from Task limit 1].Description);

        b = new RallySync('asdf', 'Task', 'Subject', mappings, defaults, '');
        b.start(null);
        b.execute(null, new List<Integer>{0});
        b.finish(null);

        // make sure id matching worked 
        System.assertEquals(1, [select Id from Task].size());
    }

}