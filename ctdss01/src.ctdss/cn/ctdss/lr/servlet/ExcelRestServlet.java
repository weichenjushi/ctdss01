package cn.ctdss.lr.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.Excel;
import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.service.APIService;
import cn.ctdss.lr.service.APPChildrenService;
import cn.ctdss.lr.service.AppService;
import cn.ctdss.lr.service.CreatedataService;
import cn.ctdss.lr.service.SubwayService;

/*
 @WebServlet("/ExcelRestServlet/*")*/
public class ExcelRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/xml;charset=utf-8");
		PrintWriter pwout = response.getWriter();
		String strHref = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath() + request.getServletPath();
		// 注意：这个地址是服务器端地址request.getLocalAddr()+服务器端端口号request.getLocalPort() http://127.0.0.1:8080/ctdss01/ExcelRestServlet
		// System.out.println(strHref);
		// System.out.println(request.getPathInfo());// /dbtables/后面的

		if (request.getPathInfo() != null) {// /employee-list 即请求地址的最后一部分
			String TableId = request.getPathInfo().substring(10, request.getPathInfo().length());

			if ("listtables".equals(TableId)) {

				try {
					SubwayService subwayService = new SubwayService();
					List<Excel> listtables = subwayService.listAllExcels();
					pwout.write("<?xml version='1.0' encoding='UTF-8'?>" + "\n");
					pwout.write("<p:Employees xmlns:p='http://www.employee-details.com'>" + "\n");
					for (Excel table : listtables) {
						String tableName = table.getTables_in_ctdss01();
						String tablehref = strHref + "/dbtables/" + tableName;
						pwout.write("<Tables id='" + tableName + "' href='" + tablehref + "'/>" + "\n");

					}
					pwout.write("</p:Employees >");
					pwout.flush();
					
					 * request.setAttribute("listtables", listtables); request.getRequestDispatcher("/index/core/create_data_service_wrapper.jsp").forward(request, response);
					 
				} catch (SQLException e) {
					//
					e.printStackTrace();
				}
			} else {// 显示详细的数据信息
				String appKey = request.getParameter("key");
				String dtype = request.getParameter("dtype");

				APIService apiService = new APIService();
				MyApp myapp;
				try {
					myapp = apiService.getmyapp(appKey);
					if (myapp != null && TableId.equals(myapp.getDtname().trim())) {
						// 如果验证正确之后就根据AppKey使访问次数加1
						if (myapp.getTimes() < 3) {
							if (myapp.getTimes() == 0)// 说明第一次使用，并且把当前的时间记录下来
							{
								apiService.addTimes(appKey);// 先将次数加1
								Date datetime = new Date();
								String startime = datetime.toLocaleString();
								apiService.addStartime(appKey, startime);// 记录第一次使用时间
							} else if (myapp.getTimes() == 1)// 用户一天就调用一次，导致最后一次使用时间为NULL
							{
								if (myapp.getEndtime() == null)// 如果为NULL，就调用系统的时间和开始时间做减法，如果大于一天，就将次数设置为1，并且将当前系统时间更新开始时间
								{

									Date endtime1 = new Date();
									Date startime = myapp.getStartime();
									long l = endtime1.getTime() - startime.getTime();
									long day = l / (24 * 60 * 60 * 1000);
									if (day >= 1)// 如果超过一天以上，就把使用次数置为1,和当前系统时间为开始时间
									{

										apiService.updateStartTimes(appKey, endtime1.toLocaleString());//

									} else {
										apiService.addTimes(appKey);
										Date datetime = new Date();
										String endtime = datetime.toLocaleString();
										apiService.addEndtime(appKey, endtime);// 记录最后一次使用时间
									}
								}
							} else if (myapp.getTimes() == 2)// 用户一天就调用2次，导致最后一次使用时间不为NULL
							{
								if (myapp.getEndtime() != null)// 如果不为NULL，就调用系统的时间和结束时间做减法，如果大于一天，就将次数设置为1，并且将当前系统时间更新开始时间
								{
									Date endtime2 = new Date();
									Date startime = myapp.getEndtime();
									long l = endtime2.getTime() - startime.getTime();
									long day = l / (24 * 60 * 60 * 1000);
									if (day >= 1)// 如果超过一天以上，就把使用次数置为1,和当前系统时间为开始时间
									{

										apiService.updateStartTimes(appKey, endtime2.toLocaleString());//

									} else {
										apiService.addTimes(appKey);
										Date datetime = new Date();
										String endtime = datetime.toLocaleString();
										apiService.addEndtime(appKey, endtime);// 记录最后一次使用时间
									}
								}
							}
							if ("xml".equals(dtype))// 返回数据为xml格式
							{
								String path = "http://113.11.194.86:8088/ctdss01/xml/" + TableId + ".xml";

								// request.getRequestDispatcher(path).forward(request, response);
								response.sendRedirect(path);
							} else {// 返回数据为json格式
								String jsonObj = new CreatedataService().createJson(TableId);
								// response.getWriter().write(jsonObj);
								request.getSession().setAttribute("message", jsonObj);
								response.sendRedirect("/ctdss01/admin/retjson.jsp");
							}
						} else {
							request.setAttribute("message", "您今天申请该数据的AppKey次数已经使用完，请购买继续使用");
							request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
						}

					} else {
						request.setAttribute("message", "使用之前，请先申请该数据的AppKey或使用正确的AppKey");
						request.getRequestDispatcher("/index/core/message.jsp").forward(request, response);
					}
				} catch (SQLException e1) {
					//
					e1.printStackTrace();
				}// 验证AppKey是否正确存在

			}

		}*/
		// 请求地址
