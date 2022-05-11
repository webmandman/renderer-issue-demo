<cfcomponent output="false">

  <cfproperty name="settings" inject="coldbox:modulesettings:user">
  <cfproperty name="EmailService" inject="EmailService">

	<!---- init ---->
	<cffunction name="init" returntype="any">
	  <cfreturn this />
	</cffunction>

  <!---Create Password Change Request--->
  <cffunction name="createPasswordChangeRequest" returntype="void" hint="Creates a password change request"> 
    

    <!--- 
        in my original service I do some database calls, 
        then send off an email if all is good, 
        finally return database base record with some kind of token.   
    --->

        <cfset emailSettings = {
          to: "webmandman@gmail.com",
          from: "webmandman@gmail.com",
          subject: "Please reset your password",
          allowTest: 1,
          bodyTokens: {
              toemail: "webmandman@gmail.com",
              firstname: "Daniel M",
              reseturl:  "https://trycf.com/login/password/reset/",
              requesturl: "https://trycf.com/login/forgot",
              domain: "https://trycf.com",
              moduletitle: "Password Reset",
              previewtext: "We see that you have initiated a password change request. Please use the link below to update your password.",
              sourcemodule: "Test Module"
          }
        }>
        
        <!---Send Notification Email --->
        <cfset email = EmailService.send(
            layoutName="referencecenter",
            viewName="intra.password.reset",
            settings=emailSettings)>
            
   
  </cffunction>


</cfcomponent>