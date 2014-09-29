package cn.ctdss.lr.servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import cn.ctdss.lr.daoimpl.UserDaoImpl;
import cn.ctdss.lr.domain.CSession;
import cn.ctdss.lr.domain.User;



/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/xml;charset=utf-8");
		//resp.setContentType("text/html;charset=utf-8");
		resp.setHeader("Cache-Control", "no-cache");
		PrintWriter out = resp.getWriter();
		String service = req.getParameter("service");
		UserDaoImpl userdao = new UserDaoImpl();
		HttpSession session = req.getSession();
		
		if("login".equals(service))
		{
			out.println("<response>");
			String username = req.getParameter("username");
			String password = req.getParameter("password");		
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			
			int result = userdao.login(user);
			if(result == -2)
			{
				out.println("<result>" + "The account is not active!" + "</result>");
			}
			else if(result == -1)
			{
				out.println("<result>" + "The username does not exist!" + "</result>");
			}
			else if(result == 0)
			{
				out.println("<result>" + "The password is wrong!" + "</result>");
			}
			else if(result == 1)
			{
				int isallowed = userdao.getIsAllowed(username);
				CSession cs = new CSession();  
				cs.setUsername(username);  
				cs.setUsertype("0");
				session.setAttribute("C_SESSION",cs); 
				session.setAttribute("username", username);
				session.setAttribute("isallowed", isallowed);
				out.println("<result>commonuser</result>");
//			    resp.sendRedirect("index/core/myindex.jsp");
			}
			else
			{
				int isallowed = userdao.getIsAllowed(username);
				CSession cs = new CSession();  
				cs.setUsername(username);  
				cs.setUsertype("1");
				session.setAttribute("C_SESSION",cs); 
				session.setAttribute("adminname", username);
				session.setAttribute("isallowed", isallowed);
				out.println("<result>admin</result>");
				
			}
			out.println("</response>");
			out.close();
//			resp.sendRedirect("index/core/amyindex.jsp");
		}
		else if("updateinfo".equals(service)){
//			String firstname = req.getParameter("firstname");
//			String lastname = req.getParameter("lastname");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String username = req.getParameter("username");
			String companyname = req.getParameter("companyname");
			String guid = userdao.getGUID(username);
			
			User user = new User();
			user.setName(name);
			user.setEmailAddress(email);
			user.setUsername(username);
			user.setCompanyName(companyname);
			user.setGuid(guid);
			
			userdao.updateUserInfo(user);
			out.println("<response>");
			out.println("<result>Modified successfully!</result>");
			out.println("</response>");
			out.close();
		}
		else if("getuserinfo".equals(service)){
			String username = session.getAttribute("username")==null?session.getAttribute("adminname").toString():session.getAttribute("username").toString();
			String guid = userdao.getGUID(username);
			User user = userdao.getUserInfo(guid);
			JSONObject jobj = JSONObject.fromObject(user);
			out.println(jobj);
	        out.flush();
	        out.close();
		}
		else if("updatepwd".equals(service)){
			out.println("<response>");
			String oldpassword = req.getParameter("oldpassword");
			String newpassword = req.getParameter("newpassword");
			String username = session.getAttribute("username")==null?session.getAttribute("adminname").toString():session.getAttribute("username").toString();
			String guid = userdao.getGUID(username);
			User user = userdao.getUserInfo(guid);
			if(user.getPassword().equals(oldpassword))
			{
				userdao.updatePwd(newpassword,guid);
				out.println("<result>" + "Password changed successfully!" + "</result>");
			}else{
				out.println("<result>" + "The Old Password is wrong!" + "</result>");
			}
			out.println("</response>");
			out.close();
		}
	}

}
