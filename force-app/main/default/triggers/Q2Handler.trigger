//Q2. When a Field is updated(in Contact), in the parent record(Account), update a field(Description).
trigger Q2Handler on Contact (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        List <Account> aList = new List <Account> ();
        
        For(Contact c : Trigger.new){
            //Which account record should be updated, it's a parent of contact ?
            //Do I have the Contacts Parent Account Id ?
            Account a = new Account();
            a.Id = c.AccountId;
            a.Description = 'New Test Description Added';
            
            aList.add(a);
        }
        update aList;
    }
}