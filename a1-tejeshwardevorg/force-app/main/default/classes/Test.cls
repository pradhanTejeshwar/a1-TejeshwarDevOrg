public class Test {
	public void runNegativeTestCases() {
        User u3 = [select id from User where alias='tuser'];     
        System.RunAs(u3) {
            System.debug('Inserting a record with 501 miles... (negative test case)');
            //Date testMiles3 = new Date( Miles__c = 501, Date__c = System.today() );
            try{
            //    insert testMiles3;
            }
            catch (DmlException e){
               
                //Assert Error Message 
                System.assert( e.getMessage().contains('Insert failed. First exception on ' +'row 0; first error:FIELD_CUSTOM_VALIDATION_EXCEPTION,'+'Mileage request exceeds daily limit(500): [Miles__c]'),e.getMessage() );
    
                //Assert field 
                //System.assertEquals(Mileage__c.Miles__c, e.getDmlFields(0)[0]);
    
                //Assert Status Code 
                System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' , e.getDmlStatusCode(0) );
            } //catch 
        } //RunAs(u3)
    }
}