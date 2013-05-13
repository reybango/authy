
<!--- Build the Authy SMS URL --->
<cfset newURL = "https://api.authy.com/protected/json/sms/" & session.authy_id>

<!--- https://api.authy.com/protected/json/sms/225?api_key=b92234d78a8bdb88524dc824d0346882 --->

<!--- Request that an Authy SMS message be sent to the user --->
<cfhttp url="#newURL#" method="get">
	<cfhttpparam type="URL" name="api_key" value="b92234d78a8bdb88524dc824d0346882">
	<cfhttpparam type="URL" name="force" value="true">		
</cfhttp>





