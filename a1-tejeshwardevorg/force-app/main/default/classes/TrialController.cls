public class TrialController {
    public List <Account> accountsList{ set;get; }
    
    public Integer foobar() {
        /*Account acc = [SELECT Id, Name FROM Account LIMIT 1];
        
        Account a = new Account();
        a.Id = acc.Id;
        a.Name = 'Testing TrialController';
        a.Rating = 'Hot';
        a.Industry = 'Technology';
        
		update a;
		*/
        accountsList= [SELECT Id, Name, Rating, Industry FROM Account];
        return accountsList.size();
    }
}