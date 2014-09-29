package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.domain.Appplat;
import cn.ctdss.lr.domain.Ckapp;
import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.service.APIService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.CkappService;

@WebServlet("/CkappServlet/*")
public class CkappServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private void apptocheck(HttpServletRequest request, HttpServletResponse response) {
		List<Ckapp> ckappstock;
		try {
			ckappstock = new CkappService().listalltocheck();
			request.setAttribute("ckappstocks", ckappstock);
			try {
				request.getRequestDispatcher("/admin/list_apptocheck.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	private void checkedapp(HttpServletRequest request, HttpServletResponse response) {
		List<Ckapp> ckappstock;
		try {
			ckappstock = new CkappService().listallchecked();
			List<Appplat> appplats=new CkappService().listallplats();
			request.getSession().setAttribute("appplats", appplats);
			request.setAttribute("ckappstocks", ckappstock);
			
			try {
				request.getRequestDispatcher("/admin/list_checkedapp.jsp").forward(request, response);
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
		String cmd=request.getPathInfo();//  /add
		cmd=cmd.substring(1, cmd.length());
		if("apptocheck".equals(cmd)){
			this.apptocheck(request,response);
		}else if("checkedapp".equals(cmd)){
			this.checkedapp(request,response);
		}else if(cmd.startsWith("verified")){
			String myappid=cmd.substring(9, cmd.length());
			//根据myappid更新checkingapp和myapp中表的状态，同时apps中num+1
			try {
				new CkappService().upstatebymyappid(myappid,2);
				new APIService().upstatebymyappid(myappid,2);
				MyApp myapp=new APIService().getmyappbyid(myappid);
				new AppService().setnumadd(myapp.getDtname());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("message", "��֤ͨ��");
			request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
		}else if(cmd.startsWith("unverified")){
			String myappid=cmd.substring(11, cmd.length());
			//根据myappid更新checkingapp和myapp中表的状态，同时apps中num-1
			try {
				new CkappService().upstatebymyappid(myappid,3);
				new APIService().upstatebymyappid(myappid,3);
				MyApp myapp=new APIService().getmyappbyid(myappid);
				new AppService().setnumsub(myapp.getDtname());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("message", "成功设置认证不通过");
			request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
		}else if(cmd.startsWith("getbyplatid")){
			String platid=cmd.substring(12, cmd.length());
			List<Ckapp> ckappstock;
			try {
				ckappstock = new CkappService().listallbyplatid(platid);
				request.setAttribute("ckappstocks", ckappstock);
				try {
					request.getRequestDispatcher("/admin/list_checkedapp.jsp").forward(request, response);
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

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getPathInfo();//  /add
		cmd=cmd.substring(1, cmd.length());
		if("add".equals(cmd))
		{
			this.add(request,response);
		}
		
	}

	private void add(HttpServletRequest request, HttpServletResponse response) {
		String appid=request.getParameter("appid");
		String appname=request.getParameter("appname");
		String url=request.getParameter("url");
		String des=request.getParameter("des");
		String type=request.getParameter("type");
		
		String myappuname=request.getParameter("myappuname");
		String myappid=request.getParameter("myappid");
		
		//新增前根据type、appid先检验该数据服务是否已经存在
		boolean flag;
		try {
			flag = new CkappService().checkisExist(type,appid,myappuname);
			if(!flag)
			{
				String msg;
				try {
					msg = new CkappService().add(appid,appname,url,des,type,myappid,myappuname);//并且设置状态为1：审核中
					new CkappService().upstatebymyappid(myappid,1);
					new APIService().upstatebymyappid(myappid,1);
					request.setAttribute("message", msg);
					try {
						request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
					} catch (ServletException e) {
						
						e.printStackTrace();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
			else{
				try {
					request.setAttribute("message", "你要审核的数据正在审核中...，请耐心等待！");
					request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
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
