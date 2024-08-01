public with sharing class wireDecoratorController {
    public wireDecoratorController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> fetchAccounts(){
        return [SELECT Id, Name FROM Account];
    }

    @AuraEnabled
    public static List<Contact> fetchContacts(){
        Account a = new Account();
        a.Name = 'New Account Record created using Imperative Apex';
        insert a;
        
        return [SELECT Id, FirstName, LastName, Email FROM Contact];
    }
}