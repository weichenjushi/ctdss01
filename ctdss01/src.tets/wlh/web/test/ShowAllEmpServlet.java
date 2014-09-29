package wlh.web.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowAllEmpServlet
 */
@WebServlet("/ShowAllEmpServlet")
public class ShowAllEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		List<Emp> list = new ArrayList<Emp>();
		EmpDao dao = new EmpDaoImp();
		list = dao.queryAllEmp();//����ʵ����Ĳ�ѯȫ������
		request.setAttribute("list", list);//�Ѳ�ѯ�������request������
		request.getRequestDispatcher("showAllEmp.jsp").forward(request, response);//ת������ʵȫ����ҳ��
		out.flush();
		out.close();
	}

}
