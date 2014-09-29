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
    <title>城市交通数据服务空间</title>
</head>
<body onload="initDataServices();initTService();"> 
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

	<div id="bd">
		<div id="docs-main">
    	<div style="height:30px; widows:100%"></div>
		<div id="main">
			<!--  <div class="ur-title">
       			<a class="appTitlea">我的数据>>按需资费数据</a>
            	
        	</div>
            <div class="linestyle">
            	<table width="98%" border="0" cellspacing="0" cellpadding="0" class="api_tb">
		          <tr class="tr_title" id="demand">
		            <td class="td_bottom_line"><strong>序号</strong></td>
		            
		            <td class="td_bottom_line"><strong>数据</strong></td>
                    <td class="td_bottom_line" style="text-indent:0"><strong>审核认证</strong>&nbsp;<a href="javascript:void(0)" title='通过聚合官方的认证，数据通过审核认证可以获得一定的奖励'><img src="/themes/images/questionico.gif" align="absmiddle" width=16 height=16 border="0" alt="通过聚合官方的认证，数据通过审核认证可以获得一定的奖励"></a></td>
                    <td class="td_bottom_line"><strong>套餐等级</strong></td>
                    <td class="td_bottom_line"><strong>剩余次数</strong></td>
		            <td class="td_bottom_line">&nbsp;</td>
		            <td class="td_bottom_line"><strong>操作</strong></td>
		          </tr>
                                    
                  <tr class="bgcolor">
                  	<td colspan="7">&nbsp;</td>
                  </tr>
                </table>  
            </div> -->
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
		          <!--   &nbsp;<a href="/my/appinfo/id/26835" title="查看KEY" >查看</a> -->
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
<script language="javascript">
var theTable;
var totalPage;
var pageNum ;

var spanPre;
var spanNext;
var spanFirst;
var spanLast;

var numberRowsInTable;
var pageSize = 8;
var page = 1;

function qk()
{
	var searchInputdata =document.getElementById("searchInputdata").value;
	if(searchInputdata=="Search data service name,or description"){
		document.getElementById("searchInputdata").value="";
	} 

}
function mr()
{
	var searchInputdata =document.getElementById("searchInputdata").value;
	if(searchInputdata==""){
		document.getElementById("searchInputdata").value="Search data service name,or description";
	} 

}
function select_list(domainmap) {
	document.getElementById("topnav1").innerHTML = "";
    var domain = document.getElementById("selectDomain");
	domain.innerHTML=""; 
	domain.options.add(new Option("Domain","Domain"));
	domain.options.add(new Option("Any Domain","Any Domain"));
    var domains = domainmap.split("##%%");
//     var num = 0;
    for(var j=0;j<domainmap.length-1;j++){
    	var types = domains[j].split(",");
        var option = document.createElement("option");
        option.value = types[0];
        option.innerHTML = types[0];
        domain.appendChild(option);
//         num++;
        document.getElementById("topnav1").innerHTML += "<li><a class=\"navlink\" href=\"javascript:findDomain('"+types[0]+"')\">"+types[0]+"</a><span class=\"attibutenumCSS\">("+types[1]+")&nbsp;&nbsp;&nbsp;</span></li>"
//         if(num%10==0)
//         {
//         	document.getElementById("topnav1").innerHTML += "<br>";
//         }
    }
  }
function initDataServices(){
	  var url = "browseServlet/browse?cmd=init";
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("post",url, true); 
	     req.onreadystatechange = initcomplete; 
	     req.send(null); 
	  } 
	} 

function initcomplete(){
	if (req.readyState == 4) { 
	  if (req.status == 200) { 
		  document.getElementById('content').innerHTML = req.responseText; 
		  
		     theTable = document.getElementById("table2");
		     totalPage = document.getElementById("spanTotalPage");
		     pageNum = document.getElementById("spanPageNum");

		     spanPre = document.getElementById("spanPre");
		     spanNext = document.getElementById("spanNext");
		     spanFirst = document.getElementById("spanFirst");
		     spanLast = document.getElementById("spanLast");

		     numberRowsInTable = theTable.rows.length;

		    hide();	  
	  }
	}
}

