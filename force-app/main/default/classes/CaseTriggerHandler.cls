public class CaseTriggerHandler {
    public static void caseMethod(list<case> caseNewList, list<case> caseOldList, map<id, case> caseNewMap, map<id, case> caseOldMap) {
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
    }
}