function checkpassword(){
	var password = document.getElementById("password").value;
	var repassword = document.getElementById("repassword").value;
	var guid = document.getElementById("guid").value;
	if (password == "") {
		alert("password is empty!");
		return false;
	} else if (password.length < 6) {
		alert("password length can not be less than 6!");
		return false;
	} else if (repassword == "") {
		alert("repeat password is empty!");
		return false;
	} else if (repassword != password) {
		alert("the repeat password does not match with the password!");
		return false;
	}else{
	    sendRequest("RegisterServlet?service=updatePwd&password=" + password +"&guid="+ guid);
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
			window.alert(res);
			window.location.href = "login.jsp";
		} else {
			window.alert("The page you request is abnormal!");
		}
	}
}