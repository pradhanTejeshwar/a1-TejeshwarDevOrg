trigger Example1_1 on Case (before Update) {
	if(trigger.isBefore && trigger.isUpdate){
        for(Case c: trigger.new){
            c.Status ='New '+c.Status;
        }
    } 
}