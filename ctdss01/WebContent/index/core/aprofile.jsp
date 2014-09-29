<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profile</title>
<!--     <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  -->
<!-- 	<script type="text/javascript" src="index/js/prototype.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css"> -->

      <link rel="stylesheet" type="text/css" href="index/css/core_css/layout">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="stylesheet" type="text/css" href="test/docsnew.css">
    	<link rel="stylesheet" href="<%=basePath%>index/css/log_sign.css">


	<script language="javascript" src="<%=basePath%>index/log_sign/js/login.js"></script>


</head>

  <body onload="init();">
 
	<script type=text/javascript>
		function selectTag(showContent,selfObj){
			// 标签
			var tag = document.getElementById("tags").getElementsByTagName("li");
			var taglength = tag.length;
			for(i=0; i<taglength; i++){
			tag[i].className = "";
			}
			selfObj.parentNode.className = "selectTag";
			// 标签内容
			for(i=0; j=document.getElementById("tagContent"+i); i++){
			j.style.display = "none";
			}
			document.getElementById(showContent).style.display = "block";
		}
	</script>
  <div id="main" class="header">
			<ul class="nav-head">
				<li class="lssss cur"><a href="index/core/amyindex.jsp">首页</a>
				</li>
				<li class="ls"><a href="index/core/abrowse.jsp">浏览数据接口</a>
				</li>
				<li class="ls"><a href="index/core/acreate_data_service_wrapper.jsp">创建数据服务</a>
				</li>
				<li class="ls"><a href="index/core/amanage_users.jsp">用户管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_dataservices.jsp">数据服务管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_news.jsp">网站公告管理</a>
				</li>
				<%
					if (session.getAttribute("username") == null
							&& session.getAttribute("adminname") == null) {
				%>
				<li class="lss"><a href="login.jsp">登录</a>
				</li>
				<li class="lss"><a href="signup.jsp">注册</a>
				</li>
				<%
					} else {
				%>
				<li class="lsss"><a href="index/core/aprofile.jsp">用户中心</a>
				</li>
				<li class="lssss"><a href="logout.jsp">退出</a>
				</li>
				<%
					}
				%>
			</ul>
	
	<div class="login">
		<a>用户中心</a>
	</div>
	<div id=con>
	    <ul id=tags>
	      <li class=selectTag><a onClick="selectTag('tagContent0',this)" href="javascript:void(0)" class="words">个人信息</a> </li>
	      <li><a onClick="selectTag('tagContent1',this)" href="javascript:void(0)" class="words">密码</a> </li>
	      <!-- <li><a onClick="selectTag('tagContent2',this)" href="javascript:void(0)" class="words">API Key</a> </li> -->
	    </ul>
		<div id="tagContent">
	        <div class="tagContent selectTag" id=tagContent0>
				<table width="100%" cellspacing="0" cellpadding="0" class="profile_table" bordercolor="#3ED3CD">
					<tr>
						<td><a>名字</a><a id="red">*</a></td>
						<td><input type="text" name="firstname" id="firstname" class="longinput"></input></td>
					</tr>
					<tr>
						<td><a>姓氏</a><a id="red">*</a></td>
						<td><input type="text" name="lastname" id="lastname" class="longinput"></input></td>
					</tr>
					<tr>
						<td><a>Email</a><a id="red">*</a></td>
						<td><input type="text" name="email" id="email" disabled="disabled" class="longinput"></input></td>
					</tr>
					<tr>
						<td><a>用户名</a><a id="red">*</a></td>
						<td><input type="text" name="username" id="username" disabled="disabled" class="longinput"></input></td>
					</tr>
					<tr>
						<td><a>公司名</a></td>
						<td><input type="text" name="companyname" id="companyname" class="longinput"></input></td>
					</tr>
				</table>
			
				<div>
					<button class="button" onclick="save();">保存</button>
				</div>
			</div>
	        <div class="tagContent" id="tagContent1">
				<table width="100%" cellspacing="0" cellpadding="0" class="profile_table" bordercolor="#3ED3CD">
					<tr><td></td><td></td></tr>
					<tr>
						<td><a>旧密码</a><a id="red">*</a></td>
						<td><input type="password" name="oldpassword" id="oldpassword" class="longinput"></input></td>
					</tr>
					<tr>
						<td><a>新密码</a><a id="red">*</a></td>
						<td><input type="password" name="newpassword" id="newpassword" class="longinput"></input></td>
					</tr>
					<tr>
						<td><a>确认密码</a><a id="red">*</a></td>
						<td><input type="password" name="repeatpassword" id="repeatpassword" class="longinput"></input></td>
					</tr>
					<tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
				</table>
				
				<div class="div_save">
					<button class="button" onclick="resetpassword();">保存</button>
				</div>       
	        </div>
	    </div>
	</div>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
