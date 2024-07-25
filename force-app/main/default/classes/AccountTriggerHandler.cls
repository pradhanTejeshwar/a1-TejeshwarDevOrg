public class AccountTriggerHandler {
	public void foobar (List <Account> accounts) {
        List <Account> accList = new List <Account>();
        
        for (Account a : accounts) {
            Account acc = new Account();
            acc.Id = a.Id;
            acc.Description = a.Description + 'Added Description';
            
            accList.add(acc);
        }
        update accList;
    }
    public void muffins (List <Account> accounts) {
        for (Account a : accounts) {
            a.Description = 'Pysche ' + a.Description;
		}
    }
}