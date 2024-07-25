trigger AccountTrigger on Account (before insert, before update) {
     
    if(Trigger.isbefore && Trigger.isInsert) {
        
        //Calling trigAccountHelper class and method postfixAccountNameLimited by sending trigger.new
        trigAccountHelper.postfixAccountNameLimited(Trigger.new);
            
    }
    
    
    if(Trigger.isbefore && Trigger.isUpdate) {
       
        //Calling trigAccountHelper class and method showErrorAccountSite by sending trigger.old, trigger.new
        trigAccountHelper.showErrorAccountSite(trigger.old, trigger.new);
        
        //Calling trigAccountHelper class and method showErrorAccountSiteUI by sending trigger.oldMap, trigger.new
        trigAccountHelper.showErrorAccountSiteUI(trigger.oldMap, trigger.new);
        
        //Calling trigAccountHelper class and method updateContactMailingCity by sending trigger.newMap
        trigAccountHelper.updateContactMailingCity(trigger.newMap);
        
    }
     
}