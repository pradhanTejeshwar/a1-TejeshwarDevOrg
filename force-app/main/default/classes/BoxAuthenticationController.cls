public class BoxAuthenticationController {
    public string authcode {get;set;}
    public string body {get;set;}
    //public string access_token {get;set;}
    public PageReference authenticate() {
        return new PageReference('https://account.box.com/api/oauth2/authorize?response_type=code&client_id=8p8ph81ys3naq1sr15rvm1z3ql16yl7m');
    }
    public void tradeAuthCode() {
        //1. Extract the Auth Code
        authCode = ApexPages.currentPage().getParameters().get('code');
        
        //2. Instantiate HTTP Class
        Http h = new HTTP();
        
        //3. Frame the request for a POST Method
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/oauth2/token/');
        req.setMethod('POST');
        req.setHeader('Accepts', 'application/json');
        req.setBody('grant_type=authorization_code&client_id=8p8ph81ys3naq1sr15rvm1z3ql16yl7m&client_secret=4bxtrVQFUeNyfaGT48TjbkIWOpmszMtW&code='+authCode);
        
        //4. Handle the response
        HttpResponse res = h.send(req);
        
        System.debug(res.getBody());
        //body = res.getBody();
        fromJSON d = (fromJSON)JSON.deserialize(res.getBody(), fromJSON.class);
        //d.accessToken;
        body = getFilesInfo(d.access_token);
        
        //fromJSON d = (fromJSON)JSON.deserialize(res.getBody(), fromJSON.class);
    }
    public String getFilesInfo(String access_token) {
        Http h = new http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/2.0/folders/147200252816/items/');
        req.setMethod('GET');
        req.setHeader('Accepts','application/json');
        req.setHeader('Authorization', 'Bearer ' + access_token);
        
        HttpResponse res = h.send(req);
        return res.getBody();
    }
    public class fromJSON{
        public String access_token;	//dLGCssek0qgnPpUvp82ZxpaTFtCRaztI
        public Integer expires_in;	//3737
        public cls_restricted_to[] restricted_to;
        public String refresh_token;	//i6znZHhcIO2O82hr8I3oAWIoztPq6VXhSIfJs7EJvmHg2XiLKx9g4ag3WmXIwaSS
        public String token_type;	//bearer
        
        
        
    }
    class cls_restricted_to {
    }
    /*
    public static fromJSON parse(String json){
    return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
    }
    
    static testMethod void testParse() {
    String json=		'{"access_token":"dLGCssek0qgnPpUvp82ZxpaTFtCRaztI","expires_in":3737,"restricted_to":[],"refresh_token":"i6znZHhcIO2O82hr8I3oAWIoztPq6VXhSIfJs7EJvmHg2XiLKx9g4ag3WmXIwaSS","token_type":"bearer"}';
    fromJSON obj = parse(json);
    System.assert(obj != null);
    }
    */
}