<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="cn.ctdss.lr.domain.Apps" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/default.css">
<link rel="stylesheet" type="text/css" href="test/docsapi.css">
<link rel="stylesheet" type="text/css" href="test/rateit.css">
<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
<title>城市交通数据服务空间</title>
<script type="text/javascript" src="index/js/jquery.min.js"></script>
<script type="text/javascript" src="index/js/tab.js"></script>

</head>
<body onload="initDataServices();initTService();">
	<div id="main" class="header" style="height: 2200px;width:90%;margin:auto;padding:0;">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a>
			</li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a>
			</li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a>
			</li>
			<li class="ls"><a
				href="index/core/create_mashup_traditional.jsp">常见问题</a>
			</li>
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a>
			</li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a>
			</li>
			<%
				if (session.getAttribute("username") == null
						&& session.getAttribute("adminname") == null) {
			%>
			<li class="lssss"><a href="login.jsp">登录</a>
			</li>
			<li class="lsss"><a href="signup.jsp">注册</a>
			</li>
			<%
				} else {
			%>
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a>
			</li>
			<li class="lssss"><a href="logout.jsp">退出</a>
			</li>
			<%
				}
			%>
		</ul>

		<div id="bd">
			<div class="docs_api_main">
				<div class="api_data">
					<div class="api_data_img a8"
						style="background: url(index/images/data/doc_data.png) center center no-repeat;">

					</div>
					<div class="api_data_info">
						<%--    ${app.name} ${app} ${app.name} --%>
						<h2>${app.name}</h2>
						<ul>
							<li><div style="width: 108px; float: left">数据类型：</div> <span
								class="info_value">${app.appcategory}</span>
							</li>
							<li><div style="width: 108px; float: left">接口状态：</div> <span
								class="info_value"><span style="color: green;">${app.state==1?"正常":"非正常"}</span>
							</span>
							</li>
							<!--<li><div style="width:108px; float:left">更新周期：</div><span class="info_value">每天</span></li> -->
							<li><div style="width: 108px; float: left">已连接App的数量：</div>
								<span class="info_value">${app.num}</span>
							</li>
							<li><div style="width: 108px; float: left">描述：</div>
								<h1 class="info_value">${app.description}</h1>
							</li>
						</ul>
					</div>
					<div class="api_data_btns">
						<a class="api_newbtn_apply" href="APIServlet?method=addapi&dtname=${app.tname}&appid=${app.id}" title="申请 APPKEY">申请数据</a>
						<a class="api_newbtn_demo" href="APIServlet?method=mybox&dtname=${app.tname}" target="_blank">接口调用</a>
					</div>
					<div class="clear"></div>

				</div>
			</div>

			<div class="docs_api_tab">
				<ul class="tabul">
					<li id="apilists" style="color: #39C">API</li>
					<li id="errorcode">错误码参照</li>
					<li id="apiprice">API请求限制</li>
					<li id="update">更新记录</li>
					<li id="sdkandqa">SDK与常见问题</li>
					<li id="ucomments">用户评价</li>
					<li id="apicontact">其他相关</li>
				</ul>
				<div class="clear"></div>
			</div>

			<div class="docs_api_show" rel="sdkandqa" style="display: none">
				<div class="fullsimpleline">
					<strong>SDK下载中心：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table" id="sdk_table">

					</table>
				</div>
				<div class="fullsimpleline">
					<strong>常见问题：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td>内容</td>
							<td>详细</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url" width="200">常见问题:</td>
							<td class="url"><a
								href="index/core/create_mashup_traditional.jsp" class="blue"
								target="_blank">http://www.ctdss.cn/questions</a>
							</td>
						</tr>
					</table>
				</div>

			</div>

			<div class="docs_api_show" rel="apicontact" style="display: none">
				<div class="fullsimpleline">
					<strong>其他相关内容：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td>内容</td>
							<td>详细</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">接口测试:</td>
							<td class="text"><a href="APIServlet?method=mybox&dtname=${app.tname}" class="blue"
								target="_blank">API测试工具</a>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">技术支持:</td>
							<td class="url"><a href="javascript:void(0);">北方工业大学云计算中心</a>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">QQ交流群:</td>
							<td class="url">168712265</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">合作QQ:</td>
							<td class="url"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1481251591&amp;site=qq&amp;menu=yes"><img src="http://wpa.qq.com/pa?p=2:7073464:42" title="点这里咨询" alt="点这里咨询" border="0">1481251591</a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">合作邮箱:</td>
							<td class="url">mrmote@qq.com</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">联系电话:</td>
							<td class="url">18811756877</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="docs_api_show" rel="ucomments" style="display: none">
				<div class="fullsimpleline">
					<strong>用户评价：</strong>
					<div style="float:right;">
					<!-- Baidu Button BEGIN -->
