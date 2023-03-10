trigger AccountTrigger on Account (before update, after insert) {
    if (trigger.isAfter && trigger.isInsert) {
        AccountTriggerHandler.method1(trigger.new);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        AccountTriggerHandler.method2(trigger.new);
        AccountTriggerHandler.method3(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}