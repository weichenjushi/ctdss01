package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.News;
import cn.ctdss.lr.service.AppCategoryService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.NewService;

@WebServlet("/news/*")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void list(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * List<News> listnews; try { listnews = new NewService().list(0); request.setAttribute("listnews", listnews); try { request.getRequestDispatcher("/admin/list_news.jsp").forward(request, response); } catch (ServletException e) { e.printStackTrace(); } catch (IOException e) {
		 * e.printStackTrace(); } } catch (SQLException e1) { e1.printStackTrace(); }
		 */

		List<News> getbypageadmins = null;
		try {
			int rowCount = new NewService().getrowcount();
			int pageCount = (rowCount % 5) == 0 ? rowCount / 5 : rowCount / 5 + 1;
			getbypageadmins = new NewService().getbypageadmin("1", "5");
			try {
				request.getSession().setAttribute("hidepageindex2", 1);
				request.getSession().setAttribute("hidepagecount2", pageCount);
				request.setAttribute("listnews", getbypageadmins);
				request.getRequestDispatcher("/admin/list_news.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private void importance(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect(request.getContextPath() + "/index/core/listnews1.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void recent(HttpServletRequest request, HttpServletResponse response) {
		try {
			// request.getRequestDispatcher("/index/core/listnews.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/index/core/listnews.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		/*
		 * List<News> getbypageadmins = null; try { int rowCount=new NewService().getrowcountuserr(); int pageCount=(rowCount%3)==0?rowCount/3:rowCount/3+1; getbypageadmins = new NewService().getbypageuserr("1","3"); try { request.getSession().setAttribute("hidepageindex3", 1);
		 * request.getSession().setAttribute("hidepagecount3", pageCount); request.setAttribute("listnews", getbypageadmins); request.getRequestDispatcher("/index/core/listnews.jsp").forward(request, response); } catch (ServletException e) { e.printStackTrace(); } catch (IOException e) {
		 * e.printStackTrace(); }
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); }
		 */

	}

	private void getbypageadmin(HttpServletRequest request, HttpServletResponse response) {
		String pageSize = request.getParameter("pageSize");
		String currNo = request.getParameter("currNo");
//		System.out.println("pageSize:" + pageSize + "currNo" + currNo);
		List<News> getbypageadmins = null;
		try {
			int rowCount = new NewService().getrowcount();
			int pageCount = (rowCount % Integer.parseInt(pageSize)) == 0 ? rowCount / Integer.parseInt(pageSize) : rowCount / Integer.parseInt(pageSize) + 1;
			getbypageadmins = new NewService().getbypageadmin(currNo, pageSize);
			try {
				request.getSession().setAttribute("hidepageindex2", currNo);
				request.getSession().setAttribute("hidepagecount2", pageCount);
				request.setAttribute("listnews", getbypageadmins);
				request.getRequestDispatcher("/admin/list_news.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void getbypageuser(HttpServletRequest request, HttpServletResponse response, String type) {
		if ("r".equals(type)) {// 最近
			String pageSize = request.getParameter("pageSize");
			String currNo = request.getParameter("currNo");
			List<News> getbypageadmins = null;
			try {
				int rowCount = new NewService().getrowcountuserr();
				int pageCount = (rowCount % Integer.parseInt(pageSize)) == 0 ? rowCount / Integer.parseInt(pageSize) : rowCount / Integer.parseInt(pageSize) + 1;
				getbypageadmins = new NewService().getbypageuserr(currNo, pageSize);
				try {
					request.getSession().setAttribute("hidepageindex3", currNo);
					request.getSession().setAttribute("hidepagecount3", pageCount);
					request.setAttribute("listnews", getbypageadmins);
					request.getRequestDispatcher("/admin/list_newsuserr.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else {// 重要
			String pageSize = request.getParameter("pageSize");
			String currNo = request.getParameter("currNo");
//			System.out.println("pageSize:" + pageSize + "currNo" + currNo);
			List<News> getbypageadmins = null;
			try {
				int rowCount = new NewService().getrowcountuseri();
				int pageCount = (rowCount % Integer.parseInt(pageSize)) == 0 ? rowCount / Integer.parseInt(pageSize) : rowCount / Integer.parseInt(pageSize) + 1;
				getbypageadmins = new NewService().getbypageuseri(currNo, pageSize);
				try {
					request.getSession().setAttribute("hidepageindex4", currNo);
					request.getSession().setAttribute("hidepagecount4", pageCount);
					request.setAttribute("listnews", getbypageadmins);
					request.getRequestDispatcher("/admin/list_newsuseri.jsp").forward(request, response);
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

	private void getbyId(HttpServletRequest request, HttpServletResponse response, String id) {
			News news;
			try {
				news = new NewService().getbyId(id);
				request.setAttribute("news", news);
				try {
					request.getRequestDispatcher("/index/core/shownews.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	private void deletebyId(HttpServletRequest request, HttpServletResponse response, String id) {
		boolean flag;
		try {
			flag = new NewService().deletebyId(id);
			if(flag){
				request.setAttribute("message", "删除成功！");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void editbyId(HttpServletRequest request, HttpServletResponse response, String id) {
		News news;
		try {
			news = new NewService().getbyId(id);
			request.setAttribute("news", news);
			try {
				request.getRequestDispatcher("/admin/edit_news.jsp").forward(request, response);
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
		if (request.getPathInfo() != null) {
			String method = request.getPathInfo().substring(1, request.getPathInfo().length());
			String type = "";
			if ("list".equals(method))// 将Excel表格导入到数据库中news/addnews 管理员
			{
				this.list(request, response);
			} else if ("recent".equals(method)) { // news/recent
				this.recent(request, response);
			} else if ("import".equals(method)) { // news/import
				this.importance(request, response);
			} else if ("getbypageadmin".equals(method)) {
				this.getbypageadmin(request, response); // news/getbypageadmin
			} else if ("getbypageuserr".equals(method)) {
				type = "r";
				this.getbypageuser(request, response, type); // news/getbypageadmin
			} else if ("getbypageuseri".equals(method)) {
				type = "i";
				this.getbypageuser(request, response, type); // news/getbypageadmin
			} else if (method.startsWith("recent/")) {
				String id = method.substring(7, method.length());
//				System.out.println(id);
				this.getbyId(request, response, id); // news/import/id
			} else if (method.startsWith("import/")) {
				String id = method.substring(7, method.length());
//				System.out.println(id);
				type = "i";
				this.getbyId(request, response, id); //  news/edit/id   
			} else if (method.startsWith("edit/")) {
				String id = method.substring(5, method.length());
				this.editbyId(request, response, id);
			}else if (method.startsWith("delete/")) { //   news/delete/id
				String id = method.substring(7, method.length());
				type = "i";
				this.deletebyId(request, response, id); // 
			}
		}
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getPathInfo() != null) {
			String method = request.getPathInfo().substring(1, request.getPathInfo().length());
			if ("addnews".equals(method))// 将Excel表格导入到数据库中news/addnews
			{
				this.addnews(request, response);
			}else if ("edit".equals(method)) { //   news/edit
				this.edit(request, response); // 
			}
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String title=request.getParameter("title").trim();
		String sfrom=request.getParameter("sfrom").trim();
		String content=request.getParameter("content");
		String type=request.getParameter("type");
		News news;
		if(type!=null||"".equals(type))
		{
			type = type.trim();
		}else{
			type="newsfiles/2014";
		}
		try {
			news = new NewService().getbyId(id);
			news.setTitle(title);
			news.setContent(content);
			news.setSfrom(sfrom);
			news.setType(type);
			boolean flag=new NewService().update(news);
			if(flag){
				request.setAttribute("message", "修改成功");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
	}

	private void addnews(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title").trim();
		String type=request.getParameter("type");
		if(type!=null||"".equals(type))
		{
			type = type.trim();
		}else{
			type="newsfiles/2014";
		}
		
		String sfrom = request.getParameter("from").trim();
		String content=request.getParameter("content");

		News news = new News();
		news.setTitle(title);
		news.setSfrom(sfrom);
		news.setType(type);
		news.setContent(content);
		
		
		boolean flag;
		try {
			flag = new NewService().addnews(news);
			if (flag) {
				request.setAttribute("message", "成功添加");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

}
