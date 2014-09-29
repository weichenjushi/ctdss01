<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们</title>

<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" href="<%=basePath%>css/about.css">
</head>

<body>
<div id="main" class="header">
	<div class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="<%=basePath%>index/core/myindex.jsp">首页</a></li>
			<li class="lsss"><a href="<%=basePath%>index/core/browse.jsp">浏览</a></li>
			<li class="ls"><a href="<%=basePath%>index/core/mydataservice.jsp">我的数据服务</a></li>
			<li class="ls"><a href="<%=basePath%>index/core/create_mashup_traditional.jsp">常见问题</a></li>
			<li class="lss"><a href="<%=basePath%>index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="<%=basePath%>index/about/take_a_tour.jsp">帮助</a></li>
			<li class="lssss"><a href="<%=basePath%>login.jsp">登录</a></li>
			<li class="lsss"><a href="<%=basePath%>signup.jsp">注册</a></li>
		</ul>
	</div>
	<div class="forshowfooter1">

	
	<div class="forshowfooter2">
	<div class="centerdiv_about_us">
	<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 北方工业大学云计算研究中心成立于2010年12月，其前身是中国科学院计算技术研究所“软件集成与服务计算研究分中心”和“中德软件集成技术联合实验室”，在分布式计算、服务计算、云计算方向已有10 余年的相关学术研究和应用系统建设经历，研究工作长期以来得到了国家863 计划、973 计划、国家自然基金重大、重点和面上项目以及北京市科技创新计划的支持。
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本团队已在服务计算、网格和互联网信息集成领域培养博士和硕士研究生60 余名，发表相关学术论文150 余篇，申请专利20 项（已获授权10 项，转让8项），软件登记40 余项，近几年发起主办国际会议6 个，主编相关期刊专辑11册，出版学术专著2 本。研究团队2003 年发布了国内首批SOA 套件VINCA，参展世界最大的信息技术博览会之一——汉诺威信息技术博览会，2009 年欧盟Nessi 项目和Theseus 项目联合组织国际学术活动，在世界范围内挑选的10 项典型工作中就包括VINCA 平台。
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 除学术研究以外，团队在服务计算方面的研究工作还涉及到了制造业、应急联动、电子政务、科研等领域的多个应用，与长风联盟、神州数码、东方通、华为等组织和企业等业界相关的单位和企业也有着密切的合作，部分阶段性研究成果已经在奥运综合信息服务系统项目、公安应急联动项目等项目中得到应用。团队在计算网格领域也有着长期的积累，部分阶段性研究成果已经在奥运综合信息服务系统项目等项目中得到应用，团队带头人韩燕波研究员曾主持承担了中国国家网格软件863 重点项目，与国内外多家研究机构在网格研究上保持着密切的合作关系。
		</p>
		<div style="margin-left:20px;margin-top:100px;">
		<p><a style="font-size:27px;">联系方式</a></p>
			<p><a style="font-size:18px;">合作QQ:	1481251591</a></p>
			<p><a style="font-size:18px;">合作邮箱:	mrmote@qq.com</a></p>
			<p><a style="font-size:18px;">QQ交流群:	168712265</a></p>
			<p><a style="font-size:18px;">联系电话:	18811756877</a></p>
		</div>
	</div>
	
	<table class="table_button" width=100%>
		<tr>
			<td width="15%"></td>
			<td>
				<p>
					<button style="background: #0099CC;width:100px;  height:35px;font-family:dotum;color:white;font-size:14px;"  onclick="window.location.href='index/core/myindex.jsp'">首页</button>
				</p>
			</td>
<!-- 			<td> -->
<!-- 				<p> -->
<!-- 					<button class="button" onclick="window.location.href=''">Top</button> -->
<!-- 				</p> -->
<!-- 			</td> -->
			<td width="15%"></td>
		</tr>
	</table>
	</div>
	<center>
	 <div class ="indexfooter" style="margin-top:100px;">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	 </center> 
	</div>
	</div>
  </body>
</html>