public class OpportunityTriggerHandler {
    /*
    public static void oppMethod(list<opportunity> newOppList, map<id, opportunity> oldOppMap) {
        for (opportunity eachOpp : newOppList) {
            if (eachOpp.StageName != oldOppMap.get(eachOpp.Id).StageName) {
                system.debug(eachOpp.description + ' ' + eachOpp.Name);
            }
        }
    }
    */

    @future
    public static void future1(set<id> accId) {
        list<account> accList = [select id, Highest_Amount_Opportunity_Name__c, (select id, name, amount from Opportunities ORDER BY Amount DESC) from account WHERE Id in: accId];
        for (account eachAcc : accList) {
            eachAcc.Highest_Amount_Opportunity_Name__c = eachAcc.Opportunities[0].Name;
        }
        update accList;
    }

    @future
    public static void future2(set<id> accId) {
        list<account> accList = [select id, Target_Amount__c, Target_Amount_Achieved_Opportunity_Name__c, (select id, name, amount, StageName from Opportunities where stageName = 'Closed Won' AND Amount != null ORDER BY Amount DESC) from account WHERE Id in: accId];
        for (account eachAcc : accList) {
            if (eachAcc.Target_Amount__c < eachAcc.Opportunities[0].Amount) {
                eachAcc.Target_Amount_Achieved_Opportunity_Name__c = eachAcc.Opportunities[0].Name;
            }
        }
        update accList;
    }
}