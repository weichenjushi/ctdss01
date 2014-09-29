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
function showms(par){
	
		sendRequest("WeixinServlet?service="+par);

}

function deleteattention(a){
	sendRequest("WeixinServlet?service=delattention&number="+a);
}

function deletenews(a){
	sendRequest("WeixinServlet?service=delnews&number="+a);
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
	XMLHttpReq.open("POST", url + "&time=" + new Date().getTime(), true);
	XMLHttpReq.onreadystatechange = processResponse;
	XMLHttpReq.send(null);

}
function processResponse() {
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			var ms = XMLHttpReq.responseText;	//获取返回数据
			document.getElementById("contentshow").innerHTML = ms;//显示返回内容
		} else {			
			window.alert("The page you request is abnormal!");
		}
	}
}
///////////以下部分用于编辑消息
/*
var XHRequst;
function createXHRequest() {
	if (window.XMLHttpRequest) {
		XHRequst = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			XHRequst = new ActiveXObject("MSXML2.XMLHTTP");
		} catch (e) {
			try {
				XHRequst = new ActiveXObject("Mircsoft.XMLHTTP");
			} catch (e1) {
			}
		}
	}
}
function sendXHRequest(url) {
	createXHRequest();
	XHRequst.open("POST", url + "&time=" + new Date().getTime(), true);
	XHRequst.onreadystatechange = XHResponse;
	XHRequst.send(null);

}
function XHResponse() {
	if (XHRequst.readyState == 4) {
		if (XHRequst.status == 200) {
			var ms = XHRequst.responseText;	//获取返回数据
			document.getElementById("attentiontext").innerHTML = ms;//显示返回内容
		} else {			
			window.alert("The page you request is abnormal!");
		}
	}
}
/////////////////////
*/
function getRootPath() {
	var strFullPath = window.document.location.href;
	var strPath = window.document.location.pathname;
	var pos = strFullPath.indexOf(strPath);
	var prePath = strFullPath.substring(0, pos);
	return (prePath);
}

