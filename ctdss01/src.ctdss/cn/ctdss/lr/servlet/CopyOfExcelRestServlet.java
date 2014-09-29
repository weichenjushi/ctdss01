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
		//注意：这个地址是服务器端地址request.getLocalAddr()+服务器端端口号request.getLocalPort() http://127.0.0.1:8080/ctdss01/ExcelRestServlet
		//System.out.println(strHref);
		//System.out.println(request.getPathInfo());// /dbtables/后面的
		
		if (request.getPathInfo() != null) {// /employee-list 即请求地址的最后一部分
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
			} else {//显示详细的数据信息
				String appKey=request.getParameter("key");
				APIService apiService=new APIService();
				try {
			    MyApp myapp=apiService.getmyapp(appKey);//验证AppKey是否正确存在
			    if(myapp!=null)
				{
					//如果验证正确之后就根据AppKey使访问次数加1
					try {
						if(myapp.getTimes()<3)
						{
							if(myapp.getTimes()==0)//说明第一次使用，并且把当前的时间记录下来
							{
								apiService.addTimes(appKey);//先将次数加1
								Date datetime= new Date();
								String startime=datetime.toLocaleString();
								apiService.addStartime(appKey,startime);//记录第一次使用时间
							}else{
								apiService.addTimes(appKey);
								Date datetime= new Date();
								String endtime=datetime.toLocaleString();
								apiService.addEndtime(appKey,endtime);//记录最后一次使用时间
								MyApp myapp1=apiService.getmyapp(appKey);
								
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								 java.util.Date startime = myapp1.getStartime();
//								 java.util.Date startime = df.parse(myapp.getStartime());
//								 java.util.Date endtime=df.parse(myapp.getEndtime());
								java.util.Date endtime1=myapp1.getEndtime();
								String str1=endtime1.toLocaleString();
								long l=endtime1.getTime()-startime.getTime();
								long day=l/(24*60*60*1000);
								if(day>=1)//如果超过一天以上，就把使用次数置为0
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
							request.setAttribute("message", "您今天申请该数据的AppKey次数已经使用完，请购买继续使用");
							request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
						}
					} catch (SQLException e1) {
						// 
						e1.printStackTrace();
					}
					//可以得到tableId即表名，则通过tableId来查看对应的xml文件
					
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
					request.setAttribute("message", "使用之前，请先申请该数据的AppKey或使用正确的AppKey");
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
		//请求地址
		String requestUrl=request.getParameter("requestUrl");
		//请求参数1： appkey
		String appKey=request.getParameter("key");
		
		//请求参数2：数据返回的格式 xml/json
		String dtype=request.getParameter("dtype");
		//请求的数据库表名
		String dtname=requestUrl.substring(requestUrl.lastIndexOf("/")+1);
		APIService apiService=new APIService();
		try {
			MyApp myapp=apiService.getmyapp(appKey);//验证AppKey是否正确存在
			//1.首先判断key是否为空
			if(myapp!=null)//1.1 app不为空
			{
				//2.如果验证正确之后就根据AppKey使访问次数加1
					if(myapp.getTimes()<3)
					{
						if(myapp.getTimes()==0)//说明第一次使用，并且把当前的时间记录下来
						{
							apiService.addTimes(appKey);//先将次数加1
							Date datetime= new Date();
							String startime=datetime.toLocaleString();
							apiService.addStartime(appKey,startime);//记录第一次使用时间
						}else{
							apiService.addTimes(appKey);
							Date datetime= new Date();
							String endtime=datetime.toLocaleString();
							apiService.addEndtime(appKey,endtime);//记录最后一次使用时间
							MyApp myapp1=apiService.getmyapp(appKey);
							
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							 java.util.Date startime = myapp1.getStartime();
//							 java.util.Date startime = df.parse(myapp.getStartime());
//							 java.util.Date endtime=df.parse(myapp.getEndtime());
							java.util.Date endtime1=myapp1.getEndtime();
							String str1=endtime1.toLocaleString();
							long l=endtime1.getTime()-startime.getTime();
							long day=l/(24*60*60*1000);
							if(day>=1)//如果超过一天以上，就把使用次数置为0
							{
								apiService.updateTimes(appKey);
							}
						}
						//3.根据用户要求返回的数据格式为xml或json
						if("xml".equals(dtype))//数据以xml格式返回
						{
							String filePath=this.getServletContext().getRealPath("/xml/"+dtname+".xml");
							System.out.println(filePath);
							//1.创建xml文件解析器
							SAXReader reader=new SAXReader();
							//2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
							Document document;
							try {
								document = reader.read(new File(filePath));
								//3.得到xml文件的根元素
								Element rootElement=document.getRootElement();
								//4.根据xml文件根元素读取子元素
								List<Element> listElements=rootElement.elements();
								String str=rootElement.asXML();
								response.getWriter().write(str);
							} catch (DocumentException e) {
								// 
								e.printStackTrace();
							}
						}
						else{//数据以json格式返回
							String jsonObj=new CreatedataService().createJson(dtname);
							response.getWriter().write(jsonObj);
						}
						
					}
					else{
						
//						request.setAttribute("message", "您今天申请该数据的AppKey次数已经使用完，请购买继续使用");
//						/request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
						response.getWriter().write("您今天申请该数据的AppKey次数已经使用完，请购买继续使用");
					}
			
			}
			else{//1.2 appkey为空
				/*{
				    "resultcode": "200",
				    "reason": "appkey不存在或过期!",
				    "error_code": 10001
				}*/
				response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"appkey不存在或过期!\",\n\"error_code\": 10001\n}");
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
		

		
	}

}
