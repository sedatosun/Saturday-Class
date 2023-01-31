list<string> coloursList = new list<string>();
coloursList.add('Black');
coloursList.add('Blue');
coloursList.add('Gray');
coloursList.add('Yellow');
coloursList.add('Red');
system.debug('color list ==> ' + coloursList);

system.debug('The size of colour list is ==> ' + coloursList.size());

Boolean containsred = coloursList.contains('Red');
system.debug('Is colour list contains Red?' + containsred);

string lastcolor = coloursList.get(coloursList.size()-1);
system.debug('The last color is ==> ' + lastcolor);
string upperLastColor = lastcolor.toUpperCase();
system.debug('Make last color UPPER ==> ' + upperLastColor);

coloursList[3] = coloursList[3].toUpperCase();
system.debug('Make fourth color UPPER ==> ' + coloursList);

list<string> colourCodesList = new list<string>{'#FF0000', '#AB7888', '#CD9937'};
system.debug(colourCodesList);

system.debug('Does Colour List and Colour Codes List are equal? ' + coloursList.equals(colourCodesList));

list<string> allcolors = new list<string>();
allcolors.addAll(coloursList);
allcolors.addAll(colourCodesList);
system.debug('All color list ==> ' + allcolors);