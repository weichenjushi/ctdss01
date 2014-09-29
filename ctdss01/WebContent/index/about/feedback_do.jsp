<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="cn.ac.ict.sigsit.webide2.utils.DBUtils"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Feedback_do</title>
<link rel="stylesheet" href="index/css/about.css">
<link rel="stylesheet" href="index/css/head_menu.css">
<script language="javascript" type="text/javascript" src="index/log_sign/js/signup.js"></script>
</head>

<body>
	<div class="forshowfooter1">
	<jsp:include page="/public/head1.jsp"></jsp:include>
	
	<%   
	String name=request.getParameter("name"); 
	String email=request.getParameter("email");   
	String content=request.getParameter("content"); 
	%>

    <% 
	try{ 
		/* Connection  conn= DBUtils.getConnection();
		Statement pstmt = conn.createStatement() ;   
		String sql="insert into feedback(name,email,content) values(" + "\'" + name + "\'"  +  ","  +  "\'" + email+ "\'"   + ","   +  "\'" + content + "\')";
		pstmt.executeUpdate(sql) ;  
		pstmt.close();  
		conn.close();  */
		%> 

		<div class="div_center">
			<p class="margin"><a class="words">You have successfully uploaded the feedback, we will reply to you in time！</a></p>
	    </div>
		<%
		}catch(Exception e){ 
			out.println(e.getMessage());
		
	     }
		%>
	<div class="forshowfooter2">
	<table class="table_button" width=100%>
		<tr>
			<td width="15%"></td>
			<td>
				<p>
					<button class="button"  onclick="window.location.href='index/about/feedback.jsp'">Back</button>
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