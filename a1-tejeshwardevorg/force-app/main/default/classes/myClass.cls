public class myClass {
    public static void myMethod() {
        List<Account> myList = [Select Name, Active__c from Account];
       	
        //for loop
        for(Integer i = 0 ; i < myList.size() ; i++) {
            System.debug('Name : ' + myList[i].Name);
        }
        
        //for each loop
        for(Account a : myList){
            System.debug('Name = ' + a.Name);
        }
    }
    public static void myMethod(String str) {
        List<Account> myList = [SELECT Name, Active__c FROM Account WHERE Name= :str];
        
        for(Account a : myList) {
            System.debug('Queried Results : ' + a.Name);
        }
    }
    public static void myCal() {
        AggregateResult ar1 = [SELECT SUM(Amount), MAX(Amount) FROM Opportunity];
        System.debug('Results are : ' + ar1);
    }
    public static void myMethods() {
        List<String> nameList = new List<String>{'John','Tenz','Shazam','Sick','Dapr','Shroud','Sinatra','Tej','Zekken','Zellsis','sacy','tarik','aceu'};
        List<Contact> contactList = [SELECT firstName, lastName, Phone FROM Contact WHERE firstName IN : nameList]; 
		//List<Contact> contactList = [SELECT firstName, lastName, Phone FROM Contact]; 
		System.debug(contactList);
    }
    public static void DateLiterals() {
        List<Account> dateList = [SELECT Name FROM Account Where createdDate != TODAY]; 
        System.debug(dateList);
    }
    public static void TestClass(){
        System.debug('Test !');
    }
    public static void DynamicSOQL() {
        String s = 'SELECT ID, Name FROM Account';
        List<sObject> accList = Database.query(s);
        System.debug(accList);
    }
    public static void FullyDynamicSOQLQuery() {
        String qr = 'SELECT ID';
        String []fieldList = new List<String>();
        
        fieldList.add('Name');
        fieldList.add('Phone');
        
        String objName = 'Account';
        
        for(String field: fieldList) {
            qr += ', ' + field;
        }
        
        qr += ' FROM ' + objName;
        
        String s1 = String.escapeSingleQuotes(qr);
        List<sObject> Listfield = Database.query(s1);
        System.debug(Listfield);
    }
    public static void SOSL() {
        List<List<sObject>> l1 = [Find 'John' Returning Account(Name,NumberofEmployees), Contact(Name,Phone)];   
        System.debug(l1);
        
        List<Account> accList = l1[0];
        List<Contact> conList = l1[1];
        
        for (Account a : accList) {
            System.debug(a.Name);
            System.debug(a.NumberofEmployees);
        }
        
        for (Contact c : conList) {
            System.debug(c.Name);
            System.debug(c.Phone);
        }
    }
    public static void insertStatements(Integer n) {
        List<Account> accList = new List<Account>();
        
        for(integer i=1; i<=n ; i++) {
            Account a = new Account(Name = 'Test Account ' + i);
            accList.add(a);
        }
        //Total Accounts before Insert
        List<Account> l1 = [SELECT Name FROM Account];
        Integer size = l1.size();
        System.debug('Total Accounts before Insert: \n' + size);
        //Inserted Test Accounts
        System.debug('Inserted Test Accounts: \n' + accList);
        
        insert accList;
        //Total Accounts after Insert
        List<Account> l2 = [SELECT Name FROM Account];
        size = l2.size();
        System.debug('Total Accounts after Insert: \n' + size);
    }
    public static void showListOfSobject(String s) {
        String qr = 'SELECT Id ';
        String []fieldList = new List<String>();
        fieldList.add('Name');
        
        for(String field: fieldList) {
            qr += ', ' + field;
        }
        
        qr += ' FROM ' + s + ' LIMIT 10';
        
        String finalString = String.escapeSingleQuotes(qr);
        List<sObject> recordList = Database.query(finalString);
        System.debug(recordList);
        
        List<sObject> finalList = new List<sObject>();
        //String finalList = '';
        
        /*
        Integer n = 0;
        for(sObject a : recordList) {
            finalList += a ;
            n++;
        }
		*/ 
        
    }
    public static void updateOpportunityRecords() {
        List<Opportunity> oppList = [SELECT CloseDate FROM Opportunity];
        System.debug(oppList);
        Date d = System.Today()+90;
        for(Opportunity s : oppList) {
            s.CloseDate=d;
        }
        update oppList;
        System.debug(oppList);
    }
    public static void upsertAccountRecords() {
        List<Account> accList = [SELECT Name FROM Account where Name Like '%Test%'];
        System.debug(accList);
        Integer n = 1;
        for(Account s : accList) {
            s.Name +='Updated';
            n++;
        }
        //Account a1 = new Account(Name='Test 1');
        //Account a2 = new Account(Name='Test 1');
        //accList.add(a1);accList.add(a2);
        upsert accList;
        System.debug(accList);
    }
    public static void deleteDuplicateAccountRecords() {
        List<Account> accList = [SELECT Name FROM Account];
        Map<String, ID> mMap = new Map<String, ID>();
        
        for(Account a : accList) {
            mMap.put(a.Name,a.Id); 
        }
		
        List<Account> uniqList = new List<Account>();
        List<Account> delList = new List<Account>();
        Set<String> s1 = mMap.Keyset();
        
        Set<ID> uniqSet = new Set<ID>();
        
        for(String s : s1) {
            uniqSet.add(mMap.get(s));
        }
        
        for(Account acc : accList) {
            if(uniqSet.contains(acc.id))
                uniqList.add(acc);
        }
    }
    public static void undeleteTodaysRecords() {
        List<Account> accList = [SELECT Name FROM Account WHERE isDeleted = true AND LastModifiedDate = TODAY ALL ROWS];
        undelete accList;
    }
    public static void myMethodException(Integer i) {
        try {
            if(i<0)
                throw new myException();
            else
                i=i*10;
        }
        catch(myException me) {
            System.debug('Custom myException : ' + me.getCause() + ': ' + me.getMessage() + ': ' + me.getTypeName() + ': ' + me.getStackTraceString());
        }
    }
}