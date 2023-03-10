trigger PaymentTrigger on Payment2__c (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            PaymentTriggreHandler.createMethod(Trigger.new);
        }
        if(Trigger.isUpdate){
            PaymentTriggreHandler.updateMethod(Trigger.new, trigger.oldMap);
        }
        if(Trigger.isDelete){
            PaymentTriggreHandler.deleteMethod(Trigger.old);
        }
    }
}