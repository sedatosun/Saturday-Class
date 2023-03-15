@isTest
public class OpportunityDeleteBatchTest {
    @isTest
    private static void testQueueable1() {
        opportunity opp = new opportunity();
        opp.Name = 'Test';
        opp.CloseDate = Date.today();
        opp.StageName ='Closed Lost';
        insert opp;

        OpportunityDeleteBatch opt = new OpportunityDeleteBatch();
        Database.executeBatch(opp);

        list<opportunity> oppList = [select id from Opportunity]; 
        system.assertEquals(0, oppList.size());
    }
}