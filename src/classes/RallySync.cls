global class RallySync implements Database.Batchable<Integer> {

    String apiKey;
    String typeName;
    String externalIdField;
    Map<String, String> mappings;
    Integer pageSize = 10;
    Integer startingAt = 1;

    global RallySync(String apiKey, String typeName, String externalIdField, Map<String, String> mappings) {
        this.apiKey = apiKey;
        this.typeName = typeName;
        this.externalIdField = externalIdField;
        this.mappings = mappings;
    }

    global List<Integer> start(Database.BatchableContext BC) {
        return new List<Integer> {0};
        // todo implement pagination
    }

    global void execute(Database.BatchableContext BC, List<Integer> scope) {
        List<SObject> toInsert = new List<SObject>();
        for (Integer i : scope) {
            Map<String, Object> apiResult = RallyAPI.getHierarchicalRequirements('', pageSize, startingAt, apiKey);
            List<Object> results = (List<Object>)apiResult.get('Results');
            for (Object o : results) {
                Map<String, Object> r = (Map<String, Object>)o;
                toInsert.add(
                    makeSObject(r)
                );
            }
        }
        // update the existing found, then insert anything without ids since we can't upsert?
        setIdsFromExternalIds(toInsert);
        Database.update(toInsert, false);
        Database.insert(toInsert, false);
        // todo handle errors
    }

    global void finish(Database.BatchableContext BC) {
        // todo : start next batch if we need it
    }

    private SObject makeSObject(Map<String, Object> fromMap) {
        SObject sobj = (SObject)Type.forName(typeName).newInstance();
        for (String k : mappings.keySet()) {
            sobj.put(mappings.get(k), fromMap.get(k));
        }
        return sobj;
    }

    private void setIdsFromExternalIds(List<SObject> sobjects) {
        List<String> externalIds = new List<String>();
        for (SObject sobj : sobjects) {
            externalIds.add((String)sobj.get(externalIdField));
        }
        Map<String, SObject> existing = getExistingSObjects(externalIds);
        for (SObject sobj : sobjects) {
            String val = (String)sobj.get(externalIdField);
            if (existing.containsKey(val)) {
                sobj.put('Id', existing.get(val).Id);
            }
        }
    }

    private Map<String, SObject> getExistingSObjects(List<String> externalIds) {
        Map<String, SObject> result = new Map<String, SObject>();
        for (SObject o : Database.query('select Id, '+externalIdField+' from '+typeName+' where '+externalIdField+' in :externalIds')) {
            result.put((String)o.get(externalIdField), o);
        }
        return result;
    }

}