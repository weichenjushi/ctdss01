package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.domain.ULevel;
import cn.ctdss.lr.domain.User;
import cn.ctdss.lr.service.UserService;

// /userServlet
public class UserServlet extends HttpServlet {
	/**
	 * 得到所有有效用户
	 * 
	 * @param request
	 * @param response
	 */
	private void validatedusers(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserService();
		List<User> listusers;
		try {
			listusers = userService.listusers();
			request.setAttribute("validatedusers", listusers);
			try {
				try {
					request.getRequestDispatcher("/admin/list_validateduser.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

	/**
	 * 得到所有黑名单用户
	 * 
	 * @param request
	 * @param response
	 */
	private void blacklistusers(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserService();
		List<User> listusers;
		try {
			listusers = userService.blacklistusers();
			request.setAttribute("blacklistusers", listusers);
			try {
				try {
					request.getRequestDispatcher("/admin/list_blacklistusers.jsp").forward(request, response);
				} catch (ServletException e) {

					e.printStackTrace();
				}
			} catch (IOException e) {

				e.printStackTrace();
			}
		} catch (SQLException e1) {

			e1.printStackTrace();
		}

	}

	/**
	 * 得到所有未激活用户
	 * 
	 * @param request
	 * @param response
	 */
	private void unactivatedusers(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserService();
		List<User> listusers;
		try {
			listusers = userService.unactivatedusers();
			request.setAttribute("unactivatedusers", listusers);
			try {
				try {
					request.getRequestDispatcher("/admin/list_unactivatedusers.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

	/**
	 * 软删除用户
	 * 
	 * @param request
	 * @param response
	 */
	private void delById(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("id");
		UserService userService = new UserService();
		boolean flag;
		try {
			flag = userService.delById(uid);
			if (flag) {
				request.setAttribute("message", "用户已加入黑名单！");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("message", "用户加入黑名单失败！");
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

	/**
	 * 恢复软删除用户
	 * 
	 * @param request
	 * @param response
	 */
	private void regainById(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("id");
		UserService userService = new UserService();
		boolean flag;
		try {
			flag = userService.regainById(uid);
			if (flag) {
				request.setAttribute("message", "用户已移除黑名单！");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("message", "用户移除黑名单失败！");
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

	private void editlevelById(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		try {
			request.getSession().setAttribute("uid", uid);
			request.getSession().setAttribute("uname", uname);
			request.getRequestDispatcher("/admin/edit_userlevel.jsp").forward(request, response);
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}
	private void getULevelId(HttpServletRequest request, HttpServletResponse response) {
		List<String> listlevelids=new UserService().getULevelId();
		try {
			request.setAttribute("listulevels", listlevelids);
			request.getRequestDispatcher("/admin/edit_userlevel.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	private void listulevels(HttpServletRequest request, HttpServletResponse response) {
		List<ULevel> listulevels;
		try {
			listulevels = new UserService().listulevels();
			request.setAttribute("listulevels", listulevels);
			try {
				request.getRequestDispatcher("/admin/list_ulevels.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


	private void editlevelinfoById(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");	
		ULevel ulevel;
		try {
			ulevel = new UserService().getULevelById(id);
			request.setAttribute("ulevel", ulevel);
			try {
				request.getRequestDispatcher("/admin/edit_ulevelinfo.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
	}
	
	private void getuinfobyname(HttpServletRequest request, HttpServletResponse response) {
		String uname=request.getParameter("uname");
		User user;
		try {
			user = new UserService().getuinfobyname(uname);
			request.setAttribute("user", user);
			try {
				request.getRequestDispatcher("/admin/list_userdetail.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("validatedusers".equals(method)) {
			this.validatedusers(request, response);
		} else if ("delById".equals(method)) {
			this.delById(request, response);
		} else if ("regainById".equals(method)) {
			this.regainById(request, response);
		} else if ("blacklistusers".equals(method)) {
			this.blacklistusers(request, response);
		} else if ("unactivatedusers".equals(method)) {
			this.unactivatedusers(request, response);
		} else if ("editlevelById".equals(method)) {
			this.editlevelById(request, response);
		}else if("getULevelId".equals(method)){
			this.getULevelId(request, response);
		}else if("listulevels".equals(method)){
			this.listulevels(request,response);
		}else if("editlevelinfoById".equals(method)){
			this.editlevelinfoById(request,response);
		}else if("getuinfobyname".equals(method)){
			this.getuinfobyname(request,response);	
		}
	}

	

	
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if("modifyulevel".equals(method))
		{
			this.modifyulevel(request, response);
		}else if("modifyulevelinfo".equals(method)){
			this.modifyulevelinfo(request,response);	
		}
	}

	private void modifyulevel(HttpServletRequest request, HttpServletResponse response) {
		String uid=request.getParameter("uid");
		String ulevelid=request.getParameter("ulevelid");
		new UserService().updateuserlevelbyID(uid,ulevelid);
		request.setAttribute("message", "修改成功");
		try {
			request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void modifyulevelinfo(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id").substring(2);
		String points = request.getParameter("points");
		String times = request.getParameter("times");
		new UserService().modifyulevelinfo(id,points,times);
		request.setAttribute("message", "修改成功");
		try {
			request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
