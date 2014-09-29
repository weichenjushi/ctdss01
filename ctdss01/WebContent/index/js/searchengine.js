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
var theTable;
var totalPage;
var pageNum ;

var spanPre;
var spanNext;
var spanFirst;
var spanLast;

var numberRowsInTable;
var pageSize = 10;
var page = 1;
function initDataServices(){
	  var searchInputdata ="Search data service name,or description";
	  var selectDomain ="Domain";
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

function check(){
	var checked=document.getElementById("checkbox").checked;
	atomicChecked(checked);	
}	

function removeDataServices(id) {
	var url = "browseServlet/browse?cmd=remove&id=" + id;
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			XMLHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
		} catch (e) {
			try {
				XMLHttpReq = new ActiveXObject("Mircsoft.XMLHTTP");
			} catch (e1) {
			}
		}
	}

	if (req) {
		req.open("GET", url, true);
		req.onreadystatechange = removecomplete;
		req.send(null);
	}
} 

function removecomplete(){
	if (req.readyState == 4) { 
	  if (req.status == 200) { 
		  var row=document.getElementById(req.responseText);    
		  var index=row.rowIndex; 
		  theTable.deleteRow(index);
		  numberRowsInTable = theTable.rows.length;
	    
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
	     req.open("GET",url, true); 
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

function reset(){
	document.getElementById("checkbox").checked=false;
	document.getElementById("searchInputdata").value="";
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
	var url = "browseServlet/browse?cmd=atomicchecked&searchInputdata="+searchInputdata+"&selectDomain="+selectDomain+"&selectRelevance="+selectRelevance+"&showuser="+showuser+"&checked="+checked;
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

//��һҳ
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

//��һҳ
function first() {
    hideTable();
    page = 1;
    for ( var i = 0; i<pageSize; i++ ) {
        theTable.rows[i].style.display = '';
    }
    showPage();
    
    preText();
    nextLink();
    lastLink();
}

//���һҳ
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
}

function hideTable() {
    for ( var i = 0; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = 'none';
    }
}

function showPage() {
    pageNum.innerHTML = page;
}

//�ܹ�ҳ��
function pageCount() {
    var count = 0;
    if ( numberRowsInTable%pageSize != 0 ) count = 1; 
    return parseInt(numberRowsInTable/pageSize) + count;
}

//��ʾ����
function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>Previous </a>"; }
function preText() { spanPre.innerHTML = "Previous "; }

function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>Next </a>"; }
function nextText() { spanNext.innerHTML = "Next "; }

function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>First </a>"; }
function firstText() { spanFirst.innerHTML = "First "; }

function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>Last </a>"; }
function lastText() { spanLast.innerHTML = "Last "; }

//���ر��
function hide() {
    for ( var i = pageSize; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = 'none';
    }
    
    totalPage.innerHTML = pageCount();
    pageNum.innerHTML = '1';
    
    nextLink();
    lastLink();
}
