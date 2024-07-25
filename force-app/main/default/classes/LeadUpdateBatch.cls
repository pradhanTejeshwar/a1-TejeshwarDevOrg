global class LeadUpdateBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT AnnualRevenue FROM Lead]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> lList) {
        for(Lead l : lList) {
            if(l.annualRevenue == null)
                l.annualRevenue = 1000000;
        }
        update lList;
    }
    
    global void finish(Database.BatchableContext bc) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toAddress = new String[]{'tejeshwarpradhan22@gmail.com','pihuthapa446@gmail.com','acktvt.official@gmail.com'};
            
		mail.setToAddresses(toAddress); 
        mail.setSubject('KFC Offer only for you!');
        mail.setPlainTextBody('Hey, The offer code which we got for you is limited for a week and needs to be availed in your nearest KFC outlet. Code : BOKUNOBAKA');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}