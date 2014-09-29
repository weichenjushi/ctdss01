package cn.ctdss.lr.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// 

	}
	@Override
	public void destroy() {
		// 

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
	
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/login.jsp");// 这里设置如果没有登陆将要转发到的页面
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String fileURL = req.getRequestURI();
		
		if ((session.getAttribute("username") == null || "".equals(session.getAttribute("username"))) 
				&& (session.getAttribute("adminname") == null || "".equals(session.getAttribute("adminname"))))
		{
			// 如果值为空，判断所过滤的文件，若为图片，则正常执行
			if (fileURL.contains("jpg")|| fileURL.contains("bmp")|| fileURL.contains("png") || fileURL.contains("JPEG")
					|| fileURL.contains("gif")|| fileURL.contains("login.jsp")
					|| fileURL.contains("ImageServlet") || fileURL.contains("loginServlet"))
			{
				chain.doFilter(req, res);
				return;
			}
			res.setHeader("Cache-Control", "no-store");
			res.setDateHeader("Expires", 0);
			res.setHeader("Pragma", "no-cache");
			dispatcher.forward(request, response);
		}
		else
		{
			chain.doFilter(request, response);
		}
		
	}
	

}