function initTService(){
	  var searchInputdata ="Search data service name,or description";
	  var selectDomain ="Domain";
	  var selectRelevance ="Relevance";
	  var showuser ="";
	  var checked=false;
	  var url = "browseServlet/browse?cmd=initT&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&showuser="+showuser+"&checked="+checked;
	  if (window.XMLHttpRequest) { 
	    reqt = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    reqt = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(reqt){ 
	     reqt.open("post",url, true); 
	     reqt.onreadystatechange = initTcomplete; 
	     reqt.send(null); 
	  } 
	} 

function initTcomplete(){
	if (reqt.readyState == 4) { 
	  if (reqt.status == 200) { 
		  var domainmap = reqt.responseText;
		  select_list(domainmap);
	  }
	}
}
function check(){
	var checked=document.getElementById("checkbox").checked;
	atomicChecked(checked);	
}	
	
	
function removeDataServices(id){
	var url = "browseServlet/browse?cmd=remove&id="+id;
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("post",url, true); 
	     req.onreadystatechange = removecomplete; 
	     req.send(null); 
	  } 
	} 

function removecomplete(){
	if (req.readyState == 4) { 
	  if (req.status == 200) { 
		  var row=document.getElementById(req.responseText);    
		    var index=row.rowIndex;//rowIndex属性为tr的索引值，从0开始   
		    theTable.deleteRow(index);//从table中删除
			numberRowsInTable = theTable.rows.length;
			initTService();
	  }
	}
	}


function findDataServices(){
	  var searchInputdata =document.getElementById("searchInputdata").value;
	  var selectDomain =document.getElementById("selectDomain").value;
	  var selectRelevance =document.getElementById("selectRelevance").value;
	  var showuser =document.getElementById("showuser").value;
	  var checked = false;	
	  var selectRelevancedata;
	  if(selectRelevance=="Relevance"){
			 selectRelevancedata = "Relevance";
		}else if(selectRelevance=="Created by"){
			 selectRelevancedata = "createdby";
		}else if(selectRelevance=="Created on"){
			 selectRelevancedata = "createdon";
		}else if(selectRelevance=="Last Updated"){
			 selectRelevancedata = "lastupdated";
		}else if(selectRelevance=="Update Frequency"){
			 selectRelevancedata = "updatefrequency";
		}else if(selectRelevance=="Response Time"){
			 selectRelevancedata = "responsetime";
		}else if(selectRelevance=="Total Rows"){
			 selectRelevancedata = "totalrows";
		}else if(selectRelevance=="Data Volumn"){
			 selectRelevancedata = "datavolumn";
		}

	  var url = "browseServlet/browse?cmd=find&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevancedata+"&showuser="+showuser+"&checked="+checked;
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("post",url, true); 
	     req.onreadystatechange = findcomplete; 
	     req.send(null); 
	  } 

	} 
	
function findDomain(domain)
{
	 var searchInputdata ="Search data service name,or description";
	  var selectDomain =domain;
	  var selectRelevance ="Relevance";
	  var showuser ="";
	  var checked=false;
	  var url = "browseServlet/browse?cmd=find&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&showuser="+showuser+"&checked="+checked;
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("GET",url, true); 
	     req.onreadystatechange = findcomplete; 
	     req.send(null); 
	  } 
}

function findExamples(Example)
{
	document.getElementById("searchInputdata").value=Example;
	 var searchInputdata =Example;
	  var selectDomain ="Domain";
	  var selectRelevance ="Relevance";
	  var showuser ="";
	  var checked=false;
	  var url = "myDataServiceServlet/myDataService?cmd=find&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&showuser="+showuser+"&checked="+checked;
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("post",url, true); 
	     req.onreadystatechange = findcomplete; 
	     req.send(null); 
	  } 
	
	}
	
