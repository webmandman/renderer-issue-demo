/**
* 
*/

component extends="coldbox.system.RestHandler" {

    property name="UserService" 		inject="UserService";

    //Create a Password Change Request
    function createPasswordChangeRequest(event,rc,prc){       

        //Authenticate User
        var result = UserService.createPasswordChangeRequest(argumentCollection=rc);

        //Configure Results
        event.getResponse().setData("Hello");
    }

}