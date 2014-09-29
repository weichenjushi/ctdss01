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
		String empname = request.getParameter("ename");//���ҳ�洫�ݹ���������
		int depno = Integer.parseInt(request.getParameter("depno"));//���ҳ�洫�ݹ���������
		Emp emp = new Emp();
		Dept dept = new Dept();
		dept.setDepno(depno);//��depno���õ�dept������
		emp.setEmpname(empname);//��empname���õ�emp������
		emp.setDept(dept);//��dept���õ�emp������
		EmpDao dao = new EmpDaoImp();
		dao.addEmp(emp);//����ʵ����ĵ���ӷ���
		response.sendRedirect("ShowAllEmpServlet");//�ض�����ʾȫ����Servlet��
		out.flush();
		out.close();
	}

}
