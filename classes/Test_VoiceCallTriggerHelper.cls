@isTest

private class Test_VoiceCallTriggerHelper {
    
    @isTest
    public static void AssignVoiceOwnerToCase_test(){
        Case c = new Case();
        c.Status='New';
        c.Origin='Phone';
        insert c;
        DateTime callStart = DateTime.newInstance(1997, 1, 31, 10, 8, 16);
        VoiceCall vc = new VoiceCall();
        vc.Case__c = c.id;
        vc.FromPhoneNumber = '+14072340326';
        vc.ToPhoneNumber = '+12077704080';
        vc.CallCenterId = [Select Id, Name from CallCenter].Id;
        vc.VendorType = 'ContactCenter';
        vc.CallEndDateTime = callStart;
        vc.CallStartDateTime = callStart;
        vc.CallType = 'Inbound';
        insert vc;
        vc.OwnerId = [SELECT Id FROM USER WHERE Profile.Name = 'System Administrator' AND ISACTIVE = TRUE AND UserId != :UserInfo.getUserId()][0].Id;
        update vc;    
	}

}