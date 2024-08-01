({
    //Initiating an action
    //declaration of method
    doInit : function(component, event) {
        //declaring variable action which is calling findAll method from the ContactController class
    	var action = component.get("c.findAll");
    	//calling the function setcallback
    							//creating another function which will store the returned data from that function
        action.setCallback(this,function(a)	{
                                                //Used to store return value from a(returnvalue) to v.contacts available in component
                                                component.set("v.contacts",a.getReturnValue());
                                      		});
    //This is used to call the action to pass variable action
	$A.enqueueAction(action);
	},
    
    searchKeyChange : function(component,event) {
        var searchKey = event.getParams("searchKey");
    
    	var action = component.get("c.findByName");
        
        action.setParams({
    
            "searchKey":searchKey
    
            });

        action.setCallback(this,function(a){
            
            component.set("v.contacts",a.getReturnValue());
            
        });

        $A.enqueueAction(action);
                                
        }
})