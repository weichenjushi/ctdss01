package cn.ctdss.lr.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.ctdss.lr.daoimpl.BaseDao;
import cn.ctdss.lr.domain.Excel;
import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.domain.Subway;
import cn.ctdss.lr.service.APIService;
import cn.ctdss.lr.service.CreatedataService;
import cn.ctdss.lr.service.SubwayService;

/*
 @WebServlet("/ExcelRestServlet/*")*/
public class CopyOfExcelRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter pwout=response.getWriter();
		String strHref="http://"+request.getLocalAddr()+":"+request.getLocalPort()+request.getContextPath()+request.getServletPath();
		//ע�⣺�����ַ�Ƿ������˵�ַrequest.getLocalAddr()+�������˶˿ں�request.getLocalPort() http://127.0.0.1:8080/ctdss01/ExcelRestServlet
		//System.out.println(strHref);
		//System.out.println(request.getPathInfo());// /dbtables/�����
		
		if (request.getPathInfo() != null) {// /employee-list �������ַ�����һ����
			String TableId = request.getPathInfo().substring(10,
					request.getPathInfo().length());
			
			System.out.println(TableId);
			if ("listtables".equals(TableId)) {
				/*pwout.write("<?xml version='1.0' encoding='UTF-8'?>" + "\n");
				pwout.write("<p:Employees xmlns:p='http://www.employee-details.com'>"
						+ "\n");
				pwout.write("<Employee id='00345' href='http://localhost:8080/myrest/RESTDemoServlet/employees/00345'/>"
						+ "\n");
				pwout.write("<Employee id='00346' href='http://localhost:8080/myrest/RESTDemoServlet/employees/00346'/>"
						+ "\n");
				pwout.write("<Employee id='00347' href='http://localhost:8080/myrest/RESTDemoServlet/employees/00347'/>"
						+ "\n");
				pwout.write("<Employee id='00348' href='http://localhost:8080/myrest/RESTDemoServlet/employees/00348'/>"
						+ "\n");
				pwout.write("</p:Employees >");
				pwout.flush();*/
				try {
					SubwayService subwayService=new SubwayService();
					List<Excel> listtables= subwayService.listAllExcels();
					pwout.write("<?xml version='1.0' encoding='UTF-8'?>" + "\n");
					pwout.write("<p:Employees xmlns:p='http://www.employee-details.com'>"+ "\n");
					for(Excel table :listtables)
					{
						String tableName=table.getTables_in_ctdss01();
						String tablehref=strHref+"/dbtables/"+tableName;
						pwout.write("<Tables id='"+tableName+"' href='"+tablehref+"'/>"+ "\n");
						System.out.println(tableName);
						System.out.println(tablehref);
					}
					pwout.write("</p:Employees >");
					pwout.flush();
					/*request.setAttribute("listtables", listtables);
					request.getRequestDispatcher("/index/core/create_data_service_wrapper.jsp").forward(request, response);*/
				} catch (SQLException e) {
					// 
					e.printStackTrace();
				}
			} else {//��ʾ��ϸ��������Ϣ
				String appKey=request.getParameter("key");
				APIService apiService=new APIService();
				try {
			    MyApp myapp=apiService.getmyapp(appKey);//��֤AppKey�Ƿ���ȷ����
			    if(myapp!=null)
				{
					//�����֤��ȷ֮��͸���AppKeyʹ���ʴ�����1
					try {
						if(myapp.getTimes()<3)
						{
							if(myapp.getTimes()==0)//˵����һ��ʹ�ã����Ұѵ�ǰ��ʱ���¼����
							{
								apiService.addTimes(appKey);//�Ƚ�������1
								Date datetime= new Date();
								String startime=datetime.toLocaleString();
								apiService.addStartime(appKey,startime);//��¼��һ��ʹ��ʱ��
							}else{
								apiService.addTimes(appKey);
								Date datetime= new Date();
								String endtime=datetime.toLocaleString();
								apiService.addEndtime(appKey,endtime);//��¼���һ��ʹ��ʱ��
								MyApp myapp1=apiService.getmyapp(appKey);
								
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								 java.util.Date startime = myapp1.getStartime();
//								 java.util.Date startime = df.parse(myapp.getStartime());
//								 java.util.Date endtime=df.parse(myapp.getEndtime());
								java.util.Date endtime1=myapp1.getEndtime();
								String str1=endtime1.toLocaleString();
								long l=endtime1.getTime()-startime.getTime();
								long day=l/(24*60*60*1000);
								if(day>=1)//�������һ�����ϣ��Ͱ�ʹ�ô�����Ϊ0
								{
									apiService.updateTimes(appKey);
								}
							}
							String path="http://localhost:8080/ctdss01/xml/"+TableId+".xml";
							System.out.println(path);
							//request.getRequestDispatcher(path).forward(request, response);
							response.sendRedirect(path);
							
						}
						else{
							request.setAttribute("message", "��������������ݵ�AppKey�����Ѿ�ʹ���꣬�빺�����ʹ��");
							request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
						}
					} catch (SQLException e1) {
						// 
						e1.printStackTrace();
					}
					//���Եõ�tableId����������ͨ��tableId���鿴��Ӧ��xml�ļ�
					
					/*SubwayService subwayService=new SubwayService();
					List<Object> tables = null;*/
//					List<T> tables=null;
//					BaseDao baseDao=new BaseDao();
//					try {
//						baseDao.getTableById(TableId);
//					} catch (SQLException e) {
//						// 
//						e.printStackTrace();
//					}
//					pwout.write("<?xml version='1.0' encoding='UTF-8'?>" + "\n");
//					pwout.write("<"+TableId+">"+ "\n");
//					for(Object table:tables)
//					{
						/*pwout.write("<"+table.getId().trim()+">" + table.getId().trim()+ "</"+table.getId().trim()+">" + "\n");
						//System.pwout.println(EmpId);
						pwout.write("<"+table.getName().trim()+">" + table.getName().trim()+ "</"+table.getName().trim()+">" + "\n");
						//System.pwout.println(((Employee) map.get(EmpId)).getName());
						pwout.write("<"+table.getDistance()+">"+ table.getDistance()+ "</"+table.getDistance()+">" + "\n");
						//System.pwout.println(((Employee) map.get(EmpId)).getDept());
	*/					
						//Object str =TableId.replaceFirst(TableId.substring(0, 1),TableId.substring(0, 1).toUpperCase())  ; 
//						Subway table1=(Subway)table;
//						pwout.write("<id>" +table1.getId().trim()+ "</id>" + "\n");
//						//System.pwout.println(EmpId);
//						pwout.write("<name>" + table1.getName().trim()+ "</name>" + "\n");
//						//System.pwout.println(((Employee) map.get(EmpId)).getName());
//						pwout.write("<distance>"+ table1.getDistance()+ "</distance>" + "\n");
//						//System.pwout.println(((Employee) map.get(EmpId)).getDept());
//					}
//					pwout.write("</"+TableId+">" + "\n");
//					pwout.flush();
				}
				else{
					request.setAttribute("message", "ʹ��֮ǰ��������������ݵ�AppKey��ʹ����ȷ��AppKey");
					request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
				}
				} catch (SQLException e1) {
					
					e1.printStackTrace();
				}
				
			}

		} else {

		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//�����ַ
		String requestUrl=request.getParameter("requestUrl");
		//�������1�� appkey
		String appKey=request.getParameter("key");
		
		//�������2�����ݷ��صĸ�ʽ xml/json
		String dtype=request.getParameter("dtype");
		//��������ݿ����
		String dtname=requestUrl.substring(requestUrl.lastIndexOf("/")+1);
		APIService apiService=new APIService();
		try {
			MyApp myapp=apiService.getmyapp(appKey);//��֤AppKey�Ƿ���ȷ����
			//1.�����ж�key�Ƿ�Ϊ��
			if(myapp!=null)//1.1 app��Ϊ��
			{
				//2.�����֤��ȷ֮��͸���AppKeyʹ���ʴ�����1
					if(myapp.getTimes()<3)
					{
						if(myapp.getTimes()==0)//˵����һ��ʹ�ã����Ұѵ�ǰ��ʱ���¼����
						{
							apiService.addTimes(appKey);//�Ƚ�������1
							Date datetime= new Date();
							String startime=datetime.toLocaleString();
							apiService.addStartime(appKey,startime);//��¼��һ��ʹ��ʱ��
						}else{
							apiService.addTimes(appKey);
							Date datetime= new Date();
							String endtime=datetime.toLocaleString();
							apiService.addEndtime(appKey,endtime);//��¼���һ��ʹ��ʱ��
							MyApp myapp1=apiService.getmyapp(appKey);
							
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							 java.util.Date startime = myapp1.getStartime();
//							 java.util.Date startime = df.parse(myapp.getStartime());
//							 java.util.Date endtime=df.parse(myapp.getEndtime());
							java.util.Date endtime1=myapp1.getEndtime();
							String str1=endtime1.toLocaleString();
							long l=endtime1.getTime()-startime.getTime();
							long day=l/(24*60*60*1000);
							if(day>=1)//�������һ�����ϣ��Ͱ�ʹ�ô�����Ϊ0
							{
								apiService.updateTimes(appKey);
							}
						}
						//3.�����û�Ҫ�󷵻ص����ݸ�ʽΪxml��json
						if("xml".equals(dtype))//������xml��ʽ����
						{
							String filePath=this.getServletContext().getRealPath("/xml/"+dtname+".xml");
							System.out.println(filePath);
							//1.����xml�ļ�������
							SAXReader reader=new SAXReader();
							//2.����xml�ļ�ʹ���ΪDocument����,�ļ�·�����⣺src\\wlh\\java\\xml\\car.xml
							Document document;
							try {
								document = reader.read(new File(filePath));
								//3.�õ�xml�ļ��ĸ�Ԫ��
								Element rootElement=document.getRootElement();
								//4.����xml�ļ���Ԫ�ض�ȡ��Ԫ��
								List<Element> listElements=rootElement.elements();
								String str=rootElement.asXML();
								response.getWriter().write(str);
							} catch (DocumentException e) {
								// 
								e.printStackTrace();
							}
						}
						else{//������json��ʽ����
							String jsonObj=new CreatedataService().createJson(dtname);
							response.getWriter().write(jsonObj);
						}
						
					}
					else{
						
//						request.setAttribute("message", "��������������ݵ�AppKey�����Ѿ�ʹ���꣬�빺�����ʹ��");
//						/request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
						response.getWriter().write("��������������ݵ�AppKey�����Ѿ�ʹ���꣬�빺�����ʹ��");
					}
			
			}
			else{//1.2 appkeyΪ��
				/*{
				    "resultcode": "200",
				    "reason": "appkey�����ڻ����!",
				    "error_code": 10001
				}*/
				response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"appkey�����ڻ����!\",\n\"error_code\": 10001\n}");
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
		

		
	}

}
