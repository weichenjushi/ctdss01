package cn.ctdss.lr.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.AppsChild;
import cn.ctdss.lr.service.AppCategoryService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.CreatedataService;
import cn.ctdss.lr.service.ExcelService;

//  /apps/*
public class APPS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getPathInfo() != null) {// http://localhost:8080/ctdss01/apps/id/1
			//System.out.println(request.getPathInfo());
			String aId = request.getPathInfo().substring(4, request.getPathInfo().length());// /id/1

			//System.out.println(aId);
			if ("allnormal".equals(aId)) {// 查询所有正常的docs /apps/id/allnormal
				
				/*List<Apps> allnormalapps;
				try {
					allnormalapps = new AppService().listallnormal();
					//allnormalapps = new AppService().listallnormalbypage("1","8");
					for (Apps app : allnormalapps) {
						AppCategory appcategory = new AppCategoryService().getById(app.getCid());
						app.setAppcategory(appcategory.getName());
					}
					request.setAttribute("allnormalapps", allnormalapps);
					// response.sendRedirect(request.getContextPath() + "/index/core/myapi.jsp");
					request.getRequestDispatcher("/admin/list_normalapps.jsp").forward(request, response);
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}*/
				List<Apps> allnormalapps = null;
				try {
					int rowCount=new AppService().getrowcount();
					int pageCount=(rowCount%8)==0?rowCount/8:rowCount/8+1;
					allnormalapps = new AppService().listallnormalbypage("1","8");
					for (Apps app : allnormalapps) {
						AppCategory appcategory = new AppCategoryService().getById(app.getCid());
						app.setAppcategory(appcategory.getName());
					}
					request.getSession().setAttribute("hidepageindex1", 1);
					request.getSession().setAttribute("hidepagecount1", pageCount);
					request.setAttribute("allnormalapps", allnormalapps);
					// response.sendRedirect(request.getContextPath() + "/index/core/myapi.jsp");
					request.getRequestDispatcher("/admin/list_normalapps.jsp").forward(request, response);
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}
			} else if("allnormalbypage".equals(aId)){//分页查询所有正常的   /apps/id/allnormalbypage
				String pageSize= request.getParameter("pageSize");
				String currNo= request.getParameter("currNo");
//				System.out.println("pageSize:"+pageSize+"currNo"+currNo);
				List<Apps> allnormalapps = null;
				try {
					int rowCount=new AppService().getrowcount();
					int pageCount=(rowCount%Integer.parseInt(pageSize))==0?rowCount/Integer.parseInt(pageSize):rowCount/Integer.parseInt(pageSize)+1;
					allnormalapps = new AppService().listallnormalbypage(currNo,pageSize);
					for (Apps app : allnormalapps) {
						AppCategory appcategory = new AppCategoryService().getById(app.getCid());
						app.setAppcategory(appcategory.getName());
					}
					request.getSession().setAttribute("hidepageindex1", currNo);
					request.getSession().setAttribute("hidepagecount1", pageCount);
					request.setAttribute("allnormalapps", allnormalapps);
					// response.sendRedirect(request.getContextPath() + "/index/core/myapi.jsp");
					request.getRequestDispatcher("/admin/list_normalapps.jsp").forward(request, response);
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}
				
			} else if ("allappnames".equals(aId)) {// 查询所有非正常的docs /apps/id/allappnames
				List<Apps> allnormalapps;
				try {
					allnormalapps = new AppService().listallnormal();
					for (Apps app : allnormalapps) {
						AppCategory appcategory = new AppCategoryService().getById(app.getCid());
						app.setAppcategory(appcategory.getName());
					}
					request.setAttribute("allnormalapps", allnormalapps);
					request.getRequestDispatcher("/admin/add_appchildren.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} 
			else if ("allbad".equals(aId)) {// 查询所有非正常的docs /apps/id/allbad
				List<Apps> allbadapps;
				try {
					allbadapps = new AppService().listallbad();
					for (Apps app : allbadapps) {
						AppCategory appcategory = new AppCategoryService().getById(app.getCid());
						app.setAppcategory(appcategory.getName());
					}
					request.setAttribute("allbadapps", allbadapps);
					// response.sendRedirect(request.getContextPath() + "/index/core/myapi.jsp");
					request.getRequestDispatcher("/admin/list_badapps.jsp").forward(request, response);
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}

			} else if (aId.startsWith("setbad"))// setbad/id
			{
				String id = aId.split("/")[1];
				boolean flag;
				try {
					flag = new AppService().setbad(id);
					if (flag) {
						request.setAttribute("message", "成功设置app不可用！");
						request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
					} else {
						request.setAttribute("message", "设置app不可用失败！");
						request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}

			} else if (aId.startsWith("setnormal"))// setnormal/id
			{
				String id = aId.split("/")[1];
				boolean flag;
				try {
					flag = new AppService().setnormal(id);
					if (flag) {
						request.setAttribute("message", "成功设置app可用！");
						request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
					} else {
						request.setAttribute("message", "设置app可用失败！");
						request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}

			} else if (aId.startsWith("edit"))// edit/id 
			{
				String id = aId.split("/")[1];
				Apps editapp;
				try {
					editapp = new AppService().getById(id);
					request.getSession().setAttribute("editapp", editapp);
					request.getRequestDispatcher("/admin/edit_app.jsp").forward(request, response);
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}

			} else if (aId.startsWith("deleteById"))// deleteById/id 
			{
				String id = aId.split("/")[1];
				boolean flag;
				try {
					//TODO 3删除数据服务时做到①删除对应的数据库表②删除服务器中对应的资源
					Apps app=new AppService().getById(aId);
					new AppService().droptable(app.getTname());
					flag = new AppService().deleteById(id);
					if (flag) {
						request.setAttribute("message", "成功删除app！");
						request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
					} else {
						request.setAttribute("message", "删除app失败！");
						request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}

			} else if (aId.startsWith("getById"))// getById/id 
			{
				String id = aId.split("/")[1];				
				try {
					Apps app = new AppService().getById(id);
					// System.out.println(app.getName());
					// System.out.println(app.getRetexampxml());
					// System.out.println(app.getRetexampxml());
					// System.out.println(app.getRetexampjson());
					// request.setAttribute("app", app.getName());
					AppCategory appcategory = new AppCategoryService().getById(app.getCid());
					request.setAttribute("appcategory", appcategory.getName());
					request.getRequestDispatcher("/admin/add_appchildren.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}else {//查询单个APP，根据app的id得到app // http://localhost:8080/ctdss01/apps/id/1
				AppService appService = new AppService();
				try {
					Apps app = appService.getById(aId);
					AppCategory appcategory = new AppCategoryService().getById(app.getCid());
					app.setAppcategory(appcategory.getName());
					
					List<AppsChild> children=appService.listallchildren(aId);
					request.getSession().setAttribute("children", children);				
					request.getSession().setAttribute("app", app);
					response.sendRedirect(request.getContextPath() + "/index/core/myapi.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getPathInfo() != null) {
			String method = request.getPathInfo().substring(1, request.getPathInfo().length());
			if ("addapp".equals(method))// 将Excel表格导入到数据库中apps/addapp
			{
				this.addapp(request, response);
			} else if ("addnewapp".equals(method)) {// apps/addnewapp
				this.addnewapp(request, response);
			}else if ("addnewappchild".equals(method)) {// apps/addnewapp
				this.addnewappchild(request, response);
			} else if ("updateapp".equals(method)) {
				this.updateapp(request, response); // apps/updateapp
			}
		}
	}

	/**
	 * 将Excel表格导入到数据库中
	 * 
	 * @param request
	 * @param response
	 */
	private void addapp(HttpServletRequest request, HttpServletResponse response) {
		String filepath = request.getParameter("filepath");
		String txtname = request.getParameter("txtname");
//		System.out.println("文件路径为：" + filepath + ";数据表名为：" + txtname);
		ExcelService excelService = new ExcelService();
		String result = excelService.createtable(filepath, txtname);
		request.getSession().setAttribute("mesage", result);
		try {
			request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}

	/**
	 * 添加数据服务
	 * 
	 * @param request
	 * @param response
	 */
	private void addnewapp(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String tname = request.getParameter("tname");
		String cid = request.getParameter("cid");
		String ctid = request.getParameter("ctid");
		String description = request.getParameter("description");
		/*String apiaddress = request.getParameter("apiaddress");
		String apiexample = request.getParameter("apiexample");
		String retexampxml = request.getParameter("retexampxml");
		String retexampjson = request.getParameter("retexampjson");*/
		String apiaddress = "http://127.0.0.8:8080/ctdss01/ExcelRestServlet/dbtables/"+tname;
		String apiexample = "http://127.0.0.8:8080/ctdss01/ExcelRestServlet/dbtables/"+tname+"?key=您申请的APPKEY";
		Date datetime = new Date();
		String addtime = datetime.toLocaleString();
		Apps app = new Apps();
		app.setName(name);
		app.setTname(tname);
		app.setCid(Integer.parseInt(cid));
		app.setDescription(description);
		app.setApiaddress(apiaddress);
		app.setApiexample(apiexample);
		app.setCtid(ctid);
		/*app.setRetexampxml(retexampxml);
		app.setRetexampjson(retexampjson);*/
		app.setAddtime(addtime);
		boolean flag,flag1,flag2;
		try {
			flag = new AppService().addnewapp(app);
			//[2].添加返回数据格式为json更新到数据库中
			flag2 = new CreatedataService().updateretjson(tname);
			//[1].添加返回数据格式为xml更新到数据库中
			String filePath=this.getServletContext().getRealPath("/xml/"+tname+"1.xml");
			try {
				flag1 = new CreatedataService().updateretxml(tname,filePath);
				//1.创建xml文件解析器
				SAXReader reader=new SAXReader();
				//2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
				Document document=reader.read(new File(filePath));
				//3.得到xml文件的根元素
				Element rootElement=document.getRootElement();
				//4.根据xml文件根元素读取子元素
				List<Element> listElements=rootElement.elements();
				String str=rootElement.asXML();
				AppService appService= new AppService();
				Apps app1=appService.getByTname(tname);
				app1.setRetexampxml(str);
				appService.updateapp(app1);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
			if (flag) {
				request.setAttribute("message", "新增数据服务成功");
				request.getRequestDispatcher("/admin/message.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/**
	 * 添加数据服务的子服务
	 * 
	 * @param request
	 * @param response
	 */
	private void addnewappchild(HttpServletRequest request, HttpServletResponse response) {
		
		String param = request.getParameter("param");
		String name = request.getParameter("name");
		String parentid = request.getParameter("parentid");
		
		Apps parent;
		try {
			parent = new AppService().getById(parentid);
			/*String tname = request.getParameter("tname");
			String cid = request.getParameter("cid");
			String description = request.getParameter("description");*/
			/*String apiaddress = request.getParameter("apiaddress");
			String apiexample = request.getParameter("apiexample");
			String retexampxml = request.getParameter("retexampxml");
			String retexampjson = request.getParameter("retexampjson");*/
			String apiaddress = "http://127.0.0.8:8080/ctdss01/ExcelRestServlet/dbtables/getroute";
			String apiexample = "http://127.0.0.8:8080/ctdss01/ExcelRestServlet/dbtables/getroute?key=您申请的APPKEY&id=?";
			Date datetime = new Date();
			String addtime = datetime.toLocaleString();
			AppsChild child = new AppsChild();
			child.setName(name);
			child.setTname(parent.getTname());
			child.setCid(parent.getCid());
			child.setDescription(name);
			child.setApiaddress(apiaddress);
			child.setApiexample(apiexample);
			/*app.setRetexampxml(retexampxml);
			app.setRetexampjson(retexampjson);*/
			child.setAddtime(addtime);
			child.setParam(param);
			child.setParentname(parent.getTname());
			
			boolean flag,flag1,flag2;
			try {
				flag = new AppService().addnewappchild(child);
				//[2].添加返回数据格式为json更新到数据库中
				/*flag2 = new CreatedataService().updateretjsonchild();
				
				//[1].添加返回数据格式为xml更新到数据库中
				String filePath=this.getServletContext().getRealPath("/xml/"+tname+"1.xml");
				try {
					flag1 = new CreatedataService().updateretxml(tname,filePath);
					//1.创建xml文件解析器
					SAXReader reader=new SAXReader();
					//2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
					Document document=reader.read(new File(filePath));
					//3.得到xml文件的根元素
					Element rootElement=document.getRootElement();
					//4.根据xml文件根元素读取子元素
					List<Element> listElements=rootElement.elements();
					String str=rootElement.asXML();
					AppService appService= new AppService();
					Apps app1=appService.getByTname(tname);
					app1.setRetexampxml(str);
					appService.updateapp(app1);
				} catch (DocumentException e) {
					
					e.printStackTrace();
				}*/
				if (flag) {
					request.setAttribute("message", "新增数据子服务成功");
					request.getRequestDispatcher("/admin/message.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		

	}
	/**
	 * 更新数据服务
	 * 
	 * @param request
	 * @param response
	 */
	private void updateapp(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cid = request.getParameter("cid");
		String ctid=request.getParameter("ctid");
		String description = request.getParameter("description");
		String apiaddress = request.getParameter("apiaddress");
		String apiexample = request.getParameter("apiexample");
		String retexampxml = request.getParameter("retexampxml");
		String retexampjson = request.getParameter("retexampjson");
		Apps app;
		try {
			app = new AppService().getById(id);
			app.setName(name);
			System.out.println(cid);
			if(cid!=null)
			{
				app.setCid(Integer.parseInt(cid));
			}
			app.setDescription(description);
			app.setApiaddress(apiaddress);
			app.setApiexample(apiexample);
			app.setRetexampxml(retexampxml);
			app.setRetexampjson(retexampjson);
			app.setCtid(ctid);
			boolean flag = new AppService().updateapp(app);
			if (flag) {
				request.setAttribute("message", "更新数据服务成功");
				request.getRequestDispatcher("/admin/message.jsp");
			} else {
				request.setAttribute("message", "更新数据服务失败");
				request.getRequestDispatcher("/admin/message.jsp");

			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

	}
}
