# rally-salesforce-integration

Sync Rally data to Salesforce however you want.

    RallySync.run(
      'apikey', // your api key
      'My_Custom_Object__c', // sobject in your system
      'My_ObjectID_Field__c',  // the field you want to use for upsert
      new Map<String, String>{'Name' => 'Name'}, // field mappings
      '(Tags.name = "CloudAnswers")' // rally query for filtering results
    );

### TODO

1. Point-and-click scheduling instead of anon apex
1. Handle paginated results (more than one iteration of batch)