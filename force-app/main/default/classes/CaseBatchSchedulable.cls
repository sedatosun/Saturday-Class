public class CaseBatchSchedulable implements Schedulable {
    public void execute(SchedulableContext sc){
        CaseBatch cs = new CaseBatch();
        Database.executeBatch(cs, 100);
    }
}