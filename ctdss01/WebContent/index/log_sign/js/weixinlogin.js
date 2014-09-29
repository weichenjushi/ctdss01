function enterClick(e) {
        var keynum
        if (window.event) // IE
        {
            keynum = e.keyCode
            if (keynum == 13) {
                window.event.returnValue = false;
                weixinlogin_null();
            }
        }
        else if (e.which) // Netscape/Firefox/Opera
        {
            keynum = e.which
            if (keynum == 13) {
                e.preventDefault();
                weixinlogin_null();
            }
        }
 }
function weixinlogin_null()
{
	var username = document.getElementById("weixinlogin_username").value;
	var password = document.getElementById("weixinlogin_password").value;
	
	if(username == "" || password == "")
		{
			if(username == ""){
				alert("username is empty!");
				return false;
			}
			else {
				alert("password is empty!");
				return false;
			}
		}
	else
		{
		    sendRequest("loginServlet?service=login&username=" + username
				+ "&password=" + password);
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
			if(res=="admin")
			{
				window.location.href = "index/weixin/attentionadd.jsp";
			}
			else
			{
				window.alert(res);
				return;
			}
		} else {
			window.alert("The page you request is abnormal!");
		}
	}
}
function getRootPath(){
    var strFullPath=window.document.location.href;
    var strPath=window.document.location.pathname;
    var pos=strFullPath.indexOf(strPath);
    var prePath=strFullPath.substring(0,pos);
    return(prePath);
   }