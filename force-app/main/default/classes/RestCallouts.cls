public with sharing class RestCallouts {
    //Endpoint : https://api.covidtracking.com/v1/us/current.json
    //HTTP Method : GET 
    public static HttpResponse getCovidInfo(){
        // 1.Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        // 2. Prepare Internet
        Http http = new Http();

        // 3. Send HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        // 4. Process HttpResponse
        if(response.getStatusCode() == 200){
            string jsonString = response.getBody();
            //system.debug(jsonString);

            //Deserialize JSON format message to Apex Format
            List<CovidInfoResponse> covRes = (List<CovidInfoResponse>) JSON.deserialize(jsonString, List<CovidInfoResponse>.class);
            List<Covid_Info__c> cov =[SELECT Id, Name, Positive__c, Negative__c, Pending__c FROM Covid_Info__c WHERE Received_Date__c = TODAY];
            
            if (cov.size()>0) {
            //if(!cov.isEmpty()){}
                cov[0].Name =  String.valueOf(covRes[0].states);
                cov[0].Positive__c = covRes[0].positive;
                cov[0].Negative__c = covRes[0].negative;
                cov[0].Pending__c = covRes[0].pending;
                update cov[0];
            } else {
                Covid_Info__c cvd = new Covid_Info__c();
                cvd.Name =  String.valueOf(covRes[0].states);
                cvd.Positive__c = covRes[0].positive;
                cvd.Negative__c = covRes[0].negative;
                cvd.Pending__c = covRes[0].pending;
                cvd.Received_Date__c = Date.today();
                insert cvd;
            }            
        }
        return response;
    }
    //Endpoint : https://gorest.co.in/public/v2/posts
    //HTTP Method : POST
    //Access Token: 4771ca5624c08c5523a6b1a8dd831ad80f053836fcce1341f4de0afa33e86a79
    public static HttpResponse postPost(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');

        PostsWrapper wrap = new PostsWrapper();
        Posts__c pst = [SELECT Id, Name, Title__c, User_ID__c, Body__c FROM Posts__c WHERE CreatedDate = TODAY];
        wrap.user_id = Integer.valueOf(pst.User_ID__c);
        wrap.title = pst.Title__c; 
        wrap.body = pst.Body__c;

        string jsonBody = JSON.serialize(pst);
        request.setBody(jsonBody);
        system.debug(jsonBody);
        //TOKEN Authorization
        request.setHeader('Authorization', 'Bearer b42db5c4d55857f836f8612dc3c512b321e610f0e6c8ed2bb0be50b33e8a5668');

        Http http = new Http();

        HttpResponse response = http.send(request);

        if (response.getStatusCode()==201){
            String jsonString = response.getBody();
            system.debug(jsonString);
        }
        return response;
    }
}