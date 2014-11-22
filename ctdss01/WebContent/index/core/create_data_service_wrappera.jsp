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
    <link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
    <link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
    <!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
    <title>城市交通数据服务空间</title>
<body> 
	<div class="forshowfooter1">   
	<div id="main" class="header">
		<ul class="nav-head">
				<li class="lssss cur"><a href="index/core/amyindex.jsp">首页</a>
				</li>
				<li class="ls"><a href="index/core/abrowse.jsp">浏览数据接口</a>
				</li>
				<li class="ls"><a href="index/core/create_data_service_wrappera.jsp">创建数据服务</a>
				</li>
				<li class="ls"><a href="index/core/amanage_users.jsp">用户管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_dataservices.jsp">数据服务管理</a>
				</li>
				<%
					if (session.getAttribute("username") == null
							&& session.getAttribute("adminname") == null) {
				%>
				<li class="lss"><a href="login.jsp">登录</a>
				</li>
				<li class="lss"><a href="signup.jsp">注册</a>
				</li>
				<%
					} else {
				%>
				<li class="lsss"><a href="index/core/profile.jsp">用户中心</a>
				</li>
				<li class="lsss"><a href="logout.jsp">退出</a>
				</li>
				<%
					}
				%>
			</ul>		
			<div class="forshowfooter2">
		<div>
			<!-- <object width="100%"; height="600" data="AppBuilder.html"></object>  -->
			<form action="apps/addapp" method="post">
			<label>数据表路径：</label><input type="text" name="filepath" id="myfile">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>数据表表名（必须是英文字母并且以t_开头，例：t_subway）：</label><input type="text" name="txtname"><input type="submit" value="导入数据表">
			
			</form>
		</div>
		<!-- <script type="text/javascript">
        function test() {
            var filePath = document.getElementById("myfile").value;
            alert(filePath);
        }  </script>-->
   
		</div>
        <div id="ft">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	</div><!--/#doc -->
	</div>
</body>
</html>	