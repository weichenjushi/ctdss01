package cn.ctdss.test;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

@WebServlet("/toHtmlPath")
public class ToHtmlPath extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		String url = ""; 
		String name = ""; 

		ServletContext sc = request.getServletContext(); 

		String file_name = request.getParameter("file_name");// ��Ҫ���ʵ�jsp�ļ�,��news.jsf�� 
		// file_name�磺fileDetail.jsf?fileId=56.Ҫ���в��� ֻ��һ��������Բ�������Ϊ�ļ��� 
		String realName = request.getParameter("realName");// Ҫ������ļ�����aaa;ע�����û�������� 

		String path = request.getParameter("path");// ��Ҫ���ʵ�jsp�ļ�·������news��ע�����û�������� 

		String realPath = request.getParameter("realPath");// ��Ҫ������ļ�·��,��htmlNews.ע�����û�������� 
		// ����ȷ��Ҫ������ļ����֡� 
		if (realName == null || realName == "") { 
			int a = 0; 
			a = file_name.indexOf("=") + 1; 
			realName = file_name.substring(a); 
			if (realName.indexOf(".")>0) { 
				realName = file_name.substring(0, file_name.indexOf(".")); 
			} 
		} 
		// ���湹��Ҫ���ʵ�ҳ�档 
		if (path == null || path == "") { 
			url = "/" + file_name;// ������Ҫ���HTML��jsp�ļ�,�� 
		} else { 
			url = "/" + path + "/" + file_name;// ������Ҫ���HTML��jsp�ļ�,�� 
		} 
		// ���湹��Ҫ������ļ���·���� 
		// 1�������realPath���򱣴���realPath�¡� 
		// 2�������path�򱣴���path�¡� 
		// 3�����򣬱����ڸ�Ŀ¼�¡� 
		if (realPath == null || realPath == "") { 
			if (path == null || path == "") { 
				//name = request.getContextPath() + """" + realName + ".htm";// ������ɵ�html�ļ���,��index.htm.˵�� ConfConstants.CONTEXT_PATHΪ���������·���� 
				name = request.getContextPath() + realName + ".htm";// ������ɵ�html�ļ���,��index.htm.˵�� ConfConstants.CONTEXT_PATHΪ���������·���� 
			} else { 
				name = request.getContextPath()  + path + realName + ".htm";// ������ɵ�html�ļ���,��index.htm. 
			} 
		} else { 
			name = request.getContextPath() + realPath  + realName + ".htm";// ������ɵ�html�ļ���,��index.htm. 
		} 

		// ���������ҳ�棬�����ָ�����ļ��� 
		RequestDispatcher rd = sc.getRequestDispatcher(url); 

		final ByteArrayOutputStream s = new ByteArrayOutputStream(); 
		final OutputStream os=response.getOutputStream();
		final ServletOutputStream stream = new ServletOutputStream() { 
			public void write(byte[] data, int offset, int length) { 
				try {
					os.write(data, offset, length);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			} 

			public void write(int b) throws IOException { 
				os.write(b); 
			} 
		}; 

		final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os)); 

		HttpServletResponse rep = new HttpServletResponseWrapper(response) { 
			public ServletOutputStream getOutputStream() { 
				return stream; 
			} 

			public PrintWriter getWriter() { 
				return pw; 
			} 
		}; 
		rd.include(request, rep); 
		pw.flush(); 
		InputStream is = new FileInputStream(name); // ��jsp��������д��xxx.htm 
		int len = 0;
		byte[] buf = new byte[1024];
		while((len=(is).read(buf))>0){
			os.write(buf,0,len);
		}
		
		is.close();
		os.close();
		PrintWriter out = response.getWriter(); 
		out.print("<p align=center><font size=3 color=red>success��</font></p>"); 
  } 
 
}
