/*
trigger CaseTrigger on Case (before insert, before update, after insert, after update) {

    system.debug('We are in the triggers');
    if (trigger.isBefore) {
        system.debug('We are in the before triggers');
        if (trigger.isUpdate) {
            system.debug('We are in the before-Update triggers');
        }
        if (trigger.isInsert) {
            system.debug('We are in the before-Insert triggers');
        }
    }
    if (trigger.isAfter) {
        system.debug('We are in the after triggers');
        if (trigger.isUpdate) {
            system.debug('We are in the after-Update triggers');
        }
        if (trigger.isInsert) {
            system.debug('We are in the after-Insert triggers');
        }
    }
}
*/

/*
trigger CaseTrigger on Case (after insert) {
    if(trigger.isAfter && trigger.isInsert)
    for (case c1 : trigger.new) {
        System.debug('case ' + c1.CaseNumber + 'id ' + c1.Id + 'created date ' + c1.CreatedDate);
    }
}
*/
/*
trigger CaseTrigger on Case (before update){
    if (trigger.isBefore && trigger.isUpdate) {
        CaseTriggerHandler.caseMethod(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}
*/
trigger CaseTrigger on Case (before insert){
    CaseTriggerHandler.caseMethod2(trigger.new);
}