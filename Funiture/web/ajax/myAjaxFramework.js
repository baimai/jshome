function createRequestObject( ){
	var requestObjectTemp = false;
	if (window.XMLHttpRequest){
		requestObjectTemp =new XMLHttpRequest( );
	}else if (window.ActiveXObject){
		requestObjectTemp =new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		alert ("Your browser does not support Ajax");
	}
		return requestObjectTemp;
}
function getDataReturnText(url, callback){ 
	var requestObject = createRequestObject( );
	if(requestObject) {
		requestObject.open("GET", url+"?ts="+new Date( ).getTime( )); 
		requestObject.onreadystatechange = function( ) { 
			if (requestObject.readyState == 4 && requestObject.status == 200) { 
					callback(requestObject.responseText); 
					delete requestObject;
					requestObject = null;
			} 
		}
		requestObject.send(null); 
	}
}
function getDataReturnXml(url, callback){ 
	var requestObject = createRequestObject( );
	if(requestObject) {
		requestObject.open("GET", url+"?ts="+new Date( ).getTime( )); 
		requestObject.onreadystatechange = function( ) { 
			if (requestObject.readyState == 4 && requestObject.status == 200) { 
				callback(requestObject.responseXML); 
				delete requestObject;
				requestObject = null;
			} 
		}
		requestObject.send(null); 
	}
}
function postDataReturnText(url, data, callback){ 
	var requestObject = createRequestObject( );
	if(requestObject) {
		requestObject.open("POST", url+"?ts="+new Date( ).getTime( )); 
		requestObject.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
		requestObject.onreadystatechange = function( ) { 
			if (requestObject.readyState == 4 && requestObject.status == 200) {
				callback(requestObject.responseText); 
				delete requestObject;
				requestObject = null;
			} 
		}
		requestObject.send(data); 
	}
}

function postDataReturnXml(url, data, callback){ 
	var requestObject = createRequestObject( );
	if(requestObject) {
		requestObject.open("POST", url+"?ts="+new Date( ).getTime( )); 
		requestObject.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
		requestObject.onreadystatechange = function( ) { 
			if (requestObject.readyState == 4 && requestObject.status == 200) {
				callback(requestObject.responseXML); 
				delete requestObject;
				requestObject = null;
			} 
		}
		requestObject.send(data); 
	}
}



