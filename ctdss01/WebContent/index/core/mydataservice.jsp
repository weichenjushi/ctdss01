<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>
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
    <title>My Data Service</title>
</head>
<body onload="initMyDataServices();initTService();">    
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a></li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a></li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a></li>
			<!-- <li class="l"><a><span>创建数据源</span></a>
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
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
			<li class="lssss"><a href="logout.jsp">退出</a></li>
			<%} %>
		</ul>

	<div id="bd">
		<div id="leftbrowsediv1"> 
			<div class="bbd">Browse by Domain</div>
			<div class="servicetype"><ul id="topnav1"></ul></div>	
		</div> <!--/#leftbrowsediv --> 
		  
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
					</div><!--/#searchdata --> 
					<br>
					<div class="exampledata">
						Examples:
						<a class="navlink" href="javascript:findExamples('Publichealth Emergency')">Publichealth Emergency &nbsp;&nbsp;</a>
						<a class="navlink" href="javascript:findExamples('Medical treatment')">Medical treatment</a>
					</div>
					<br>
					<div class="searchbutton">
						<a class="navlink" href="javascript:reset()"><b>Reset</b></a>
						<input type="button" name="finddata"  class="buttoncss" value="Find Data Services" onClick="findDataServices()" >
					</div>
				</div>
			</div>
		</div> <!--/#leftbrowsediv --> 
		<br>	
		<div id='content'></div> 
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
        document.getElementById("topnav1").innerHTML += "<li><a class=\"navlink\" href=\"javascript:findDomain('"+types[0]+"')\">"+types[0]+"</a><span class=\"attibutenumCSS\">("+types[1]+")&nbsp;&nbsp;&nbsp;</span></li>";
//         if(num%10==0)
//         {
//         	document.getElementById("topnav1").innerHTML += "<br>";
//         }
    }
  }
function initMyDataServices(){
	  var url = "myDataServiceServlet/myDataService?cmd=init";	 
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
	  var checked=false;
	  var url = "myDataServiceServlet/myDataService?cmd=initT&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&checked="+checked;
	  if (window.XMLHttpRequest) { 
	    reqt = new XMLHttpRequest(); 
	  }else if (window.ActiveXObject){ 
	    reqt = new ActiveXObject("Microsoft.XMLHTTP"); 
	  } 
	  if(req){ 
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


function findDataServices(){
	  var searchInputdata =document.getElementById("searchInputdata").value;
	  var selectDomain =document.getElementById("selectDomain").value;
	  var selectRelevance =document.getElementById("selectRelevance").value;
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
	 var url = "myDataServiceServlet/myDataService?cmd=find&searchInputdata="
			 +searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="
			 +selectRelevancedata+"&checked="+checked;
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

function reset(){
	document.getElementById("checkbox").checked=false;
	document.getElementById("searchInputdata").value="Search data service name,or description";
	document.getElementById("selectDomain").value="Domain";
	document.getElementById("selectRelevance").value="Relevance";
	document.getElementById("showuser").value="";
	var searchInputdata ="Search data service name,or description";
	var selectDomain =domain;
	var selectRelevance ="Relevance";
	var showuser ="";
	var checked=false;
	var url = "myDataServiceServlet/myDataService?cmd=reset&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&showuser="+showuser+"&checked="+checked;
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

function removeDataServices(id){
	var url = "myDataServiceServlet/myDataService?cmd=remove&id="+id;
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