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
<!-- <link rel="stylesheet" type="text/css" href="index/css/core_css/layout"> -->
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<script type="text/javascript" src="test/jquery.min.js"></script>
<!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
<title>城市交通数据服务空间</title>
<STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	BACKGROUND: url(images/bg.gif);
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px
}

BODY {
	FONT-SIZE: 12px
}

TD {
	FONT-SIZE: 12px
}

.menu_box_pad {
	PADDING-RIGHT: 2px;
	PADDING-LEFT: 2px;
	BACKGROUND: #fdf9d5;
	PADDING-BOTTOM: 2px;
	PADDING-TOP: 0px
}

.menu_box {
	BORDER-RIGHT: #d6d6d6 1px solid;
	BORDER-TOP: #ababab 1px solid;
	BORDER-LEFT: #ababab 1px solid;
	BORDER-BOTTOM: #d6d6d6 1px solid
}

.menu_box TH {
	BACKGROUND: url(images/menu_list_icon.gif) no-repeat center 50%;
	WIDTH: 10px;
	LINE-HEIGHT: 22px
}

.menu_box TD {
	BACKGROUND: url(images/menu_list_split.gif) no-repeat left bottom;
	LINE-HEIGHT: 20px
}

.menu_box A {
	COLOR: #000;
	TEXT-DECORATION: none
}

.menu_box A:hover {
	TEXT-DECORATION: underline
}

.hand {
	CURSOR: pointer
}

.ctrl_menu {
	BORDER-RIGHT: #767676 1px solid;
	BACKGROUND: #ffcf60;
	BORDER-LEFT: #767676 1px solid;
	BORDER-BOTTOM: #767676 1px solid
}

.ctrl_menu_title {
	PADDING-LEFT: 15px;
	FONT-WEIGHT: bold;
	LINE-HEIGHT: 25px
}

.ctrl_menu_title_bg {
	BACKGROUND: url(images/menu_title_bg.gif)
}

.top_bg { /* 	BACKGROUND: url(images/top_bg.gif) */
	background-color: #f8f8f8;
	height: 80px;
}

.logo_bg {
	BACKGROUND: url(images/logo_bg.gif);
}

.a01 A:link {
	COLOR: #000;
	TEXT-DECORATION: underline
}

.a01 A:visited {
	COLOR: #000;
	TEXT-DECORATION: underline
}

.a01 A:active {
	COLOR: #000;
	TEXT-DECORATION: none
}

.a01 A:hover {
	COLOR: #000;
	TEXT-DECORATION: none
}

#top_nav_menu {
	COLOR: #fff
}

#top_nav_menu A {
	COLOR: #fff;
	TEXT-DECORATION: none
}

#top_nav_menu A:hover {
	COLOR: #ff6;
	TEXT-DECORATION: underline
}
</STYLE>
<SCRIPT>
function $(_sId){
	return document.getElementById(_sId);
}
function exist(_sId){
	var oObj = $(_sId);
	return oObj != null ? oObj : false;
}
function dw(_sTxt){
	document.write(_sTxt);
}
function hide(_sId){
	$(_sId).style.display = $(_sId).style.display == "none" ? "" : "none";
}
function openOnce(_sId){
	$(_sId).style.display = $(_sId).style.display == "none" ? "" : "";
}
function onlyShow(_sId, _iNum, _sPic, _sTxt1, _sTxt2){
	var i = 0;
	var oCurr = exist(_sId + i);
	while(oCurr){
		oCurr.style.display = "none";
		$(_sPic + i).src = _sTxt2;
		i++;
		oCurr = exist(_sId + i)
	}
	$(_sId + _iNum).style.display = "";
	$(_sPic + _iNum).src = _sTxt1;
}
function swapShow(_sId){
	var i = 0;
	var oCurr = exist(_sId + i);
	while(oCurr){
		hide(_sId + i);
		i++;
		oCurr = exist(_sId + i)
	}
}
function seekKey(_sKey){
	var i = 0;
	while(exist(_sKey + i)){
		i++;
	}
	return i;
}
function swapPic(_sId,_sAttr,_sTxt1, _sTxt2) {
	$(_sId)[_sAttr] = $(_sId)[_sAttr].indexOf(_sTxt1) > -1 ? _sTxt2 : _sTxt1;
}
function swap(_sId,_sAttr,_sTxt1, _sTxt2) {
	$(_sId)[_sAttr] = $(_sId)[_sAttr] == _sTxt1 ? _sTxt2 : _sTxt1;
}
function moveGif(_sId){
	swap(_sId,'className','marginLeft2','');
}
function moveStart(_sId){
	__tmp__time = setInterval("moveGif('" + _sId + "')",200);
}
function moveStop(_sId){
	clearInterval(__tmp__time);
	$(_sId).className = "marginLeft2";
}
function switchShow(){
	hide('left');
	swapPic('arrow','src','images/control_switch_up.gif','images/control_switch_down.gif');
	swapShow('hideLeft');
	swapShow('hideBody');
}
function scroll_to_top()
{
	document.body.scrollTop=0;
}
function mainFrameRedirect(url)
{
	oo = document.getElementById("mainFrame");
	oo.url = url;
}
</SCRIPT>
</head>




