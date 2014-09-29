<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% --%>
<!-- String contextPath = request.getContextPath();  -->
<!-- String headerReferer =request.getHeader("Referer");  -->
<!-- String Path = null; -->
<!-- if(headerReferer!=null) -->
<!-- 	Path = headerReferer.substring(0,headerReferer.indexOf(contextPath)+contextPath.length()+1); -->
<!-- %> -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%--     <base href="<%=Path%>"> --%>
	<base href="<%=basePath%>">
	<meta property="qc:admins" content="72007744751114771664510063757" />
    <title>欢迎使用城市交通数据服务空间</title>
	<link rel="stylesheet" type="text/css" href="index/css/log_sign.css">
	<link rel="stylesheet" type="text/css" href="index/css/head_menu.css">
  </head>
  <body onload="notice();">
  <div class="forshowfooter1">
	<jsp:include page="/public/head1.jsp"></jsp:include>
	
	<div class="div_center">
		<p>
			<img src="index/images/logos/puzzle2.jpg" width="40%" alt="Puzzle">
		</p>
	</div>
	<div id="kong">
	 	<!--浮动框-->
		 <div id="out">
			   <div id="tit">-</div>
			   <div class="right">
			  		<a class="words_no_link">本网站只能在火狐浏览器和谷歌浏览器中正常运行，推荐使用屏幕分辨率：1440*900。</a><br/>
			   </div>
		 </div>
	</div>
	<div class="forshowfooter2">
		<table class="table" width=100%;>
			<tr>
				<td width="15%"></td>
				<td>
					<p>
						<button class="button"  onclick="window.location.href='index/about/take_a_tour.jsp'">游览一番</button>
					</p>
				</td>
				<td>
					<p>
						<button class="button" onclick="window.location.href='index/core/myindex.jsp'">进入</button>
					</p>
				</td>
				<td width="15%"></td>
			</tr>
		</table>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
	
  </div>
  </body>
    <script language="javascript">
	var $ = function (d){return document.getElementById(d)};
	var CLS={
	   create: function() {
		  return function() {
			this.$ADD = function (fn){CLS.add(this,fn)};
		    this.init.apply(this, arguments);
		  }
	   },
	   add:function (obj,fn){
		   fn.apply(obj,arguments);
	   },
	   enterFrame:function (){
		    this.onEnterFrame=function (){};
			this.$PLAY = function (g){
				this.enterFrameP = this.enterFrameP || 10;
				this.CLStimeIndex = CLS.ontimes.length;
				CLS.ontimes.push(this);
				window.clearTimeout(this.enterFrameTimeout);
				window.clearInterval(this.enterFrameInterval);
				if(g)this.enterFrameTimeout = window.setTimeout('CLS.ontimes['+this.CLStimeIndex+'].enterFrameInterval=window.setInterval("CLS.ontimes['+this.CLStimeIndex+'].onEnterFrame()",'+this.enterFrameP+')',parseInt(g*1000));
				else this.enterFrameInterval = window.setInterval("CLS.ontimes["+this.CLStimeIndex+"].onEnterFrame()",this.enterFrameP);
			}
			this.$STOP = function (){
				window.clearInterval(this.enterFrameInterval);
			}
			this.$SET = function (p){
				this.enterFrameP = p;
			}
	   },
	   ontimes:new Array()
	};
	CLS.Marquee = CLS.create();
	CLS.Marquee.prototype = {
	   init:function (button,box,speed){
	      this.box = $(box);
		  this.tit = $(button)
		  this.kong = $("kong");
		  this.onOpen = true;
		  this.show = false;
		  this.time = 0;
		  this.speed = speed;
		  this.kong.style.height = this.box.offsetHeight +"px";
		  this.Maxw = this.box.offsetWidth-this.tit.offsetWidth;
		  this.box.style.right = -this.box.offsetWidth + "px";
		  this.boxTop = this.kong.offsetTop;
		  var _t = this;
		  this.tit.onclick = function (){
		    this.show = true;
		    if(_t.onOpen){
			  _t.onEnterFrame = _t.close;
			  _t.onOpen = false;
			}else{
			  _t.onEnterFrame = _t.open;
			  _t.onOpen = true;
			}
			_t.$PLAY();
		  };
		  this.$ADD(CLS.enterFrame);
		  this.onEnterFrame = this.open;
		  this.$PLAY();
	   },
	   open:function(){
	      this.tit.innerHTML = "-";
	      var _r = parseInt(this.box.style.right);
		  var _b = (0 - _r)/30;
		  this.box.style.right = (_r + _b) +"px";
		  this.kong.style.top = (document.documentElement.scrollTop + this.boxTop) +"px";
		  if(_b==0 && !this.show){
		   this.time +=10;
		   if(this.time>=this.speed*1000){
		     this.show = true;
			 this.onOpen = false;
			 this.$STOP();
		     this.onEnterFrame = this.close;
			 this.$PLAY(); 
		   }
		  }	  
	   },
	   close:function (){
	      this.tit.innerHTML = "+";
	      var _r = parseInt(this.box.style.right);
		  var _b = (-this.Maxw - _r)/5;
		  this.box.style.right = Math.round(_r + _b) +"px";
		  this.kong.style.top = (document.documentElement.scrollTop + this.boxTop) +"px";
	   }
	};
	window.onload = function (){
	  setTimeout(function(){new CLS.Marquee("tit","out",10)},0);//tit是点击按钮的Id ，abc是浮动块的ID,10是显示时长
	};
</script>
</html>