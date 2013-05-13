<cfif isDefined( "form.cellphone")>

	<cfset session.authy_id = 0>

	<!--- Send the Authy request to enable two-factor auth for the user --->
	<cfhttp url="https://api.authy.com/protected/json/users/new" method="post">
		<cfhttpparam type="formField" name="api_key" value="b92234d78a8bdb88524dc824d0346882">
		<cfhttpparam type="formField" name="user[email]" value="reybango@gmail.com">	    	
		<cfhttpparam type="formField" name="user[cellphone]" value='#form.cellphone#'>
		<cfhttpparam type="formField" name="user[country_code]" value='#form.country#'>			
	</cfhttp>

	<!--- Query param to show the JSON response --->
	<cfif isDefined( "url.json" )>
		<cfdump var="#cfhttp.filecontent#">
		<cfabort>
	</cfif>

	<!--- Convert the JSON response to a CF struct for easier usage --->
	<cfset myJSONStruct = deserializeJSON(cfhttp.filecontent)>

	<!--- If you get an Authy ID sent back, all is good and we can test their mobile device --->
	<cfif myJSONStruct.user.id>
		<cfset session.authy_id = myJSONStruct.user.id>
		<cflocation url="gettoken.cfm" addtoken="true">
		<cfabort>
	</cfif>

</cfif>

<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <title>Nettuts 2-auth Tut - Enable Two-Factor Auth</title>
        <link rel="stylesheet" href="css/main.css">
        <link href="https://www.authy.com/form.authy.min.css" media="screen" rel="stylesheet" type="text/css">   
    </head>
    <body>

    	<div class="authy-form"> 
		<form method="post" class="user-form" action="<cfoutput>#cgi.script_name#</cfoutput>">

			<h2>Turn on Two-Factor Authentication</h2>
			
			<label for="countries-input">Your country</label>
			<input class="authy-countries" id="countries-input" name="country" type="text" placeholder="Enter your country">

			<label for="authy-cellphone">Your cellphone</label>
			<input id="authy-cellphone" name="cellphone" type="text" placeholder="Enter your cellphone">

			<input type="submit" value="Enable">			

		</form>
	</div>

    <script src="https://www.authy.com/form.authy.min.js" type="text/javascript"></script>        
    </body>
</html>
