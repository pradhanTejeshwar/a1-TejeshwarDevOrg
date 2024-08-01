@isTest//(seeAllData=true)
public class TestAccount {
	@testSetup
    static void setup() {
        List<Account> testAccList = new List<Account>();
        
        //Create common test accounts
        
        for(Integer i=0;i<2;i++) {
			testAccList.add(new Account(Name = 'TestAccount'+i));
        }
        insert testAccList;
    }
    
    @isTest
    public static void method1() {
        //Get first test account by using SOQL Query
        Account acc = [SELECT Id FROM Account WHERE Name='TestAccount0' LIMIT 1];
        //Modify first account
        acc.Phone = '1234567890';
        //This update is local to this test method only
        update acc;
        system.debug(acc);
        //Delete second account
        Account acc2 = [SELECT Id FROM Account WHERE Name='TestAccount1' LIMIT 1];
        //This deletion is local to this test method only
        delete acc2;
        system.debug(acc2);
    }
}