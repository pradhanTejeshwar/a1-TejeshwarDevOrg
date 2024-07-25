public class First_Extension {

    public First_Extension(ApexPages.StandardController controller) {

    }


    public First_Extension(CustomFunction controller) {

    }
    
    public void foobar(){
    System.debug('First Extension Debug Line');
    }
}