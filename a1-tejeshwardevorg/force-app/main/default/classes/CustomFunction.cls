public class CustomFunction {
    public String name {set;get;}
    public String rating {set;get;}
    public String industry {set;get;}
    
    public PageReference save(){
        Account a=new Account();
        a.Name=name;
        a.Rating=rating;
        a.Industry=industry;
        
        insert a;
        
        PageReference pr= new PageReference('/'+a.Id);
        return pr;
    }
    
    public PageReference saveandnew(){
        Account a=new Account();
        a.Name=name;
        a.Rating=rating;
        a.Industry=industry;
        
        insert a;
        
        PageReference pr= new PageReference('/'+'001/e?retURL=%2F001%2Fo');
        return pr;
    }
    
    public PageReference cancel(){       
        PageReference pr= new PageReference('/'+'home/home.jsp');
        return pr;
    }
}