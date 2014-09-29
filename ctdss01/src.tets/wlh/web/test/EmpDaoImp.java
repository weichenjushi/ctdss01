package wlh.web.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.ctdss.lr.utils.HibernateSessionFactory;
import cn.ctdss.lr.utils.HibernateUtil;

public class EmpDaoImp implements EmpDao {

	

	@Override
	public void addEmp(Emp emp) {
		Session session = HibernateSessionFactory.getSession();
		Transaction tr = session.beginTransaction();
		session.save(emp);// �������
		tr.commit();// �ύ����
	}

	@Override
	public List<Emp> queryAllEmp() {
		Session session = HibernateSessionFactory.getSession();
		Transaction tr = session.beginTransaction();
		List<Emp> list =session.createQuery("from Emp").list();//��ѯȫ��
		tr.commit();//�ύ����
		return list;
	}

}
