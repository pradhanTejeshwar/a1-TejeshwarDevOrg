public class FirstController {
    public String accName, accPhone;
    public String conName, conEmail;
    public String oppName{get;set;}
    public Decimal oppAmount{get;set;}
    public void FirstController() {
        
    }
    public void saveRecord() {
        Account a = new Account(Name=accName, Phone=accPhone);
        insert a;
        Contact c = new Contact(lastName=conName, Email=conEmail, accountid=a.id);
        insert c;
        Opportunity o = new Opportunity(Name=oppName, Amount=oppAmount, accountid=a.id, StageName='Prospecting', CloseDate=System.today());
        insert o;
    }  
    public void setAccName(String a) {
        accName = a;
    }
    public String getAccName() {
        return accName;
    }
    public void setAccPhone(String a) {
        accPhone = a;
    }
    public String getAccPhone() {
        return accPhone;
    }
    public void setConName(String c) {
        conName = c;
    }
    public String getConName() {
        return conName;
    }
    public void setConEmail(String c) {
        conEmail = c;
    }
    public String getConEmail() {
        return conEmail;
    }
    /*
    public void setOppName(String o) {
        oppName = o;
    }
    public String getOppName() {
        return oppName;
    }
    public void setOppAmount(Decimal o) {
        oppAmount = o;
    }
    public Decimal getOppAmount() {
        return oppAmount;
    }
    */
}