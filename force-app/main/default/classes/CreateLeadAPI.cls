@RESTResource(urlMapping='/CreateLead/')
global with sharing class CreateLeadAPI
{
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
        
        String qr = 'SELECT Name FROM ' + objName + ' WHERE Id = + :i ' + 'Limit 1';
        System.debug(qr);
        
        sObject s = Database.query(qr);
        
        String jsonResponse = '{\"Name\":\"'+s.get('Name')+'\"}';
            
		return jsonResponse;
        
    }
    
    @HTTPPost
    global static String doPost()
    {
        String fname, lname, comp;
        String fieldValue, fieldName;
        
        RestRequest req = RestContext.request;
        
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
                
        System.debug('Request Body is : ' + jsonBody);
        
        JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() != JSONToken.END_OBJECT){
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName == 'FirstName')
                    fname = fieldValue;
                else if(fieldName == 'LastName')
                    lname = fieldValue;
                else if(fieldName == 'Company')
                    comp = fieldValue;
            }
        }
		
        Lead l = new Lead(firstName = fname, lastName = lname, company = comp);
        insert l;
        
        System.debug(l);
        
       	return l.id;
    }
}