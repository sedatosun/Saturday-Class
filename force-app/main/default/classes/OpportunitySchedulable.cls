public class OpportunitySchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        OpportunityDeleteBatch opp = new OpportunityDeleteBatch();
        Database.executeBatch(opp, 100);
    }
}