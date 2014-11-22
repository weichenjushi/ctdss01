package cn.ctdss.lr.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/trafficFlowServlet/*")
public class TrafficFlow extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static long position=0;
	public static long preposition=0;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("xml");
	
		 //1.根据请求的数据格式dataType：xml或者json
		 System.out.println(request.getPathInfo());
		 if(request.getPathInfo()!=null){
			 String dataType=request.getPathInfo().substring(1, request.getPathInfo().length());
			 System.out.println(dataType);
			 if("xml".equals(dataType)){
				 StringBuilder sb=new StringBuilder();
					String fileName="/file/data1.txt";
					String realPath=request.getRealPath(fileName);
					String re=request.getServletContext().getRealPath(fileName);
					File file=new File(realPath);
					if (file.exists()){
						FileReader reader=new FileReader(file);
						BufferedReader bufferReader=new BufferedReader(reader);
						String line=null;
						sb.append("<root>");
						while((line=bufferReader.readLine()) !=null){
							sb.append("<child>");
							String[] strs=line.split(",");
							sb.append("<timestamp>").append(strs[0]).append("</timestamp>");
							sb.append("<monitorpoint>").append(strs[1]).append("</monitorpoint>");
							sb.append("<vehicles>").append(strs[2]).append("</vehicles>");
							sb.append("</child>");
						}
						sb.append("</root>");
						request.setAttribute("message1", sb.toString());
					}else{
						request.setAttribute("message", "请求错误");
					}
					request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
			 }else{//json数据格式
				 StringBuilder sb=new StringBuilder();
					String fileName="/file/data1.txt";
					String realPath=request.getRealPath(fileName);
					String re=request.getServletContext().getRealPath(fileName);
					File file=new File(realPath);
					if (file.exists()){
						FileReader reader=new FileReader(file);
						BufferedReader bufferReader=new BufferedReader(reader);
						String line=null;
						sb.append("{\"trafficflow\":[");
						while((line=bufferReader.readLine()) !=null){
							sb.append("{");
							String[] strs=line.split(",");
							sb.append("\"timestamp\":\"").append(strs[0]).append("\"");
							sb.append(",\"monitorpoint\":\"").append(strs[1]).append("\"");
							sb.append(",\"vehicles\":\"").append(strs[2]).append("\"");
							sb.append("},");
						}
						sb.append("]}");
						request.setAttribute("message1", sb.toString());
					}else{
						request.setAttribute("message", "请求错误");
					}
					request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
			 }
		 }
		 else{//显示普通数据
				
			 	StringBuilder sb=new StringBuilder();
				String fileName="/file/data1.txt";
				String realPath=request.getRealPath(fileName);
				String re=request.getServletContext().getRealPath(fileName);
				File file=new File(realPath);
				if (file.exists()){
					FileReader reader=new FileReader(file);
					BufferedReader bufferReader=new BufferedReader(reader);
					String line=null;
					sb.append("时间戳,监测点,车流量<br>");
					while((line=bufferReader.readLine()) !=null){
						sb.append(line+"<br>");
					}
					request.setAttribute("message", sb.toString());
				}else{
					request.setAttribute("message", "请求错误");
				}
				request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
		 }
		 //2.读取文件Data1.txt中的数据根据类型返回相应的数据格式
		 //3.将读取到的文件内容以特定的格式响应到界面上
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
