package cn.ctdss.lr.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	// ����SessionFactory
	private static final SessionFactory sessionFactory;
	static {
		// ʵ����sessionFactory
		sessionFactory = (new Configuration()).configure().buildSessionFactory();
		
	}
	//SessionFactory�����̰߳�ȫ�ģ�Session�����̰߳�ȫ�ģ���������ʹ��ThreadLocal��������Session��װ����ǰ�����߳���
	public static final ThreadLocal sessionThread=new ThreadLocal();
	/**
	 * �õ���ǰSession
	 * @return
	 */
	public static Session currentSession(){
		//Session s=(Session) sessionThread.get();
		Session s=null;
		//��sessionΪ�ջ����Ѿ��رյ�ʱ�򣬾��´���һ��session����
		if(s==null||!s.isOpen())
		{
			s=sessionFactory.openSession();
			sessionThread.set(s);
		}
		return s;
	}
	
	/**
	 * �ر�Session
	 */
	public static void closeSession()
	{
		Session s=(Session) sessionThread.get();
		sessionThread.set(null);
		if(s!=null)
		{
			s.close();
		}
	}
}
