public class LeadExtension {
    public List<Lead> lList{get;set;}
    public LeadExtension(ApexPages.StandardController s) {
        lList = [SELECT Name, Status FROM Lead ORDER BY Name];
    }
}