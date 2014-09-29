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
// 	$(document).ready(function() {
// 		$("button").click(function() {
// 			$("#txt").val('123465');
// 		});
// 	});
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
	<div class="myClass">div class="notMe"</div>
	<div class="myClass">div class="myClass"</div>
	<span class="myClass">span class="myClass"</span>
	<button class="myClass" type="button" value="fds">Click me</button>
	<input type="text" name="newsletter" class="myClass1" value="parf">
	<input type="text" name="newsletter" class="myClass1" value="param2">
	<input type="text" name="newsletter" class="myClass1" value="parfds ">
	
	<input type="text" class="myClass1" value="param3">
	<input type="text" class="myClass1" value="param4">
	<input type="text" size="15"  disabled="disabled" name="input-param" value="name"><input id="_cardno" name="rvalue" type="text" size="20" value="wlh">
	<input type="text" size="15"  disabled="disabled" name="input-param" value="age">：<input id="_cardno" name="rvalue" type="text" size="20" value="22">
	
	<a id="next">下一页</a>
</body>
<script type="text/javascript">
var pageSize=5;
var pageCount;//总页数
var currNo=1;//当前页
jQuery(document).ready(function(){
// 	var txt=$(".myClass1").val();

   var params1="";
   $("input[name='input-param'").each(function(){
  	    params1=params1+$(this).val()+"/";
   })
   var params="";
   $("input[name='rvalue'").each(function(){
  	    params=params+$(this).val()+"/";
   })
    
	alert(params1); 
   alert(params); 		

})
</script>
</html>