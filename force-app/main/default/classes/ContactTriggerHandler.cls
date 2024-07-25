public class ContactTriggerHandler {
    public void foobar (List <Contact> contacts) {
        List <Contact> conList = new List <Contact>();
        
        for (Contact c : contacts) {
            Contact conc = new Contact();
            conc.Id = c.Id;
            conc.LastName = conc.LastName + 'Added Name';
            
            conList.add(conc);
        }
        update conList;
    }
    public void muffins (List <Contact> contacts) {
        for (Contact c : contacts) {
            c.FirstName = 'Dr.' + c.FirstName;
		}
    }
}