var patten = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
function email_null_wrong() {
	var email = document.getElementById("email").value;
	if (email == "") {
		alert("The email is empty!");
		return false;
	} else if (!patten.test(email)) {
		alert("Please enter the correct email format!");
		email.focus();
		return false;
	}else{
	    sendRequest("EmailServlet?service=emailexists&email_address=" + email);
	    return false;
	}
}
var XMLHttpReq;
function createXMLHttpRequest(){
    if(window.XMLHttpRequest){
       XMLHttpReq = new XMLHttpRequest();
    }else if(window.ActiveXObject){
       try{
           XMLHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
       }catch(e){
           try{
              XMLHttpReq = new ActiveXObject("Mircsoft.XMLHTTP");
           }catch(e1){}
       }
    }
}
function sendRequest(url) {
	createXMLHttpRequest();
	XMLHttpReq.open("GET", url+"&time="+new Date().getTime(), true);
	XMLHttpReq.onreadystatechange = processResponse;
	XMLHttpReq.send(null);

}
function processResponse() {
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			var res = XMLHttpReq.responseXML.getElementsByTagName("result")[0].firstChild.data;
			if(res=="success")
			{
				var email = document.getElementById("email").value;
				window.location.href = "EmailServlet?service=findPwd&email="+email;
			}
			else
			{
				window.alert(res);
			}
		} else {
			window.alert("The page you request is abnormal!");
		}
	}
}