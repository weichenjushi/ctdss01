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
<title>信息反馈</title>
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" href="index/css/about.css">


</head>

<body>
<div id="main" class="header">
	<div class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="<%=basePath%>index/core/myindex.jsp">首页</a></li>
			<li class="lsss"><a href="<%=basePath%>index/core/browse.jsp">浏览</a></li>
			<li class="ls"><a href="<%=basePath%>index/core/mydataservice.jsp">我的数据服务</a></li>
			<li class="ls"><a href="<%=basePath%>index/core/create_mashup_traditional.jsp">常见问题</a></li>
			<li class="lss"><a href="<%=basePath%>index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="<%=basePath%>index/about/take_a_tour.jsp">帮助</a></li>
			<li class="lssss"><a href="<%=basePath%>login.jsp">登录</a></li>
			<li class="lsss"><a href="<%=basePath%>signup.jsp">注册</a></li>
		</ul>
	</div>
	<div class="forshowfooter1">
	
	<div class="message_board">
		<p><a>信息反馈表</a></p>
	</div>
		
	<div class="center_div">
		<form name="form1" method="post" action="feedback_do.jsp">
			<center>
				<table>
					<tr>
						<td>
							<div class="div_content" style="height:470px;">
								<p class="margin">
									<a>用户名:</a>
									<input type="text" class="longinput"></input>
								</p>
								<p>
									<a>邮箱:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
									<input type="text" name="email" class="longinput"></input>
								</p>
								<p>
									<a>内容:&nbsp;&nbsp;&nbsp;&nbsp;</a>
									<textarea name="content" class="textarea" cols="30" rows="20"></textarea>
								</p>
								<p>
									<input class="button_feedback" type="submit" value="提交" onclick="return checkValidate();">
								</p>
							</div>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div class="forshowfooter2">
	<!-- <table class="table_button" width=100%>
		<tr>
			<td width="15%"></td>
			<td>
				<p>
					<button class="button"  onclick="window.location.href='index/core/myindex.jsp'">Home</button>
				</p>
			</td>
			<td>
				<p>
					<button class="button" onclick="window.location.href=''">Top</button>
				</p>
			</td>
			<td width="15%"></td>
		</tr>
	</table> -->
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
</div>
</div>
</body>

	
	<script language="javascript"> 
			
		function checkValidate() 
		{ 
		  var patten = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		  if(document.form1.name.value==""||document.form1.name.value==null) 
		    { 
		      window.alert("Name can't be empty!"); 
		      return false; 
		    } 
		 
		  if(document.form1.email.value==""||document.form1.email.value==null) 
		    { 
		      window.alert("Email can't be empty!"); 
		      return false; 
		    } 
		  if (!patten.test(document.form1.email.value)) 
		    {
			  window.alert("Please enter the correct email format!");
			  return false;
			}  
		
		  if(document.form1.content.value==""||document.form1.content.value==null) 
		    { 
		      window.alert("Content can't be empty!"); 
		      return false; 
		    } 
		  if (document.form1.content.value.length < 10) 
		    {
			 window.alert("Content length can't be less than 10!");
			  return false;
		    }
		  return true;
		} 
</script> 
</html>