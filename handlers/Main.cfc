/**
 * My RESTFul Event Handler
 */
component extends="coldbox.system.RestHandler" {
	
	function index( event, rc, prc ) {
		event.getResponse().setData( "Welcome to my ColdBox RESTFul Service" );
	}

}
