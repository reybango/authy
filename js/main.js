/* Used in gettoken.cfm to send the SMS message */
$("#sendsms").click( function( event ) {
	
	event.preventDefault();
	
	$.ajax( {url: "sendsms.cfm", 
	    	beforeSend:function(){ 
	    		$("#loading").show(); 
	    	}
	} ).always( function(){ 
	   	$("#loading").hide(); 
	});

});
