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
	<title>Congratulation!</title>
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
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
	<div class="null_25"></div>
	

		<div class="login">
			<a>Thank You!</a>
		</div>	
		<center>
			<div class="color_border_for_resend" style="line-height: 30px;">
				<p class="lineheight" style="font-size: 19">请核实您已注册的邮箱地址.</p>
				<p class="lineheight">一封激活邮件已经发往您的邮箱，通过点击确认超链接激活您的账户或者将该链接地址复制黏贴到浏览器地址栏中进行激活操作！</p>
				<p class="lineheight">
					如果没有收到激活邮件，请查看该邮件是否在垃圾箱中，因为有些邮箱会把这种邮件当做垃圾邮件处理。如果你没有找到， 请点击
					<a class="notice" href="index/log_sign/about/resend_activation_email.jsp">click here</a>重新发送激活邮件
					
				</p>
			</div>
		</center>


	 <center>
	 <div class ="indexfooter" style="margin-top:400px;">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	 </center> 
</div>
</div>
</body>
</html>