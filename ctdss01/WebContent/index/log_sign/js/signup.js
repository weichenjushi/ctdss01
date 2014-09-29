var patten = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
//邮箱
var pusername=/^[A-Za-z0-9_\\-\\u4e00-\\u9fa5]+$/;
var pcompany=/^[A-Za-z0-9_()（）\\-\\u4e00-\\u9fa5]+$/;
var pname=/^[\u4e00-\u9fa5A-Za-z]{2,8}$/;
var ppwd= /^.*[A-Za-z0-9\\w_-]+.*$/;
var labelid;
	
function gel(id){
	return document.getElementById(id);
}
function checkUsername(labelmsgid){
	gel(labelmsgid).innerHTML="";
	var username = document.getElementById("username").value.trim();
	if(username==""){
		gel(labelmsgid).innerHTML="<font color='red'>用户名不能为空!</font>";
		return false;
	}else if (username.length<4||username.length>20) {
		gel(labelmsgid).innerHTML="<font color='red'>用户名长度只能在4-20位字符之间!</font>";
		return false;
	}else if(!pusername.test(username)){
		gel(labelmsgid).innerHTML="<font color='red'>用户名只能由英文、数字及\"-\"、\"_\"组成!</font>";
		return false;
	}else{
		sendRequest("RegisterServlet?service=checkUsername&username=" + username,labelmsgid);
		return false;
	}
}
function checkPassword(labelmsgid){
	gel(labelmsgid).innerHTML="";
	var firstpassword = document.getElementById("password").value.trim();
	if(firstpassword==""){
		gel(labelmsgid).innerHTML="<font color='red'>密码不能为空!</font>";
		return false;
	}else if (firstpassword.length<6||firstpassword.length>20) {
		gel(labelmsgid).innerHTML="<font color='red'>密码长度只能在6-20位字符之间!</font>";
		return false;
	}else if(!ppwd.test(firstpassword)){
		gel(labelmsgid).innerHTML="<font color='red'>密码只能由英文、数字及标点符号组成!</font>";
		return false;
	}
}
function checkPassword2(labelmsgid){
	gel(labelmsgid).innerHTML="";
	var firstpassword = document.getElementById("password").value.trim();
	var secondpassword = document.getElementById("repassword").value;
	if(secondpassword==""){
		gel(labelmsgid).innerHTML="<font color='red'>重复密码不能为空!</font>";
		return false;
	}else if (secondpassword.length<6||secondpassword.length>20) {
		gel(labelmsgid).innerHTML="<font color='red'>密码长度只能在6-20位字符之间!</font>";
		return false;
	}else if(!ppwd.test(secondpassword)){
		gel(labelmsgid).innerHTML="<font color='red'>密码只能由英文、数字及标点符号组成!</font>";
		return false;
	}else if(firstpassword!=secondpassword){
		gel(labelmsgid).innerHTML="<font color='red'>两次输入密码不一致!</font>";
		return false;
	}
}
function checkEmail(labelmsgid){
	gel(labelmsgid).innerHTML="";
	var email = document.getElementById("email").value.trim();
	if(email==""){
		gel(labelmsgid).innerHTML="<font color='red'>邮箱不能为空!</font>";
		return false;
	}else if (email.length<4||email.length>50) {
		gel(labelmsgid).innerHTML="<font color='red'>邮箱地址长度应在4-50个字符之间!</font>";
		return false;
	}else if(!patten.test(email)){
		gel(labelmsgid).innerHTML="<font color='red'>邮箱地址不正确，请重新输入!</font>";
		return false;
	}else{
		sendRequest("RegisterServlet?service=checkEmail&email_address=" + email,labelmsgid);
		return false;
	}
}
function checkName(labelmsgid){
	gel(labelmsgid).innerHTML="";
	var name = document.getElementById("name").value.trim();
	if(name==""){
		gel(labelmsgid).innerHTML="<font color='red'>姓名不能为空!</font>";
		return false;
	}else if (!pname.test(name)) {
		gel(labelmsgid).innerHTML="<font color='red'>请输入您的真实姓名!</font>";
		return false;
	}
}
function checkComp(labelmsgid){
	gel(labelmsgid).innerHTML="";
	var comp = document.getElementById("company_name").value.trim();
	if(comp.length>25){
		gel(labelmsgid).innerHTML="<font color='red'>公司名长度不超过25个字符!</font>";
		return false;
	}
}
function enterClick(e) {
    var keynum
    if (window.event) // IE
    {
        keynum = e.keyCode
        if (keynum == 13) {
            window.event.returnValue = false;
            register();
        }
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        keynum = e.which
        if (keynum == 13) {
            e.preventDefault();
            register();
        }
    }
}
function register() {
	var username = document.getElementById("username").value.trim();
	var password = document.getElementById("password").value.trim();
	var repassword = document.getElementById("repassword").value.trim();
	var email = document.getElementById("email").value.trim();
//	var firstname = document.getElementById("firstname").value;
//	var lastname = document.getElementById("lastname").value;
	var name = document.getElementById("name").value;
	var company_name = document.getElementById("company_name").value.trim();
	/*var recaptcha_challenge_field = document.getElementById("recaptcha_challenge_field").value;
	var recaptcha_response_field = document.getElementById("recaptcha_response_field").value;*/
	var vcode=document.getElementById("vcode").value.trim();
//    if (company_name.length > 25) {
//		alert("���볤�Ȳ��ܴ���25!");
//		return false;
//	} 
	if(username==""){
		gel("unamemsg").innerHTML="<font color='red'>用户名不能为空!</font>";
		return false;
	}else if (username.length<4||username.length>20) {
		gel("unamemsg").innerHTML="<font color='red'>用户名长度只能在4-20位字符之间!</font>";
		return false;
	}else if(!pusername.test(username)){
		gel("unamemsg").innerHTML="<font color='red'>用户名只能由英文、数字及\"-\"、\"_\"组成!</font>";
		return false;
	}else if(password==""){
		gel("pwdmsg").innerHTML="<font color='red'>密码不能为空!</font>";
		return false;
	}else if (password.length<6||password.length>20) {
		gel("pwdmsg").innerHTML="<font color='red'>密码长度只能在6-20位字符之间!</font>";
		return false;
	}else if(!ppwd.test(password)){
		gel("pwdmsg").innerHTML="<font color='red'>密码只能由英文、数字及标点符号组成!</font>";
		return false;
	}else if(repassword==""){
		gel("repwdmsg").innerHTML="<font color='red'>重复密码不能为空!</font>";
		return false;
	}else if (repassword.length<6||repassword.length>20) {
		gel("repwdmsg").innerHTML="<font color='red'>密码长度只能在6-20位字符之间!</font>";
		return false;
	}else if(!ppwd.test(repassword)){
		gel("repwdmsg").innerHTML="<font color='red'>密码只能由英文、数字及标点符号组成!</font>";
		return false;
	}else if(password!=repassword){
		gel("repwdmsg").innerHTML="<font color='red'>两次输入密码不一致!</font>";
		return false;
	}else if(email==""){
		gel("emailmsg").innerHTML="<font color='red'>邮箱不能为空!</font>";
		return false;
	}else if (email.length<4||email.length>50) {
		gel("emailmsg").innerHTML="<font color='red'>邮箱地址长度应在4-50个字符之间!</font>";
		return false;
	}else if(!patten.test(email)){
		gel("emailmsg").innerHTML="<font color='red'>邮箱地址不正确，请重新输入!</font>";
		return false;
	}else if(name==""){
		gel("namemsg").innerHTML="<font color='red'>姓名不能为空!</font>";
		return false;
	}else if (vcode == "") {
		gel("vcodemsg").innerHTML="<font color='red'>验证码不能为空!</font>";		
		return false;
	} else {
		sendRequest("RegisterServlet?service=register&username=" + username
				+ "&password=" + password + "&name=" + name
				+ "&company_name=" + company_name
				+ "&vcode="+ vcode
				+ "&email_address=" + email);
		
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
function sendRequest(url,labelmsgid) {
	labelid=labelmsgid;
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
				window.location.href = "index/log_sign/about/regsuccess.jsp";
			} else {
				//window.alert(res);
				gel(labelid).innerHTML="<font color='red'>"+res+"</font>";
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