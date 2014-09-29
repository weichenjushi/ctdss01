<%@ page language="java" import="java.net.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <% --%>
<!-- String contextPath = request.getContextPath();  -->
<!-- String headerReferer =request.getHeader("Referer");  -->
<!-- String Path = null; -->
<!-- if(headerReferer!=null) -->
<!-- Path = headerReferer.substring(0,headerReferer.indexOf(contextPath)+contextPath.length()+1); -->
<!-- %> -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%-- <base href="<%=Path%>"> --%>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Download</title>
</head>
<body>
	<%
		response.setContentType("application/x-download");//设置为下载application/x-download
		String filedownload = "/index/download/UserManualCh.pdf";//即将下载的文件的相对路径
		String filedisplay = "UserManualCh.pdf";//下载文件时显示的文件保存名称
		URLEncoder.encode(filedisplay, "UTF-8");
// 		response.addHeader("Content-Disposition", "attachment;filename="
// 				+ filedisplay);
		response.setHeader( "Content-Disposition", "attachment;filename=" + new String( filedisplay.getBytes("gb2312"), "ISO8859-1" ) );
		try {
			RequestDispatcher dis = application
					.getRequestDispatcher(filedownload);
			if (dis != null) {
				dis.forward(request, response);
			}
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	%>
</body>
</html>