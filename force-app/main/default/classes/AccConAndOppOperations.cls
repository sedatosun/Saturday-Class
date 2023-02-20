public class AccConAndOppOperations {
    public static void logicAcc() {
        list<account>  listAccount = [select id, Name, AccountSource, AnnualRevenue, Type FROM Account];
        system.debug('All accounts : ' + listAccount);
    }

    public static void method(string stg, string src) {
        list<opportunity> listOpp = [select id, LeadSource, StageName from opportunity where LeadSource = : src OR StageName = : stg];
        system.debug(listOpp);
    }

    public static void method2() {
        list<account> listAcc = [select id, name,  annualrevenue, type, (select name, amount from opportunities where stagename = 'Closed Won') from account where type = 'Customer - Direct'];
        for (account eachAcc : listAcc) {
            system.debug(eachAcc);
            for (opportunity eachOpp : eachAcc.opportunities) {
                system.debug(eachOpp);
            }
        }
        /*for (account eachAcc : listAcc) {
            system.debug('Account name is ' + eachAcc.Name + ' its annual revenue is ' + eachAcc.AnnualRevenue);
            system.debug('----------');
            for (opportunity eachOpp : eachAcc.Opportunities){
                system.debug('Opp name is ' + eachOpp.Name + ' its annual revenue is ' + eachOpp.amount);
            }
            system.debug('----------');
        }*/
    }

    public static void method3(string name1, decimal annualRevenue, string type2) {
        account acc = new account();
        if (name1 != null) {
            acc.Name = name1;
            acc.AnnualRevenue = annualRevenue;
            acc.Type = type2;
            insert acc;
        } else { 
            system.debug('Account without name cannot be created');
        }
    }

    public static decimal method4() {
        list<Opportunity> listOpp = [select id, name, amount from Opportunity where stagename = 'Closed Won' and amount!=null];

        decimal sum = 0;
        for (opportunity eachOpp : listOpp) {
            
            sum+=eachOpp.amount;
        }
        return sum;
    }
    /*
    public static List<Account> accountWithOpp (String stgName){          
        List<Account> accountList = new List<Account>();
        accountList = [
                        SELECT Id, Name 
                        FROM Account 
                        WHERE Id IN (SELECT AccountId FROM Opportunity WHERE StageName = :stgName)
                    ];
        if(accountList != null &&accountList.size() > 0){
            return accountList;
        }else{
            System.debug('There are not any records with these criteria');
            return null;
        }
    }
    */

    public static list<account> method5(string stagename) {
        list<account> listAcc = [select id, name, (select id from opportunities where stagename =: stagename) from account];
        return listAcc;
    }

    public static void method6() {
        //list<account> accList = [select id, name, (select id, accountID from contacts where accountId!=null)from account];
        List<Account> accountList = new List<Account>();
        accountList = [
                        SELECT Id, Name, (select lastname from Contacts) 
                        FROM Account ];
                    system.debug(accountList);
            for (account eachAcc : accountList) {
                system.debug('Account name: ' + eachAcc.Name);
                for (contact eachCon : eachAcc.Contacts) {
                    system.debug('Account name: ' + eachAcc.name + ' Contact name is ' + eachCon.lastname);
                }
            }
    }

    public static void method7(Id accountId) {
        account acc = [select id, name from account where id = : accountId];

        contact c = new contact();
        c.lastname = acc.name;
        c.accountId = acc.Id;
        insert c;        
    }

    public static void method8() {
        list<opportunity> oppList = [select id, amount, description from Opportunity where amount!=null ORDER BY Amount DESC LIMIT 10];
        if (!oppList.isEmpty()) {
            for (opportunity eachOpp : oppList) {
            eachOpp.description = 'This is one of the top 10 opportunities. Please work on this properly';
            }
        }
        update oppList;
    }

    public static void method9(Id accountId, Integer n) {
        List<opportunity> oppList = new List<Opportunity>();
        if (n > 0) {
            account acc = [select id, name, AnnualRevenue from Account where Id =: accountId];
            for (Integer i = 1; i <= n; i++) {
                opportunity opp = new opportunity();
                opp.CloseDate = date.today().addYears(3);
                opp.stagename = 'Prospecting';
                opp.name = acc.name;
                if (acc.annualrevenue != null) {
                    opp.amount = acc.AnnualRevenue/n;
                }
                opp.accountid = acc.Id;//relation field
                oppList.add(opp);
            }
            insert oppList;
        } else {
            system.debug('Please tell us how many opportunities needs to be created');
        }
    }

    public static void method10() {
        list<account> accList = [select id, name, (select id, lastname from contacts WHERE accountid =null) from Account];
        //list<account> listAcc = [select id, name from account where Id not in (select AccountId from contact)];
        list<contact> conList = new list<contact>();
        if (!accList.isEmpty()) {
            for (account eachAcc : accList) {
                contact c = new contact();
                c.lastName = eachAcc.name;
                c.accountId = eachAcc.Id;
                conList.add(c);
            }
            if (!conList.isEmpty()) {
                insert conList;
            }
        }
    }
}