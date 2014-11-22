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
    <link rel="stylesheet" href="index/css/head_menu.css">
    <link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
  </head>
  
  <body>
  <div class="forshowfooter1">
	<jsp:include page="/public/head1.jsp"></jsp:include>

	<table>
		<tr>
			<td>
				<div class="div_support_us_words">
					<p class="title1_overview">1. Here is how You support us.</p>
					<p>&nbsp;&nbsp;&nbsp;You want more services ? more possibilities ?more choice ?</p>
					<p>&nbsp;&nbsp;&nbsp;Then help us to enlarge our database.Don't worry it's simple an even if you are a newbie it's possible for you.</p>
					<p class="title1_overview">2. Here is how it works.</p>
					<p>&nbsp;&nbsp;&nbsp;Go to the application of your choice and press the support button. Follow the steps and take care that all information's you type in are correct.Press the "Enlarge" button.</p>
					<p class="title1_overview">3. What happens?</p>
					<p> &nbsp;&nbsp;&nbsp;XML is the common format in our portal and it helps to present information's and to Mash-up files from different applications.</p>
				</div>
			</td>
			<td>
				<div class="div_support_us_img">
					<p>
						<img src="index/images/icons/map.png" width="400" height="370" alt="Map">
					</p>
				</div>	
			</td>
		</tr>
	</table>
	<div class="forshowfooter2">
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