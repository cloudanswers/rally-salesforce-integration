@IsTest
public with sharing class RallyAPITests {
    @IsTest static void testCoverage () {
        RallyAPI.getOverride = '{"QueryResult": {"_rallyAPIMajor": "2","_rallyAPIMinor": "0","Errors": [],"Warnings": [],"TotalResultCount": 46,"StartIndex": 1,"PageSize": 100, "Results": []}}';
        RallyAPI.get('asdf', 'asdf');
        RallyAPI.getHierarchicalRequirements(null, null, null, 'asfd');
    }
}