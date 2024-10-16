public class apexPractise {
    public static void HelloWorld() {
         System.debug('Hello World!');
	}
    public static String OddorEven(Integer i) {
        if(Math.mod(i,2)==0)
            return('Even');		//return Even
		else
			return('Odd');		//return Odd
    }
    public static Integer BiggestofThree(Integer x, Integer y, Integer z) {
        if (x > y) {
                if(x > z)
                    return(x);
            	else
                	return(z);
        } 
        else {
            if(y > z)
            	return(y);
            else
            	return(z);
        }
    }
    public static void ArrayofInteger(Integer a) {
        Integer[] arr = new Integer[a];
        //Looping through Array and assigning value of i to each index for arr[i]
        for(Integer i=0; i<a; i++)
            arr[i]=i;
        System.debug(arr);
    }
    public static Integer BiggestElementinArray(Integer[] arr) {
        //Assigning values to array by default
        Integer i,x=0;
        
        //Check for the highest element in the array
        for(i=0; i<arr.size(); i++) {
            if(arr[i]>x) {
            	x=arr[i];
            }
        }
        return x;
    }
}