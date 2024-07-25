trigger Test1Handler on Contact (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        Boolean flag = false;
        List <Contact> conList = new List <Contact>();
        
        for(Contact c : Trigger.new){
            Contact con = new Contact();
            con.Id = c.Id;
            con.LastName = 'Dr' + c.LastName;
            
            conList.add(con);
        }
        update conList;
    }
    
}