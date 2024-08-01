public with sharing class accountController {
    @auraenabled(cacheable=true)
    public static List<Account> getAccounts(String searchkey) {
        return [SELECT Id, Name, Phone, Industry FROM Account WHERE Name LIKE : '%'+ searchkey +'%' OR Industry Like : '%'+ searchkey +'%'
                OR Phone LIKE : '%'+ searchkey +'%'];
                
    }
}