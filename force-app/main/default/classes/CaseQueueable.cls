public class CaseQueueable implements Queueable{
    public void execute(QueueableContext qc){
        case c = new case();
        c.Status = 'New';
        c.Origin = 'Phone';
        insert c;
    }
}