<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Sign Up</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
    <link rel="stylesheet" href="index/css/log_sign.css">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<script language="javascript" type="text/javascript" src="index/js/multilingual.js"></script>
	<script language="javascript" type="text/javascript" src="index/log_sign/js/signup.js"></script>
	<script type="text/javascript" src="test/jquery.min.js"></script>
	<script type="text/javascript">
	function refresh() {
		document.getElementById("autoImg").src = 'autoImg?now=' + new Date();
	}
	</script>
</head>
  <body>
  <script type="text/javascript">
 var RecaptchaOptions = {
	lang : 'en',
    theme : 'red'
 };
 </script>
 <div id="main" class="header">
	<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a></li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a></li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a></li>
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a></li>
			<li class="lssss"><a href="login.jsp">登录</a></li>
			<li class="lsss"><a href="signup.jsp">注册</a></li>
	</ul>
	
	
	
	<div class="forshowfooter1">
		
	<div class="register">
		<a>新会员注册入会</a>
	</div>
	<div style="height:50px;">
	
	</div>
	<div class="div_center_signup">	
		<table class="table_null">
			<tr>
				<td><p class="margin_30px"><a>用户名</a><a id="red">*</a></p></td>
				<td><input type="text" id="username" class="longinput" onblur="checkUsername('unamemsg')" value=""></input><label id="unamemsg" class="blank"></label></td>
			</tr>
			<tr>
				<td><p><a>登录密码</a><a id="red">*</a></p></td>
				<td><input type="password" id="password" class="longinput" onblur="checkPassword('pwdmsg');" value=""></input><label id="pwdmsg" class="blank"></label></td>
			</tr>
			<tr>
				<td><p><a>重复密码</a><a id="red">*</a></p></td>
				<td><input type="password" id="repassword" class="longinput" onblur="checkPassword2('repwdmsg');" value=""></input><label id="repwdmsg" class="blank"></label></td>
			</tr>
			<tr>
				<td><p><a>Email邮箱</a><a id="red">*</a></p></td>
				<td><input type="text" id="email" class="longinput" onblur="checkEmail('emailmsg');" value=""></input><label id="emailmsg" class="blank"></label></td>
			</tr>
			<!-- <tr>
				<td>&nbsp;</td>
				<td><p><a id="lightwords">我们将不会泄露您的任何信息！</a></p></td>
			</tr> -->
			<tr>
				<td><p><a>姓名</a><a id="red">*</a></p></td>
				<td><input type="text" id="name" class="longinput" onblur="checkName('namemsg');" value=""></input><label id="namemsg" class="blank"></label></td>
			</tr>
			<!-- <tr>
				<td><p><a>姓氏</a><a id="red">*</a></p></td>
				<td><input type="text" id="lastname" class="longinput"></input></td>
			</tr> -->
			<tr>
				<td><p><a>公司名称</a></p></td>
				<td><input class="longinput" id="company_name" onblur="checkComp('compmsg');" value=""></input><label id="compmsg" class="blank"></label></td>
			</tr>
			<tr>
				<td>
					<p><a>请输入验证码</a><a id="red">*</a></p>
				</td>
				<td >
				<input type="text"  id="vcode" style="height:30px;width:250px;float:left;"></input>
					&nbsp;&nbsp;&nbsp;&nbsp;<img src="autoImg" id="autoImg"  style="float:left;margin-left:20px;"/><a style="float:left;margin-left:20px;" href="#" onClick="refresh()">换一张</a><label id="vcodemsg" class="blank"></label>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- <div class="identify_code" >
		<table>
			<tr>
				<td>
					<a>请输入验证码</a><a id="red">*</a>
				</td>
				<td>
				<input type="text" id="vcode" class="longinput"></input>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				    <script type="text/javascript"
		               src="http://www.google.com/recaptcha/api/challenge?k=6LdxId4SAAAAAOzB3zTFCBDLtKeT0lIeUVbjX3Bs">
		           </script>
		           <noscript>
		             <iframe src="http://www.google.com/recaptcha/api/noscript?k=6LdxId4SAAAAAOzB3zTFCBDLtKeT0lIeUVbjX3Bs"
		               height="300" width="500" frameborder="0"></iframe><br>
		             <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
		             <input type="hidden" name="recaptcha_response_field" id="recaptcha_response_field"
		              value="manual_challenge">
	           		</noscript>
	           		
	           </td>
          	</tr>
          </table>
	</div>
 -->
	<div class="register_button" >
		<p>
			<button class="button" onclick="register();">注册</button>
		</p>
	</div>
<!-- 	<div style="height:10px;background-color:red;">
	
	</div> -->

<div class ="indexfooter">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
</div>
</div>
  </body>
  <script type="text/javascript">
 	$(document).ready(function(){
	 $("#username").focus(function(){
		 $("#unamemsg").text("4-20位字符，支持中英文、数字及\"-\"、\"_\"组合");
	 });
	 
	 $("#password").focus(function(){
		 $("#pwdmsg").text("6-20位字符，可使用字母、数字或符号的组合，不建议使用纯数字，纯字母，纯符号");
	 });
	 $("#repassword").focus(function(){
		 $("#repwdmsg").text("请再次输入密码");
	 });
	 $("#email").focus(function(){
		 $("#emailmsg").text("请输入 邮箱");
	 });
	 $("#name").focus(function(){
		 $("#namemsg").text("请输入 姓名");
	 });
	 $("#company_name").focus(function(){
		 $("#company_name").text("请输入 公司名称，字符长度小于25");
	 });
 });
  </script>
</html>