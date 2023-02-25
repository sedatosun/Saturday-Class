public class OpportunityTriggerHandler {
    public static void oppMethod(list<opportunity> newOppList, map<id, opportunity> oldOppMap) {
        for (opportunity eachOpp : newOppList) {
            if (eachOpp.StageName != oldOppMap.get(eachOpp.Id).StageName) {
                system.debug(eachOpp.description + ' ' + eachOpp.Name);
            }
        }
    }
}