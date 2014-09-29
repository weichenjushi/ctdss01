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
<script type="text/javascript">
function getULevelId() {
	var href="<%=basePath%>/userServlet?method=getULevelId";
		window.location.href = href;
	}
</script>
</head>
<body>
	<form action="<%=basePath%>userServlet?method=modifyulevelinfo" method="post">
		<center>
			<table width="50%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
				<caption>用户等级修改页面</caption>
				<tr class="tr_title">
					<td>用户级别</td>
					<td><input type="text" name="id" value="Lv${ulevel.id}" readonly="readonly" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>用户积分：</td>
					<td><input type="text" name="points" value="${ulevel.points}" /></td>
				</tr>
				<tr class="tr_title">
					<td>每日访问次数：</td>
					<td><input type="text" name="times" value="${ulevel.times}"  /></td>
				</tr>
				<tr class="tr_title">
					<td colspan="2">
					<td><input type="submit" value="修改" /></td>
				</tr>
			</table>
		</center>
	</form>
</body>
<!-- <script type="text/javascript">
$(document).ready(function(){
	$("#ulevelid").click(function(){
		var url="userServlet?method=getULevelId";
		$.get(url,function(e){
				$(".show-request-type").html("请求方式："+requestType);
				$(".show-request-url").html("请求URL："+requestUrl);
				$(".show-request-params").html("请求参数：key="+appkey+"&dtype="+reponseDtype);
				$("#show-reponse-content").val(e);
				
		})	
	})
})
</script> -->
</html>