/*
trigger OpportunityTrigger on opportunity (before insert) {
    if (trigger.isBefore && trigger.isInsert) {
        for (opportunity eachOpp : trigger.new) {
            system.debug('Opportunity name ' + eachOpp.name + ' ' + ' Opportunity CloseDate ' + eachOpp.closedate + ' ' + 'Opportunity amount ' + eachOpp.amount);
            system.debug(trigger.new.size());
        }
    }
}
*/


trigger OpportunityTrigger on opportunity (after insert) {
    if (trigger.isAfter && trigger.isInsert) {
        for (opportunity eachOpp : trigger.new) {
            system.debug('Opportunity name ' + eachOpp.name + ' ' + 'Opportunity stage name ' + eachOpp.stagename + ' ' + ' Opportunity description ' + eachOpp.description);
        }
    }
}
