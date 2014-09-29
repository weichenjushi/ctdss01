package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.AppsChild;
import cn.ctdss.lr.domain.Ckapp;
import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.service.APIService;
import cn.ctdss.lr.service.APPChildrenService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.CkappService;
import cn.ctdss.lr.service.ExcelService;

/**
 * Servlet implementation class APIServlet
 */
// @WebServlet("/APIServlet")
// /APIServlet/*
public class APIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 申请APPKEY
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addapi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id,usernmae,dtname,appkey,startime,endtime,times
		// 1.准备数据：得到用户传过来的username和dtname，生成aapkey
		String dtname = request.getParameter("dtname");
		String appid = request.getParameter("appid");
		String username = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		} else if (session.getAttribute("adminname") != null) {
			username = session.getAttribute("adminname").toString();
		}
		String finaluuid = UUID.randomUUID().toString();
		String appkey = finaluuid.substring(0, 8) + finaluuid.substring(9, 13) + finaluuid.substring(14, 18) + finaluuid.substring(19, 23) + finaluuid.substring(24);
		// 2.将准备好的数据插入到数据库中
		APIService apiService = new APIService();
		try {
			// 插入之前先查看该用户是否已经申请了该数据服务，先根据用户名查出该用户的所有数据服务
			List<MyApp> listmyapps = apiService.queryAll(username);
			for (MyApp myapp : listmyapps) {
				if (dtname.equals(myapp.getDtname()))// 如果存在该数据服务，则返回
				{
					request.setAttribute("message", "您已经申请了该数据服务，不能申请同样的数据服务！错误代码：10011");
					request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
					return;
				}
			}

			boolean flag = apiService.add(dtname, username, appkey, appid);
			if (flag)// 插入成功
			{
				request.setAttribute("message", "你申请的APPKey为" + appkey);
				// 如果插入成功，则将该用户的所有的appkey查询出来
				List<MyApp> myapps = apiService.queryAll(username);
				if (myapps != null) {
					for (MyApp app : myapps) {
						// 根据myapp表中的appid得到appname并将他保存在myapp中的appname属性当中
						Apps appModel = new AppService().getById(Integer.toString(app.getAppid()));
						app.setAppname(appModel.getName());
					}
				}

				// System.out.println(myapps);
				request.setAttribute("myapps", myapps);
				request.getRequestDispatcher("/index/core/ucenter.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "申请数据失败！");
				request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		// 3.成功之后将页面跳转到用户API界面，否则跳转到失败界面


	}

	/**
	 * 查看我的数据服务
	 * 
	 * @param request
	 * @param response
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void viewmyapps(HttpServletRequest request, HttpServletResponse response) {
		String username = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		} else if (session.getAttribute("adminname") != null) {
			username = session.getAttribute("adminname").toString();
		}
		APIService apiService = new APIService();
		List<MyApp> myapps;
		try {
			myapps = apiService.queryAll(username);
			for (MyApp app : myapps) {
				// 根据myapp表中的appid得到appname并将他保存在myapp中的appname属性当中
				Apps appModel = new AppService().getById(Integer.toString(app.getAppid()));
				app.setAppname(appModel.getName());
				// System.out.println(app.getDtname());
			}
			try {
				request.getSession().setAttribute("myapps", myapps);
				// request.getRequestDispatcher("/index/core/ucenter.jsp").forward(request, response);
				response.sendRedirect("index/core/ucenter.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

	/**
	 * 调用接口示例,根据username和dtname从myapp表中查询出数据
	 * 
	 * @param request
	 * @param response
	 */
	private void mybox(HttpServletRequest request, HttpServletResponse response) {
		String dtname = request.getParameter("dtname");
		String username = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		} else if (session.getAttribute("adminname") != null) {
			username = session.getAttribute("adminname").toString();
		}

		// 2.将准备好的数据插入到数据库中
		APIService apiService = new APIService();
		MyApp myapp;
		try {
			myapp = apiService.getmyapp(username, dtname);
			if(myapp==null){
				request.setAttribute("message", "使用之前，请先申请该数据的AppKey或使用正确的AppKey");
				try {
					request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			else{
				request.getSession().setAttribute("myapp", myapp);
				try {
					response.sendRedirect("index/core/mybox.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/**
	 * 调用接口示例,根据username和dtname查询其子服务相关数据
	 * 
	 * @param request
	 * @param response
	 */
	private void myboxp(HttpServletRequest request, HttpServletResponse response) {
		String dtname = request.getParameter("dtname");
		//子服务的参数
		String param=request.getParameter("param");
		String username = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		} else if (session.getAttribute("adminname") != null) {
			username = session.getAttribute("adminname").toString();
		}

		// 2.将准备好的数据显示到mybox页面当中：数据服务名、appkey、接口列表、API参数
		APIService apiService = new APIService();
		AppService appService = new AppService();
		MyApp myapp;
		try {
			APPChildrenService appchildrenService=new APPChildrenService();
			AppsChild appsChild= appchildrenService.getbycpname(param);
			request.getSession().setAttribute("appsChild", appsChild);
			try {
				response.sendRedirect("index/core/mybox1.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/**
	 * 管理员查看每个APP的调用情况
	 * 
	 * @param request
	 * @param response
	 */
	private void listapps(HttpServletRequest request, HttpServletResponse response) {

		APIService apiService = new APIService();
		List<MyApp> listapps;
		try {
			listapps = apiService.listapps();
			for (MyApp app : listapps) {
				Apps apps = new AppService().getById(Integer.toString(app.getAppid()));
				app.setAppname(apps.getName());
			}
			try {
				request.getSession().setAttribute("listapps", listapps);
				response.sendRedirect("index/core/amanage_dataservices.jsp");
			} catch (IOException e) {

				e.printStackTrace();
			}
		} catch (SQLException e1) {

			e1.printStackTrace();
		}

	}

	/**
	 * 查询可以封装成数据服务的数据表
	 * 
	 * @param request
	 * @param response
	 */
	private void accessdtables(HttpServletRequest request, HttpServletResponse response) {
		List<String> accessedtables = new ExcelService().accessedtables();
		request.getSession().setAttribute("accessedtables", accessedtables);
		try {
			request.getRequestDispatcher("/admin/add_app.jsp").forward(request, response);
			return;
		}

		catch (ServletException e) {

			e.printStackTrace();
			return;
		} catch (IOException e) {

			e.printStackTrace();
			return;
		}
	}

	private void accessdtblbycxml(HttpServletRequest request, HttpServletResponse response) {
		List<String> accessedtables = new ExcelService().accessedtables();
		request.getSession().setAttribute("accessedtables", accessedtables);
		try {
			request.getRequestDispatcher("/admin/create_data.jsp").forward(request, response);
			return;
		}

		catch (ServletException e) {
			e.printStackTrace();
			return;
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
	}

	private void getDtNameofretxml(HttpServletRequest request, HttpServletResponse response) {
		List<String> accessedtables = new AppService().getDtnames();
		request.getSession().setAttribute("getDtNameofretxml", accessedtables);
		try {
			request.getRequestDispatcher("/admin/create_data.jsp").forward(request, response);
			return;
		}

		catch (ServletException e) {
			e.printStackTrace();
			return;
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
	}
	/**审核*/
	private void getmyappbyid0(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MyApp myapp;
		try {
			myapp = new APIService().getmyappbyid(id);
			request.setAttribute("myapp", myapp);
			try {
				request.getRequestDispatcher("/index/core/myvcard.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/**审核中*/
	private void getmyappbyid1(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MyApp myapp;
		try {
			myapp = new APIService().getmyappbyid(id);
			Ckapp ckapp=new CkappService().getbymyappid1(id,1);
			request.setAttribute("myapp", myapp);
			request.setAttribute("ckapp", ckapp);
			try {
				request.getRequestDispatcher("/index/core/myvcard.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/**审核通过*/
	private void getmyappbyid2(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MyApp myapp;
		try {
			myapp = new APIService().getmyappbyid(id);
			Ckapp ckapp=new CkappService().getbymyappid2(id,2);
			request.setAttribute("myapp", myapp);
			request.setAttribute("ckapp", ckapp);
			try {
				request.getRequestDispatcher("/index/core/myvcard.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/**得到用户提交的应用审核*/
	private void listbyuanme(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String uname = request.getParameter("myappuname");
		try {
			List<Ckapp> ckapps=new CkappService().listbyuanme(uname);
			request.setAttribute("ckapps", ckapps);
			request.getRequestDispatcher("/index/core/myapplyapp.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}
	private void getparms(HttpServletRequest request, HttpServletResponse response) {
		String dtname=request.getParameter("dtname");
		Map<String, String> addressMap = new AppService().getparmsByDtname(dtname);
		try {
			request.setAttribute("addressMaps", addressMap);
			request.setAttribute("getDtNameofretparms", dtname);
			request.getRequestDispatcher("/admin/add_appparams.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void getDtNameofparms(HttpServletRequest request, HttpServletResponse response) {
		List<String> accessedtables = new AppService().getDtnames();
		try {
			request.setAttribute("getDtNameofretparms", accessedtables);
			request.getRequestDispatcher("/admin/add_appparams.jsp").forward(request, response);
			return;
		}

		catch (ServletException e) {
			e.printStackTrace();
			return;
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		HttpSession session = request.getSession();
		if ((session.getAttribute("username") == null || "".equals(session.getAttribute("username"))) && (session.getAttribute("adminname") == null || "".equals(session.getAttribute("adminname")))) {
			request.setAttribute("message", "亲，请先登录之后再进行操作！");
			request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
		} else {
			if ("addapi".equals(method)) {
				// 申请APPKey
				this.addapi(request, response);
			}

			// 调用接口示例
			else if ("mybox".equals(method)) {
				this.mybox(request, response);
			}else if ("myboxp".equals(method)) {
				this.myboxp(request, response);
			}
			// 管理员查看每个APP的调用情况
			else if ("listapps".equals(method)) {
				this.listapps(request, response);
			}
			// 查询可以封装成数据服务的数据表
			else if ("accessdtables".equals(method)) {
				this.accessdtables(request, response);
			} else if ("accessdtblbycxml".equals(method)) {
				this.accessdtblbycxml(request, response);
			} else if ("getDtNameofretxml".equals(method)) {
				this.getDtNameofretxml(request, response);
			}
			// 查看我的服务
			else if ("viewmyapps".equals(method)) {
				this.viewmyapps(request, response);
			} else if ("getmyappbyid0".equals(method)) {
				this.getmyappbyid0(request, response);
			}else if ("getmyappbyid1".equals(method)) {
				this.getmyappbyid1(request, response);
			}else if ("getmyappbyid2".equals(method)) {
				this.getmyappbyid2(request, response);
			}else if ("listbyuanme".equals(method)) {
				try {
					this.listbyuanme(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}else if("getparms".equals(method)){
				this.getparms(request,response);
			}else if("getDtNameofparms".equals(method)){
				this.getDtNameofparms(request,response);
			}
		}

	}

	

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if("addparms".equals(method)){
			this.addparms(request,response);
		}
	}

	private void addparms(HttpServletRequest request, HttpServletResponse response) {
		String dtname=request.getParameter("tname");
		Map<String,String> maplist=new AppService().getparmsByDtname(dtname);
		for(Entry<String,String> entry:maplist.entrySet()){
			String key=entry.getKey().trim();
			String paramvalue=request.getParameter(key);
			new AppService().addnewappparm(dtname,key,paramvalue);
		}
	}

}
