package wlh.web.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

public class App {
	private static SessionFactory sessionFactory;
	static {
		// ��ȡ�����ļ�������Session ��������
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		// cfg.addClass(User.class);
		sessionFactory = cfg.buildSessionFactory();
	}

	// �����󱣴浽���ݿ���
	@Test
	public void testSave() throws Exception {
		// 1.��ȡ���󣬼�������ֵ
		User user = new User();
		user.setName("����");
		// 2.�����󱣴浽���ݿ���
		Session session = sessionFactory.openSession();// �õ�Session
		Transaction tx = session.beginTransaction();// ��������
		// ---------------------------------------
		session.save(user);
		// ---------------------------------------
		tx.commit();// �ύ����
		session.close();// �ر�����
	}

	// �����ݿ���ȡ��һ������
	@Test
	public void testGet() throws Exception {
		// 1.�õ�����
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = (User) session.get(User.class, 1);
		tx.commit();
		session.close();

		// 2.��������ʾ����
		System.out.println(user);
	}
}
