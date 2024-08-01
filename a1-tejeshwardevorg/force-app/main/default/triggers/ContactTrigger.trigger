trigger ContactTrigger on Contact (after insert) { //record gets locked
    
    if (Trigger.isAfter && Trigger.isInsert) {
        
        List <Contact> conList = new List <Contact>();
        if (! RecursionHandlerController.recursionFlag) {
            for (Contact c : Trigger.new) {
                Contact con = new Contact();
                con.LastName = 'New Contact Inserted';
                
                conList.add(con);
            }
			RecursionHandlerController.recursionFlag = true;
            insert conList;
        }
    }
}