public class ContactTriggerHandler {
    public static void contactMethod(map<id,account> accountNewMap) {
        set<id> accIdSet = accountNewMap.keySet();

        list<contact> contactList = [select Id, LastName from Contact where AccountId in :accIdset];
        for (contact eachCon : contactList) {
        }
    }
}