public class OpportunityDeleteBatch implements Database.Batchable<SObject>, Database.stateful{
    integer totalNum = 0;

    //start method
    public Database.QueryLocator start(Database.BatchableContext st){
        Database.QueryLocator opp = Database.getQueryLocator([select id from Opportunity WHERE StageName = 'Closed Lost']);
        return opp;
    }

    //execute method
    public void execute(Database.BatchableContext st, list<Opportunity> scope){
        delete scope;
        totalNum = totalNum + scope.size();
    }

    //finish method
    public void finish(Database.BatchableContext st){
        system.debug('Total number of deleted--> ' + totalNum);
    }
}
