<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<script type="text/javascript" src="test/jquery.min.js"></script>
<script type="text/javascript">
	// 	function test() {
	// 		alert(document.getElementById("num").value);
	// 		$("#txt").val("Single2");
	// 	}
	// 	$("#single").val("Single2");
	// 	$("#multiple").val(["Multiple2", "Multiple3"]);
	// 	$("input").val(["check2", "radio1"]);
	$(document).ready(function() {
		$("button").click(function() {
			$("#txt").val('123465');
		});
	});
</script>
<script type="text/javascript">
function test(id){
	alert(id);
	var username=document.getElementById("username").value;
	var test1;
	//alert(test1);
	if(test1==undefined){
		alert("用户名不能为空");
	}
}
</script>
</head>
<body>
	<select id="single">
		<option>Single</option>
		<option>Single2</option>
	</select>
	<select id="multiple" multiple="multiple">
		<option selected="selected">Multiple</option>
		<option>Multiple2</option>
		<option selected="selected">Multiple3</option>
	</select>
	<br />
	<input type="checkbox" value="check1" /> check1
	<input type="checkbox" value="check2" /> check2
	<input type="radio" value="radio1" /> radio1
	<input type="radio" value="radio2" /> radio2
	<input type="text" id="txt">
	<button type="button">Click me</button>
	<a id="next">下一页</a>
	<form action="">
	<table><tr><td>用户名</td><td><input type="text" id="username"></td></tr></table>
	<table><tr><td><font size=""></font></td></tr></table>
	</form>
</body>
<script type="text/javascript">
var pageSize=5;
var pageCount;//总页数
var currNo=1;//当前页
jQuery(document).ready(function(){
	
	$("#next").click(function(){
		currNo++;
		
		alert(currNo);
		
 		})
 		

})
</script>
</html>