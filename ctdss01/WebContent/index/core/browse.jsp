<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="stylesheet" type="text/css" href="test/docsnew.css">
	
	<style type="text/css">
	
	</style>
	<script type="text/javascript" src="index/js/prototype.js"></script>
	<script type="text/javascript" src="test/jquery.min.js"></script>
    <title>城市交通数据服务空间</title>
</head>
<body onload="initDataServices();initTService();"> 
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss" ><a href="index/core/myindex.jsp">首页</a></li>
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
	<!-- <div id="leftbrowsediv1">
         	<div class="bbd">Browse by Domain</div>
         	<div class="servicetype"><ul id="topnav1"></ul></div>	
        </div> /#leftbrowsediv  
		<div id="leftbrowsediv2">
			<div id ="biankuang1">
				<div id ="biankuang2">
					<br>
					<div id="dds">&nbsp;Discover Data Services</div>
					<br>
					<div class="searchdata">
						<input name="searchdata" type="text" id="searchInputdata" onfocus="qk()" onblur="mr()" value="Search data service name,or description">
						<strong>&nbsp;&nbsp;in&nbsp;&nbsp;</strong>
						<select name="selectDomain" id="selectDomain">
						  <option selected>Domain</option>
						  <option>Any Domain</option>
					    </select>
			        	<strong>&nbsp;&nbsp;Sort&nbsp;by&nbsp;&nbsp;</strong>
						<select name="selectRelevance" id="selectRelevance">
							<option selected>Relevance</option>
							<option>Created by</option>
							<option>Created on</option>
							<option>Last Updated</option>
							<option>Update Frequency</option>
							<option>Response Time</option>
							<option>Total Rows</option>
							<option>Data Volumn</option>
						</select> 
					</div>/#searchdata 
					<br>
					<div class="exampledata">
						Examples:
						<a class="navlink" href="javascript:findExamples('Publichealth Emergency')">Publichealth Emergency &nbsp;&nbsp;</a>
						<a class="navlink" href="javascript:findExamples('Medical treatment')">Medical treatment</a>
					</div>
					<br>
					<div class="searchdata">
						Only show data services owned by user
						<input type="text" name="showuser" id="showuser">
					</div>
					<div class="searchbutton">
						<a class="navlink" href="javascript:reset()"><b>Reset</b></a>
						<input type="button" name="finddata" value="Find Data Services" onClick="findDataServices()" >
					</div>
				</div>
			</div>
		</div> -->
		 <!--/#leftbrowsediv --> 
