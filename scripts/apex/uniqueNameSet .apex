set<string> uniqueNameSet = new set<string> ();
system.debug(uniqueNameSet.size());

uniqueNameSet.add('Mickey');
uniqueNameSet.add('Minnie');
system.debug(uniqueNameSet);

uniqueNameSet.contains('Seda');
system.debug(uniqueNameSet.contains('Seda'));

uniqueNameSet.isEmpty();
system.debug(uniqueNameSet.isEmpty());

uniqueNameSet.clear();
system.debug(uniqueNameSet);

system.debug(uniqueNameSet.isEmpty());

