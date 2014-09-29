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
    <title>Resend activation email</title>
  
	
</head>
  <body>
  <div class="forshowfooter1">
	<jsp:include page="/public/head2.jsp"></jsp:include>
<script language="javascript" type="text/javascript" src="index/log_sign/js/resend_activation_email.js"></script>
	<div class="forshowfooter2">
		<div class="recover_password">
			<a>发送激活邮件</a>
		</div>
		<center>
			<div class="color_border_for_resend">
		
				<p class="margin">
					<a>您的邮箱地址</a><a id="red">*</a>
					<input type="text" id="email" class="longinput"></input>
				</p>
				<p>
					<a id="lightwords">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入您的邮箱，我们将要给你发送激活邮件.</a>
				<p>
				<p>
					<button class="button" onclick="email_null_wrong();">发送</button>
				</p>
			</div>
		</center>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </body>
</html>