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
<title>城市交通数据服务空间</title>
<link rel="stylesheet" href="index/css/about.css">
<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />

</head>
  
  <body>
  <div class="forshowfooter1">
	<jsp:include page="/public/head1.jsp"></jsp:include>
	<div class="forshowfooter2">
	<div class="div_center">
		<p><a>What's new, table JS  INSERT HERE</a></p>
	</div>
	
	<table class="table_button" width=100%>
		<tr>
			<td width="15%"></td>
			<td>
				<p>
					<button class="button"  onclick="window.location.href='index/about/take_a_tour.jsp'">Back</button>
				</p>
			</td>
			<td>
				<p>
					<button class="button" onclick="window.location.href=''">Top</button>
				</p>
			</td>
			<td width="15%"></td>
		</tr>
	</table>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </body>
</html>