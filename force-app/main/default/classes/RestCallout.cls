public with sharing class RestCallout {
    @future(callout=true)
    public static void postEmployee(Id employeeId) {
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');

        Employee__c emp = [SELECT Name, Gender__c,Email__c, Designation__c, Complete_Address__c, Phone_Number__c,Username__c, Integration_Status__c FROM Employee__c WHERE Id =: employeeId];

        EmployeeWrapper wrap = new EmployeeWrapper();

        wrap.username = emp.Username__c;
        wrap.name = emp.Name;
        wrap.email = emp.Email__c;
        wrap.gender = emp.Gender__c;
        wrap.designation = emp.Designation__c;
        wrap.phone_number = emp.Phone_Number__c;
        wrap.complete_address = emp.Complete_Address__c;

        String jsonBody = JSON.serialize(wrap);

        request.setBody(jsonBody);

        Http http = new Http();

        HttpResponse response = http.send(request);

        emp.Integration_Status__c = string.valueOf(response.getStatusCode());
        try {
            update emp;
        } catch (Exception ex) {
            system.debug(ex.getMessage());
        }
    }
}