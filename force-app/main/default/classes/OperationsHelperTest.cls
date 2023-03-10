@isTest
public class OperationsHelperTest {
    @isTest
    private static void test1() {
        OperationHelper o = new OperationHelper();
        decimal maxNum = o.largestOutOfTwoNumbers(9, 10);
        decimal maxNum2 = o.largestOutOfTwoNumbers(15, 11);
        system.assertEquals(10, maxNum);
        system.assertEquals(15, maxNum2);
    }
    @isTest
    private static void test2() {
        OperationHelper o = new OperationHelper();
        decimal minNum = o.smallestOutOfThreeNumbers(5, 18, 13);
        system.assertEquals(5, minNum);
    }
    @isTest
    private static void test3() {
        OperationHelper o = new OperationHelper();
        integer s = o.sumOfPositiveInteger(5);
        system.assertEquals(15, s);
    }
}