<body>
	<div class="forshowfooter1">
		<div id="main" class="header">
			<ul class="nav-head">
				<li class="lssss cur"><a href="index/core/amyindex.jsp">首页</a>
				</li>
				<li class="ls"><a href="index/core/abrowse.jsp">浏览数据接口</a>
				</li>
				<li class="ls"><a href="index/core/acreate_data_service_wrapper.jsp">创建数据服务</a>
				</li>
				<li class="ls"><a href="index/core/amanage_users.jsp">用户管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_dataservices.jsp">数据服务管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_news.jsp">网站公告管理</a>
				</li>
				<%
					if (session.getAttribute("username") == null
							&& session.getAttribute("adminname") == null) {
				%>
				<li class="lss"><a href="login.jsp">登录</a>
				</li>
				<li class="lss"><a href="signup.jsp">注册</a>
				</li>
				<%
					} else {
				%>
				<li class="lsss"><a href="index/core/aprofile.jsp">用户中心</a>
				</li>
				<li class="lssss"><a href="logout.jsp">退出</a>
				</li>
				<%
					}
				%>
			</ul>
			<div class="forshowfooter2">
				<TABLE id=bodyTable cellSpacing=0 cellPadding=0 width="100%" border=0 style="margin: 0; padding: 0;">

					<TBODY>

						<TR>

							<TD class=top_bg vAlign=bottom align=left height=80 style="padding-left: 31px;">
								<!-- 				页面TOP头 -->

								<TABLE cellSpacing=0 cellPadding=0 width="211" border=0>
									<TBODY>
										<TR>
											<TD vAlign=bottom align=right width=210>
												<TABLE cellSpacing=0 cellPadding=0 width=210 border=0>
													<TBODY>
														<TR>
															<TD height=50 align=center class=logo_bg><strong style="font-size: 14px">创建数据服务中心 </strong></TD>
														</TR>
														<TR>
															<TD class=hand onclick=switchShow() align=left><IMG id=arrow height=21 src="images/control_switch_up.gif" width=205>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>

											<TD vAlign=bottom align=left></TD>
										</TR>
									</TBODY>
								</TABLE> <!-- 												 页面TOP头 --></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" height="100%" border=0>
					<TBODY>
						<TR>
							<TD id=left vAlign=top width=252 height="100%">
								<TABLE cellSpacing=0 cellPadding=0 width=220 align=right border=0>
									<TBODY>
										<TR>
											<TD vAlign=top align=left height=50>
												<TABLE class=ctrl_menu cellSpacing=0 cellPadding=0 width=205 border=0>
													<TBODY>
														<TR>

															<%-- 															<% --%>
															<!-- 		              	int usertype = Integer.parseInt(session.getAttribute("usertype").toString()); -->
															<!-- 		                if(usertype == 0){ -->
															<!-- 		              %> -->

															<TD align=middle>
																<!-- 快速通道 -->


																<TABLE class=ctrl_menu_title_bg cellSpacing=0 cellPadding=0 width=195 border=0>
																	<TBODY>

																		<TR class=hand onClick="hide('hideMenuFunc0')">
																			<TD class=ctrl_menu_title width=174>创建数据服务</TD>
																			<TD width=21><IMG src="images/menu_title_down.gif" width="21" height="25" id=MenuFunc0></TD>
																		</TR>
																		<TR id=hideMenuFunc0 style="DISPLAY: none">
																			<TD class=menu_box_pad align=left colSpan=2>
																				<TABLE class=menu_box cellSpacing=5 cellPadding=0 width="100%" border=0>
																					<TBODY>


																						<TR>
																							<TH></TH>
																							<TD><A onclick=scroll_to_top() href="<%=request.getContextPath()%>/admin/importexcel2db.jsp" target=mainFrame>*导入表格到数据库中(first)</A>
																							</TD>
																						</TR>

																						<TR>
																							<TH></TH>
																							<TD><A onclick=scroll_to_top() href="<%=request.getContextPath()%>/admin/add_app.jsp" target=mainFrame>*添加父数据服务API文档(second)</A>
																							</TD>
																						</TR>
																						<TR>
																							<TH></TH>
																							<TD><A onclick=scroll_to_top() href="<%=request.getContextPath()%>/admin/add_appparams.jsp" target=mainFrame>*添加父数据服务参数说明(third)</A>
																							</TD>
																						</TR>
																						<TR>
																							<TH></TH>
																							<TD><A onclick=scroll_to_top() href="<%=request.getContextPath()%>/admin/add_appchildren.jsp" target=mainFrame>添加孩子数据服务API文档(optional)</A>
																							</TD>
																						</TR>
																						<TR>
																							<TH></TH>
																							<TD><A onclick=scroll_to_top() href="<%=request.getContextPath()%>/admin/create_data.jsp" target=mainFrame>生成数据(optional)</A>
																							</TD>
																						</TR>
																						
																					</TBODY>
																				</TABLE></TD>
																		</TR>
																	</TBODY>
																</TABLE> <!-- /快速通道 --></TD>
														</TR>
														<TR height=5>
															<TD></TD>
														</TR>


													
													</TBODY>
												</TABLE> </TD>
										</TR>
									</TBODY>
								</TABLE></TD>


							<TD vAlign=top align=center height="780">
								<DIV style="width: 100%; height: 100%">
									<IFRAME id="mainFrame" name="mainFrame" style="width: 100%; height: 100%" src="" frameBorder="0" scrolling="auto">您的浏览器不支持此功能，请您使用最新的版本。</IFRAME>
								</DIV>
							</TD>
						</TR>
					</TBODY>

				</TABLE>


			</div>
			<div id="ft">
				Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a>
			</div>
			<!--/#ft -->
		</div>
		<!--/#doc -->
	</div>
	<SCRIPT type=text/javascript>var resizeflag='1';
function iframeResize()
{


	var dyniframe   = null;
	var indexwin    = null;

	if (document.getElementById)
	{
		dyniframe       = document.getElementById("mainFrame");
		indexwin        = window;

		if (dyniframe)
		{
			if(resizeflag=='0'){resizeflag='1';dyniframe.height="700";return false}

			if (dyniframe.contentDocument){
				dyniframe.height = dyniframe.contentDocument.body.scrollHeight + 10;

			}
			else if (dyniframe.document && dyniframe.document.body.scrollHeight)
			{
				iframeheight	= mainFrame.document.body.scrollHeight + 10;
//				windowheight = indexwin.document.body.scrollHeight - 128;
//				dyniframe.height = (iframeheight < windowheight) ? windowheight : iframeheight;
				dyniframe.height = iframeheight;
			}
		}
	}
}
if (window.addEventListener)
window.addEventListener("load", iframeResize, false)
else if (window.attachEvent)
window.attachEvent("onload", iframeResize)
else
window.onload=iframeResize
function winopen(url)
{
	 window.open("/control/section" + url, "control", "width=680,height=450,scrollbars=yes,left=" + (window.screen.width-680)/2 + ",top=" + (window.screen.height-450)/2);

}
-->
</SCRIPT>
</body>
</html>
