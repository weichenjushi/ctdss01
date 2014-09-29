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
    <title>Update Password</title>
	<script language="javascript" type="text/javascript" src="index/log_sign/js/update_password.js"></script>
	<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="stylesheet" href="<%=basePath%>index/css/log_sign.css">
	<link rel="stylesheet" href="<%=basePath%>index/css/head_menu.css">
</head>
  <body>
  <div id="main" class="header">
	<div class="header">
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
	</div>
  <div class="forshowfooter1">
	
	<div class="forshowfooter2">
		<div class="recover_password">
			<a>修改密码</a>
		</div>
		<center>
			<div class="color_border_for_resend">
				<center>
					<table class="margin">
						<tr>
							<td><a>修改后的密码</a><a id="red">*</a></td>
							<td><input type="password" id="password" class="longinput"></input></td>
						</tr>
						<tr>
							<td><a>再次输入修改后的密码</a><a class="red">*</a></td>
							<td><input type="password" id="repassword" class="longinput"></input></td>
						</tr>
					</table>
				</center>
				<p>
				    <input type="hidden" id="guid" value='<%=request.getParameter("guid")%>'></input>
					<button class="button" onclick="checkpassword();">修改</button>
				</p>				
			</div>
		</center>
	</div>
	<center>
	 <div class ="indexfooter" style="margin-top:400px;">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	 </center> 
  </div>
  </div>
  </body>
</html>