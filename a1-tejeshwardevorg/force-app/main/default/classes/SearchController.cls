public class SearchController {
    
    public List<Account> accountsList {set;get;}
    public String searchEntry {set;get;}
    public Boolean pbRenderedFlag {set;get;}

    public SearchController (){
        pbRenderedFlag = false;
    }
    
    public Integer search(){
        String searchEntry = '%' + searchEntry + '%';
        accountsList = [SELECT Id, Name, Rating, Industry FROM Account WHERE Name LIKE :searchEntry];
        
        if (accountsList.size() > 0) {
            pbRenderedFlag = true;
        }
        return 1;
        //searchEntry = null;
    }
}