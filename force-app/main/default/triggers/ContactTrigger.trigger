/*
trigger ContactTrigger on Contact (after insert) {
    if (trigger.isAfter && trigger.isInsert) {
        for (contact eachContact : trigger.new) {
            if (eachContact.AccountId != null) {
                system.debug(eachContact.LastName + ' contact created WITH Account ');
            } else {
                system.debug(eachContact.LastName + ' contact created WITHOUT Account ');
            }
        }
    }
}
*/
trigger ContactTrigger on Contact (after insert){
    
}