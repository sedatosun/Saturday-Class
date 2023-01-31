public class OperationsHelper {
    public void largestOutOfTwoNumbers(Decimal x, Decimal y){
        if (x > y) {
            System.debug(x + ' largest');
        } else {
            System.debug(y + ' largest');
        }
    }

    /*public decimal largestOutOfTwoNumbers(decimal x, decimal y){
        if (x > y) {
            return x;
        } else {
            return y;
        }
    }
    */

    public decimal smallestOutOfThreeNumbers(Decimal x, Decimal y, Decimal z){
        if (x < y && x < z ) {
            return x;
        } else if (x > z) {
            return y;
        } 
        return z;
    }

    public integer sumofPositiveIntegers(integer n){
        integer sum;
        if (n < 0) {
            system.debug('We are not calculating the sum for negative numbers');
            sum = null;
        } else {
            sum = 0;
            for (integer i = 0; i < n; i++){
                sum += i;
                system.debug(sum);
            }
        }
        return sum;
    }
    public static decimal sumList(list<decimal> value){
        decimal sum;
        if (value.size() > 0) {
            sum = 0;
            for (decimal eachSum : value) {
                sum += eachSum;
            }
        } else {
            system.debug('Please provide values to do the operation');
        }
        return sum;
    }
    public static decimal averageList(list<decimal> value){
        decimal average; 
        if (value.size() > 0){
            average = 0;
            decimal sum = sumList(value);
            average = sum / value.size();
        } else {
            system.debug('Please provide values to do the operation');
        }
        return average;
    }
    public static Decimal Highest(List<Decimal> numbers){
        if(!numbers.isEmpty()){
            numbers.sort();
        }else{
            System.debug('ERROR');
        }
        return numbers[numbers.size()-1];
    }
    public static Decimal Lowest(List<Decimal> numbers){
        if(!numbers.isEmpty()){
            numbers.sort();
        }else{
            System.debug('ERROR');
        }
        return numbers[0];
    }
}