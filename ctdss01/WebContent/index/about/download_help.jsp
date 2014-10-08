<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% --%>
<!-- String contextPath = request.getContextPath();  -->
<!-- String headerReferer =request.getHeader("Referer");  -->
<!-- String Path = null; -->
<!-- if(headerReferer!=null) -->
<!-- Path = headerReferer.substring(0,headerReferer.indexOf(contextPath)+contextPath.length()+1); -->
<!-- %> -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>城市交通数据服务空间</title>
<link rel="stylesheet" href="index/css/about.css">
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
  <div class="forshowfooter1">
	<div class="forshowfooter2">
	<div class="center_div">
		<table class="tabledownloadhelp" width=100% >
			<tr>
				<td style="text-align:left;" class="title_help_download">
					<div style="margin-left:25%;">
					 	<a style="font-size:20px;color:red;">城市交通数据服务空间用户手册帮助中心</a>
					 </div>
				</td>				
			</tr>
			<tr>
				<td>
					 <a href="index/download/UserManualCh.jsp">下载查看《CTDSS用户手册》</a>
				</td>				
			</tr>
			<tr>
				<td>
					 <a href="index/download/UserManualCh.pdf">在线查看《CTDSS用户手册》</a>
				</td>				
			</tr>
		</table>
	</div>
	
	<table class="table_button" width=100% style="margin-top:100px;">
		<tr>
			<td width="14%"></td>
			<td>
				<p>
					<button class="button"  onclick="window.location.href='index/about/take_a_tour.jsp'">Back</button>
				</p>
			</td>
			<td>
				<p>
					<button class="button" onclick="window.location.href='index/core/myindex.jsp">Top</button>
				</p>
			</td>
			<td width="16%"></td>
		</tr>
	</table>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </div>
  </body>
</html>