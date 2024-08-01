public class BatchController {
    public void invoke() {
        /*
        //Batch Apex
        AccountsBatchController obj = new AccountsBatchController();
        	Id jobId = Database.executeBatch(obj, 5); //Default: 200; Max: 2000;
        
        AsyncApexJob aaj = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberofErrors
                            FROM AsyncApexJob WHERE Id =: jobId];
		*/
        
        
        AccountSchedulable accsh = new AccountSchedulable();
        String sch = '00 00 1 12 8 ';
        Id jobId = System.schedule('Notification Name', sch, accsh);
	    

        /*
        //Future
        FutureController.foobar();
		*/
        
        /*
        //Queueable Apex
        QueueableApex qa = new QueueableApex();
		Id jobId = System.enqueueJob(qa);
		*/
    }
}