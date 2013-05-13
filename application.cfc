component {

    this.name = "twoauth22";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
    this.datasource = "my_datasource";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 1, 0, 0); // 1 hour
    this.setClientCookies = true;
    this.customTagPaths = [ expandPath('/myAppCustomTags') ];
    this.mappings = {
        "/foo" = expandPath('/com/myCompany/foo')
    };
    this.scriptProtect = "all";
    
    setting enablecfoutputonly="false" requesttimeout="0" showdebugoutput="yes";

    // see also: http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-750b.html
    // see also: http://help.adobe.com/en_US/ColdFusion/10.0/Developing/WSED380324-6CBE-47cb-9E5E-26B66ACA9E81.html

    function onApplicationStart() {

	application.authyAPIKey = "b92234d78a8bdb88524dc824d0346882";
	application.authyNewUser = "https://api.authy.com/protected/json/users/new";
	application.authySMS = "https://api.authy.com/protected/json/sms/";

	return true;
    }

    function onSessionStart() {}

    // the target page is passed in for reference, 
    // but you are not required to include it
    function onRequestStart( string targetPage ) {

    	// Restart the app if needed... 
	if (isdefined("url.reinit")) {
	    OnApplicationStart();
	    OnSessionStart();
	}

    }

    function onRequest( string targetPage ) {
        include arguments.targetPage;
    }

    function onRequestEnd() {}

    function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

    function onApplicationEnd( struct ApplicationScope ) {}

    function onError( any Exception, string EventName ) {}

}	