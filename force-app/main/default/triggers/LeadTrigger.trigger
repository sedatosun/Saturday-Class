trigger LeadTrigger on Lead (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        for (lead l1 : trigger.new) {
            if(l1.leadSource == 'Web' ) {
                system.debug('Rating should be COLD');
            } else {
                system.debug('Rating should be HOT');
            }
        }
    }
    
}