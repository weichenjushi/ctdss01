<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="test/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/ucenter.css">

<script type="text/javascript" src="test/htmlformat.js"></script>
<script type="text/javascript" src="test/jquery.min.js"></script>
<script type="text/javascript" src="test/jsformat.js"></script>
<title>城市交通数据服务空间</title>
<script type="text/javascript">
	function checkappname() {
		var filepath = document.getElementById("appname");
		var content = filepath.value;
		if (content == "") {
			alert("应用名称不能为空!");
			filepath.focus();
			return false;
		} 
		else {
			
		}
	}
	function checkurl() {
		var dtname = document.getElementById("url");
		var content = dtname.value;
		if (content == "") {
			alert("应用地址不能为空!");
			dtname.focus();
			return false;
		} 
		else {
			
		}
	}
	function checkdes() {
		var dtname = document.getElementById("des");
		var content = dtname.value;
		if (content == "") {
			alert("应用描述不能为空!");
			dtname.focus();
			return false;
		} 
		else {
			
		}
	}
</script>
</head>
<body onload="" style="background-color: #F8F8F8; height: 50px;">

	<div class="forshowfooter1">

		<div id="main1" class="header">
			<ul class="nav-head">
				<li class="lssss cur"><a href="index/core/myindex.jsp">首页</a></li>
				<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a></li>
				<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
				<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a></li>
				<!-- 	<li class="l"><a><span>创建数据服务</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">创建网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
				<li class="lss"><a href="index/Navigator/index.jsp">应用</a></li>
				<li class="lss"><a href="index/about/take_a_tour.jsp">帮助</a>
				</li>
				<%
					if (session.getAttribute("username") == null
							&& session.getAttribute("adminname") == null) {
				%>
				<li class="lss"><a href="login.jsp">登录</a></li>
				<li class="lss"><a href="signup.jsp">注册</a></li>
				<%
					} else {
				%>
				<li class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
				<li class="lsss"><a href="logout.jsp">退出</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<div id="bd">

<div class="u-main" style="width:90%;margin:auto;padding:auto;">
		<div class="u-main-right" style="margin-left:50px;">
			<div class="ur-title">
       			<a class="appTitlea">会员中心>>应用审核认证</a>
            	
        	</div>
        <div class="linestyle" >
        <form name="infoForm" id="infoForm" action="CkappServlet/add" method="post">
        	<input type="hidden" value="58" name="did" id="did">
	        <table width="98%" border="0" cellspacing="0" cellpadding="0" class="api_tb" style="color:#333">
	          <tr class="bgcolor">
	            <td width="120" >&nbsp;用户账号：</td>
	            <td >&nbsp;${myapp.username}<input type="hidden" value="${myapp.username}" name="myappuname" id="uname"><input type="hidden" value="${myapp.id}" name="myappid" id="uid">
	            </td>
	          </tr>
              <tr >
	            <td width="120" >&nbsp;数据名称：</td>
	            <td>&nbsp;${myapp.appname}<input type="hidden" value="${myapp.appname}" name="appid" id="uid">
	            <span id="info-uid-tips" class="normal-tips">用户UID验证失败</span></td>
	          </tr>
              
              <tr class="bgcolor">
	            <td width="120" >&nbsp;</td>
	            <td >&nbsp;
	            </td>
	          </tr>
              
              <tr >
	            <td width="120" >&nbsp;APPKEY：</td>
	            <td >&nbsp;${myapp.appkey}
	            <span id="info-uid-tips" class="normal-tips"></span>
	            </td>
	          </tr>
              <tr class="bgcolor">
	            <td width="120" >&nbsp;创建时间：</td>
	            <td >&nbsp;${myapp.addtime}
	            <span id="info-uid-tips" class="normal-tips"></span>
	            </td>
	          </tr>
              <tr>
	            <td width="120" >&nbsp;应用平台：</td>
	            <td >&nbsp; <input type="radio" name="type" value="1" checked="checked">&nbsp;&nbsp;<img src="images/android.png" alt="Android" class="png_bg" alt="Android" title="安卓应用">
		        &nbsp;&nbsp;<input type="radio" value="2" name="type" >&nbsp;&nbsp; <img src="images/apple.png" alt="ios" class="png_bg" alt="苹果应用">
		        &nbsp;&nbsp;<input type="radio" value="3" name="type" >&nbsp;&nbsp; <img src="images/desk.png" alt="windowsPhone" class="png_bg" alt="Windows应用">
		        &nbsp;&nbsp;<input type="radio" value="4" name="type" >&nbsp;&nbsp;<img src="images/web.png" alt="WEBAPP" class="png_bg" alt="WEB网站">
                &nbsp;&nbsp;<input type="radio" value="5" name="type" >&nbsp;&nbsp;<img src="images/wechat.png" alt="WEBAPP" class="png_bg" alt="微信公众平台">
                &nbsp;&nbsp;<input type="radio" value="6" name="type" >&nbsp;&nbsp;其他
	            </td>
	          </tr>

				<c:if test="${ckapp!=null}">
              <tr  class="bgcolor">
	            <td width="120" >&nbsp;您的应用名称：</td>
	            <td >&nbsp;<input type="text" disabled="disabled" value="${ckapp.name}" id="appname" name="appname" class="userinfo-input" maxlength="24" onblur="checkappname()">
	            <span style="color:#999">&nbsp;*&nbsp;请填写真实应用名称，否则不予通过</span>
	            </td>
	          </tr>
              <tr >
	            <td width="120" >&nbsp;应用地址：</td>
	            <td >&nbsp;<input type="text" disabled="disabled" value="${ckapp.address}" id="url" name="url" class="userinfo-input"  style="width:550px;" onblur="checkurl()">
	            <span style="color:#999">&nbsp;*&nbsp;APP STORE地址或者安卓市场下载地址，WEB应用直接填写URL地址</span>
	            </td>
	          </tr>

	          <tr class="bgcolor">
	            <td >&nbsp;应用描述：</td>
	            <td >&nbsp;<input type="text" disabled="disabled" value="${ckapp.description}" id="des" name="des" class="userinfo-input" style="width:550px;" maxlength="128" onblur="checkdes()">
	            <span style="color:#999">&nbsp;*&nbsp;简述应用的基本功能或微信公众号，不超过128个字</span>
	            </td>
	          </tr>
                            
              <tr >
	            <td width="120" >&nbsp;审核状态：</td>
	            <td>
	            <c:if test="${myapp.state==0}"><a class="vcard uncheckd" style="margin-left:30px" href="APIServlet?method=getmyappbyid0&id=${myapp.id}">未认证</a></c:if><c:if test="${myapp.state==1}"><a class="vcard checking" style="margin-left:30px" href="APIServlet?method=getmyappbyid1&id=${myapp.id}">审核中</a></c:if><c:if test="${myapp.state==2}"><a class="vcard" style="margin-left:30px" href="APIServlet?method=getmyappbyid2&id=${myapp.id}">审核通过</a></c:if><c:if test="${myapp.state==3}"><a class="vcard checkfailed" style="margin-left:30px">审核未通过</a> </c:if>  
	            </td>
	          </tr>
              	          <tr class="bgcolor">
	            <td >&nbsp;</td>
	            <td >&nbsp;</td>
	          </tr>
	          </c:if>
	          <c:if test="${ckapp==null}">
	          <tr  class="bgcolor">
	            <td width="120" >&nbsp;您的应用名称：</td>
	            <td >&nbsp;<input type="text" value="" id="appname" name="appname" class="userinfo-input" maxlength="24" onblur="checkappname()">
	            <span style="color:#999">&nbsp;*&nbsp;请填写真实应用名称，否则不予通过</span>
	            </td>
	          </tr>
              <tr >
	            <td width="120" >&nbsp;应用地址：</td>
	            <td >&nbsp;<input type="text"  value="" id="url" name="url" class="userinfo-input"  style="width:550px;" onblur="checkurl()">
	            <span style="color:#999">&nbsp;*&nbsp;APP STORE地址或者安卓市场下载地址，WEB应用直接填写URL地址</span>
	            </td>
	          </tr>

	          <tr class="bgcolor">
	            <td >&nbsp;应用描述：</td>
	            <td >&nbsp;<input type="text" value="" id="des" name="des" class="userinfo-input" style="width:550px;" maxlength="128" onblur="checkdes()">
	            <span style="color:#999">&nbsp;*&nbsp;简述应用的基本功能或微信公众号，不超过128个字</span>
	            </td>
	          </tr>
                            
              <tr >
	            <td width="120" >&nbsp;审核状态：</td>
	            <td>
	            <a class="vcard uncheckd" style="margin-left:30px" >未认证</a></td>
	          </tr>
              	          <tr class="bgcolor">
	            <td >&nbsp;</td>
	            <td >&nbsp;
	             <input type="submit" value="提交认证" class="btnyeallow" id="checkBtn">
	            </td>
	          </tr>
	          </c:if>
	          
	        </table>
	        </form>
	      </div>
		 <div class="clearfix"></div>
		 <div class="ur-title">
       			<a class="appTitlea">会员中心>>认证说明</a>
         </div>
         <div class="linestyle" >
         	<ul style="color:#333">
            	<li style="color:#F30">1、基本说明：用户在使用城市交通数据服务空间完成了应用或网站的开发并上线，即可提交认证审核。开发期间，未审核的应用并不会影响接口的调用。</li>
            	<li>2、认证说明：为了使城市交通数据服务空间更了解开发者的实际使用场景，为后续提供更好更优质的服务，请各开发者完善开发的应用的基本信息。</li>
                <li>3、认证的好处：一经通过认证的应用，城市交通数据服务空间将会奖励开发者该数据一定期限的免费使用权限，以及不定期的奖励。对于，优质的应用我们还将会发布至城市交通数据服务空间网站展示。</li>
            </ul>
         </div>
		<div id="ft">
			Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a>
		</div>
		<!--/#ft -->
		</div>
		</div>

	</div>

	<!--/#doc -->
</body>
<script language="javascript">
	function initDataServicesHome() {
		var url = "BrowseServlet?cmd=initHome";
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("GET", url, true);
			req.onreadystatechange = initcomplete;
			req.send(null);
		}
	}

	function initcomplete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('main2').innerHTML = req.responseText;
				hide();
			}
		}
	}
	<%-- $(document).ready(function(){
		$("#infoBtn").click(function(){
			$(this).val("保存中...").attr("disabled","disabled");
			
			$("#infoForm").ajaxSubmit(function(e){
				var o =json_parse(e);
				if(o.code =='0'){
					alert(o.info);
				}else{
					alert(o.info);
				}
				$("#infoBtn").val("保存信息").removeAttr("disabled");
			});
		})
	
		$("#checkBtn").click(function(){
			var appname =$("#appname").val();
			var platid=$('input[name=type]:checked').val();
			var appid=$("#appid").val();
			var url =$("#url").val();
			var des =$("#des").val();
			var paraObj = {appname:appname,platid:platid,appid:appid,url:url,des:des};
			
			
			var url="<%=basePath%>CkappServlet/add";
			$.post(url,paraObj,function(e){
					$(".show-request-type").html("请求方式："+requestType);
					$(".show-request-url").html("请求URL："+requestUrl);
					//alert(obj.requestUrl);
					$(".show-request-params").html("请求参数：key="+appkey+"&dtype="+reponseDtype);
					$("#show-reponse-content").val(e);
					//alert(obj.reponse);
					$("#boxBtn").val('调用接口').removeAttr('disabled');
					//do_js_beautify();
			})
		
			$.post("/my/checkit",{uid:uid,did:did},function(e){
					var o =json_parse(e);
					if(o.code =='0'){
						window.location.reload();
					}else{
						alert(o.info);
					}
			})
			
		})
		
	}) --%>
	function dataServices() {
		var url = "myDataServiceServlet/myDataService?cmd=serviceitem";
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("post", url, true);
			req.onreadystatechange = dataServicescomplete;
			req.send(null);
		}
	}

	function dataServicescomplete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('content').innerHTML = req.responseText;
			}
		}
	}

	function lastestdataServices() {
		var url = "browseServlet/browse?cmd=popservice";
		if (window.XMLHttpRequest) {
			req1 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req1) {
			req1.open("post", url, true);
			req1.onreadystatechange = lastestdataServicescomplete;
			req1.send(null);
		}
	}

	function lastestdataServicescomplete() {
		if (req1.readyState == 4) {
			if (req1.status == 200) {
				document.getElementById('content1').innerHTML = req1.responseText;
			}
		}
	}
	//隐藏表格
	function hide() {
		for ( var i = pageSize; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = 'none';
		}

		totalPage.innerHTML = pageCount();
		pageNum.innerHTML = '1';
		if ((numberRowsInTable > pageSize) && (pageCount() > page)) {
			nextLink();
			lastLink();
		}
	}
</script>
</html>