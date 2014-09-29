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
<title>Take a tour</title>
<link rel="stylesheet" href="index/css/about.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
</head>
  <body style="background-color: f8f8f8;">
  <div id="main" class="header">
	<div class="header">
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
	</div>
	<div class="forshowfooter2">
	<div class="center_div">
		<table class="table" width=100%>
			<tr>
				<td width=28%></td>
				<td>
					<img src="index/images/icons/network-icon.png" width="80" height="80" alt="Overview"><a href="index/about/overview.jsp">系统介绍</a>
				</td>
				<td>
					<img src="index/images/icons/target-icon.png" width="80" height="80" alt="Samples"> <a href="index/about/samples.jsp">典型案例</a>
				</td>
				<td width=18%></td>					
			</tr>
			<tr>
				<td width=28%></td>
				<td>
					<img src="index/images/icons/riddit-icon.png" width="80" height="80" alt="Help"> <a href="index/about/download_help.jsp">寻求帮助</a>
				</td>
				<td>
					<img src="index/images/icons/down-icon.png" width="80" height="80" alt="Download"> <a href="index/about/download.jsp">文档下载</a>
				</td>
				<td width=18%></td>					
			</tr>
		</table>
	</div>
	
	<table class="table_button" width=100% style="margin-top:100px;">
		<tr>
			<td width="14%"></td>
			<td>
				<p>
					<button class="button"  onclick="window.location.href='index/core/myindex.jsp'">Home</button>
				</p>
			</td>
			<!-- <td>
				<p>
					<button class="button" onclick="window.location.href=''">Top</button>
				</p>
			</td> -->
			<td width="16%"></td>
		</tr>
	</table>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </body>
</html>