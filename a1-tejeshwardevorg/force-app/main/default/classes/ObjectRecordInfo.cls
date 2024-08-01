@RESTResource(urlMapping='/ObjectRecordInfo')
global class ObjectRecordInfo {
	@HTTPGet
    global static String doGet() {
        String objName;
        Id i;
        
        RestRequest req = RestContext.request;
        
        RestResponse res = RestContext.response;
        
        //System.debug(req.headers.toString());
        
        objName = req.headers.get('ObjectName');
        i = req.headers.get('Id');
        
        /*
        String jsonBody = req.requestBody.toString();
            
		JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken() != null) {
            if(parser.getCurrentToken() != JSONToken.END_OBJECT) {
                String fName = parser.getCurrentName();
                String fValue = parser.getText();
                	
                	if(fName == 'ObjectName')
                        objName = fValue;
                	else if(fName == 'ID')
                        i = fValue;
            }
        }
        */
        
        String qr  = 'SELECT Name FROM '+objName+' WHERE ID = :i '+' LIMIT 1';
        //System.debug(qr);
        
        sObject s = Database.query(qr);
        
        String jsonResponse = '{\"Name\":\"'+s.get('Name')+'\"}';
            
		return jsonResponse;
        
    }
}