<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>

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
    <!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
	<script language="javascript" type="text/javascript">
	
	var req = null;
	//This function initializes XHR
	function initXHR() {
		if (navigator.appName.indexOf("Microsoft") > -1) {
			try {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e1) {
				alert("failed to create XHR in IE");
			}
		} else {
			try {
				req = new XMLHttpRequest();
			} catch (error) {
				alert("failed to create XHR in FireFox");
			}
		}
	}
	//get an employee detail
	 /* function getTableDetails(Empurl) {
		initXHR();
		req.open("GET", Empurl, true);
		req.onreadystatechange = handleTableDetailResponse;
		req.send(null);

	}  */

	//get employee list
	function getDBTablesList(listurl) {
		initXHR();
		req.open("GET", listurl, true);
		req.onreadystatechange = handleTableListResponse;
		req.send(null);
	}
	/* function handleTableDetailResponse() {
		//if Response is complete

		if (req.readyState == 4) {
			//response is OK
			if (req.status == 200) {
				var str = "";
				var response = req.responseXML;
				var root = response.documentElement;
				for ( var i = 0; i < root.childNodes.length; i++) {
					if (root.childNodes[i].nodeType!= 1)
						continue;
					var name = root.childNodes[i].nodeName;
					//alert(name);
					var value = root.childNodes[i].firstChild.nodeValue;
					//alert(value);
					str = str + name + "--- >" + value + " <br >";
				}
				document.getElementById("emp-div").style.display = "";
				document.getElementById("emp-detail-div").innerHTML = str;
			} else {
				document.getElementById("messageDiv").innerHTML = " <SPAN style='color:#FF0000; font-size:12pt; text-decoration:none;' <Invalid URL or PartId </SPAN >";
			}
			req.abort();
		}
	} */

	function handleTableListResponse() {
		//if Response is complete
		if (req.readyState == 4) {
			//response is OK
			if (req.status == 200) {
				
				var pstr = "";
				//var response = req.responseXML;
				
				var root = req.responseXML.documentElement;
				
				for ( var i = 0; i < root.childNodes.length; i++) {
					if (root.childNodes[i].nodeType != 1)// Integer that receives one of the following values.1 Element node. 3 Text node. 
						continue;
					var id = root.childNodes[i].getAttribute("id");
					//var href = root.childNodes[i].getAttribute("href");
					var href ="<%=basePath%>APIServlet?method=addapi&dtname="+id;
					pstr = pstr
							+ "数据表"
							+ "--- >"
							+ id
							+ "&nbsp; <a href='"+href+"'>申请数据</a>"+"<br>";
				}
				document.getElementById("emp-list-div").style.display = "";
				document.getElementById("emp-list").innerHTML = pstr;
			} else {
				document.getElementById("messageDiv").innerHTML = " <SPAN style='color:#FF0000; font-size:12pt; text-decoration:none;' >Invalid Employee ID. </SPAN >";
			}
		}
	}
	function test(){
		var url = "/ctdss01/index/core/create_data_service_wrapper.jsp";
		window.location.href = url;
	}
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
		<div id="contain">
			<!-- <object width="100%"; height="600" data="DataServiceWrapper.html"></object> -->
			<%-- <a href="${pageContext.request.contextPath}/ExcelRestServlet/dbtables/listtables">显示所有数据库表</a> --%>
			<center>
		<input type="button" value="得到所有数据表"
<%-- 			onclick="getDBTablesList('<%=basePath%>ExcelRestServlet/dbtables/listtables')"> --%>
			onclick="getDBTablesList('<%=basePath%>ExcelRestServlet/dbtables/listtables')">
		<div id="messageDiv"></div>
		<div id="emp-list-div"
			style='color:#FF0000; font-size:12pt; text-decoration:none; 
      display:none;'>DBTables
			List :</div>
		<br>
		
		<div id="emp-list"></div>
		<br> <br>
		<div id="emp-div"
			style='color:#FF0000; font-size:12pt; text-decoration:none; 
      display:none;'>Selected
			DBTable Detail :</div>
		<br>
		<div id="emp-detail-div"></div>
	</center>
		</div>
		</div>
        <div id="ft">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	</div><!--/#doc -->
	</div>
</body>
</html>	