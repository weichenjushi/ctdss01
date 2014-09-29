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
    <title>Password Reset</title>
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="stylesheet" href="<%=basePath%>index/css/log_sign.css">
<%-- 	<link rel="stylesheet" href="<%=basePath%>index/css/head_menu.css"> --%>
	
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
	<script language="javascript" type="text/javascript" src="index/log_sign/js/password_resets.js"></script>
	<div class="forshowfooter2">
	<div class="recover_password">
		<a>重置密码</a>
	</div>

	<center>
		<div class="color_border_for_resend">
	
			<p class="margin">
				<a>您的邮箱 </a><a id="red">*</a>
				<input id="email" type="text" class="longinput"></input>
			</p>
			<p>
				<a id="lightwords">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入您邮箱地址，我们将会发送重置密码到您的邮箱.</a>
			<p>
			<p>
				<button class="button" onclick="email_null_wrong();">发送</button>
			</p>
		</div>
	</center>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </div>
  </body>
</html>