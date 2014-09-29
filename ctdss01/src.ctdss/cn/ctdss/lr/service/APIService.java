package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.APIDaoImpl;
import cn.ctdss.lr.daoimpl.AppsDaoImpl;
import cn.ctdss.lr.domain.MyApp;

public class APIService {

	APIDaoImpl apiDao = new APIDaoImpl();

	// ����myapp
	public boolean add(String dtname, String username, String appkey, String appid) throws SQLException {
		
		return apiDao.add(dtname, username, appkey, appid);
	}

	// ��ԃָ���Ñ����е�API
	public List<MyApp> queryAll(String username) throws SQLException {
		return apiDao.queryAll(username);
	}

	/**
	 * ��ԃAPPID�õ����е�APP����
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> queryAllByAppId(String username) throws SQLException {
		return apiDao.queryAllByAppId(username);
	}

	/**
	 * �����û�����appkey����֤appkey�Ƿ���ȷ
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
	 * ʹ���ʴ�����1
	 * 
	 * @param appKey
	 * @throws SQLException
	 */
	public boolean addTimes(String appKey) throws SQLException {
		return apiDao.addTimes(appKey);
	}

	/**
	 * ����AppKey�õ�MyAppʵ��
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public MyApp getmyapp(String appKey) throws SQLException {
		
		return apiDao.getmyapp(appKey);
	}

	/**
	 * ����û���һ��ʹ�õ�ʱ��
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean addStartime(String appKey, String startime) throws SQLException {
		
		return apiDao.addStartime(appKey, startime);
	}

	/**
	 * ����û����һ��ʹ�õ�ʱ��
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
	 * ����appKey���û�ʹ�ô�����Ϊ0
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean updateTimes(String appKey) throws SQLException {
		return apiDao.updateTimes(appKey);
	}

	/**
	 * ����username��dtname��ѯmyapp
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
	 * ����Ա�鿴ÿ��APP�ĵ������
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> listapps() throws SQLException {
		return apiDao.listapps();
	}

	/**
	 * ��myapp���еõ����е�appid
	 * 
	 * @return
	 */
	public List<String> listappids() {
		return apiDao.listappids();
	}

	/**
	 * �������ݷ�������id���õ���������������ݷ���
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
	 * ���¿�ʼʱ��ʹ���
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
	//ÿ����´���Ϊ0
	public void updateallTimes() throws SQLException {
		apiDao.updateallTimes();
		
	}

}
