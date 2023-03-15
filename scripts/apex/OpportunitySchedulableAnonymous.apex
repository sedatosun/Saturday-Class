string crn = '0 0 15 1/1 * ? *';
OpportunitySchedulable opp = new OpportunitySchedulable();
system.schedule('OpportunitySchedule', crn, opp);