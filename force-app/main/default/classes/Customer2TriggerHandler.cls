public class Customer2TriggerHandler {
    public static void method1(list<Customer2__c> customerList) {
        list<Payment2__c> paymentList = new list<Payment2__c>();
        for (Customer2__c eachCust : customerList) {
            Payment2__c p1 = new Payment2__c();
            p1.Amount__c = 0.1;
            p1.Mode__c = 'Online';
            p1.Customer2__c = eachCust.Id;

            Payment2__c p2 = new Payment2__c();
            p2.Amount__c = 1;
            p2.Mode__c = 'Crypto';
            p2.Customer2__c = eachCust.Id;

            paymentList.add(p1);
            paymentList.add(p2);
        }
        insert paymentList;
    }
    public static void method2(List<Customer2__c> oldCustList) {
        set<Id> activeCust = new set<Id>();
        set<Id> deactiveCust = new set<Id>();
        for (Customer2__c eachCust : oldCustList) {
            if (eachCust.Active__c == true) {
                activeCust.add(eachCust.Id);
            } else {
                deactiveCust.add(eachCust.Id);
            }
        }
        list<payment2__c> activepayList = [select id from Payment2__c where Customer2__c in :activeCust];

        delete activepayList;

        List<Payment2__c> deactivepaylist = [Select id, Mode__c from Payment2__c where Customer2__c in:deactiveCust and Mode__c ='Online'];

        delete deactivepaylist;
    }
    public static void method3(List<Payment__c> triggerNew) {
        Set<Id> customersIdSet  = new Set<Id>();
        for(Payment__c p : triggerNew){
            customersIdSet.add(p.Customer_c__c);
        }
        if(!customersIdSet.isEmpty()){
            updateAmountOnCustomer(customersIdSet);
        }
    }
    public static void method4(List<Payment__c> triggerNew, Map<Id, Payment__c> oldPaymentRecsMap) {
        Set<Id> customersIdSet  = new Set<Id>();
        for(Payment__c p : triggerNew){
            Payment__c oldPRec = oldPaymentRecsMap.get(p.Id);
            //When Reparenting is done
            if(p.Customer_c__c != oldPRec.Customer_c__c || p.Amount__c!= oldPRec.Amount__c){//Reparenting scenario
                customersIdSet.add(p.Customer__c);//new customer Id added
                customersIdSet.add(oldPRec.Customer_c__c);//Old customer Id added
            }
        }
        if(!customersIdSet.isEmpty()){
            updateAmountOnCustomer(customersIdSet);
        }
    }
    public static void method5(List<Payment__c> triggerOld) {
        Set<Id> customersIdSet  = new Set<Id>();
        for(Payment__c p : triggerOld){
            customersIdSet.add(p.Customer_c__c);
        }
        if(!customersIdSet.isEmpty()){
            updateAmountOnCustomer(customersIdSet);
        }
    }
    public static void method6(Set<Id> customersIdSet) {
        List<Customer__c> customerWithPayments = new List<Customer__c>();
        customerWithPayments = [Select Id, total_Amount__c, (Select Id, Amount__c from Payments__r) from Customer__c Where Id =: customersIdSet];
        List<Customer__c> updatedCustomerList = new List<Customer__c>();//New place holder for storing updated values
        for(Customer__c c : customerWithPayments){
            decimal totalAmount = 0;
            for(Payment__c p :c.Payments__r){
                totalAmount = totalAmount + p.Amount__c;
            }
            c.total_Amount__c = totalAmount;
            updatedCustomerList.add(c);
        }
        if(!updatedCustomerList.isEmpty()){
            Update updatedCustomerList;
        }
    }
}