/*
trigger Customer2Trigger on Customer2__c (after insert) {
    Customer2TriggerHandler.method1(trigger.new);
}
*/
trigger Customer2Trigger on Customer2__c (before delete) {
    Customer2TriggerHandler.method2(trigger.old);
}

