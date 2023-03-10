public class AccountTriggerHandler {
    public static void method1(list<account> accList){
        list<contact> conList = new list<contact>();
        for (account eachAcc : accList) {
            contact c = new contact();
            c.AccountId = eachAcc.Id;
            c.Lastname = eachAcc.Name;
            c.phone = eachAcc.phone;
            conList.add(c);
        }
        insert conList;
    }
    public static void method2(list<account> accNewList) {
        set<id> accIdSet = new set<id>();
        for (account eachAcc : accNewList) {
            accIdSet.add(eachAcc.Id);
        }
        list<opportunity> oppList = [select id, StageName from Opportunity where AccountId IN :accIdSet AND StageName !='Closed Won' AND StageName !='Closed Lost'];
        for (opportunity eachOpp : oppList) {
            eachOpp.StageName = 'Close Lost';
        }
        update oppList;
    }
    public static void method3(list<account> newList, list<account> oldList, map<id,account> newMap, map<id, account> oldMap) {
        set<id> accIdSet = new set<id>();
        for (account eachAcc : newList) {
            if (eachAcc.Phone != oldMap.get(eachAcc.Id).Phone) {
                accIdSet.add(eachAcc.Id);
            }
        }
        list<contact> conList = [select id, MobilePhone, OtherPhone, AccountId From Contact where AccountId IN: accIdSet];
        for (contact eachCon : conList) {
            eachCon.OtherPhone = oldMap.get(eachCon.AccountId).Phone;
            eachCon.MobilePhone =  newMap.get(eachCon.AccountId).Phone;
        }
        update conList;
    }
    //other solution
    /*
    public static void updateRelatedContacts(Map<Id,Account> oldMap, Map<Id,Account> newMap){ 
        Set<Id> accs = new Set<Id>();
        for(Id key : oldMap.keySet()){
            Account old=oldMap.get(key);
            Account newAcc=newMap.get(key);
            if(old.Phone!=newacc.Phone){
                accs.add(key);  
            }
        }
        List<Contact> contactList=[select OtherPhone,MobilePhone,AccountId from Contact where accountId in:accs];
        for(Contact c: contactList){
            c.otherPhone=oldMap.get(c.accountId).Phone; 
            c.mobilePhone=newMap.get(c.accountId).phone; 
        }
        update contactList;
        
    }
    */
}