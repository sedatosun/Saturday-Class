AccConAndCase.DummyDataCreation(5);

list<account> listAcc = new list<account>();
account acc1 = new account();
acc1.name = 'Test account';
listAcc.add(acc1);

account acc2 = new account();
acc2.name = 'Test account 2';
listAcc.add(acc2);

insert listAcc;

AccConAndCase.DummyDataCreation2(3, listAcc);

list<contact> listcontact = new list<contact>();
    contact con1 = new contact();
    con1.firstname = 'Charlotte ';
    con1.lastname = 'Perez';
    listcontact.add(con1);


// contact con2 = new contact();
// con2.firstname = 'Helen';
// con2.lastname = 'White';
// listcontact.add(con2);

insert listcontact;

AccConAndCase.DummyDataCreation3(listcontact);