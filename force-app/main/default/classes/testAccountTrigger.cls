@isTest
public class testAccountTrigger {
	@isTest
    static void testTrigger() {
        List<Account> accList = new List<Account>();
        
        for(Integer i=1;i<=100;i++) {
            accList.add(new Account(Name = 'TestAccount'+i));
        }
        insert accList;
        
        List<Account> accList2 = [SELECT Name, NumberOfEmployees FROM Account];
        
        for(Account a:accList2) {
            System.debug('---' + a.Id + '---' + a.Name + '---' + a.NumberOfEmployees);
        }
    }
}