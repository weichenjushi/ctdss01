package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.SubwayDaoImpl;
import cn.ctdss.lr.domain.Excel;
import cn.ctdss.lr.domain.Subway;

public class SubwayService {

	SubwayDaoImpl subwayDao = new SubwayDaoImpl();

	/**
	 * 1.得到所有的地铁信息
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Subway> listAllSubway() throws SQLException {
		return subwayDao.listAllSubway();
	}

	/**
	 * 2.返回数据库中的所有表信息
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Excel> listAllExcels() throws SQLException {
		return subwayDao.listAllExcels();
	}

	/**
	 * 3.根据数据库表名得到表的所有字段
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
