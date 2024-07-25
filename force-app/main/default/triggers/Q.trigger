trigger Q on Account (before insert) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        List <Account> accountsList = [SELECT Id, OwnerId, (SELECT Id FROM Contacts) FROM Account WHERE Id IN:Trigger.new];
        List <Contact> contactsList = new List <Contact> ();
        
        for (Account acc : accountsList) {
            Account oldAcc = Trigger.oldMap.get(acc.Id);
            If (acc.OwnerId != oldAcc.OwnerId) {
                for (Contact contact : acc.contacts) {
                    Contact updatedContact = new Contact ();
                    updatedContact.Id = contact.Id;
                    updatedContact.OwnerId = acc.OwnerId;
                    
                    contactsList.add(updatedContact);
                }
            }
        }
        update contactsList;
    }
}