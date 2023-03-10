public class Payment2TriggerHandler {
    public static void createMethod(list<Payment2__C> newPayList) {
        set<id> createdIdPay = new set<id>();
        for (Payment2__c eachPay : newPayList) {
            createdIdPay.add(eachPay.Id);
        }
        totalAmount(createdIdPay);
    }

    public static void updateMethod(list<Payment2__C> newPayList, map<id, payment2__c> oldPayMap) {
        set<id> updatedIdPay = new set<id>();
        for (Payment2__c eachPay : newPayList) {
            if (eachPay.Amount__c!= oldPayMap.get(eachPay.Id).Amount__c) {
                updatedIdPay.add(eachPay.Id);
            }
        }
        totalAmount(updatedIdPay);
    }

    public static void deleteMethod(list<Payment2__C> oldPayList) {
        set<id> deletedIdPay = new set<id>();
        for (Payment2__c eachPay : oldPayList) {
            deletedIdPay.add(eachPay.Id);
        }
        totalAmount(deletedIdPay);
    }

    public static void totalAmount(set<id> totalAmountId) {
        list<customer2__c> listCust = [select id, amount__c, (select id from payment2__r) from customer2__c where id in :totalAmountId];
        for (customer2__c eachCust : listCust) {
            integer TotalAmount = 0;
            if (eachCust.payment2__c != null) {
                TotalAmount = eachCust.payment2__c.size();
            }
            eachCust.Total_Amount__c = TotalAmount;
        }
    }
}