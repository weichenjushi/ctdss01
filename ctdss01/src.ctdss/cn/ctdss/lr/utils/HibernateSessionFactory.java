package cn.ctdss.lr.utils;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {
	private static Configuration cf = null;
	private static SessionFactory sf = null;
	static{
	try {
	cf = new Configuration().configure();
	sf = cf.buildSessionFactory();//创建session
	} catch (HibernateException e) {
	throw new RuntimeException("SessionFactory创建失败",e);
	}
	}
	public static Session getSession(){//获得session的方法
	Session session = null;
	try {
	if (session==null||session.isOpen()==false)
	session = null;
	session = sf.openSession();
	} catch (HibernateException e) {
	throw new RuntimeException("Session创建失败",e);
	}
	return session;
	}
	public static void closed(Session session){//关闭session的方法
	try {
	if(session!=null)
	session.close();
	} catch (HibernateException e) {
	throw new RuntimeException("Session关闭失败",e);
	}
	}
	public static void main(String[] args) {//测试方法
	getSession();
	}
}
