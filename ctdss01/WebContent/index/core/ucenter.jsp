<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/layout">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/dataservice.css"> 
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="stylesheet" type="text/css" href="test/docsnew.css">
	<link rel="stylesheet" type="text/css" href="test/ucenter.css">
	<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
    <title>城市交通数据服务空间</title>
</head>
<body onload="initDataServices();initTService();"> 
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a></li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a></li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a></li>
		<!-- 	<li class="l"><a><span>创建数据源</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a></li>
			<%
				if (session.getAttribute("username") == null
						&& session.getAttribute("adminname") == null) {
			%>
			<li class="lssss"><a href="login.jsp">登录</a></li>
			<li class="lsss"><a href="signup.jsp">注册</a></li>
			<%
				} else {
			%>	
			<li  class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
			<li class="lssss"><a href="logout.jsp">退出</a></li>
			<%} %>
		</ul>

	<div id="bd">
		<div id="docs-main">
    	<div style="height:30px; widows:100%"></div>
		<div id="main">
            <div class="clearfix"></div>
            <div class="ur-title">
       			<a class="appTitlea">我的数据>>按月资费数据</a>
            	<a class="applyBtn" href="index/core/browse.jsp">申请新数据</a>
        	</div>
        	<div class="linestyle">
		        <table width="98%" border="0" cellspacing="0" cellpadding="0" class="api_tb">
		          <tr class="tr_title">
		           <!--  <td class="td_bottom_line">&nbsp;</td> -->
		            <!--<td class="td_bottom_line">&nbsp;应用名称</td>-->
		            <td class="td_bottom_line" ><strong>数据</strong></td>
                    <td class="td_bottom_line"><strong>权限等级</strong></td>
		            <td class="td_bottom_line"><strong>今日配额（次）</strong></td>
		            <td class="td_bottom_line"><strong>已使用（次）</strong></td>
		            <td class="td_bottom_line"><strong>剩余次数</strong></td>
		            <td><strong>AppKey</strong></td>
		            <td><strong>审核认证</strong>&nbsp;</td>
		            <td><strong>操作</strong></td>
		          </tr>
		         <c:forEach var="myapp" items="${myapps}">
				<tr id="data_tr_26835">
		            <!-- <td align="center"><a class="mydata_icon train"></a>&nbsp;1</td> -->
		            <td><a href="apps/id/${myapp.appid}">${myapp.appname}</a>&nbsp;</td>
		            <td ><a class="vcard uncheckd" href="/my/vcard/did/22">0</a></td>
                    <td>3</td>
                    <td>${myapp.times}</td>
		            <td>${3-myapp.times}</td>
		            <td>${myapp.appkey}</td>
		            <td><c:if test="${myapp.state==0}"><a href="APIServlet?method=getmyappbyid0&id=${myapp.id}">审核</a></c:if><c:if test="${myapp.state==1}"><a href="APIServlet?method=getmyappbyid1&id=${myapp.id}">审核中</a></c:if><c:if test="${myapp.state==2}"><a href="APIServlet?method=getmyappbyid2&id=${myapp.id}">审核通过</a></c:if><c:if test="${myapp.state==3}">审核未通过</c:if>  
</td>
		            <td>
                    <a href="apps/id/${myapp.appid}" title="查看数据API接口" target="_blank">接口</a></td>
                    
				</tr>
			    </c:forEach>
		          	
		          
		          <tr>
          				<td colspan="7" height="40"><a class="delapi"><img src="index/images/data/delete.png" align="absmiddle"  class="png_bg" style="_margin-top:-20px"/>&nbsp;删除数据</a></td>
          		  </tr>
		          <tr>
          				<td colspan="7" height="40" class="appPages"><a>首页</a><a>上一页</a><a href='javascript:void(0)' class="pageSel">1</a><a>下一页</a><a>尾页</a></td>
         		  </tr>
         		  <tr>
          				<td colspan="7" height="40" style="float:right;margin-right: 0;text-align:right;"><a href="APIServlet?method=listbyuanme&myappuname=${username}">查看审核通过的应用以及奖励</a></td>
		         </table>
		</div>
</div>
		</div> 
	</div><!--/#bd --> 
           
</div><!--/#doc -->
</body>

</html>

