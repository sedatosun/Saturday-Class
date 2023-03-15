public class CaseBatch implements Database.Batchable<SObject>, Database.stateful{
    integer totalNum = 0;

    //start method
    public Database.QueryLocator start(Database.BatchableContext st){
        Database.QueryLocator caseList = Database.getQueryLocator([select id, OwnerId from Case WHERE Status != 'Closed' AND LastModifiedDate < LAST_N_DAYS:5]);
        return caseList;
    }

    //execute method
    public void execute(Database.BatchableContext st, list<Case> scope){
        List<Task> taskList= new list<Task>();
        for (case eachCase : scope) {
            task t = new task();
            t.Subject =  system.label.CaseSubject;
            t.ActivityDate = date.today().addDays(2);
            t.Description = system.label.CaseComment;
            t.WhatId = eachCase.Id;
            t.OwnerId = eachCase.OwnerId;
            t.Status = 'In Progress';
            taskList.add(t);
            totalNum++;
        }
        if (!taskList.isEmpty()) {
            insert taskList; 
        }
        
    }

    //finish method
    public void finish(Database.BatchableContext st){
        system.debug('Total number of inserted Tasks --> ' + totalNum);
    }
}