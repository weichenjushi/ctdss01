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
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<script type="text/javascript" src="test/jquery.min.js"></script>
<title>管理员后台中心</title>
<script type="text/javascript">
	function getDtName() {
		var href="<%=basePath%>APIServlet?method=accessdtables";
		window.location.href=href;
	}
	function getCId() {
		var href="<%=basePath%>/appCateServlet?method=listallu";
		window.location.href = href;
	}
</script>
</head>
<body onload="initpage();">
	<div id="maincontent">
		<form action="<%=basePath%>apps/addnewapp" method="post">
			<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="bg_tb">
					<tr class="tr_title">
						<td>数据服务id</td>
						<td>数据服务名称</td>
						<td>数据服务种类</td>
						<td>数据服务描述</td>
						<!-- 					<td>api接口地址</td> -->
						<td>app连接数量</td>
						<td>数据服务状态</td>
						<td>操作</td>
					</tr>
					<c:forEach var="anapp" items="${allnormalapps}">
						<tr class="tr_content">
							<td>${anapp.id}</td>
							<td>${anapp.name}</td>
							<td>${anapp.appcategory}</td>
							<td>${anapp.description}</td>
							<%-- 						<td>${anapp.apiaddress}</td> --%>
							<td>${anapp.num}</td>
							<td>正常</td>
							<td><a href="<%=basePath%>apps/id/edit/${anapp.id}">编辑</a>&nbsp;&nbsp;<a href="<%=basePath%>apps/id/setbad/${anapp.id}">设置为不可用</a></td>
						</tr>
					</c:forEach>
					<tr class="tr_content">
						<td colspan="7" height="40" class="appPages"><a id="first">首页</a><a id="pre">上一页</a><a id="next">下一页</a><a id="final">最后一页</a> <a id="pagetext">${hidepageindex1}/${hidepagecount1}</a><input type="hidden"
							id="hidepageindex1" value="${hidepageindex1}"> <input type="hidden" id="hidepagecount1" value="${hidepagecount1}">
						</td>

					</tr>

				</table>
			</center>
		</form>
	</div>

</body>
<script type="text/javascript">
	var pageSize = 8;
	var pageCount = $("#hidepagecount1").val();;//总页数
	var currNo = 1;//当前页
	
	jQuery(document).ready(function() {
		$("#first").click(function() {
			$("#pagetext").text(1+"/"+pageCount);
			//var paraObj = {key:appkey,requestUrl:requestUrl,dtype:reponseDtype,requestType:requestType};
			//var url="apps/id/allnormalbypage";
			$.get("apps/id/allnormalbypage", {
				pageSize : pageSize,
				currNo : 1
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		$("#pre").click(function() {
			currNo = $("#hidepageindex1").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if (currNo <= 1) {
				currNo = 1;
			} else {
				currNo--;
				$("#pagetext").text(currNo+"/"+pageCount);
				$.get("apps/id/allnormalbypage", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					//alert(e);
					$("#maincontent").html(e);
				})
			}
			
		})

		$("#next").click(function() {
			currNo = $("#hidepageindex1").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if(currNo>=pageCount)
				{
					currNo=pageCount;
				}
			else{
				currNo++;
				$.get("apps/id/allnormalbypage", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					//alert(e);
					$("#maincontent").html(e);
				})
			}
		})
		$("#final").click(function() {
			$("#pagetext").text(currNo+"/"+pageCount);
			$.get("apps/id/allnormalbypage", {
				pageSize : pageSize,
				currNo : pageCount
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		
	})
	
</script>
</html>