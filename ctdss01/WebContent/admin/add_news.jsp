<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员后台中心</title>
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<script type="text/javascript" src="test/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>fckeditor/fckeditor.js"></script>
	<script type="text/javascript">
	   jQuery(document).ready(function() {
			var oFCKeditor = new FCKeditor( 'content' ) ; 
			oFCKeditor.BasePath	= "<%=basePath%>fckeditor/" ; 
			oFCKeditor.Height	= "600" ;
			oFCKeditor.Width	= "100%" ;
			oFCKeditor.ToolbarSet = "bbs" ;
			oFCKeditor.ReplaceTextarea();
			
		});
	</script>
</head>
<body>
	<form action="<%=basePath%>news/addnews" method="post">
		<center>
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
				<caption>公告新增界面</caption>
				<tr class="tr_title">
					<td>公告标题：</td>
					<td><input type="text" name="title" />
					</td>
				</tr>
				<!-- <tr class="tr_title">
					<td>公告相对应页面名称：</td>
					<td><input type="text" name="pagename" />
					</td>
				</tr> -->
				<tr class="tr_title">
					<td>公告类型:</td>
					<td>
						<input type="radio" name="type" value="importances/2014">重要
					</td>
				</tr>
				<tr class="tr_title">
					<td>公告来源：</td>
					<td><input type="text" name="from" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>公告内容：</td>
					<td height="80%">
					<textarea name="content"></textarea>
					</td>
				</tr>
				<tr class="tr_title">
					<td colspan="2"  style="text-align: center;">
					<input type="submit" value="新增" />
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>

</html>