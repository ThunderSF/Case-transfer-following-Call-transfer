public class VoiceCallTriggerHelper {
    
    public static void AssignVoiceOwnerToCase(List<VoiceCall> list_VoiceCall,Map<Id,VoiceCall> oldMap_VoiceCall){
        List<Case> caseList = new List<Case>();
        Map<id,VoiceCall> mapofVoiceCall  = new Map<id,VoiceCall>();
        for(VoiceCall vc : list_VoiceCall){
            if( (vc.OwnerId != Null && vc.OwnerId != oldMap_VoiceCall.get(vc.id).OwnerId) || 
                (vc.Case__c != Null && vc.Case__c != oldMap_VoiceCall.get(vc.id).Case__c) ){ 
                mapofVoiceCall.put(vc.Case__c,vc);
            }
        }
        
        if(mapofVoiceCall.size()>0){
            for(Case c : [select id, OwnerId from case where id In: mapofVoiceCall.keyset()]){
                c.OwnerId = mapofVoiceCall.get(c.id).OwnerId;
                caseList.add(c);
            }
            if(caseList.size()>0){
                update caseList;
            }
        }
    }
}