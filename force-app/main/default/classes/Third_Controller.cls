public class Third_Controller {

    public void functionName(){
        //creating an object of a class Account
        Account a = new Account();
        
        //Insert, update field data
        a.Id='0015g00000SRZyvAAH';
        a.Name='API Insertion';
        a.Rating='Hot';
        a.Industry='Technology';
        
        //update, upsert, delete
        upsert a;
        
        //Not Mandatory to do this
        System.debug('Hello World !'+a);
    }

}