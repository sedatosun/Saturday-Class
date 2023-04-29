public with sharing class EmployeeTriggerHandler {
    public static void EmployeeInsert(list<Employee__c> empList) {
        for (Employee__c emp : empList) {
            RestCallout.postEmployee(emp.Id);
        }
    }
}