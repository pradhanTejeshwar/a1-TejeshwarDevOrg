public class AccountSearchController {
    public String searchText{get;set;}
     public String temp{get;set;}
    public List<Account> accList{get;set;}
    
    public AccountSearchController() {
        
    }
    public void search() {
        temp = '%'+searchText+'%';
        accList = [SELECT Name, NumberOfEmployees, Type FROM Account WHERE Name LIKE :temp];
    }
}