<div id="bdshare" class="bdshare_b" style="line-height: 12px; text-align:center;">
<img src="http://bdimg.share.baidu.com/static/images/type-button-1.jpg?cdnversion=20120831" />
</div>
<script type="text/javascript" id="bdshare_js" data="type=button&amp;uid=6558445" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date() / 3600000);
</script>
<!-- Baidu Button END -->
					</div>
				</div>
				
				<div class="fullsimplearea" style="margin-top:50px;">
				
<div class="yellow_prom mt20">不是我要找的数据？<input type="button" value="申请数据定制" onclick="factory(this.value);" class="inp_btn5 mr5 ml10" /><div class="r"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1481251591&amp;site=qq&amp;menu=yes"><img src="http://wpa.qq.com/pa?p=2:7073464:42" title="点这里咨询" alt="点这里咨询" border="0"></a><span class="ml10" style="position:relative; top:-5px;">&nbsp;&nbsp;CTDSS技术交流群：168712265</span></div></div>
<div class="order_info">
</div>
					<div class="data_commb" style="height:230px;width:70%;">
		<p class="fs14 fc_gray3 data_prod">数据评价</p>
	<div class="data_commbox clearfix">
<div class="data_lcomm clearfix">
<div class="data_per">
<p>0%</p>
<span>好评度</span>
</div>
<div class="data_r">
<p>好评<span class="data_commline vam"><span id="good" style="width:0%"></span></span>0%</p>
<p>中评<span class="data_commline vam"><span style="width:0%"></span></span>0%</p>
<p>差评<span class="data_commline vam"><span style="width:100%"></span></span>100%</p>
</div>
</div>
<div class="data_rcomm">
<a href="#" target="_blank" class="comm_inte mt10 mb10" style="">发表评价</a>
<p style="color: #E3AA8B">前三位评价用户可获得双倍积分</p>

