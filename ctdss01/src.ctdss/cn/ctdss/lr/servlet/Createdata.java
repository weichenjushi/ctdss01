package cn.ctdss.lr.servlet;
// /Createdata
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.CreatedataService;
import cn.ctdss.lr.service.ExcelService;


public class Createdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private void createallxml(HttpServletRequest request, HttpServletResponse response) throws DocumentException {
		//1.得到所有文件名
//		System.out.println("come in");
		List<String> accessedtables = new ExcelService().accessedtables1();
//		System.out.println(accessedtables.size());
		for(String tname:accessedtables)
		{
			//生成文件路径
			String filePath=this.getServletContext().getRealPath("/xml/"+tname+".xml");
			try {
				new CreatedataService().createXML(tname,filePath);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	/**
	 * 生成xml文件
	 * @param request
	 * @param response
	 * @throws DocumentException 
	 */
	private void createxml(HttpServletRequest request, HttpServletResponse response) throws DocumentException {
		String tname=request.getParameter("dtname");
		//生成文件路径
		String filePath=this.getServletContext().getRealPath("/xml/"+tname+".xml");
//		String filePath = request.getContextPath()+"/xml/"+tname+".xml";//通过request取上下文目录
		boolean flag;
		try {
			flag = new CreatedataService().createXML(tname,filePath);
			if(flag)
			{
				request.setAttribute("message", "创建XML文件成功");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			else{
				request.setAttribute("message", "创建XML文件失败");
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
	private void updateretxml(HttpServletRequest request, HttpServletResponse response) throws DocumentException {
		String tname=request.getParameter("dtname");
//		System.out.println(tname);
		//生成文件路径
		String filePath=this.getServletContext().getRealPath("/xml/"+tname+"1.xml");
//		String filePath = request.getContextPath()+"/xml/"+tname+".xml";//通过request取上下文目录
//		System.out.println(filePath);
		boolean flag;
		try {
			flag = new CreatedataService().updateretxml(tname,filePath);
			if(flag)
			{
				request.setAttribute("message", "更新成功");
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
				Apps app=appService.getByTname(tname);
				app.setRetexampxml(str);
//				System.out.println("qin"+app.getRetexampxml());
				appService.updateapp(app);
//				System.out.println("hou"+app.getRetexampxml());
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			else{
				request.setAttribute("message", "更新失败");
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
	private void updateretjson(HttpServletRequest request, HttpServletResponse response) throws DocumentException {
		String tname=request.getParameter("dtname");
		System.out.println(tname);
		boolean flag;
		try {
			flag = new CreatedataService().updateretjson(tname);
			if(flag)
			{
				request.setAttribute("message", "更新成功");
				try {
					request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			else{
				request.setAttribute("message", "更新失败");
				
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if("createxml".equals(method))
		{
			try {
				this.createxml(request,response);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
		else if("updateretxml".equals(method))
		{
			try {
				this.updateretxml(request,response);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
		else if("updateretjson".equals(method))
		{
			try {
				this.updateretjson(request,response);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
		else if("createallxml".equals(method))
		{
			try {
				this.createallxml(request,response);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
