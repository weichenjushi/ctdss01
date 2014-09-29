<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%-- <base href="<%=Path%>"> --%>
	<base href="<%=basePath%>">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="stylesheet" href="index/css/log_sign.css" type="text/css"></link>
	<!-- <link rel="stylesheet" type="text/css" href="test/docsnew.css"> -->
	
	
	<script language="javascript" src="index/log_sign/js/login.js"></script>
</head>
  <body>
  <div id="main" class="header">
  
	      <ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a></li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a></li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a></li>
		<!-- 	<li class="l"><a><span>创建数据源</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a></li>
			<%
				if (session.getAttribute("username") == null
						&& session.getAttribute("adminname") == null) {
			%>
			<li class="lssss"><a href="login.jsp">登录</a></li>
			<li class="lsss"><a href="signup.jsp">注册</a></li>
			<%
				} else {
			%>	
			<li  class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
			<li class="lssss"><a href="logout.jsp">退出</a></li>
			<%} %>
		</ul>
	
	<div class="login">
		<a>网站入口</a>
	</div>
	
	<div class="forshowfooter2">
		<center>
			<table>
				<tr>
					<td>
							<font style="color: red;font-weight: bold"><a class="margin">
		<%
			if (request.getAttribute("result") != null)
				out.write((String) request.getAttribute("result"));
		%>
		</a></font>
						<div class="color_border">
							<p class="margin">
								<a>用户名:</a>
								<input id="login_username" type="text" class="input" onkeypress="enterClick(event)"></input>
							</p>
							<p>
								<a>密&nbsp;&nbsp;码:</a>
								<input id="login_password" type="password" class="input" onkeypress="enterClick(event)"></input>
							</p>
							<p>
								<button class="button" onclick="login_null();" onkeypress="enterClick(event)">登录</button>
							</p>
						</div>
					</td>
					<td>
						<p><a class="notice" href="signup.jsp">&nbsp;&nbsp;&nbsp;亲，还没注册?那就狂点注册吧</a></p>
						<p><a class="notice" href="index/log_sign/about/password_resets.jsp">&nbsp;&nbsp;&nbsp;亲，忘了用户名、密码?那就狂点找回吧</a></p>
						<p><a class="notice" href="index/log_sign/about/resend_activation_email.jsp">&nbsp;&nbsp;&nbsp;亲，没收到激活邮件?那就快点点击激活吧</a></p>
					</td>
				</tr>
			</table>
		</center>
	</div>
	
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </body>
</html>