</div>
</div>
</div>
<div id="comment" class="mt20 ui-tabs ui-widget ui-widget-content ui-corner-all">
<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="ui-tabs-2" aria-labelledby="ui-id-3" aria-selected="true"><a href="#" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">全部评价(1)</a></li>
<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="ui-tabs-3" aria-labelledby="ui-id-4" aria-selected="false"><a href="#" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4">好评(0)</a></li>
<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="ui-tabs-4" aria-labelledby="ui-id-5" aria-selected="false"><a href="#" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-5">中评(0)</a></li>
<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="ui-tabs-5" aria-labelledby="ui-id-6" aria-selected="false"><a href="#" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-6">差评(1)</a></li>
</ul>
</div>
				</div>
			</div>

			<div class="docs_api_show" rel="update" style="display: none">
				<div class="fullsimpleline">
					<strong>更新动态：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td>内容</td>
							<td>时间</td>
						</tr>
						<tr>
							<td colspan="2" align="center" height="30">暂无该数据的更新记录！</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</div>

			</div>


			<div class="docs_api_show" rel="apiprice" style="display: none">
				<div class="fullsimpleline">
					<strong>《${app.name}》资费说明：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td>等级</td>
							<td>积分(个/月)</td>
							<td>请求限制(次/天)</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url" width="200">Lv0</td>
							<td class="url" width="200">5&nbsp;&nbsp;</td>
							<td class="url">5&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">Lv1</td>
							<td class="url">20&nbsp;&nbsp;</td>
							<td class="url">20&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">Lv2</td>
							<td class="url">100&nbsp;&nbsp;</td>
							<td class="url">100&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">Lv3</td>
							<td class="url">300&nbsp;&nbsp;</td>
							<td class="url">500&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">Lv4</td>
							<td class="url">500&nbsp;&nbsp;</td>
							<td class="url">1000&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>

			</div>

			<div class="docs_api_show" rel="errorcode" style="display: none">
				
				
				<div class="fullsimpleline">
					<strong>系统级错误码参照：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td width="200">错误码</td>
							<td>说明</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10001</td>
							<td class="text">错误的请求KEY</td>
							
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10002</td>
							<td class="text">该KEY无请求权限</td>
							
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10003</td>
							<td class="text">KEY不存在或过期</td>
							
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10004</td>
							<td class="text">应用未审核超时，请提交认证</td>
							
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10005</td>
							<td class="text">未知的请求源</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10006</td>
							<td class="text">被禁止的KEY</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10007</td>
							<td class="text">请求超过次数限制</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10008</td>
							<td class="text">测试KEY超过请求限制</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10009</td>
							<td class="text">接口维护</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10010</td>
							<td class="text">接口停用</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">10011</td>
							<td class="text">重复申请资源</td>
						</tr>
					</table>
				</div>
				
				
				
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td width="200">错误码</td>
							<td>说明</td>
							<!--<td width="150">对应旧版本（resultcode）</td>-->
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">200801</td>
							<td class="text">错误的LAC或CELLID</td>
							<!--<td class="url">201</td>-->
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="url">200803</td>
							<td class="text">查询不到该信息</td>
							<!--<td class="url">203</td>-->
						</tr>
					</table>
				</div>

				<div class="fullsimpleline">
					<strong>错误码格式说明（示例：200201）：</strong>
				</div>
				<div class="fullsimplearea">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="api_table">
						<tr class="title">
							<td width="40">&nbsp;</td>
							<td>2</td>
							<td>002</td>
							<td>01</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="text" width="200">服务级错误（1为系统级错误）</td>
							<td class="text" width="200">服务模块代码(即数据ID)</td>
							<td class="text">具体错误代码</td>
						</tr>
					</table>
				</div>

			</div>

			<div class="docs_api_show" rel="apilists">
				<div class="das_left">
					<ul>
							<c:forEach var="child" items="${children}">
								<li ><a style="display:block;cursor:pointer; float:left"  title="根据地铁线路查询其站点接口" class="apisel"  onclick="getbyname('${child.param}','${child.tname}')" >1、${child.name}</a>
                	                                        <div class="clear"></div>
                                </li>
							</c:forEach>
					</ul>
				</div>
				<div class="das_right">
					<div class="simpleline">
						<strong>接口地址：</strong><span id="apiaddress" class="url">${app.apiaddress}</span>
					</div>
					<div class="simpleline">
						<strong>支持格式：</strong><span class="url">JSON/XML</span>
					</div>
					<div class="simpleline">
						<strong>请求方式：</strong><span class="url">GET</span>
					</div>
					<div class="simpleline">
						<strong>请求示例：</strong><span id="apiexample" class="url">${app.apiexample}</span>
					</div>

					<div class="simpleline">
						<strong>请求参数：</strong>
					</div>
					<div class="simplearea">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							align="center" class="api_table">
							<tr class="title">
								<td width="40">&nbsp;</td>
								<td width="80">名称</td>
								<td width="60">类型</td>
								<td width="50">必填</td>
								<td>说明</td>
							</tr>
							
							<tr>
								<td>&nbsp;</td>
								<td class="url">dtype</td>
								<td class="url">string</td>
								<td class="text">否</td>
								<td class="text">返回的数据格式：json/xml</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="url">key</td>
								<td class="url">string</td>
								<td class="text">是</td>
								<td class="text">APPKEY</td>
							</tr>

						</table>
					</div>

					<div class="simpleline">
						<strong>调用样例及调试工具：</strong>
					</div>
					<div class="simplearea">
						<a href="APIServlet?method=mybox&dtname=${app.tname}" target="_blank">&nbsp;&nbsp;API测试工具&nbsp;<img
							src="images/testlink.png" border="0" width="30" height="30"> </a>
					</div>

					<div class="simpleline">
						<strong>返回字段：</strong>
					</div>
					<div class="simplearea">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="api_table" id="parmnote">
							<tr class="title">
								<td width="40">&nbsp;</td>
								<td>名称</td>
								<td>类型</td>
								<td>说明</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="url">error_code</td>
								<td class="url">int</td>
								<td class="text">返回码</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="url">reason</td>
								<td class="url">string</td>
								<td class="text">返回说明</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="url">result</td>
								<td class="url">-</td>
								<td class="text">返回结果集</td>
							</tr>
							<%Apps app1=new Apps();
							app1=(Apps)session.getAttribute("app");
							String value1=null;
							String value2=null;
							String key=null;
							if(app1!=null){
								for (Entry<String, String> entry:app1.getAddressMap().entrySet()) 
								{key = entry.getKey();
								
								String[] values = entry.getValue().split("/");
								value1=values[0];
								value2=values[1]; 
								%>
								<tr>
								<td>&nbsp;</td>
								<td class="url"><%=key%></td>
								<td class="url"><%=value1%></td>
								<td class="text"><%=value2%></td>
							    </tr>
							<% }%>
							<%}%>
							
						</table>
					</div>


					<div class="simpleline">
						<strong>JSON返回示例：</strong>
					</div>
					<div class="simplearea">
						<pre>
					${app.retexampjson}
						</pre>
					</div>
					<div class="simpleline">
						<strong>XML返回示例：</strong>
					</div>
					<div class="simplearea">
						<pre>
						<c:out value="${app.retexampxml}" default="expression" escapeXml="true"/>
 					</pre>
					</div>
					<div class="simpleline">
						<strong>备注：</strong>
					</div>
					<div class="simplearea"></div>
				</div>
			</div>
			<!-------Footer-------->
			<div class="clearfix"></div>
			<div class="footer">

			</div>
		</div>
		<!--/#bd -->

	</div>
	<!--/#doc -->
