public class Calculator {
    public static decimal dynamicCalulationMethod(decimal a, decimal b, string operation){
        decimal result;
        switch on operation {
            when  'ADDITION'{
                result = a + b;
            }
            when 'SUBSTRACTION' {
                result = a - b;
            }
            when 'DIVISION'{
                result = a / b;
            }
            when 'MULTIPLICATION'{
                result = a * b;
            }
            when else {
                system.debug('Undefined operation, please check your paramater.');
            }
        }
        return result;
    } 
}
