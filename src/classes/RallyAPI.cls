public with sharing class RallyAPI {
    
    private static String baseUrl = 'https://rally1.rallydev.com/slm/webservice/v2.0';

    public static RallyHierarchicalRequirementWrapper getHierarchicalRequirements (String query, Integer pageSize, Integer startingAt, String apiKey) {
        if (query == null) query = '';
        query = EncodingUtil.urlEncode(query, 'UTF-8');
        if (pageSize == null) pageSize = 200;
        if (startingAt == null) startingAt = 1;
        return (RallyHierarchicalRequirementWrapper)JSON.deserialize(
            get('/HierarchicalRequirement?fetch=true&query='+query+'&pagesize='+pageSize+'&start='+startingAt, apiKey).getBody(), 
            RallyHierarchicalRequirementWrapper.class
        );
    }
    
    public class RallyHierarchicalRequirement {
        public String Name;
        public Double ObjectID;
        public String Description;
    }
    
    public class RallyHierarchicalRequirementQueryResult {
        public Integer TotalResultCount;
        public Integer StartIndex;
        public Integer PageSize;
        public RallyHierarchicalRequirement[] Results;
    }

    public class RallyHierarchicalRequirementWrapper {
        public RallyHierarchicalRequirementQueryResult QueryResult;
    }
    
    // helpers

    @TestVisible
    private static String getOverride;

    public static HttpResponse get(String url, String apiKey) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url.startsWith('https://') ? url : baseUrl + url);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('ZSESSIONID', apiKey);
        Http http = new Http();
        HttpResponse res;
        if (Test.isRunningTest()) {
            res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody(getOverride);
        } else {
            res = http.send(req);
        }
        if (res.getStatusCode() != 200) {
            throw new RallyAPIException('Invalid status code: ' + res.getStatusCode());
        }
        return res;
    }

    public class RallyAPIException extends Exception {}

}