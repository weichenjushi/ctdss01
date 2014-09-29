package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.service.APIService;
import cn.ctdss.lr.service.AppCategoryService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.UserService;

// /countServlet
public class CountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void countbyacg(HttpServletRequest request, HttpServletResponse response) {

		List<AppCategory> acgs;
		try {
			acgs = new AppCategoryService().getAllForCount();
			request.getSession().setAttribute("acgs", acgs);
			try {
				request.getRequestDispatcher("/admin/count_byacg.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	private void countbyapp(HttpServletRequest request, HttpServletResponse response) {
		List<String> ids = new APIService().listappids();
		Map<String, String> mapidname;
		try {
			mapidname = new AppService().getNamesById(ids);
			try {
				request.getSession().setAttribute("mapidname", mapidname);
				request.getRequestDispatcher("/admin/count_byapp.jsp").forward(request, response);

			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}

	}

	private void countbyuser(HttpServletRequest request, HttpServletResponse response) {
		List<String> listunames = new UserService().listunames();
		// request.setAttribute("listunames", listunames);
		// request.getSession().setAttribute("listunames", listunames);
		try {
			request.getSession().setAttribute("listunames", listunames);
			request.getRequestDispatcher("/admin/count_byuser.jsp").forward(request, response);

		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}

	private void getByUname(HttpServletRequest request, HttpServletResponse response) {
		// 设置无缓存
		// response.setHeader("Pragma", "No-cache");
		// response.setHeader("Cache-Control", "no-cache");
		// response.setDateHeader("Expires", 0);

		String username = request.getParameter("uname");
//		System.out.println(username);
//		System.out.println("come in");
		List<MyApp> myapps;
		try {
			myapps = new APIService().queryAll(username);
			for (MyApp app : myapps) {
				// 根据myapp表中的appid得到appname并将他保存在myapp中的appname属性当中
				Apps appModel = new AppService().getById(Integer.toString(app.getAppid()));
				app.setAppname(appModel.getName());
				System.out.println(app.getAppname());
			}

			try {
				request.setAttribute("userapps", myapps);
				// request.getRequestDispatcher("/index/core/ucenter.jsp").forward(request, response);
				request.getRequestDispatcher("/admin/count_byuser.jsp").forward(request, response);
				return;
			} catch (ServletException e) {
				
				e.printStackTrace();

				// response.sendRedirect("admin/count_byuser2.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}

		} catch (SQLException e) {
		
			e.printStackTrace();
		}


	}

	private void getByApp(HttpServletRequest request, HttpServletResponse response) {
		String appid = request.getParameter("appid");
		List<MyApp> myapps;
		try {
			myapps = new APIService().queryAllByAppId(appid);
			for (MyApp app : myapps) {
				// 根据myapp表中的appid得到appname并将他保存在myapp中的appname属性当中
				Apps appModel = new AppService().getById(Integer.toString(app.getAppid()));
				app.setAppname(appModel.getName());
//				System.out.println(app.getAppname());
			}
			try {
				request.setAttribute("listsbyapp", myapps);
				// request.getRequestDispatcher("/index/core/ucenter.jsp").forward(request, response);
				try {
					request.getRequestDispatcher("/admin/count_byapp.jsp").forward(request, response);
				} catch (ServletException e) {
				
					e.printStackTrace();
				}
				return;
			} catch (IOException e) {
				
				e.printStackTrace();
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	private void getByAcg(HttpServletRequest request, HttpServletResponse response) {
		String acgid = request.getParameter("acgid");
		List<MyApp> myapps;
		try {
			myapps = new APIService().getAllByAcgId(acgid);
			for (MyApp app : myapps) {
				// 根据myapp表中的appid得到appname并将他保存在myapp中的appname属性当中
				Apps appModel = new AppService().getById(Integer.toString(app.getAppid()));
				app.setAppname(appModel.getName());
				
			}

			try {
				request.setAttribute("listsbyacg", myapps);
				// request.getRequestDispatcher("/index/core/ucenter.jsp").forward(request, response);
				request.getRequestDispatcher("/admin/count_byacg.jsp").forward(request, response);
				return;
			} catch (ServletException e) {
			
				e.printStackTrace();

				// response.sendRedirect("admin/count_byuser2.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("countbyacg".equals(method)) {
			this.countbyacg(request, response);
		} else if ("countbyapp".equals(method)) {
			this.countbyapp(request, response);
		} else if ("countbyuser".equals(method)) {
			this.countbyuser(request, response);
		} else if ("getByUname".equals(method)) {
			this.getByUname(request, response);
		} else if ("getByApp".equals(method)) {
			this.getByApp(request, response);
		} else if ("getByAcg".equals(method)) {
			this.getByAcg(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
