package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.AppCategoryImpl;
import cn.ctdss.lr.domain.AppCategory;

public class AppCategoryService {

	AppCategoryImpl appCategoryImpl=new AppCategoryImpl();
	/**
	 * ����id�õ�ʵ��
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public AppCategory getById(int cid) throws SQLException {
		// 
		return appCategoryImpl.getById(cid);
	}
	/**
	 * ����MyApp���еķ���õ����еķ�������
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> getAllForCount() throws SQLException {
		return appCategoryImpl.getAllForCount();
	}
	/**
	 * ��ʾ���е�APP����
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> listallappcate2show() throws SQLException {
		return appCategoryImpl.listallappcate2show();
	}

	
}
