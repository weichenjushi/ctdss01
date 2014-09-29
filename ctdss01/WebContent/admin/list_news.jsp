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
	
	function getbyplatid() {
		var href="CkappServlet/getbyplatid/"+document.getElementById("platid").value;
		window.location.href = href;
	}
</script>
</head>
<body>
	<div id="maincontent">
		<form>
			<center>
				<table width="90%" border="0" cellspacing="0" cellpadding="0" class="bg_tb">	
					<tr class="tr_title">
						<td width="60%">标题</td>
						<td width="10%">来源</td>
<!-- 						<td>href</td> -->
						<td width="10%">发表时间</td>	
						<td width="10%">操作</td>
					</tr>
					<c:forEach var="listnew" items="${listnews}">
						<tr class="tr_content">
							<td>${listnew.title}</td>
							<td>${listnew.sfrom}</td>
<%-- 							<td>${listnew.type}/${listnew.pagename}</td> --%>
							<td>${listnew.addtime}</td>	
							<td><a href="news/edit/${listnew.id}">修改</a>
							<a href="news/delete/${listnew.id}">删除</a>
							
							</td>
						</tr>
					</c:forEach>
					<tr class="tr_content">
						<td colspan="7" height="40" class="appPages"><a id="first">首页</a><a id="pre">上一页</a><a id="next">下一页</a><a id="final">最后一页</a> <a id="pagetext">${hidepageindex2}/${hidepagecount2}</a><input type="hidden"
							id="hidepageindex2" value="${hidepageindex2}"> <input type="hidden" id="hidepagecount2" value="${hidepagecount2}">
						</td>

					</tr>

				</table>
			</center>
		</form>
	</div>

</body>
<script type="text/javascript">
	var pageSize = 5;
	var pageCount = $("#hidepagecount2").val();//总页数
	var currNo = 1;//当前页
	
	jQuery(document).ready(function() {
		$("#first").click(function() {
			$("#pagetext").text(1+"/"+pageCount);
			//var paraObj = {key:appkey,requestUrl:requestUrl,dtype:reponseDtype,requestType:requestType};
			//var url="apps/id/allnormalbypage";
			$.get("news/getbypageadmin", {
				pageSize : pageSize,
				currNo : 1
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		$("#pre").click(function() {
			currNo = $("#hidepageindex2").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if (currNo <= 1) {
				currNo = 1;
			} else {
				currNo--;
				$("#pagetext").text(currNo+"/"+pageCount);
				$.get("news/getbypageadmin", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					//alert(e);
					$("#maincontent").html(e);
				})
			}
			
		})

		$("#next").click(function() {
			currNo = $("#hidepageindex2").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if(currNo>=pageCount)
				{
					currNo=pageCount;
				}
			else{
				currNo++;
				$.get("news/getbypageadmin", {
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
			$.get("news/getbypageadmin", {
				pageSize : pageSize,
				currNo : pageCount
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		
	})
	
</script>
</html>