<script>
  function init()
  {
	  sendRequest2();
  }
  
  function sendRequest2()
  {
 	 var url = "loginServlet";   
 	 var service = "service=getuserinfo";  
 	 new Ajax.Request(
 			   url,
 			   {
 				   method:'post',
 				   parameters:service,
 				   onComplete:jsonResponse
 			   }
 			 );
  }
  
  function jsonResponse(originalRequest)
  {
  	 var user = originalRequest.responseText.evalJSON(true);
  	 document.getElementById("firstname").value = user.firstname;
  	 //alert(user.firstname);
  	 document.getElementById("lastname").value = user.lastname;
  	 //alert(user.lastname);
  	 document.getElementById("email").value = user.emailAddress;
  	 document.getElementById("username").value = user.username;
  	//alert(user.username);
  	 document.getElementById("companyname").value = user.companyName;
  }
  
  function save()
  {
	  var firstname = document.getElementById("firstname").value;
	  var lastname = document.getElementById("lastname").value;
	  var email = document.getElementById("email").value;
	  var username = document.getElementById("username").value;
	  var companyname = document.getElementById("companyname").value;
	  if(firstname=="") {
		  alert("The firstname can't be empty!");
		  return false;
	  }
	  if(lastname=="") {
		  alert("The lastname can't be empty!");
		  return false;
	  }
	  sendRequest("&time="+new Date().getTime()+"&service=updateinfo&firstname="+firstname
				+"&lastname="+lastname+"&email="+email+"&username="+username+"&companyname="+companyname);
	  init();
  }
  
  function resetpassword()
  {
	  var oldpassword = document.getElementById("oldpassword").value;
	  var newpassword = document.getElementById("newpassword").value;
	  var repeatpassword = document.getElementById("repeatpassword").value;
	  if(oldpassword=="") {
		  alert("The old password can't be empty!");
		  return false;
	  }
	  if(newpassword==""){
		  alert("The new password can't be empty!");
		  return false;
	  }
	  if (newpassword.length < 6){
			alert("new password length can not be less than 6!");
			return false;
	  }
	  if(repeatpassword==""){
		  alert("The repeat password can't be empty!");
		  return false;
	  }
	  if(repeatpassword!=newpassword){
		  alert("The repeat password does not match with the new password!");
		  return false;
	  }
	  sendRequest("&time="+new Date().getTime()+"&service=updatepwd&oldpassword="+oldpassword
				+"&newpassword="+newpassword+"&repeatpassword="+repeatpassword);
	  document.getElementById("oldpassword").value = "";
	  document.getElementById("newpassword").value = "";
	  document.getElementById("repeatpassword").value = "";
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
		XMLHttpReq.open("POST", "loginServlet", true);
		XMLHttpReq.onreadystatechange = processResponse;
		XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		XMLHttpReq.send(url);
	}
	function processResponse() {
		if (XMLHttpReq.readyState == 4) {
			if (XMLHttpReq.status == 200) {
				var res = XMLHttpReq.responseXML.getElementsByTagName("result")[0].firstChild.data;
				window.alert(res);
			} else {
				window.alert("The page you request is abnormal!");
			}
		}
	}

</script>
  </body>
</html>