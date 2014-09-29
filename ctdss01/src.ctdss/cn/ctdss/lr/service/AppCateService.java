package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.AppCateDaoImpl;
import cn.ctdss.lr.domain.AppCategory;

public class AppCateService {
	AppCateDaoImpl appCateDaoImpl=new AppCateDaoImpl();
	/**
	 * ������ݷ�������
	 * 
	 * @param appCategoryname
	 * @return
	 * @throws SQLException 
	 */
	public String create(String appCategoryname) throws SQLException {
		if(appCateDaoImpl.checkIsExist(appCategoryname))
		{
			return appCateDaoImpl.create(appCategoryname);
		}
		return "�����ݷ��������Ѵ���";
	}
	/**
	 * �г����е����ݷ�������
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> listall() throws SQLException {
		return appCateDaoImpl.listall();
	}
	public String delById(String id) throws SQLException {
		return appCateDaoImpl.delById(id);
	}
	public AppCategory getById(String id) throws SQLException {
		return appCateDaoImpl.getById(id);
	}
	public String update(String name,String id) throws SQLException {
		return appCateDaoImpl.update(name,id);
	}

}
