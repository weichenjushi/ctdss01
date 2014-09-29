package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.AppsChild;
import cn.ctdss.lr.domain.News;
import cn.ctdss.lr.service.APPChildrenService;
import cn.ctdss.lr.service.AppCategoryService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.NewService;

@WebServlet("/BrowseServlet")
public class BrowseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String getDataServiceListByCid(String ctid) {
		StringBuffer sb = new StringBuffer();
		// 2.分类显示数据
		List<AppCategory> appcates;
		try {
			appcates = new AppCategoryService().listallappcate2show();
			for (AppCategory appcate : appcates) {
				// start
				sb.append("<div class='data_title'>" + "<div class='title' >&gt;").append(appcate.getName()).append("</div><ul class='data_ul clear'>");

				// 根据app种类id得到该种类下的所有数据
				List<Apps> apps = new AppService().listall2showbyctid(appcate.getId(),ctid);
				if (apps != null) {
					for (Apps app : apps) {
						if(appcate.getEnglishname()!=null){
							sb.append("<li><div class='divimg'><a class='").append(appcate.getEnglishname()).append("' href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
						}
						else{
							sb.append("<li><div class='divimg'><a href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
						}
						
					}
				}
				// end
				sb.append("</ul></div>");
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			return sb.toString();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("cmd");
		String lastData = "";
		if ("init".equals(method)) {
			lastData = getDataServiceList();
		}
		else if("initHome".equals(method))//首页
		{
			Apps appad= new AppService().appad();
			request.getSession().setAttribute("ad", appad.getName());
			lastData = getDataServiceListHome();
		}else if("initbycid".equals(method)){
			String cid=request.getParameter("cid");
			lastData = getDataServiceListByCid(cid);
		}else if("getbypname".equals(method)){
			String param=request.getParameter("param");
			lastData=this.getbypname(param);
		}
		response.getWriter().print(lastData);
	}

	

	


	private String getbypname(String param) {
		StringBuffer sb=new StringBuffer();
		try {
			AppsChild appsChild= new APPChildrenService().getbypname(param);
			sb.append("{'apiaddress':'").append(appsChild.getApiaddress()).append("','apiexample':'").append(appsChild.getApiexample()).append("','parms':[");
			for(Map.Entry<String, String> entry: appsChild.getAddressMap().entrySet()) {
				 sb.append("{'parmkey1':'").append(entry.getKey()).append("','parmvalue1':'").append(entry.getValue()).append("'},");
				}
			sb.append("]}");
			return sb.toString();
		} catch (SQLException e) {
			e.printStackTrace();
			return sb.toString();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	@SuppressWarnings("finally")
	private String getDataServiceList() {
		StringBuffer sb = new StringBuffer();
		// 1.首页数据：热门、最新
		sb.append("<div class='data_title'>" + "<ul class='tabUl1 clear'></ul>" + "<div class='allBox1'>" + "<div class='box_data'  style='display: block;'>" + "<ul class='data_ul clear'>" + "<li style='background:#FF6600; color:#fff; width:30px; height:110px; padding-top:5px '>" + "热<br />门<br />数<br />据<br />服<br />务<br />");
		// 1获取热门数据
		List<Apps> mostapps = new AppService().mostapps();
		if(mostapps!=null)
		{
			for (Apps app : mostapps) {
				sb.append("<li><div class='divimg'><a class='hotds' href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
			}
		}
		sb.append("</ul></div>");// end����div
		sb.append("<div class='box_data'>" + "<ul class='data_ul clear'>" + "<li style='background:#00b271; color:#FFF; width:30px; height:110px; padding-top:5px'>" + "最<br />新<br />数<br />据<br />服<br />务<br /></li>");
		// 2获取最新数据

		List<Apps> recentapps = new AppService().recentaddapps();
		if (recentapps != null) {
			for (Apps app : recentapps) {
				sb.append("<li><div class='divimg'><a class='newds' href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
			}
		}
		sb.append("</ul></div></div></div>"); // end ��ҳ��ݣ����š�����

		// 2.分类显示数据
		List<AppCategory> appcates;
		try {
			appcates = new AppCategoryService().listallappcate2show();
			for (AppCategory appcate : appcates) {
				// start
				sb.append("<div class='data_title'>" + "<div class='title' >&gt;").append(appcate.getName()).append("</div><ul class='data_ul clear'>");

				// 根据app种类id得到该种类下的所有数据
				List<Apps> apps = new AppService().listall2show(appcate.getId());
				if (apps != null) {
					for (Apps app : apps) {
						if(appcate.getEnglishname()!=null){//��������Ӣ�����ֲ�Ϊ�գ�˵�����Զ����ͼ�꣬����ʱ��Ĭ�ϵ�ͼ��
							sb.append("<li><div class='divimg'><a class='").append(appcate.getEnglishname()).append("' href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
						}
						else{
							sb.append("<li><div class='divimg'><a href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
						}
						
					}
				}
				// end
				sb.append("</ul></div>");
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			return sb.toString();
		}
	}
	
	private String getDataServiceListHome() {
		StringBuffer sb = new StringBuffer();
		// 1.首页数据：热门、最新
		sb.append("<div class='data_title'>" + "<ul class='tabUl1 clear'></ul>" + "<div class='allBox1'>" + "<div class='box_data'  style='display: block;'>" + "<ul class='data_ul clear'>" + "<li style='background:#FF6600; color:#fff; width:30px; height:110px; padding-top:5px '>" + "热<br />门<br />数<br />据<br />服<br />务<br />");
//		sb.append("<div class='data_title'>" + "<ul class='tabUl1 clear'></ul>" + "<div class='allBox1'>" + "<div class='box_data'  style='display: block;'>" + "<ul class='data_ul clear'>" + "<li style='background:#5d7bee; color:#FFF; width:30px; height:110px; padding-top:5px '>" + "��<br />��<br />��<br />��<br />��<br />��<br />");
		// 1获取热门数据
		List<Apps> mostapps = new AppService().mostapps();
		if(mostapps!=null)
		{
			for (Apps app : mostapps) {
				sb.append("<li><div class='divimg'><a  class='hotds' href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
			}
		}
		sb.append("</ul></div>");// end����div
		sb.append("<div class='box_data'>" + "<ul class='data_ul clear'>" + "<li style='background:#00b271; color:#FFF; width:30px; height:110px; padding-top:5px'>" + "最<br />新<br />数<br />据<br />服<br />务<br /></li>");
		// 2获取最新数据

		List<Apps> recentapps = new AppService().recentaddapps();
		if (recentapps != null) {
			for (Apps app : recentapps) {
				sb.append("<li><div class='divimg'><a class='newds' href='apps/id/").append(app.getId()).append("' target='_blank'></a>" + "</div><h2><a href='apps/id/").append(app.getId()).append("' target='_blank'>").append(app.getName()).append("</a></h2></li>");
			}
		}
		sb.append("</ul></div></div></div>"); // end ��ҳ��ݣ����š�����
		
		/*APP管理模块*/
		//sb.append("<div style='float: right;width: 30%;height: 630px;margin-top: -12%;background-color:#00B4ED;'><ul><li style='list-style: none;'><font size='5'>APP����ģ��</font></li><li>�����ŵ�APP</li><li>���·�����APP</li></ul></div>");
		
		//3.最新通告
		sb.append("<div class='content'><div class='content1'><div style='margin-left:100px;margin-top:120px;text-align:left;vertical-align: middle;'><br><br>");
		//获取最新通告
		List<News> recentnews;
		try {
			recentnews = new NewService().recentnews();
			if(recentnews!=null)
			{
				for (News news : recentnews) {
					sb.append("<div class='news-td'><a  class='news' href='news/recent/").append(news.getId()).append("' target='_blank'  title='").append(news.getTitle()).append("'><p>").append(news.getTitle()).append("</p></a></div>");
//					sb.append("<div class='news-td'><a  class='news' href='").append(news.getType()).append("/").append(news.getPagename()).append(".jsp' target='_blank'  title='").append(news.getTitle()).append("'><p>").append(news.getTitle()).append("</p></a></div>");
				}
			}
			sb.append("<div class='more' ><a  class='more-a' href='news/recent' target='_blank'>more&nbsp;<img src='images/arrow.jpg' /></a></div></div></div>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		//4.重要通告
		sb.append(" <div class='content2'><br><br><div style='margin-left:100px;text-align:left'>");
		//获取重要通告
		List<News> importnews;
		try {
			importnews = new NewService().importnews();
			if(importnews!=null)
			{
				for (News news : importnews) {
					sb.append("<div class='news-td'><a  class='news' href='news/import/").append(news.getId()).append("' target='_blank'  title='").append(news.getTitle()).append("'><p>").append(news.getTitle()).append("</p></a></div>");
//					sb.append("<div class='news-td'><a  class='news' href='").append(news.getType()).append("/").append(news.getPagename()).append(".jsp' target='_blank'  title='").append(news.getTitle()).append("'><p>").append(news.getTitle()).append("</p></a></div>");
//					sb.append("<div class='news-td'><a  class='news' href='").append(news.getType()).append("/").append(news.getPagename()).append(".jsp' target='_blank'  title='").append(news.getTitle()).append("'<p>��<script type='text/javascript' language='javascript'>document.write(GetStr9('").append(news.getTitle()).append("'));</script></p></a></div>");
				}
			}
			sb.append("<div  class='more' ><a  class='more-a' href='news/import' target='_blank'>more&nbsp;<img src='images/arrow.jpg' /></a></div></div></div></div>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return sb.toString();
	}
}
