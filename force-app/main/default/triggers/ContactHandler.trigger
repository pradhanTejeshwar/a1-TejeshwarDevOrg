trigger ContactHandler on Contact (before insert, after insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Contact c : Trigger.new){
            c.FirstName = 'Dr. ' + c.FirstName;
        }
    }
    //Read only: 200 Default size
    if(Trigger.isAfter && Trigger.isInsert){
        List<Contact> conList = new List<Contact>();
        
        for(Contact c : Trigger.new){
            Contact con = new Contact();
            con.Id = c.Id;
            con.LastName = 'Dr. ' + c.LastName + 'MBBS FRCS PHD';
            
            conList.add(con);
            
        }
        update conList;
    }
}