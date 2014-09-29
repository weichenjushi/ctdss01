package cn.ctdss.lr.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import cn.ctdss.lr.daoimpl.UserDaoImpl;
import cn.ctdss.lr.domain.A;
import cn.ctdss.lr.domain.User;
import cn.ctdss.lr.utils.MailSenderInfo;
import cn.ctdss.lr.utils.SimpleMailSender;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/xml;charset=utf-8");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		String service = req.getParameter("service");
		String username = req.getParameter("username");
		UserDaoImpl userdao = new UserDaoImpl();
		
		//String contextPath = req.getContextPath(); 
		//String headerReferer =req.getHeader("Referer"); 
		//String Path = null;
		//if(headerReferer!=null)
			//Path = headerReferer.substring(0,headerReferer.indexOf(contextPath)+contextPath.length()+1);
		String path = req.getContextPath();
		String Path = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
		//处理用户的注册请求
		if ("register".equals(service)) {
			out.println("<response>");
			if (userdao.userExists(username) == 0) {
				String email = req.getParameter("email_address");
				if (userdao.emailExists(email) == 0) {
			       /* String remoteAddr = req.getRemoteAddr();
			        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
			        reCaptcha.setPrivateKey("6LdxId4SAAAAAMi7HZ0SzaQO_XgTSBMhlEbM9EM9");
			        						
			        String challenge = req.getParameter("recaptcha_challenge_field");
			        String uresponse = req.getParameter("recaptcha_response_field");
			        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);*/
					String vcode=req.getParameter("vcode");
					String sessionvcode=(String) req.getSession().getAttribute("code");
			
			        if (!vcode.equalsIgnoreCase(sessionvcode)) {
			        	out.println("<result>" + "验证码错误!" + "</result>");
			        } else {
						String password = req.getParameter("password");
//						String firstname = new String(req.getParameter("firstname").getBytes("ISO8859-1"),"utf-8");
//						String lastname = new String(req.getParameter("lastname").getBytes("ISO8859-1"),"utf-8");
						String name = new String(req.getParameter("name").getBytes("ISO8859-1"),"utf-8");
						String comp_name =new String(req.getParameter("company_name").getBytes("ISO8859-1"),"utf-8");
						DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM);
						String reg_date = df.format(new Date());

						User user = new User();
						user.setUsername(username);
						user.setPassword(password);
						user.setEmailAddress(email);
						user.setName(name);
						user.setCompanyName(comp_name);
						user.setRegdate(reg_date);
						
						String regresult = userdao.register(user);
						if ("failed".equals(regresult)) {
							out.println("<result>" + "注册失败!" + "</result>");
						} else {
							MailSenderInfo mailInfo = new MailSenderInfo();
							mailInfo.setEmail(email, true,"城市交通数据服务空间账户激活邮件");
							String content = "尊敬的 "+ name+", 我们收到您在 "
							+ "城市交通数据服务的注册.  最后一步是激活您的账户 "
							+ "前点击下面的链接，如果没有反应，请将该链接地址复制黏贴到地址栏中： "
							+ Path + "RegisterServlet?service=isactive&guid="+ regresult;
							mailInfo.setContent(content);
							SimpleMailSender sms = new SimpleMailSender();
							sms.sendTextMail(mailInfo);
							//sms.sendTextMail(mailInfo); ����html��ʽ
							out.println("<result>success</result>");
						}
					}
				} else {
					out.println("<result>" + "很遗憾，该邮箱已经被注册过了!" + "</result>");
				}
			} else {
				out.println("<result>" + "亲，用户名已经被别人抢走了，请更换用户名！" + "</result>");
			}
			out.println("</response>");
			out.close();
		} else if("checkUsername".equals(service)){//����û����Ƿ����
			out.println("<response>");
			if (userdao.userExists(username) == 1) {
				out.println("<result>亲，用户名已经被别人抢走了，请更换用户名！</result>");
			}else{
				out.println("<result>用户名可以使用！</result>");
			}
			out.println("</response>");
			out.close();
		}else if("checkEmail".equals(service)){//��������Ƿ���ע��
			out.println("<response>");
			String email = req.getParameter("email_address");
			if (userdao.emailExists(email) == 1) {
				out.println("<result>很遗憾，该邮箱已经被注册过了!</result>");
			}
			out.println("</response>");
			out.close();
		}else if("password_resets".equals(service)){//����������������
			String guid = req.getParameter("guid");
			req.getRequestDispatcher("/index/log_sign/about/update_password.jsp?guid="+guid).forward(req, resp);
		}else if("updatePwd".equals(service)){//�������������޸���������
			out.println("<response>");
			String password = req.getParameter("password");
			String guid = req.getParameter("guid");
			userdao.updatePwd(password,guid);
			out.println("<result>" + "Password changed successfully!" + "</result>");
			out.println("</response>");
			out.close();
		}else if ("isactive".equals(service)) {//����˺��Ƿ��Ѽ���
			String guid = req.getParameter("guid");
			int isActive = userdao.isActive(guid);
			if(isActive == 1){
				req.setAttribute("result", "恭喜! 您的账户已被激活!");
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			}else if(isActive == -1){
				req.setAttribute("result", "抱歉!您未激活您的账户!.");
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			}
		}else if("generate".equals(service)){//���ڴ���ٶȵ�ͼӦ�ã�����xml��ʽ�ķ���
			String serviceID = req.getParameter("serviceID");
			String filename = req.getParameter("listfilename").replace("\r", "");
			String servicename = req.getParameter("servicename");
			
			String url = Path+"ds/"+serviceID+".xml";
			//String url = "http://127.0.0.1:"+req.getServerPort()+"/DataServiceSpace/ds/"+serviceID+".xml";
			URL myurl = new URL(url);
			BufferedReader in = new BufferedReader(new InputStreamReader(myurl.openStream(),"UTF-8"));
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(req.getRealPath("/")+"/xml/temp/"+servicename+".xml")));
			String line;
			while ((line = in.readLine()) != null) {
				bw.write(line+"\n");
			}		
			
			bw.flush();
			bw.close();
			in.close();
