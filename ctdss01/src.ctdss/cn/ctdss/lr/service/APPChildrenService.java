package cn.ctdss.lr.service;

import java.sql.SQLException;

import cn.ctdss.lr.daoimpl.APPChildrenDaoImpl;
import cn.ctdss.lr.domain.AppsChild;

public class APPChildrenService {

	APPChildrenDaoImpl appChildrenDaoImpl=new APPChildrenDaoImpl();
	/**
	 * �����ӷ���Ĳ������õ��ӷ���
	 * @param param
	 * @return
	 * @throws SQLException 
	 */
	public AppsChild getbycpname(String param) throws SQLException {
		return appChildrenDaoImpl.getbycpname(param);
	}
	public String getbyroutename(String paramvalue) {
		return appChildrenDaoImpl.getbyroutename(paramvalue);
	}
	public AppsChild getbypname(String param) throws SQLException {
		return appChildrenDaoImpl.getbypname(param);
	}

}
