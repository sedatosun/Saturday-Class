set<string> fruitSet = new set<string>{'Orange', 'Apple', 'Banana', 'Cherry'};
    for(string eachFruit : fruitSet){
        system.debug(eachFruit);
    }
    system.debug(fruitSet.size());
    
fruitSet.add('Apricot');
system.debug(fruitSet);

system.debug('Does fruit setcontain Apricot? ==> ' + fruitSet.contains('Apricot'));

system.debug('Does fruit set is empty? ==> ' + fruitSet.isEmpty());