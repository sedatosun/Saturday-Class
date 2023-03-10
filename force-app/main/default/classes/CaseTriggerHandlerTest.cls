@isTest
public class CaseTriggerHandlerTest {
    @isTest 
    private static void method1() {
        Case c = new Case();
        c.Status = 'New';
        c.Origin = 'Email';
        c.Description = 'password';
        insert c;

        list<Case> caseList = [select id from Case];
        system.assertEquals(2, caseList.size());
    }
    @isTest
    private static void method2() {
        list<Case> caseList = new list<Case>();
        for (Integer i = 0; i < 200; i++) {
            Case c = new Case();
            c.Status = 'New';
            c.Origin = 'Email';
            c.Description = 'A';
            caseList.add(c);
        }
        insert caseList;

        list<Case> caseList2 = [select id from Case];
        system.assertEquals(200, caseList.size());
    }
}