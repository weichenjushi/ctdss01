var patten = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
function enterClick(e) {
    var keynum
    if (window.event) // IE
    {
        keynum = e.keyCode
        if (keynum == 13) {
            window.event.returnValue = false;
            addattention();
        }
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        keynum = e.which
        if (keynum == 13) {
            e.preventDefault();
            addattention();
        }
    }
}
function addattention() {
	var attentiontext = document.getElementById("attentiontext").value;
	if (attentiontext == "") {
		alert("content can not be empty!");
		return false;
	}else {
		sendRequest("WeixinServlet?service=addattention&attentiontext=" + attentiontext);
	}
}
function addnews(){
	var newstext = document.getElementById("newstext").value;
	if (newstext == "") {
		alert("content can not be empty!");
		return false;
	}else {
		sendRequest("WeixinServlet?service=addnews&newstext=" + newstext);
	}	
}
//编辑首次关注
function updateattention(){

	var num=document.getElementById("number").value;
	var attentiontext = document.getElementById("attentiontext").value;
	if (attentiontext == "") {
		alert("content can not be empty!");
		return false;
	}else {
		sendRequest("WeixinServlet?service=updateattention&attentiontext=" + attentiontext+"&num="+num);
	}	
}
//编辑最新消息
function updatenews(){
	var num=document.getElementById("number").value;
	var newstext = document.getElementById("newstext").value;
	if (newstext == "") {
		alert("content can not be empty!");
		return false;
	}else {
		sendRequest("WeixinServlet?service=updatenews&newstext=" + newstext+"&num="+num);
	}		
}

var XMLHttpReq;
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) {
		XMLHttpReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			XMLHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
		} catch (e) {
			try {
				XMLHttpReq = new ActiveXObject("Mircsoft.XMLHTTP");
			} catch (e1) {
			}
		}
	}
}
function sendRequest(url) {
	createXMLHttpRequest();
	XMLHttpReq.open("GET", url + "&time=" + new Date().getTime(), true);
	XMLHttpReq.onreadystatechange = processResponse;
	XMLHttpReq.send(null);

}
function processResponse() {
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			var res = XMLHttpReq.responseXML.getElementsByTagName("result")[0].firstChild.data;
			if (res == "success") {
				window.location.href = "index/weixin/success.jsp";
			} else {
				window.alert(res);
			}
		} else {
			window.alert("The page you request is abnormal!");
		}
	}
}
function getRootPath() {
	var strFullPath = window.document.location.href;
	var strPath = window.document.location.pathname;
	var pos = strFullPath.indexOf(strPath);
	var prePath = strFullPath.substring(0, pos);
	return (prePath);
}