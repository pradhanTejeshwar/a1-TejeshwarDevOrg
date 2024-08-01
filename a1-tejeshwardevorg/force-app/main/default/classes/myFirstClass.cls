public class myFirstClass {
    public static void myFirstMethod() {
        integer i;
        
        System.debug(i);
    }
    public static void my2DimensionalList() {
        List<List<List<Integer>>> lList = new List<List<List<Integer>>>{
            new List<List<Integer>>{new List<Integer>{10,20,30},new List<Integer>{10,20,30},new List<Integer>{10,20,30}},
                new List<List<Integer>>{new List<Integer>{10,20,30},new List<Integer>{10,20,30},new List<Integer>{10,20,30}},
                    new List<List<Integer>>{new List<Integer>{10,20,30},new List<Integer>{10,20,30},new List<Integer>{10,20,30}}
        };
            System.debug(lList);
    }
    public static void myFirstSet() {
        List<Integer> l1 = new List<Integer>{1,2,3};
            Set<Integer> set1 = new Set<Integer>{3,6,9};
                
                System.debug(set1);
    }
    public static void myFirstMap() {
        Map<Integer,String> myMap = new Map<Integer,String>{1=>'Todd',2=>'Reed',3=>'Zedd'};
            System.debug(myMap);
    }
    public static void pattern1() {
        String s = ''; 
        for(Integer i = 0 ; i < 5 ; i++) {
            s+='\n';
            for(Integer j = 4 ; j > i ; j--) {
                s+='o';
            }
            for(Integer k = 0 ; k <= i ; k++) {
                Integer x = Math.Mod(k,2);
                //System.debug(x);
                if(x == 0) {
                    s+='0';
                }
                else {
                    s+='1';
                }
            }
        }
        System.debug(s);
    }
    public static void pattern2() {
        for(integer i=1;i<=5;i++) {
            string s='  ';
            for(integer j=1;j<=5;j++) {
                if(j>=6-i ) {
                    s = s + 'x';
                }
                else {
                    s = s + '_';
                }
            }
            System.debug(s);
        }
    }
    public static void pattern3() {
        String s = '';
        for(integer i = 0 ; i < 5 ; i++) {
            s+='\n';
            for(integer j = 0 ; j < 5 ; j++) {
                s+='*';
            }
        }
        System.debug(s);
    }
    public static void pattern4() {
        String s = '';
        for(Integer i = 0 ; i < 5 ; i++) {
            s+='\n';
            for(Integer j = 0 ; j <= i ; j++) {
                s+='*';
            }
        }
        System.debug(s);
    }
    public static void pattern5() {
        String s = '';
        for(Integer i = 0 ; i < 6 ; i+=2) {
            s+='\n';
            for(Integer j = 4 ; j > i ; j-=2) {
                s+='_ ';
            }
            for(Integer k = 0 ; k <= i ; k++) {
                s+='* ';
            }
            }
            /*for(Integer l = 1 ; l <= i ; l++) {
                s+='*';
            }*/
        for(Integer n = 0 ; n < 4 ; n+=2) {
            s+='\n';
            for(Integer m = 0 ; m <= n ; m+=2) {
                s+='_ ';
            }
            for(Integer l = 4 ; l > n+1 ; l--) {
                s+='* ';
        }
        }
        System.debug(s);
    }
    public static void pattern6() {
        for (integer i = 1; i <= 4; i++)
        {
            string s=' ';
            integer n = 4;
   
            for (integer j = 1; j<= n - i; j++) 
            { 
            s=s+'_';    
            }
            for (integer k = i; k >= 1; k--)
            {
                s=s+k;
            }
            for (integer l = 2; l <= i; l++)
            { 
            s=s+l; 
            }
            system.debug(s);
            } 

            for (integer i = 3; i >= 1; i--)
        {
            string v=' ';
            integer n = 3;
   
            for (integer j = 0; j<= n - i; j++) { v=v+'_'; } for (integer k = i; k >= 1; k--)
            {
                v=v+k;
            }
            for (integer l = 2; l <= i; l++)
            {
                v=v+l;
            }
   
            system.debug(v);
        }
    }
    public static void pattern7() {
        String s = '';
        for(Integer i = 0 ; i < 8 ; i+=2) {
            s+='\n';
            for(Integer j = 8 ; j > i ; j-=2) {
                s+='_';
            }
            for(Integer k = 0 ; k <= i ; k++) {
                s+='*';
            }
            }
        system.debug(s);
    }
    public static void pattern8() {
        String s = '';
        for(Integer i = 0 ; i < 4 ; i++) {
            s+='\n';
            for(Integer j = 0 ; j <= i ; j++) {
                if(j==0) {
                    s+='A';
                }
                else if(j==1) {
                    s+=('B');
                }
                else if(j==2) {
                    s+=('C');
                }
                else {
                    s+=('D');
                }
            }
        }
        System.debug(s);
    }
    public static void pattern9() {
        String s = '';
        for(Integer i = 0 ; i < 4 ; i++) {
            s+='\n';
            for(Integer k = 3 ; k > i ; k--) {
                s+='_';
            }
            for(Integer j = 0 ; j <= i ; j++) {
                if(j==0) {
                    s+='A';
                }
                else if(j==1) {
                    s+=('B');
                }
                else if(j==2) {
                    s+=('C');
                }
                else {
                    s+=('D');
                }
            }
        }
        System.debug(s);
    }
    public static void pattern10() {
        String s = '';
        for(Integer i = 0 ; i < 4 ; i++) {
            s+='\n';
            for(Integer k = 3 ; k > i ; k--) {
                s+='_';
            }
            for(Integer j = 0 ; j <= i ; j++) {
                if(j==0) {
                    s+='A';
                }
                else if(j==1) {
                    s+=('B');
                }
                else if(j==2) {
                    s+=('C');
                }
                else {
                    s+=('D');
                }
            }
            for(Integer m = 0 ; m < i ; m++) {
				if(i-m==1) {
					s+='A';
				}
				else if(i-m==2) {
					s+=('B');
                }
				else if(i-m==3) {
                    s+=('C');
                }
                else {
                    s+=('D');
                }
            }
        }
        System.debug(s);
    }
}