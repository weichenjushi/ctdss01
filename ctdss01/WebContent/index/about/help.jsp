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
    <title>帮助页</title>
    <link rel="stylesheet" href="index/css/about.css">
    <link rel="stylesheet" href="index/css/head_menu.css">
  </head>
  
  <body>
  <div class="forshowfooter1">
	<jsp:include page="/public/head1.jsp"></jsp:include>
	<div class="forshowfooter2">
	<div class="div_help_content">
		<p class="title1_overview"><a>1.How to login?</a></p>
		<p class="title2_overview">User can find the “Login” in the home webpage.</p>
		<p class="title1_overview">2.What can I do?</p>
		<p class="title2_overview">Users can create Data Services for themselves once registering. Also users can perform various operations to a created data services, such as composing data services.</p>
		<p class="title1_overview">3.How to create Data Service?</p>
		<p class="title2_overview">Please refer to the Sample.</p>
		<p class="title1_overview">4.How to compose Data Service?</p>
		<p class="title2_overview">Please refer to the Sample.</p>
		<p class="title1_overview">5.How to find my Data Service?</p>
		<p class="title2_overview">User can find the “MyDataService” tab in the home webpage once registered.</p>
		<p class="title1_overview">6.My Data Service is broken, what do I do?</p>
		<p class="title2_overview">As a first step, we suggest you make sure the data you are retrieving is available. Try to copy and paste the URL into your browser and see what you will get. Once you have confirmed that the URL in your browser is available, you can use the Debugger to figure out where things are going wrong. When all fails, use our Feedback mechanism. We listen and respond.</p>
		<p class="title1_overview">7.Are Data Services I create private?</p>
		<p class="title2_overview">All webpages can be accessed with their unique URL. This allows you to share them over email without having to do any configuration. Only authorized users can call data services ("MyDataservice"). Therefore, if you don't share the URL with anyone, your Data service remains private.</p>
		<p class="title1_overview">8.How to charge?</p>
		<p class="title2_overview">Now the DataServiceSpace is free.</p>
		<p class="title1_overview">9.What browsers does support?</p>
		<p class="title2_overview">We recommend Firefox 3.6.8 currently.</p>
		<p class="title1_overview">10.Can I find Data Service in my mobile?</p>
		<p class="title2_overview">No. But we will realize it soon.</p>	
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