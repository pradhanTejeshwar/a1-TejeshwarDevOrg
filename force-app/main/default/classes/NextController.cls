@isTest
public with sharing class NextController {
    public static testMethod void testRunAs() {
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        
        User u = new User(Alias = 'standt', Email = 'standarduser@testorg.com',
            			EmailEncodingKey = 'UTF-8', LastName = 'Testing', 
            			LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US',
            			ProfileId = p.Id, TimeZoneSidKey = 'America/Los_Angeles',
            			UserName = uniqueUserName);
        insert u;
        
        System.runAs(u) {
            Account a = new Account();
            a.Name = 'sForce';
            
            insert a;
            
            Test.startTest();
            TrialController sc = new TrialController();
            sc.foobar();
            Integer count = sc.accountsList.size();
            System.assertEquals(count, 1);
            Test.stopTest();
        }
    }
}