function findcomplete(){
	if (req.readyState == 4) { 
	  if (req.status == 200) { 
	    document.getElementById('content').innerHTML=req.responseText;   
	     theTable = document.getElementById("table2");
	     totalPage = document.getElementById("spanTotalPage");
	     pageNum = document.getElementById("spanPageNum");

	     spanPre = document.getElementById("spanPre");
	     spanNext = document.getElementById("spanNext");
	     spanFirst = document.getElementById("spanFirst");
	     spanLast = document.getElementById("spanLast");

	     numberRowsInTable = theTable.rows.length;

	    hide();
	    
	  }
	}
	}
	
function reset(){
	document.getElementById("checkbox").checked=false;
	document.getElementById("searchInputdata").value="Search data service name,or description";
	document.getElementById("selectDomain").value="Domain";
	document.getElementById("selectRelevance").value="Relevance";
	document.getElementById("showuser").value="";
	 document.getElementById('content').innerHTML=""; 
	
}


function atomicChecked(checked){
	var searchInputdata =document.getElementById("searchInputdatahidden").value;
	  var selectDomain =document.getElementById("selectDomainhidden").value;
	  var selectRelevance =document.getElementById("selectRelevancehidden").value;
	  var showuser =document.getElementById("showuserhidden").value;
	var url = "myDataServiceServlet/myDataService?cmd=atomicchecked&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&showuser="+showuser+"&checked="+checked;
	  if (window.XMLHttpRequest) { 
	    req = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    req = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
	     req.open("post",url, true); 
	     req.onreadystatechange = findcomplete; 
	     req.send(null); 
	  } 
}


//下一页
function next() {

    hideTable();
    
    currentRow = pageSize * page;
    maxRow = currentRow + pageSize;
    if ( maxRow > numberRowsInTable ) maxRow = numberRowsInTable;
    for ( var i = currentRow; i< maxRow; i++ ) {
        theTable.rows[i].style.display = '';
    }
    page++;
    
    if ( maxRow == numberRowsInTable )  { nextText(); lastText(); }
    showPage();
    preLink();
    firstLink();
}

//上一页
function pre() {
    hideTable();   
    page--;    
    currentRow = pageSize * page;
    maxRow = currentRow - pageSize;
    if ( currentRow > numberRowsInTable ) currentRow = numberRowsInTable;
    for ( var i = maxRow; i< currentRow; i++ ) {
        theTable.rows[i].style.display = '';
    }
    
    
    if ( maxRow == 0 ) { preText(); firstText(); }
    showPage();
    nextLink();
    lastLink();
}

//First Page
function first() {
    hideTable();
    page = 1;
    for ( var i = 0; i<pageSize; i++ ) {
        theTable.rows[i].style.display = '';
    }
    showPage();
    firstText();
    preText();
    nextLink();
    lastLink();
}

//最后一页
function last() {
    hideTable();
    page = pageCount();
    currentRow = pageSize * (page - 1);
    for ( var i = currentRow; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = '';
    }
    showPage();   
    preLink();
    nextText();
    firstLink();
    lastText();
}

function hideTable() {
    for ( var i = 0; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = 'none';
    }
}

function showPage() {
    pageNum.innerHTML = page;
}

//总共页数
function pageCount() {
    var count = 0;
    if ( numberRowsInTable%pageSize != 0 ) count = 1; 
    return parseInt(numberRowsInTable/pageSize) + count;
}

//显示链接
function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>Previous Page</a>"; }
function preText() { spanPre.innerHTML = "Previous Page"; }

function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>Next Page</a>"; }
function nextText() { spanNext.innerHTML = "Next Page"; }

function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>First Page</a>"; }
function firstText() { spanFirst.innerHTML = "First Page"; }

function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>Last Page</a>"; }
function lastText() { spanLast.innerHTML = "Last Page"; }

//隐藏表格
function hide() {
    for ( var i = pageSize; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = 'none';
    }
    
    totalPage.innerHTML = pageCount();
    pageNum.innerHTML = '1';
    if((numberRowsInTable>pageSize)&&(pageCount()>page)){
    	nextLink();
   	    lastLink();
   }
}
</script>
</html>

