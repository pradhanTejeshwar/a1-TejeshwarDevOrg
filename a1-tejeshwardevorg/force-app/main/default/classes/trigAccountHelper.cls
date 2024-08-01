public class trigAccountHelper {
    public static void updateContactMailingCity(Map<Id, Account> newMap) {
        //Update the Account's related Contact's Mailing City with its respective Account's Billing State before update
        //Map<Id, Account> newMap = trigger.newMap;
            
        List<Contact> conList = [SELECT AccountId, lastName, MailingCity FROM Contact WHERE AccountId in :newMap.keySet()];
        //List<Account> accList = [SELECT Name, BillingAddress FROM Account WHERE Name like '%test%'];
                
        for(Contact c : conList) {
            Account a = newMap.get(c.AccountId);
            c.MailingCity = a.BillingState;
        }
        update conList;
    }
    
    public static void showErrorAccountSiteUI(Map<Id, Account> oldMap, List<Account> accList) {
        //Show an Error on the UI of the field Site of Account Object before update
        //Map<Id, Account> oldMap = trigger.oldMap; 
    
        for(Account newAcc : accList) {
            Account oldAcc = oldMap.get(newAcc.Id);
            if(newAcc.site != oldAcc.site) {
                newAcc.site.addError('Value of Site can not be changed! Check Trigger!');
            }
        }
    }
    
    public static void showErrorAccountSite(List<Account> oldAccList, List<Account> newAccList) {
       //Show an Error on the UI of Account Object before update
       for(Account oldAcc : oldAccList) {
        for(Account newAcc : newAccList) {
            if(oldAcc.id == newAcc.id && oldAcc.Site != newAcc.Site) {
                newAcc.addError('Site Information can not be changed! Check Trigger!');
                }
            }
        } 
    }
    
    public static void postfixAccountNameLimited(List<Account> accList) {
        //Add Limited String at end of the Account Name before Insert
        //Tested but got an issue that when a List of Account is created in bulk only 1st data is concatenated with Limited
        //rest of them are not, Try to resolve this issue with your logic.
        Account a = accList[0];
        a.Name += ' Limited';
    }
}