//			System.out.println(req.getRealPath("/")+"xml\\temp\\"+servicename+".xml");
//			System.out.println(req.getRealPath("/")+"xml\\zuhe\\"+servicename+".xml");
			translate(req.getRealPath("/")+"xml\\temp\\"+servicename+".xml",req.getRealPath("/")+"xml\\zuhe\\"+servicename+".xml");
			
			if(!"choose".equals(filename)){
				compare(req.getRealPath("/")+"xml\\zuhe\\"+servicename+".xml",
						req.getRealPath("/")+"xml\\user\\"+filename+".xml",
						req.getRealPath("/")+"xml\\show\\"+filename+".xml");
			}
		}else if("getService".equals(service)){//���ڵõ��û��Լ��ķ���
			HttpSession session = req.getSession();
			String name = session.getAttribute("username") == null ? session
					.getAttribute("adminname").toString() : session
					.getAttribute("username").toString();
			List<String> serviceList = userdao.getName_ID(name);
			String nid = "";
			for(int i =0;i<serviceList.size();i++){
				nid = nid+serviceList.get(i)+"*??*";
			}
			out.println(nid);
		}
	}


	
	/**
	 * ��ȡxml��ʽ�ķ��񣬲������������ĵ�
	 * @param from
	 * @param to
	 */
	public void translate(String from,String to)
	{
		JAXBContext context;
		try {
			context = JAXBContext.newInstance(A.class);
			FileReader fr = new FileReader(from);
			Unmarshaller um = context.createUnmarshaller();
			A a = (A) um.unmarshal(fr);
			Document document;
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("UTF-8");
			document = DocumentHelper.createDocument();
			Element root = document.addElement("markers");
			String regexzuhe = "(^��ַ:)|(\\d+$)";
			Pattern pattern = Pattern.compile(regexzuhe);
			for (int i = 0; i < a.getO().size(); i++) {
				Element first = root.addElement("marker");
				Element name = first.addElement("name");
				Element address = first.addElement("address");
				//Element english_menu = first.addElement("english_menu");
				//Element content = first.addElement("content");

				name.setText(a.getO().get(i).getName());
				address.setText(pattern.matcher(a.getO().get(i).getAddress()).replaceAll("").replace("?", "").trim());
				//english_menu.setText(a.getO().get(i).getEnglish_menu().trim()+"Ӣ�Ĳ˵�");
				//content.setText("�˾�"+a.getO().get(i).getPrice().replace("?", ""));
			}
			FileOutputStream fos = new FileOutputStream(to);
			XMLWriter writer = new XMLWriter(fos, format);
			writer.write(document);
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * �ȽϷ������û��Լ���ϲ���趨����ͬ�㣬�����������һ���ļ�
	 * @param zuhefile
	 * @param userfile
	 * @param tofile
	 */
	@SuppressWarnings("rawtypes")
	public static void compare(String zuhefile, String userfile, String tofile) {
		try {
			Document document;
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("UTF-8");
			document = DocumentHelper.createDocument();
			Element root = document.addElement("markers");

			SAXReader usersaxReader = new SAXReader();
			SAXReader zuhesaxReader = new SAXReader();
			File filezuhe = new File(zuhefile);
			File fileuser = new File(userfile);
			
			Document zuhedocument = zuhesaxReader.read(filezuhe);
			List zuhelist = zuhedocument.selectNodes("//marker");
			Iterator zuheiter = zuhelist.iterator();
			while (zuheiter.hasNext()) {
				Element zuheelement = (Element) zuheiter.next();
				Iterator zuhenameiterator = zuheelement
						.elementIterator("name");

				Iterator zuheaddressiterator = zuheelement
						.elementIterator("address");
				Element zuheaddressElement = (Element) zuheaddressiterator
						.next();
				Iterator zuhemenuiterator = zuheelement.elementIterator("english_menu");
				Element zuhemenuElement = (Element)zuhemenuiterator.next();
				Iterator zuhecontentiterator = zuheelement
						.elementIterator("content");
				Element zuhecontentElement = (Element) zuhecontentiterator
						.next();
				Element zuhenameElement = (Element) zuhenameiterator.next();
				
				Document userdocument = usersaxReader.read(fileuser);
				List userlist = userdocument.selectNodes("//marker");
				Iterator useriter = userlist.iterator();
				while (useriter.hasNext()) {
					Element userelement = (Element) useriter.next();
					Iterator usernameiterator = userelement.elementIterator("name");

					Element usernameElement = (Element) usernameiterator.next();
					if (usernameElement.getText().equals(zuhenameElement.getText())) {
						Element first = root.addElement("marker");
						Element name = first.addElement("name");
						Element address = first.addElement("address");
						Element english_menu = first.addElement("english_menu");
						Element content = first.addElement("content");

						name.setText(zuhenameElement.getText());
						address.setText(zuheaddressElement.getText());
						english_menu.setText(zuhemenuElement.getText());
						content.setText(zuhecontentElement.getText());
					}
				}
			}
			FileOutputStream fos = new FileOutputStream(tofile);
			XMLWriter writer = new XMLWriter(fos, format);
			writer.write(document);
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
