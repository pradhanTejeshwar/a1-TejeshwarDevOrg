public with sharing class ContactController 
{
    @AuraEnabled
    public static List<Contact> findAll() 
    {
        return [SELECT ID, Name, Phone FROM Contact LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey) 
    {
        String name = '%'+searchKey +'%';
        
        return [SELECT ID, Name, Phone FROM Contact WHERE Name LIKE :name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findByID(String contactID) 
    {        
        return [SELECT ID, Name, Title, Phone, Mobilephone, Account.Name FROM Contact WHERE ID = :contactID LIMIT 1];
    }
    
}