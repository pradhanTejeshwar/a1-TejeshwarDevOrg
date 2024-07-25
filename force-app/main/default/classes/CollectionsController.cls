public class CollectionsController {
    public void foobar(){
        List<String> l=new List<String>();
        l.add('Jack');
        l.add('Samuel');
        l.add('Florence');
        System.debug('◙'+l);
        
        Set<String> s=new Set<String>();
        s.add('Becky');
        s.add('Lisa');
        s.add('Penny');
        System.debug('◙'+s);
        
        Map<String, String> m=new Map<String, String>();
        m.put('Name','Richard');
        m.put('Location','New Jersey');
        m.put('Age','563');
        System.debug('◙'+m.keyset());
        System.debug('◙'+m.values());
    }
    public void snacks(){
        List<Account> accounts = [SELECT Id, Name FROM Account];
        
        Map<Id, Account> accountsMap = new Map<Id, Account>();
            
            for(Account a: accounts){
                accountsMap.put(a.Id, a);
            }
        System.debug('↨' +accountsMap);
    }
}