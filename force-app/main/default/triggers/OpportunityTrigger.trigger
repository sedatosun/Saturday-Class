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

/*
trigger OpportunityTrigger on opportunity (after insert) {
    if (trigger.isAfter && trigger.isInsert) {
        for (opportunity eachOpp : trigger.new) {
            system.debug('Opportunity name ' + eachOpp.name + ' ' + 'Opportunity stage name ' + eachOpp.stagename + ' ' + ' Opportunity description ' + eachOpp.description);
        }
    }
}
*/

/*
trigger OpportunityTrigger on opportunity (before update, after update){
    if (trigger.isUpdate) {
        if (trigger.isBefore) {
            for (opportunity oldOpp : trigger.old) {
                system.debug(oldOpp.Name + ' ' + oldOpp.amount);
            }
        }
        if (trigger.isAfter) {
            for (opportunity newOpp : trigger.new) {
                system.debug(newOpp.Name + ' ' + newOpp.amount);
            }
        }
    }
    
}
*/
/*
trigger OpportunityTrigger on opportunity (before update, after update) {
    Map<Id, Opportunity> oppOldRecsMap = Trigger.oldMap;
        for(Opportunity opp : Trigger.new){
            System.debug('New Opportunity Name  ' + opp.Name);
            System.debug('Old Opportunity Name  ' + oppOldRecsMap.get(opp.Id).Name);
            System.debug('New Opportunity Amount ' + opp.Amount);
            System.debug('Old Opportunity Amount ' +  oppOldRecsMap.get(opp.Id).Amount);
        }
}
*/
trigger OpportunityTrigger on opportunity (before update) {
    if (trigger.isBefore && trigger.isUpdate) {
        OpportunityTriggerHandler.oppMethod(trigger.new, trigger.oldMap);
    }
}