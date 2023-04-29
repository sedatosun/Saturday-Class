@RestResource(urlMapping ='/Contact/*')
global with sharing class ContactManager {
    //EndPoint: https://saturdayclasscom-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/0038d00000Ow160AAB
    //HTTP Method: GET
    @HttpGet
    global static Contact getContact() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;

        Integer lastIndex = uri.lastIndexOf('/');
        Id contactId = uri.substring(lastIndex+1);

        Contact con = [SELECT FirstName, LastName, Title, Email, Department FROM Contact WHERE Id =: contactId];

        return con;
    }

    //EndPoint: https://saturdayclasscom-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/
    //HTTP Method: POST
    @HttpPost
    global static ID postContact() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();

        Contact con = (Contact)JSON.deserialize(body, Contact.class);
        insert con;
        return con.Id;
    }

    //EndPoint: https://saturdayclasscom-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/0038d00000VQW5dAAH
    //HTTP Method: DELETE
    @HttpDelete
    global static void deleteContact() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;

        Integer lastIndex = uri.lastIndexOf('/');
        Id contactId = uri.substring(lastIndex+1);

        Contact con = [SELECT Id FROM Contact WHERE Id =: contactId];
            delete con;
    }

    //EndPoint: https://saturdayclasscom-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/0038d00000VQW5dAAH
    //HTTP Method: PUT
    @HttpPut
    global static Id putContact(String Id1, String FirstName1, String LastName1, String Title1, String Department1, String Email1) {
        Contact c = new Contact();
        c.Id = Id1;
        c.FirstName = FirstName1;
        c.LastName = LastName1;
        c.Title = Title1;
        c.Email = Email1;
        c.Department = Department1;

        upsert c;
        return c.Id;
    }

    //EndPoint: https://saturdayclasscom-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/0038d00000VQW5dAAH
    //HTTP Method: PATCH
    @HttpPatch
    global static Contact patchContact() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();

        Contact con = (Contact)JSON.deserialize(body, Contact.class);

        update con;
        return con;
    }
}