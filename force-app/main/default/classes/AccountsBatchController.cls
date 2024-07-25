public class AccountsBatchController implements Database.Batchable<SObject>, Database.Stateful, Database.AllowsCallouts{
    public Database.QueryLocator start(Database.BatchableContext jobId) {
		System.debug(' Batch in start method! ');        
        return Database.getQueryLocator('SELECT Id, Name FROM Account');
        
        //Over all records - 50 million
        //Batch size - 200; 2000
    }
    
    public void execute(Database.BatchableContext jobId, List<Account> scope) {
 		//System.enqueueJob(new QueueableApex());
    }
    
    public void finish(Database.BatchableContext jobId) {
		System.debug(' Batch is finished ');        
    }
}