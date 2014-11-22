<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/layout">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/head_menu.css">  
    <link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
    <!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
	<script language="javascript" type="text/javascript">
	
	
</script>
    <title>Create Data Service Wrapper</title>
    
<body>   
<div class="forshowfooter1"> 
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a></li>
			<li class="lsss"><a href="index/core/browse.jsp">浏览</a></li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">创建综合数据服务</a></li>
			<li class="l"><a><span>创建数据源</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li>
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
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
			<li class="lssss"><a href="logout.jsp">退出</a></li>
			<%} %>
		</ul>
		<div class="forshowfooter2">
		<br>
		<center>${message}<br>
		<br>
		<table >
			<tr>
			<td>数据</td><td>权限等级</td><td>已用次数</td><td>AppKey</td><td>操作</td>
			</tr>
			<c:forEach var="myapp" items="${myapps}">
				<tr>
				<td>${myapp.dtname}</td>
				<td>0</td>
				<td>${myapp.times}</td>
				<td>${myapp.appkey}</td>
				<td><a href="<%=basePath%>/index/core/viewapp.jsp?dtname=${myapp.dtname}&key=${myapp.appkey}">使用数据</a></td>
				</tr>
			</c:forEach>
		</table>
		</center>
		
		</div>
		
        <div id="ft">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	</div><!--/#doc -->
	</div>
</body>
</html>	