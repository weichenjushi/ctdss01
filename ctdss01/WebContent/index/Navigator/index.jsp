<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="index/css/navigator.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
<title>城市交通数据服务空间</title>
</head>
<body style="background-color: f8f8f8;">
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a>
			</li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a>
			</li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a>
			</li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a>
			</li>
			<!-- 	<li class="l"><a><span>创建数据源</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a>
			</li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a>
			</li>
			<%
				if (session.getAttribute("username") == null && session.getAttribute("adminname") == null) {
			%>
			<li class="lssss"><a href="login.jsp">登录</a>
			</li>
			<li class="lsss"><a href="signup.jsp">注册</a>
			</li>
			<%
				} else {
			%>
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a>
			</li>
			<li class="lssss"><a href="logout.jsp">退出</a>
			</li>
			<%
				}
			%>
		</ul>
		<div class="forshowfooter2">
			<div class="center_div">
				<table class="table">
					<tr>
						<td width="42%"><img src="index/images/icons/pin-icon.png" width="110" height="110" alt="trafficFlow"><a href="trafficFlowServlet"
							class="linkword" target="blank">车流量数据服务</a></td>
							<td width=42%><a href="trafficFlowServlet/xml" target="blank">xml</a></td>
							<td width=42%><a href="trafficFlowServlet/json" target="blank">json</a></td>
					</tr>
					<!-- <tr>
					<td width=42%>
						<img src="index/images/icons/pin-icon.png" width="110" height="110" alt="Help"><a href="index/Navigator/about/geocodingForward.jsp" class="linkword">Forward</a>
					</td>
					<td width=16%>
						<img src="index/images/icons/move-icon.png" width="110" height="110" alt="Help"><a href="index/Navigator/about/geocodingReverse.jsp" class="linkword">Reverse</a>
					</td>
					<td width=42%>
						<img src="index/images/icons/world-icon.png" width="110" height="110" alt="Help"><a href="index/Navigator/about/navGo.jsp" class="linkword">navGo</a>
					</td>
				</tr> -->
				</table>
			</div>
		</div>
		<jsp:include page="/public/footer.jsp"></jsp:include>
	</div>
</body>

</html>