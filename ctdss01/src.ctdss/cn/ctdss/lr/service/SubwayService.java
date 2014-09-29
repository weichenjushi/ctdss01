package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.SubwayDaoImpl;
import cn.ctdss.lr.domain.Excel;
import cn.ctdss.lr.domain.Subway;

public class SubwayService {

	SubwayDaoImpl subwayDao = new SubwayDaoImpl();

	/**
	 * 1.�õ����еĵ�����Ϣ
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Subway> listAllSubway() throws SQLException {
		return subwayDao.listAllSubway();
	}

	/**
	 * 2.�������ݿ��е����б���Ϣ
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Excel> listAllExcels() throws SQLException {
		return subwayDao.listAllExcels();
	}

	/**
	 * 3.�������ݿ�����õ���������ֶ�
	 * @param tableId
	 * @return
	 * @throws SQLException 
	 */
	/*public List<Subway> getTableById(String tableId) throws SQLException {
		return subwayDao.getTableById(tableId);
	}*/
	public List<Object> getTableById(String tableId) throws SQLException {
		return subwayDao.getTableById(tableId);
	}
}
