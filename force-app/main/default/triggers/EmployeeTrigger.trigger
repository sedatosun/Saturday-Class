trigger EmployeeTrigger on Employee__C (after insert) {
    EmployeeTriggerHandler.EmployeeInsert(trigger.new);
}