OperationsHelper o1 = new OperationsHelper();
system.debug(o1.sumofPositiveIntegers(9));

system.debug(o1.smallestOutOfThreeNumbers(10, 6, 8));

o1.largestOutOfTwoNumbers(8.3, 3.4);

//system.debug(o1.largestOutOfTwoNumbers(8.6, 5.4));

List<Decimal> value = new List<Decimal>{5, 10, 27.8, 6, 29, 36.4};
system.debug(OperationsHelper.sumList(value));

system.debug(OperationsHelper.averageList(value));
system.debug(OperationsHelper.Highest(value));

system.debug(OperationsHelper.lowest(value));