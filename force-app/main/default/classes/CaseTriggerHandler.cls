public class CaseTriggerHandler {
    /*public static void caseMethod(list<case> caseNewList, list<case> caseOldList, map<id, case> caseNewMap, map<id, case> caseOldMap) {
        for (case eachCase : caseNewList) {
            if (eachCase.Origin != caseOldMap.get(eachCase.Id).origin) {
                system.debug('Case origin is changed for ' + eachCase.CaseNumber);
            }
        }
    }
    public static void caseMethod2(list<case> caseNewList) {
        for (case eachCase : caseNewList) {
            if (eachCase.Origin == 'Email') {
                eachCase.Status = 'New';
                eachCase.Priority = 'Medium';
            }
        }
    }*/
    public static void caseMethod3(list<case> caseNewList) {
        list<case> caseList = new list<case>();
        for (case eachCase : caseNewList) {
            if (eachCase.description.containsIgnoreCase('Password')) {
                case  c = new case();
                c.Subject = 'Parent Case may contain secret info, do something NOW';
                c.ParentId = eachCase.Id;
                c.Priority = 'High';
                c.description = 'Secret info not allowed in case';
                caseList.add(c);
            }
        }
        insert caseList;
    }
}