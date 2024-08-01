//Q1. When a field is updated, in the same record try to update another field
//Q4. When the record is updated make sure all the child records Owner Id is updated.
//Q5. Prevent a record from being edited if the record is created 365 days back.
trigger Q1Handler on Account (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        List <Account> aList = new List <Account> ();
        
        For(Account c : Trigger.new){
            //Which account record should be updated, it's a parent of contact ?
            //Do I have the Contacts Parent Account Id ?
            Account a = new Account();
            a.Id = c.Id;
            a.Description = 'New Test Description Added';
            
            aList.add(a);
        }
        update aList;
    }
}