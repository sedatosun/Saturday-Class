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
/*
trigger OpportunityTrigger on opportunity (before update) {
    if (trigger.isBefore && trigger.isUpdate) {
        OpportunityTriggerHandler.oppMethod(trigger.new, trigger.oldMap);
    }
}
*/
trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update, after delete, after undelete) {
    set<id> ac = new set<id>();
    if (trigger.isAfter) {
        if (trigger.isInsert || trigger.isUndelete) {
            /*OpportunityTriggerHandler.future1(trigger.newMap.keySet());*/
    
        for (Opportunity eachOpp : trigger.new) {
        
        ac.add(eachopp.AccountId);
    }
        }
    }
    if (trigger.isDelete) {
        for (opportunity eachOld : trigger.old) {
            ac.add(eachOld.AccountId);
        }
    }
    if (trigger.isUpdate) {
        for (opportunity eachUp : trigger.new) {
            if (eachUp.Amount != trigger.oldMap.get(eachUp.Id).Amount || eachUp.StageName != trigger.oldMap.get(eachUp.Id).StageName) {
                ac.add(eachUp.AccountId);
                ac.add(trigger.oldMap.get(eachUp.Id).AccountId);
            }
        }
    }
    OpportunityTriggerHandler.future1(ac);
    OpportunityTriggerHandler.future2(ac);
}