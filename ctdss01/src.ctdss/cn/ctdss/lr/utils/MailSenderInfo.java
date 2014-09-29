package cn.ctdss.lr.utils;

/** 
* �����ʼ���Ҫʹ�õĻ�����Ϣ 
*/ 
import java.util.Properties; 
public class MailSenderInfo { 
	// �����ʼ��ķ�������IP�Ͷ˿� 
	private String mailServerHost = "smtp.163.com"; 
	private String mailServerPort = "25"; 
	// �ʼ������ߵĵ�ַ 
	private String fromAddress = "yunjisuanzhongxin@163.com";

	// �ʼ������ߵĵ�ַ 
	private String toAddress ; 
	// ��½�ʼ����ͷ��������û��������� 
	private String userName = "yunjisuanzhongxin@163.com"; 
	private String password = "yunjisuan"; 
	// �Ƿ���Ҫ�����֤ 
	private boolean validate = false; 
	// �ʼ����� 
	private String subject; 
	// �ʼ����ı����� 
	private String content; 
	// �ʼ��������ļ��� 
	private String[] attachFileNames; 
	
	public void setEmail(String toAddress,boolean validate, String subject) {
		this.validate = validate;
		this.toAddress = toAddress;
		this.subject = subject;
	}
	
	public void setEmail(String mailServerHost,String mailServerPort,String user,String pwd,String from, String to, String subject) {
		this.mailServerHost = mailServerHost;
		this.mailServerPort = mailServerPort;
		this.userName = user;
		this.password = pwd;
		this.fromAddress = from;
		this.toAddress = to;
		this.subject = subject;
	}
	
	/** 
	  * ����ʼ��Ự���� 
	  */ 
	public Properties getProperties(){ 
	  Properties p = new Properties(); 
	  p.put("mail.smtp.host", this.mailServerHost); 
	  p.put("mail.smtp.port", this.mailServerPort); 
	  p.put("mail.smtp.auth", validate ? "true" : "false"); 
	  return p; 
	} 
	public String getMailServerHost() { 
	  return mailServerHost; 
	} 
	public void setMailServerHost(String mailServerHost) { 
	  this.mailServerHost = mailServerHost; 
	}
	public String getMailServerPort() { 
	  return mailServerPort; 
	}
	public void setMailServerPort(String mailServerPort) { 
	  this.mailServerPort = mailServerPort; 
	}
	public boolean isValidate() { 
	  return validate; 
	}
	public void setValidate(boolean validate) { 
	  this.validate = validate; 
	}
	public String[] getAttachFileNames() { 
	  return attachFileNames; 
	}
	public void setAttachFileNames(String[] fileNames) { 
	  this.attachFileNames = fileNames; 
	}
	public String getFromAddress() { 
	  return fromAddress; 
	} 
	public void setFromAddress(String fromAddress) { 
	  this.fromAddress = fromAddress; 
	}
	public String getPassword() { 
	  return password; 
	}
	public void setPassword(String password) { 
	  this.password = password; 
	}
	public String getToAddress() { 
	  return toAddress; 
	} 
	public void setToAddress(String toAddress) { 
	  this.toAddress = toAddress; 
	} 
	public String getUserName() { 
	  return userName; 
	}
	public void setUserName(String userName) { 
	  this.userName = userName; 
	}
	public String getSubject() { 
	  return subject; 
	}
	public void setSubject(String subject) { 
	  this.subject = subject; 
	}
	public String getContent() { 
	  return content; 
	}
	public void setContent(String textContent) { 
	  this.content = textContent; 
	} 
} 
