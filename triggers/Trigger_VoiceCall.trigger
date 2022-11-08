trigger Trigger_VoiceCall on VoiceCall (before insert , before update,after insert,after update) {
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
        	VoiceCallTriggerHelper.AssignVoiceOwnerToCase((List<VoiceCall>)Trigger.new,(Map<Id,VoiceCall>)Trigger.oldMap);
        }
    }

}