<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <script type="text/javascript" src="test/jquery.min.js"></script>
    <!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
	<script language="javascript" type="text/javascript">
	
	
</script>
    <title>城市交通数据服务空间</title>
    
<body id="body1">   
<div class="forshowfooter1"> 
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
		<div style="margin:auto;padding:0;" id="maincontent">
			<table width="80%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" style="margin: auto;">	
					<tr class="tr_title">
						<td width="60%">标题</td>
						<td width="10%">来源</td>
						<td width="10%">发表时间</td>	
					</tr>
					<c:forEach var="listnew" items="${listnews}">
						<tr class="tr_content">
							<td>${listnew.title}</td>
							<td>${listnew.sfrom}</td>
							<td>${listnew.addtime}</td>	
						</tr>
					</c:forEach>
					<tr class="tr_content" style="text-align:center;">
						<td colspan="7" height="40" class="appPages">
						<a style="padding-right:50px;" id="first">首页</a>
						<a style="padding-right:50px;" id="pre">上一页</a>
						<a style="padding-right:50px;" id="next">下一页</a>
						<a style="padding-right:50px;" id="final">最后一页</a> 
						<a style="padding-right:50px;" id="pagetext"></a><input type="hidden" id="hidepageindex3" value="${hidepageindex3}"> <input type="hidden" id="hidepagecount3" value="${hidepagecount3}">
						</td>

					</tr>

				</table>
		</div>
		
        <div id="ft">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	</div><!--/#doc -->
	</div>
</body>
<script type="text/javascript">
	var pageSize = 10;
	var pageCount = $("#hidepagecount3").val();//总页数
	var currNo = 1;//当前页
	
	jQuery(document).ready(function() {
		var flag=true;
		if(flag){
			$.get("news/getbypageuserr", {
				pageSize : pageSize,
				currNo : 1
			}, function(e) {
				$("#maincontent").html(e);
			})
			flag=false;	
		}
	})	
	
	jQuery(document).ready(function() {	
		$("#first").click(function() {
			$("#pagetext").text(1+"/"+pageCount);
			//var paraObj = {key:appkey,requestUrl:requestUrl,dtype:reponseDtype,requestType:requestType};
			//var url="apps/id/allnormalbypage";
			$.get("news/getbypageuserr", {
				pageSize : pageSize,
				currNo : 1
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		$("#pre").click(function() {
			currNo = $("#hidepageindex3").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if (currNo <= 1) {
				currNo = 1;
			} else {
				currNo--;
				$("#pagetext").text(currNo+"/"+pageCount);
				$.get("news/getbypageuserr", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					$("#maincontent").html(e);
				})
			}
			
		})

		$("#next").click(function() {
			currNo = $("#hidepageindex3").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if(currNo>=pageCount)
				{
					currNo=pageCount;
				}
			else{
				currNo++;
				$.get("news/getbypageuserr", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					$("#maincontent").html(e);
				})
			}
		})
		$("#final").click(function() {
			$("#pagetext").text(currNo+"/"+pageCount);
			$.get("news/getbypageuserr", {
				pageSize : pageSize,
				currNo : pageCount
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		
	})
	
</script>
</html>	