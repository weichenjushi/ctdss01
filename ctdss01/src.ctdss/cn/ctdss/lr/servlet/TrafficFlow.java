package cn.ctdss.lr.servlet;

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
		 response.setContentType("text/html");	
		   //response.setIntHeader("Refresh", 5);
		   /*PrintWriter out=response.getWriter();
		   Configuration conf;
		   FileSystem fs;
		   FSDataInputStream fsin;
		   if(request.getPathInfo()==null){	
			   //File f=new File("/root/experiment/aggregation");
			   //File[] fs=f.listFiles(new MyFilter(".txt"));	
			   //Arrays.sort(fs);
			   //FileInputStream fin=new FileInputStream(fs[fs.length-1]);
			   //BufferedReader b=new BufferedReader(new InputStreamReader(fin));
			   conf=new Configuration();
			   conf.addResource(new Path("/usr/local/hadoop-2.3.0/etc/hadoop/core-site.xml"));	
			   conf.addResource(new Path("/usr/local/hadoop-2.3.0/etc/hadoop/hdfs-site.xml"));
			   fs=FileSystem.get(conf);
			   fsin=fs.open(new Path("hdfs://localhost:8020/experiment/aggregations.txt"));
			   fsin.seek(preposition);
			   String temp;
			   out.write("<html><head><title>new aggregations</title></head>");
			   out.write("<body>");
			   while((temp=fsin.readLine())!=null){			   
				   out.write(temp+"<br/>");	
			   }
			   out.write("</body>");
			   out.write("</html>");
			   if(position==fsin.getPos()){
				   position=fsin.getPos();
			   }else{
				   preposition=position;
				   position=fsin.getPos();
			   }		   		  
			   fsin.close();
		   }
		  
		   if(request.getPathInfo()!=null){
			   out.write("<html><head><title>new aggregations</title></head>");
			   out.write("<body>");
			   out.write("error request!"+"<br/>");
			   out.write("</body>");
			   out.write("</html>");
		   }*/
		 //1.根据请求的数据格式dataType：xml或者json
		 System.out.println(request.getPathInfo());
		 if(request.getPathInfo()!=null){
			 String dataType=request.getPathInfo().substring(1, request.getPathInfo().length());
			 System.out.println(dataType);
			 if("xml".equals(dataType)){
				 
			 }else{//json数据格式
				 
			 }
		 }
		 else{//显示普通数据
			 System.out.println("come in");
			
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
