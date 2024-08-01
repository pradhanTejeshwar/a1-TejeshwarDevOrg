trigger Test3Handler on Opportunity (after insert, after update) {
	List <Task> append = new List <Task>();
    
    for(Opportunity o : trigger.new){
        if(o.stageName == 'Closed Won'){
            Task t = new Task(whatId=o.Id);
            append.add(t);
        }
    }
    insert append;
}