//		String requestUrl = request.getParameter("requestUrl");
		//String requestUrl = "http://127.0.0.8:8080/ctdss01/ExcelRestServlet/dbtables/getroute";
		String requestUrl=request.getRequestURI();
		System.out.println(requestUrl);
		// 请求参数1： appkey
		String appKey = request.getParameter("key");

		// 请求参数2：数据返回的格式 xml/json
		String dtype = request.getParameter("dtype");
		// 请求的数据库表名
		String routename=request.getParameter("routename");
		System.out.println("routename:"+routename);
		String dtname = requestUrl.substring(requestUrl.lastIndexOf("/") + 1);
		if(routename==null||"".equals(routename)){//表明是父数据服务
			if(dtname.startsWith("t_")){//表明是父数据服务
				APIService apiService = new APIService();
				try {
					MyApp myapp = apiService.getmyapp(appKey);// 验证AppKey是否正确存在
					// 1.首先判断key是否为空
					if (myapp != null && dtname.equals(myapp.getDtname().trim())) {
						// 如果验证正确之后就根据AppKey使访问次数加1
						if (myapp.getTimes() < 3) {
							if (myapp.getTimes() == 0)// 说明第一次使用，并且把当前的时间记录下来
							{
								apiService.addTimes(appKey);// 先将次数加1
								Date datetime = new Date();
								String startime = datetime.toLocaleString();
								apiService.addStartime(appKey, startime);// 记录第一次使用时间
							} else if (myapp.getTimes() == 1)// 用户一天就调用一次，导致最后一次使用时间为NULL
								{
									apiService.addTimes(appKey);
									
							} else if (myapp.getTimes() == 2)// 用户一天就调用2次，导致最后一次使用时间不为NULL
							{
								apiService.addTimes(appKey);
							}
							// 3.根据用户要求返回的数据格式为xml或json
							if ("xml".equals(dtype))// 数据以xml格式返回
							{
								response.setContentType("text/xml;charset=utf-8");
								String filePath = this.getServletContext().getRealPath("/xml/" + dtname + ".xml");
								// System.out.println(filePath);
								// 1.创建xml文件解析器
								SAXReader reader = new SAXReader();
								// 2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
								Document document;
								try {
									document = reader.read(new File(filePath));
									// 3.得到xml文件的根元素
									Element rootElement = document.getRootElement();
									// 4.根据xml文件根元素读取子元素
									List<Element> listElements = rootElement.elements();
									String str = rootElement.asXML();
									response.getWriter().write(str);
								} catch (DocumentException e) {
									//
									e.printStackTrace();
								}
							} else {// 数据以json格式返回
								String jsonObj = new CreatedataService().createJson(dtname);
								response.getWriter().write(jsonObj);
							}

						} else {

							// request.setAttribute("message", "您今天申请该数据的AppKey次数已经使用完，请购买继续使用");
							// /request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
							response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"测试KEY超过请求限制!\",\n\"error_code\": 10008\n}");
						}

					} else {// 1.2 appkey为空
						/*
						 * { "resultcode": "200", "reason": "appkey不存在或过期!", "error_code": 10001 }
						 */
						response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"appkey不存在或过期!\",\n\"error_code\": 10003\n}");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		else{//表明是子数据服务
			//父数据表名
//			String dtname1=request.getParameter("dtname");
			String dtname1="t_subway";
			if("t_subway".equals(dtname1)&&"getroute".equals(dtname)){//t_subway数据服务-根据地铁线路得到该线路的所有站点
				/*String paramname=request.getParameter("paramname").trim();
				paramname=paramname.substring(0,paramname.length()-1);*/
				String paramvalue=request.getParameter("routename");
				paramvalue=new String(paramvalue.getBytes("ISO-8859-1"),"utf-8");
				System.out.println("routename:"+paramvalue);
//				paramvalue=paramvalue.substring(0,paramvalue.length()-1);
				//1.根据paramvalue得到该地铁线路的route字段：表t_subway
				String route=new APPChildrenService().getbyroutename(paramvalue);
				System.out.println("route:"+route);
				
				if("".equals(route)||route==null){//说明没有改地铁路线
					response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"查询不到该信息!\",\n\"error_code\": 200803\n}");
				}else{
					//2.根据route字段得到站点的所有信息
					//3.根据响应的数据类型来判断生成不同的数据格式
					boolean flag1;
					if("xml".equals(dtype)){
						response.setContentType("text/xml;charset=utf-8");
						//3.1首先创建xml文件
						String filePath=this.getServletContext().getRealPath("/xml/"+dtname1+dtname+".xml");
						try {
							flag1 = new CreatedataService().createxmlbytsp(route,filePath);
						} catch (SQLException e1) {
							e1.printStackTrace();
						}
						//3.2读取xml文件并显示
						try {
							//1.创建xml文件解析器
							SAXReader reader=new SAXReader();
							//2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
							Document document=reader.read(new File(filePath));
							//3.得到xml文件的根元素
							Element rootElement=document.getRootElement();
							//4.根据xml文件根元素读取子元素
							List<Element> listElements=rootElement.elements();
							String str=rootElement.asXML();
							response.getWriter().write(str);
						} catch (DocumentException e) {
							e.printStackTrace();
						}
					}
					else{//json
						String jsonObj = new CreatedataService().createjsonbytsp(route);
						response.getWriter().write(jsonObj);
					}
				}
			}
		}
	}

	// 使用post
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 请求地址
		String requestUrl = request.getParameter("requestUrl");
		// 请求参数1： appkey
		String appKey = request.getParameter("key");

		// 请求参数2：数据返回的格式 xml/json
		String dtype = request.getParameter("dtype");
		// 请求的数据库表名
		String dtname = requestUrl.substring(requestUrl.lastIndexOf("/") + 1);
		if(dtname.startsWith("t_")){//表明是父数据服务
			APIService apiService = new APIService();
			try {
				MyApp myapp = apiService.getmyapp(appKey);// 验证AppKey是否正确存在
				// 1.首先判断key是否为空
				if (myapp != null && dtname.equals(myapp.getDtname().trim())) {
					// 如果验证正确之后就根据AppKey使访问次数加1
					if (myapp.getTimes() < 3) {
						if (myapp.getTimes() == 0)// 说明第一次使用，并且把当前的时间记录下来
						{
							apiService.addTimes(appKey);// 先将次数加1
							Date datetime = new Date();
							String startime = datetime.toLocaleString();
							apiService.addStartime(appKey, startime);// 记录第一次使用时间
						} else if (myapp.getTimes() == 1)// 用户一天就调用一次，导致最后一次使用时间为NULL
							{
								apiService.addTimes(appKey);
								
						} else if (myapp.getTimes() == 2)// 用户一天就调用2次，导致最后一次使用时间不为NULL
						{
							apiService.addTimes(appKey);
						}
						// 3.根据用户要求返回的数据格式为xml或json
						if ("xml".equals(dtype))// 数据以xml格式返回
						{
							String filePath = this.getServletContext().getRealPath("/xml/" + dtname + ".xml");
							// System.out.println(filePath);
							// 1.创建xml文件解析器
							SAXReader reader = new SAXReader();
							// 2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
							Document document;
							try {
								document = reader.read(new File(filePath));
								// 3.得到xml文件的根元素
								Element rootElement = document.getRootElement();
								// 4.根据xml文件根元素读取子元素
								List<Element> listElements = rootElement.elements();
								String str = rootElement.asXML();
								response.getWriter().write(str);
							} catch (DocumentException e) {
								//
								e.printStackTrace();
							}
						} else {// 数据以json格式返回
							String jsonObj = new CreatedataService().createJson(dtname);
							response.getWriter().write(jsonObj);
						}

					} else {

						// request.setAttribute("message", "您今天申请该数据的AppKey次数已经使用完，请购买继续使用");
						// /request.getRequestDispatcher("/admin/message.jsp").forward(request, response);
						response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"测试KEY超过请求限制!\",\n\"error_code\": 10008\n}");
					}

				} else {// 1.2 appkey为空
					/*
					 * { "resultcode": "200", "reason": "appkey不存在或过期!", "error_code": 10001 }
					 */
					response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"appkey不存在或过期!\",\n\"error_code\": 10003\n}");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else{//表明是子数据服务
			//父数据表名
			String dtname1=request.getParameter("dtname");
			if("t_subway".equals(dtname1)&&"getroute".equals(dtname)){//t_subway数据服务-根据地铁线路得到该线路的所有站点
				String paramname=request.getParameter("paramname").trim();
				paramname=paramname.substring(0,paramname.length()-1);
				String paramvalue=request.getParameter("paramvalue");
				paramvalue=paramvalue.substring(0,paramvalue.length()-1);
				//1.根据paramvalue得到该地铁线路的route字段：表t_subway
				String route=new APPChildrenService().getbyroutename(paramvalue);
				if("".equals(route)||route==null){//说明没有改地铁路线
					response.getWriter().write("{\n\"resultcode\": \"200\",\n\"reason\": \"查询不到该信息!\",\n\"error_code\": 200803\n}");
				}else{
					//2.根据route字段得到站点的所有信息
					//3.根据响应的数据类型来判断生成不同的数据格式
					boolean flag1;
					if("xml".equals(dtype)){
						//3.1首先创建xml文件
						String filePath=this.getServletContext().getRealPath("/xml/"+dtname1+dtname+".xml");
						try {
							flag1 = new CreatedataService().createxmlbytsp(route,filePath);
						} catch (SQLException e1) {
							e1.printStackTrace();
						}
						//3.2读取xml文件并显示
						try {
							//1.创建xml文件解析器
							SAXReader reader=new SAXReader();
							//2.加载xml文件使其成为Document对象,文件路径问题：src\\wlh\\java\\xml\\car.xml
							Document document=reader.read(new File(filePath));
							//3.得到xml文件的根元素
							Element rootElement=document.getRootElement();
							//4.根据xml文件根元素读取子元素
							List<Element> listElements=rootElement.elements();
							String str=rootElement.asXML();
							response.getWriter().write(str);
						} catch (DocumentException e) {
							e.printStackTrace();
						}
					}
					else{//json
						String jsonObj = new CreatedataService().createjsonbytsp(route);
						response.getWriter().write(jsonObj);
					}
				}
			}
		}
		
		
		

	}
}
