string crn = '0 0 1 ? * MON *';
CaseBatchSchedulable cs = new CaseBatchSchedulable();
system.schedule('CaseSchedule', crn, cs);