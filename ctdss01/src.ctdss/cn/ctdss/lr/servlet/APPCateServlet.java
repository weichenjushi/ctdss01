package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.service.AppCateService;

// /appCateServlet
public class APPCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void getById(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		AppCategory acg;
		try {
			acg = new AppCateService().getById(id);
			request.setAttribute("acg", acg);
			try {
				request.getRequestDispatcher("/admin/edit_appcategory.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

	}

	private void delById(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String message;
		try {
			message = new AppCateService().delById(id);
			request.setAttribute("message", message);
			try {
				request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	/**
	 * 列出所有的数据服务种类
	 * 
	 * @param request
	 * @param response
	 */
	private void listall(HttpServletRequest request, HttpServletResponse response) {
		AppCateService appCateService = new AppCateService();
		List<AppCategory> listacgs;
		try {
			listacgs = appCateService.listall();
			request.setAttribute("listacgs", listacgs);
			try {
				request.getRequestDispatcher("/admin/list_appcategory.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	private void listallu(HttpServletRequest request, HttpServletResponse response) {
		AppCateService appCateService = new AppCateService();
		List<AppCategory> listacgs;
		try {
			listacgs = appCateService.listall();
			request.setAttribute("listacgs", listacgs);
			try {
				request.getRequestDispatcher("/admin/add_app.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	private void listallubyeditapp(HttpServletRequest request, HttpServletResponse response) {
		AppCateService appCateService = new AppCateService();
		List<AppCategory> listacgs;
		try {
			listacgs = appCateService.listall();
			request.setAttribute("listacgs", listacgs);
			try {
				request.getRequestDispatcher("/admin/edit_app.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("listall".equals(method)) {
			this.listall(request, response);
		} else if ("getById".equals(method)) {
			this.getById(request, response);
		} else if ("delById".equals(method)) {
			this.delById(request, response);
		} else if ("listallu".equals(method)) {
			this.listallu(request, response);
		} else if ("listallubyeditapp".equals(method)) {
			this.listallubyeditapp(request, response);
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("add".equals(method)) {
			this.add(request, response);
		} else if ("update".equals(method)) {
			this.update(request, response);
		}
	}

	/**
	 * 添加数据服务种类
	 * 
	 * @param request
	 * @param response
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) {

		String appCategoryname = request.getParameter("acategoryname");
		AppCateService appCateService = new AppCateService();
		String message;
		try {
			message = appCateService.create(appCategoryname);

			request.setAttribute("message", message);
			try {
				request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}

	}

	private void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("acategoryid");
		String name = request.getParameter("acategoryname");
		System.out.println("id:" + id + "name:" + name);
		String message;
		try {
			message = new AppCateService().update(name, id);
			request.setAttribute("message", message);
			try {
				request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}
}
