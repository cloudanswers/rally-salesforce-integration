# rally-salesforce-integration

Sync Rally data to Salesforce however you want.

    RallySync.run(
      'apikey', // your api key
      'My_Custom_Object__c', // sobject in your system
      'My_ObjectID_Field__c',  // the field you want to use for upsert
      new Map<String, String>{'Name' => 'Name'}, // field mappings
      '(Tags.name = "CloudAnswers")' // rally query for filtering results
    );

### Managed Package

#### Version 1.0

Initial version where you just run it via anon apex

[Production Install Link](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1a0000000b9f) | [Sandbox Install Link](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t1a0000000b9f)


### TODO

1. Point-and-click scheduling instead of anon apex
1. Handle paginated results (more than one iteration of batch)