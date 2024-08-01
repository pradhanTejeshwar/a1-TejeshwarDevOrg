trigger AccountHandler on Account (before insert, before update) {
    /*
    //before insert
    //before update
    //before delete
    //System.debug('º');
    //after insert
    //after update
    //after delete
    //after undelete
    */
    /*
    //--Context Variables--
    //Trigger.isBefore
    //Trigger.isAfter
    //Trigger.isInsert
    //Trigger.isUpdate
    //Trigger.isDelete
    //Trigger.isUndelete
    //Trigger.new           -   (List)Values that user has provided in the frontend
    //Trigger.newMap        -   (Map)Values
    //Trigger.old           -   (List)Values that a saved record has
    //Trigger.oldMap        -   (Map)Values
    //Trigger.isRunning
    */
    /*
    if(Trigger.isBefore && Trigger.isInsert) {
        System.debug('▼');
    }
    
    if(Trigger.isAfter && Trigger.isInsert) {
        System.debug('▲');
    }
    
    //Bulkification
    Contact a = new Contact();
    a.LastName = 'Testing';
    
    insert a;
    */
    
    System.debug(' NEW ' + Trigger.new);
    System.debug(' OLD ' + Trigger.old);
    System.debug(' NEW MAP ' + Trigger.newMap);
    System.debug(' OLD MAP ' + Trigger.oldMap);
    
    //bulkification Limit Code
    
    for(Account a : Trigger.new){
        a.AccountNumber = '001' + a.AccountNumber;
    }
    
}