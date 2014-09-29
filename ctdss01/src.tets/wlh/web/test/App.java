package wlh.web.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

public class App {
	private static SessionFactory sessionFactory;
	static {
		// 读取配置文件并生成Session 工厂对象
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		// cfg.addClass(User.class);
		sessionFactory = cfg.buildSessionFactory();
	}

	// 将对象保存到数据库中
	@Test
	public void testSave() throws Exception {
		// 1.获取对象，即给对象赋值
		User user = new User();
		user.setName("王五");
		// 2.将对象保存到数据库中
		Session session = sessionFactory.openSession();// 得到Session
		Transaction tx = session.beginTransaction();// 开启事务
		// ---------------------------------------
		session.save(user);
		// ---------------------------------------
		tx.commit();// 提交事务
		session.close();// 关闭连接
	}

	// 从数据库中取出一条数据
	@Test
	public void testGet() throws Exception {
		// 1.得到对象
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = (User) session.get(User.class, 1);
		tx.commit();
		session.close();

		// 2.将对象显示出来
		System.out.println(user);
	}
}
