package cn.ctdss.lr.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	// 定义SessionFactory
	private static final SessionFactory sessionFactory;
	static {
		// 实例化sessionFactory
		sessionFactory = (new Configuration()).configure().buildSessionFactory();
		
	}
	//SessionFactory类是线程安全的，Session不是线程安全的，所以这里使用ThreadLocal对象来吧Session封装到当前工作线程中
	public static final ThreadLocal sessionThread=new ThreadLocal();
	/**
	 * 得到当前Session
	 * @return
	 */
	public static Session currentSession(){
		//Session s=(Session) sessionThread.get();
		Session s=null;
		//当session为空或者已经关闭的时候，就新创建一个session对象
		if(s==null||!s.isOpen())
		{
			s=sessionFactory.openSession();
			sessionThread.set(s);
		}
		return s;
	}
	
	/**
	 * 关闭Session
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
