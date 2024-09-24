public with sharing class CurrencyConverter {
    public static Decimal convertCurrencyToIN(Decimal usd) {
        Decimal inr = 0.0;
        
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://free.currconv.com//api/v7/convert?q=USD_INR&apiKey=');
        req.setMethod('GET');
        
        HTTPResponse res = h.send(req);
        
        Map<String,Object> jsonBody = (Map<String,Object>)Json.deserializeUntyped(res.getBody());
        
        Map<String,Object> mMap = (Map<String,Object>) jsonBody.get('results');
        
        Map<String,Object> mMap2 = (Map<String,Object>) mMap.get('USD_INR');
        
        Decimal conversionRate = (Decimal) mMap2.get('val');
        
        inr = usd*conversionRate;
        
        return inr;
    }
}