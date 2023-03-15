@isTest
public class CaseQueueableTest {
    @isTest
    private static void testQueueable1() {
        case cs = new case();
        cs.Status = 'Working';
        cs.Origin = 'Email';
        insert cs;

        CaseQueueable c = new CaseQueueable();
        Id cId = system.enqueueJob(c);

        case c1 = [select id from Case Limit 1];
        system.assertNotEquals(null, c1);
    }
}