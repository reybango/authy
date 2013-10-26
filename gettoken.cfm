<cfset showError = false>

<!--- This is a C9 test --->
<cfif isDefined( "form.authytoken")>

	<!--- Build the Authy URL request --->
	<cfset newURL = "https://api.authy.com/protected/json/verify/" & form.authytoken & "/" & session.authy_id>

	<!--- https://api.authy.com/protected/json/verify/1234567/225?api_key=b92234d78a8bdb88524dc824d0346882 --->


	<!--- Send the token to Authy for validation --->
	<cfhttp url="#newURL#" method="get">
		<cfhttpparam type="URL" name="api_key" value="b92234d78a8bdb88524dc824d0346882">
	</cfhttp>

	<!--- Query param to show the JSON response --->
	<cfif isDefined( "url.json" )>
		<cfdump var="#cfhttp.filecontent#">
		<cfabort>
	</cfif>

	<!--- Convert the JSON response to a CF struct for easier usage --->
	<cfset myJsonStruct = deserializeJSON(cfhttp.filecontent)>

	<!--- Is the token entered by the user valid? --->
	<cfif NOT myJSONStruct.success>
		<cfset showError = true>
	<cfelse>
		<cflocation url="success.cfm" addtoken="true">
		<cfabort>
	</cfif>

</cfif>

<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <title>Nettuts 2-auth Tut - Enter Your Auth Code</title>
        <link rel="stylesheet" href="css/main.css">
        <link href="https://www.authy.com/form.authy.min.css" media="screen" rel="stylesheet" type="text/css">   
    </head>
    <body>

    	<div class="authy-form"> 

		<form method="post" class="user-form" action="<cfoutput>#cgi.script_name#</cfoutput>">

			<h2>Enter the code we sent you</h2>
			
			<label for="authy-token">Your Token</label>
			<input id="authy-token" name="authytoken" type="text" placeholder="Enter your auth code">

			<input type="submit" value="Enable">			
			
			<a href="#" id="sendsms">Send the code via SMS</a><span id="loading" style="display:none;">Sending...</span>

		</form>
		
		<cfif showError>
			<div class="error">Invalid code. Please re-enter your code</div>					
		</cfif>	
		
	</div>

    <script src="https://www.authy.com/form.authy.min.js" type="text/javascript"></script>        
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/main.js"></script>        
    </body>
</html>
