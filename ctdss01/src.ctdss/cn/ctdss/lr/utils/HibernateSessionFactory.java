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
	sf = cf.buildSessionFactory();//����session
	} catch (HibernateException e) {
	throw new RuntimeException("SessionFactory����ʧ��",e);
	}
	}
	public static Session getSession(){//���session�ķ���
	Session session = null;
	try {
	if (session==null||session.isOpen()==false)
	session = null;
	session = sf.openSession();
	} catch (HibernateException e) {
	throw new RuntimeException("Session����ʧ��",e);
	}
	return session;
	}
	public static void closed(Session session){//�ر�session�ķ���
	try {
	if(session!=null)
	session.close();
	} catch (HibernateException e) {
	throw new RuntimeException("Session�ر�ʧ��",e);
	}
	}
	public static void main(String[] args) {//���Է���
	getSession();
	}
}