</body>
<script type="text/javascript">
	var param1,tname1;
		function getbyname(param,tname){
			param1=param;
			tname1=tname;
			var url = "BrowseServlet?cmd=getbypname&param="+param;
			  if (window.XMLHttpRequest) { 
			    req = new XMLHttpRequest(); 
			  }else if (window.ActiveXObject){ 
			    req = new ActiveXObject("Microsoft.XMLHTTP"); 
			  } 
			  if(req){ 
			     req.open("GET",url, true); 
			     req.onreadystatechange = getbypnaming; 
			     req.send(null); 
			  }  
		}
		function getbypnaming(){
			if (req.readyState == 4) { 
			  if (req.status == 200) { 
				  //document.getElementById('main2').innerHTML = req.responseText; 
				  var data = req.responseText; 
				  var datajson= eval('(' + data + ')');
				  $("#apiaddress").html(datajson.apiaddress);
				  $("#apiexample").html(datajson.apiexample);
// 				  var parm1=jQuery.makeArray(datajson.parms[0]);
 				  for(var i=0;i<datajson.parms.length;i++){
 					  //var parmkeyhh="parmkey"+eval(i+1);
 					  // alert(parmkeyhh);
					  //alert(parmkey);
 					 //alert(datajson.parms[i].parmkey1 +"   " +datajson.parms[i].parmvalue1);
 					 var key=datajson.parms[i].parmkey1;
 					 var values=datajson.parms[i].parmvalue1.split("/");
				 $("#parmnote").after("<tr><td>&nbsp;</td><td class='url'>").after(key).after("</td><td class='url'>").after(values[0]).after("</td><td class='text'>").after(values[1]).after("</td></tr>");
				 // 				 +$("#parmnote").append("<tr><td>&nbsp;</td><td class='url'>'+datajson.parms[i].parmkey1+'</td><td class='url'>datajson.parms[i].parmkey1</td><td class='text'>key</td></tr>");
 				  }
				  //alert(datajson.parms[0].parmkey1);
				  //alert(datajson.parms[1].parmkey2);
// 				  var parm1=(datajson.parms[0]).toArray();
				  var ahref="APIServlet?method=myboxp&dtname="+tname1+"&param="+param1;
				  $(".api_newbtn_demo").attr("href",ahref);
// 				  alert($(".api_newbtn_demo").attr("href"));
			  }
			}
		}
</script>
</html>

