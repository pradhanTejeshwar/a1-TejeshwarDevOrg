@isTest // Annotation for Test Class
public class apexPractiseTest {	//main test class for apexPractise
    @isTest // Annotation for Test Method
    static void testHelloWorld() {	//Method for calling test method for HelloWorld
        // Call the method to test
        apexPractise.HelloWorld();

        // Assertions can go here if applicable
    }
    @isTest	// Annotation for Test Method
    static void testOddorEven() {	//Method for calling test method for OddorEven
        // Test data setup
        String s;
        
        //Test Case 1 : Checking Even
        // Call the method to test
        s = apexPractise.OddorEven(4);
        
        // Assertion to validate the method worked as expected
        System.assertEquals('Even',s,'Return does not match');
        
        //Test Case 2 : Checking Odd
        // Call the method to test
        s = apexPractise.OddorEven(7);
        
        // Assertion to validate the method worked as expected
        System.assertEquals('Odd',s,'Return does not match');
        
        //Test Case 3 : Checking Even for 0
        // Call the method to test
        s = apexPractise.OddorEven(0);
        
        // Assertion to validate the method worked as expected
        System.assertEquals('Even',s,'Zero is considered to be Even');
    }
    @isTest	 // Annotation for Test Class
    static void testBiggestofThree() {	//Method for calling test method for BiggestofThree
         // Test data setup
         Integer i;
        
        //Test Case 1 : Checking x is biggest
        // Call the method to test
        i = apexPractise.BiggestofThree(4,2,1);
        
        // Assertion to validate the method worked as expected
        System.assertEquals(4,i,'Return does not match');
        
        //Test Case 2 : Checking y is biggest
        // Call the method to test
        i = apexPractise.BiggestofThree(2,4,1);
        
        // Assertion to validate the method worked as expected
        System.assertEquals(4,i,'Return does not match');
        
        //Test Case 3 : Checking z is biggest
        // Call the method to test
        i = apexPractise.BiggestofThree(1,2,4);
        
        // Assertion to validate the method worked as expected
        System.assertEquals(4,i,'Return does not match');
        
        //Test Case 4 : Checking x > y but z is biggest
        // Call the method to test
        i = apexPractise.BiggestofThree(2,1,4);
        
        // Assertion to validate the method worked as expected
        System.assertEquals(4,i,'Return does not match');
    }
    @isTest		// Annotation for Test Class
    static void testArrayofInteger() {	//Method for calling test method for ArrayofInteger
        // Call the method to test
        apexPractise.ArrayofInteger(3);
        
        // Assertions can go here if applicable
    }
    @isTest		// Annotation for Test Class
    static void testBiggestElementinArray() {	//Method for calling test method for ArrayofInteger
        // Test data setup
        Integer[] arr = new Integer[]{3,1,5,2,4,7,9,8,0,6};
        Integer i;
        
        // Call the method to test
       	i = apexPractise.BiggestElementinArray(arr);
        
        // Assertion to validate the method worked as expected
        System.assertEquals(9,i,'Return does not match');
    }
}