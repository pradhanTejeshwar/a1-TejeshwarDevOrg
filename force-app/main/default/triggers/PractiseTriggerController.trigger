trigger PractiseTriggerController on Account (before insert, after insert) {
    if(Trigger.isBefore && Trigger.isInsert) {
        AccountTriggerHandler ath = new AccountTriggerHandler();
        ath.foobar(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        AccountTriggerHandler ath = new AccountTriggerHandler();
        ath.muffins(Trigger.new);
    }
}