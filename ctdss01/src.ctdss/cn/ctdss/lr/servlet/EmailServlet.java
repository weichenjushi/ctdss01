package cn.ctdss.lr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctdss.lr.daoimpl.UserDaoImpl;
import cn.ctdss.lr.domain.User;
import cn.ctdss.lr.utils.MailSenderInfo;
import cn.ctdss.lr.utils.SimpleMailSender;

@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
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
		resp.setHeader("Cache-Control", "no-cache");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<response>");
		String service = req.getParameter("service");
		UserDaoImpl userdao = new UserDaoImpl();
		String ip = req.getServerName()+":"+req.getServerPort()+req.getContextPath();
		if("resend".equals(service))
		{
			
			String email = req.getParameter("email");
			User user = userdao.findPwd(email);
			String guid = user.getGuid();
		    MailSenderInfo mailInfo = new MailSenderInfo();
		    mailInfo.setEmail(email,true, "DataServiceSpace Confirmation Email");
		    String content = "尊敬的 "+user.getName()+", 我们收到您在城市交通数据服务空间的注册" +
			".最后一步是通过邮件激活您的账户 " +
			"请点击下面的链接来激活，或复制黏贴到地址栏上访问：" +
			"<a href='http://"+ip+"/RegisterServlet?service=isactive&guid="+
			guid+"'>http://"+ip+"/RegisterServlet?service=isactive&guid="+guid+"</a>";
			mailInfo.setContent(content);
		    SimpleMailSender sms = new SimpleMailSender();
		    sms.sendHtmlMail(mailInfo);//����html��ʽ
		    req.setAttribute("result", "The activation link has been resented!");
		    req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
		else if("findPwd".equals(service))
		{
			String email = req.getParameter("email");
			User user = userdao.findPwd(email);
			MailSenderInfo mailInfo = new MailSenderInfo();
			mailInfo.setEmail(email, true, "Password Reset");
			String content = "尊敬的 "+ user.getName()
			+ ". 您的用户名是 "+ user.getUsername()
			+ " .若要重置您的密码，请点击下面的链接."
			+" <a href='http://"+ip+"/RegisterServlet?service=password_resets&guid="
			+ user.getGuid()+ "'>http://"+ip+"/RegisterServlet?service=password_resets&guid="+ user.getGuid()+ "</a>"
			+ ". 如果您不重置您的密码，请忽略本邮件 "
			+ "您的邮件和密码人仍然不变.";
			mailInfo.setContent(content);
			SimpleMailSender sms = new SimpleMailSender();
			//sms.sendHtmlMail(mailInfo);// ����html��ʽ
			sms.sendTextMail(mailInfo);
		    req.setAttribute("result", "The password or username recover link has been sented!");
		    req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}else if ("emailexists".equals(service)) {
			String email = req.getParameter("email_address");
			if (userdao.emailExists(email) == 0) {
				out.println("<result>" + "Sorry, the mailbox has not been registered!" + "</result>");
			}else{
				out.println("<result>success</result>");
			}
		} 
		out.println("</response>");
		out.close();
	}

}
