package wlh.web.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEmpServlet")
public class AddEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String empname = request.getParameter("ename");//获得页面传递过来的数据
		int depno = Integer.parseInt(request.getParameter("depno"));//获得页面传递过来的数据
		Emp emp = new Emp();
		Dept dept = new Dept();
		dept.setDepno(depno);//把depno设置到dept对象中
		emp.setEmpname(empname);//把empname设置到emp对象中
		emp.setDept(dept);//把dept设置到emp对象中
		EmpDao dao = new EmpDaoImp();
		dao.addEmp(emp);//调用实现类的的添加方法
		response.sendRedirect("ShowAllEmpServlet");//重定向到显示全部的Servlet中
		out.flush();
		out.close();
	}

}
