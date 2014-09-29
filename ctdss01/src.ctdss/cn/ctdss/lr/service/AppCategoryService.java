package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.AppCategoryImpl;
import cn.ctdss.lr.domain.AppCategory;

public class AppCategoryService {

	AppCategoryImpl appCategoryImpl=new AppCategoryImpl();
	/**
	 * 根据id得到实体
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public AppCategory getById(int cid) throws SQLException {
		// 
		return appCategoryImpl.getById(cid);
	}
	/**
	 * 根据MyApp表中的服务得到所有的服务种类
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> getAllForCount() throws SQLException {
		return appCategoryImpl.getAllForCount();
	}
	/**
	 * 显示所有的APP种类
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> listallappcate2show() throws SQLException {
		return appCategoryImpl.listallappcate2show();
	}

	
}
