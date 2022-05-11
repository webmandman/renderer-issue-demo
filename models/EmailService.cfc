component 
	threadSafe	= "true"
	output		= false
	hint  		= "mail service help to mailService@cbmailservices" {

	property name="cbMailService" 	inject="mailService@cbmailservices";
	property name="Renderer"     	inject="Renderer@coldbox";
    property name="CONFIG"              inject="coldbox:configSettings";

	emailService function init(){
		return this;
	}

	public struct function send(required string layoutName, required string viewName, required struct settings, string type) {

		// Create mail service object
		var emailPayload = cbMailService.newMail();

		// Set the settings
		emailPayload.setTo(ARGUMENTS.settings.to);
		emailPayload.setFrom(ARGUMENTS.settings.from);
		emailPayload.setSubject(ARGUMENTS.settings.subject);

		if(structKeyExists(ARGUMENTS.settings, "cc")){
			emailPayload.setCc(ARGUMENTS.settings.cc);
		}
		
		if(structKeyExists(ARGUMENTS.settings, "bcc")){
			emailPayload.setBcc(ARGUMENTS.settings.bcc);
		}

		if(structKeyExists(ARGUMENTS.settings, "bodyTokens")){
			emailPayload.setBodyTokens(ARGUMENTS.settings.bodyTokens);
		}

		
		emailPayload.setTo(CONFIG.mainToEmailAddress);
		emailPayload.setSubject("TEST: " & ARGUMENTS.settings.subject);
		

		// Set the body 
		if(isDefined("ARGUMENTS.type") and ARGUMENTS.type eq "text"){
			emailPayload.setText(Renderer.layout(layout="email/"&ARGUMENTS.layoutName&".text",view="email/"&ARGUMENTS.viewName&".text"));
		}else if(isDefined("ARGUMENTS.type") and ARGUMENTS.type eq "html"){
			emailPayload.setHtml(Renderer.layout(layout="email/"&ARGUMENTS.layoutName&".html",view="email/"&ARGUMENTS.viewName&".html"));
		}else{
			emailPayload.setText(Renderer.layout(layout="email/"&ARGUMENTS.layoutName&".text",view="email/"&ARGUMENTS.viewName&".text"));
			emailPayload.setHtml(Renderer.layout(layout="email/"&ARGUMENTS.layoutName&".html",view="email/"&ARGUMENTS.viewName&".html"));
		}

		// Send it
		var result = cbMailService.send(emailPayload);

		return result;
	}

}
