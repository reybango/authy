	Approach 1:
	$.ajax( {url: "sendsms.cfm", 
	    	beforeSend:function(){ 
	    		$("#loading").show(); 
	    	},
	    	complete: function(){ 
	    		$("#loading").hide(); 
	    	}
	} );


	Approach 2:
	$.ajax( {url: "sendsms.cfm", 
	    	beforeSend:function(){ 
	    		$("#loading").show(); 
	    	}
	} ).always( function(){ 
	   	$("#loading").hide(); 
	});