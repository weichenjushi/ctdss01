package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.APIDaoImpl;
import cn.ctdss.lr.daoimpl.AppsDaoImpl;
import cn.ctdss.lr.domain.MyApp;

public class APIService {

	APIDaoImpl apiDao = new APIDaoImpl();

	// 新增myapp
	public boolean add(String dtname, String username, String appkey, String appid) throws SQLException {
		
		return apiDao.add(dtname, username, appkey, appid);
	}

	// 查詢指定用戶所有的API
	public List<MyApp> queryAll(String username) throws SQLException {
		return apiDao.queryAll(username);
	}

	/**
	 * 查詢APPID得到所有的APP服务
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> queryAllByAppId(String username) throws SQLException {
		return apiDao.queryAllByAppId(username);
	}

	/**
	 * 根据用户名和appkey来验证appkey是否正确
	 * 
	 * @param username
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean validateKey(String appKey) throws SQLException {
		return apiDao.validateKey(appKey);
	}

	/**
	 * 使访问次数加1
	 * 
	 * @param appKey
	 * @throws SQLException
	 */
	public boolean addTimes(String appKey) throws SQLException {
		return apiDao.addTimes(appKey);
	}

	/**
	 * 根据AppKey得到MyApp实体
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public MyApp getmyapp(String appKey) throws SQLException {
		
		return apiDao.getmyapp(appKey);
	}

	/**
	 * 添加用户第一次使用的时间
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean addStartime(String appKey, String startime) throws SQLException {
		
		return apiDao.addStartime(appKey, startime);
	}

	/**
	 * 添加用户最后一次使用的时间
	 * 
	 * @param appKey
	 * @param endtime
	 * @return
	 * @throws SQLException
	 */
	public boolean addEndtime(String appKey, String endtime) throws SQLException {
		return apiDao.addEndtime(appKey, endtime);
	}

	/**
	 * 根据appKey将用户使用次数置为0
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean updateTimes(String appKey) throws SQLException {
		return apiDao.updateTimes(appKey);
	}

	/**
	 * 根据username和dtname查询myapp
	 * 
	 * @param username
	 * @param dtname
	 * @return
	 * @throws SQLException
	 */
	public MyApp getmyapp(String username, String dtname) throws SQLException {
		return apiDao.getmyapp(username, dtname);
	}

	/**
	 * 管理员查看每个APP的调用情况
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> listapps() throws SQLException {
		return apiDao.listapps();
	}

	/**
	 * 在myapp表中得到所有的appid
	 * 
	 * @return
	 */
	public List<String> listappids() {
		return apiDao.listappids();
	}

	/**
	 * 根据数据服务种类id来得到该种类的所有数据服务
	 * 
	 * @param acgid
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> getAllByAcgId(String acgid) throws SQLException {
		return apiDao.listappids(acgid);
	}

	/*
	 * 
	 * 更新开始时间和次数
	 */
	public void updateStartTimes(String appKey, String endtime1) throws SQLException {
		apiDao.updateStartTimes(appKey,endtime1);
	}

	public MyApp getmyappbyid(String id) throws SQLException {
		MyApp myapp=apiDao.getmyappbyid(id);
		myapp.setAppname(new AppsDaoImpl().getByTname(myapp.getDtname()).getName());
		return myapp;
	}

	public void upstatebymyappid(String myappid, int i) throws SQLException {
		apiDao.upstatebymyappid(myappid, i);
		
	}
	//每天更新次数为0
	public void updateallTimes() throws SQLException {
		apiDao.updateallTimes();
		
	}

}
