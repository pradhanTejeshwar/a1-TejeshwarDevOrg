//Q3. Execute Trigger and create a Task record only when a specific field has changed (status in leads).
trigger Q3Handler on Opportunity (after insert, after update) {
	List <Task> append = new List <Task>();
    
    for(Opportunity o : trigger.new){
        if(o.stageName == 'Closed Won'){
            Task t = new Task(whatId=o.Id);
            append.add(t);
        }
    }
    insert append;
}