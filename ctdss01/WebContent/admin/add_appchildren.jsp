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
	function getDtName() {
		var href="<%=basePath%>APIServlet?method=accessdtables";
		window.location.href=href;
	}
	/* function getById() {
		var id=document.getElementById("parentname").value;
		var href="apps/id/getById/"+id;
		window.location.href=href;
	} */
</script>
</head>
<body onload="initParentnames();">
<script type="text/javascript" src="test/jquery.min.js"></script>
	<div id="main2">
	<form action="<%=basePath%>apps/addnewappchild" method="post">
		<center>
			<table width="50%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
				<caption>附属数据服务新增界面</caption>
				<tr class="tr_title">
					<td>父数据服务名称：</td>
					<td><select name="parentid" id="parentid" onblur="getById()"><c:forEach var="allnormalapp" items="${allnormalapps}">
								<option value="${allnormalapp.id}">${allnormalapp.name}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				
				<%-- <tr class="tr_title">
					<td>数据服务种类：</td>
					<td><input type="text" name="appcategory" value="${appcategory}"/>
					</td>
				</tr> --%>
				<tr class="tr_title">
					<td>数据服务描述：</td>
					<td><input type="text" name="name" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>子服务英文名称：</td>
					<td><input type="text" name="param" />
					</td>
				</tr>
				<!-- <tr class="tr_title">
					<td>api接口地址：</td>
					<td><input type="text" name="apiaddress" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>api说明文档：</td>
					<td><input type="text" name="apiexample" />
					</td>
				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>api返回xml数据格式：</td> -->
<!-- 					<td><textarea name="retexampxml" rows="5" cols="40"></textarea> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>api返回json数据格式：</td> -->
<!-- 					<td><textarea name="retexampjson" rows="5" cols="40"></textarea></td> -->
<!-- 				</tr> -->
				<tr>
					<td colspan="2">
					<td><input type="submit" value="新增"  />
					</td>
				</tr>
			</table>
		</center>
	</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn").click(function(){
			alert("df");
		})
	/* $("#parentname").change(function(){
		var id= $(this).val();
		var url="apps/id/getById/"+id;
		$.get(url,function(e){
			alert(e);
		})
	}) */
})
function initParentnames(){
	  var url = "apps/id/allappnames";
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("GET",url, true); 
	     req.onreadystatechange = initcomplete; 
	     req.send(null); 
	  } 
	} 

function initcomplete(){
	if (req.readyState == 4) { 
	  if (req.status == 200) { 
		  document.getElementById('main2').innerHTML = req.responseText; 
	  }
	} 
}

</script>
</html>