<!--         <div id="leftbrowsediv1"> -->
<!--          	<div class="bbd">分类浏览</div> -->
<!--          	<div class="servicetype"><ul id="topnav1"></ul></div>	 -->
<!--         </div> /#leftbrowsediv   -->
<!-- 		<div id="leftbrowsediv2"> -->
<!-- 			<div id ="biankuang1"> -->
<!-- 				<div id ="biankuang2"> -->
<!-- 					<br> -->
<!-- 					<div id="dds">&nbsp;浏览数据服务</div> -->
<!-- 					<br> -->
<!-- 					<div class="searchdata"> -->
<!-- 						<input name="searchdata" type="text" id="searchInputdata" onfocus="qk()" onblur="mr()" value="Search data service name,or description"> -->
<!-- 						<strong>&nbsp;&nbsp;in&nbsp;&nbsp;</strong> -->
<!-- 						<select name="selectDomain" id="selectDomain"> -->
<!-- 						  <option selected>区域</option> -->
<!-- 						  <option>任何区域</option> -->
<!-- 					    </select> -->
<!-- 			        	<strong>&nbsp;&nbsp;Sort&nbsp;by&nbsp;&nbsp;</strong> -->
<!-- 						<select name="selectRelevance" id="selectRelevance"> -->
<!-- 							<option selected>相关度</option> -->
<!-- 							<option>被谁创建</option> -->
<!-- 							<option>创建时间</option> -->
<!-- 							<option>最后修改时间</option> -->
<!-- 							<option>更新频率</option> -->
<!-- 							<option>响应时间</option> -->
<!-- 							<option>总行数</option> -->
<!-- 							<option>数据列数</option> -->
<!-- 						</select>  -->
<!-- 					</div>/#searchdata  -->
<!-- 					<br> -->
<!-- 					<div class="exampledata"> -->
<!-- 						Examples: -->
<!-- 						<a class="navlink" href="javascript:findExamples('Publichealth Emergency')">Publichealth Emergency &nbsp;&nbsp;</a> -->
<!-- 						<a class="navlink" href="javascript:findExamples('Medical treatment')">Medical treatment</a> -->
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<div class="searchdata"> -->
<!-- 						Only show data services owned by user -->
<!-- 						<input type="text" name="showuser" id="showuser"> -->
<!-- 					</div> -->
<!-- 					<div class="searchbutton"> -->
<!-- 						<a class="navlink" href="javascript:reset()"><b>重填</b></a> -->
<!-- 						<input type="button" name="finddata" value="查询" onClick="findDataServices()" > -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> /#leftbrowsediv  -->

		<div>
		<div style="margin-left:100px;">
			<ul>
			<li style="list-style:lower-roman;width: 300px;height:10px;color: gray;">目前仅有北京、上海，其他城市数据持续更新...</li>
			<li style="list-style:lower-roman;width: 300px;height:10px;color: gray; margin-top:10px;">在地图上点击城市名进行数据服务的查询</li>
			</ul>
		</div>
	    <div id="query" style="display:none;"><img src="<%=basePath%>images/china.jpg" alt="网站地图" width="530" height="453" border="0" usemap="#Map" />
	    	
	      <map name="Map" id="Map">
			<area shape="rect" coords="373,159,391,169"  onclick="initDataServicesByCtid('bj')"  alt="北京市"/>
            <area shape="rect" coords="421,267,440,278" onclick="initDataServicesByCtid('sh')" alt="上海市"/>
          </map>
	    </div>
	    
		<div id="kong" style="height: 140px;width:500px; top: 170px;" id="trigger">
<!-- 		<div id="kong" style="float:left;height: 453px;width:200px; top: 170px;margin-top: -400px;" id="trigger"> -->
	 	<!--浮动框-->
		 <div id="out">
			   <div id="tit">-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br></div>
			   <div class="right" >
			  		<p class="words_no_link" id="t">展<br>开<br>搜<br>索<br>框</p>
			   </div>
		 </div>
		</div>
		
		</div>

		
		<br>
		<div id='content'></div><!--/#content -->
		
		
		<div id="docs-main">
<!--     	<div style="height:30px; widows:100%"></div> -->
		<div id="main2">
			
            
		</div>
	
	</div><!--/#docs-main --> 
	
	</div><!--/#bd --> 
           
 </div><!--/#doc -->
</body>
<script type="text/javascript">
function initDataServices(){
	  var url = "BrowseServlet?cmd=init";
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
		  
		     /* theTable = document.getElementById("table2");
		     totalPage = document.getElementById("spanTotalPage");
		     pageNum = document.getElementById("spanPageNum");

		     spanPre = document.getElementById("spanPre");
		     spanNext = document.getElementById("spanNext");
		     spanFirst = document.getElementById("spanFirst");
		     spanLast = document.getElementById("spanLast");

		     numberRowsInTable = theTable.rows.length; */
		     

		    
	  }
	}
}
function initDataServicesByCtid(ctid){
	  var url = "BrowseServlet?cmd=initbycid&cid="+ctid;
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("GET",url, true); 
	     req.onreadystatechange = initcompletebyctid; 
	     req.send(null); 
	  } 
	} 

function initcompletebyctid(){
	if (req.readyState == 4) { 
	  if (req.status == 200) { 
		  document.getElementById('main2').innerHTML = req.responseText; 
	  }
	}
}

$(document).ready(function(){
    $("#out").click(function(){
		//alert("hh");
		if($("#query").css("display")=="none"){
			$("#query").css({display:"block"});
			$("#t").html("关<br>闭<br>搜<br>索<br>框");
		}else{
			$("#query").css({display:"none"});
			$("#t").html("打<br>开<br>搜<br>索<br>框");
		}
		
	})
});

</script>
</html>

