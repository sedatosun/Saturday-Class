public class AccConAndCase {
    public static void DummyDataCreation(integer n) {
        list<account> listAcc = new list<account>();
        for (Integer i = 1; i < n; i++) {
            account acc = new account();
            acc.Name = 'Test';
            acc.Rating = 'Hot';
            acc.Phone = '4559872536';
            acc.ShippingStreet = 'Test shipping address';
            acc.BillingStreet = 'Test billing address';
            listAcc.add(acc);
        }
        if (!listAcc.isEmpty()) {
            insert listAcc;
        }
        system.debug(listAcc);
    }

    public static void DummyDataCreation2(integer n, list<account> listAcc){
        list<contact> conList = new list<contact>();
        for (account eachAcc : listAcc) {
            for (Integer i = 1; i <= n; i++) {
                contact c1 = new contact();
                c1.FirstName = 'Test1';
                c1.lastName = 'Test';
                c1.phone = ' 5489652211';
                c1.mailingstreet = 'mailing address';
                c1.otherstreet = 'other address';
                c1.AccountId = eachAcc.Id;
                conList.add(c1);
            }
        }
        insert conList;
    }

    public static void DummyDataCreation3(list<contact> listcontact) {
        list<case> caseList = new list<case>();
        for (contact eachCon : listcontact) {
            case case1 = new case();
            case1.contactId = eachCon.Id;
            case1.accountId = eachCon.AccountId;
            case1.subject = 'test subject';
            case1.status = 'Escalated';
            case1.origin = 'Email';
            caseList.add(case1);
        }
        insert caseList;
    }
}