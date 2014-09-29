package cn.ctdss.lr.daoimpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.Excel;
import cn.ctdss.lr.domain.Subway;
import cn.ctdss.lr.utils.JdbcUtil;

public class SubwayDaoImpl {

	/**
	 * 1.得到所有的地铁信息
	 * @return
	 * @throws SQLException
	 */
	public List<Subway> listAllSubway() throws SQLException
	{
		List<Subway> listSubway=new ArrayList<Subway>();
		String sql="select * from hh";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		listSubway= runner.query(sql, new BeanListHandler(Subway.class));
		return listSubway;
	}
	/**
	 * 2.返回数据库中的所有表信息
	 * @return
	 * @throws SQLException
	 */
	public List<Excel> listAllExcels() throws SQLException
	{
		List<Excel> listExcel=new ArrayList<Excel>();
		String sql="show tables;";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		listExcel=runner.query(sql, new BeanListHandler(Excel.class));
		return listExcel;
	}
	/**
	 * 3.根据数据库表名得到表的所有字段
	 * @param tableId
	 * @return
	 * @throws SQLException 
	 */
	/*public List<Subway> getTableById(String tableId) throws SQLException {
		String sql="select * from subway";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Subway> subways=runner.query(sql, new BeanListHandler(Subway.class));
		return subways;
	}*/
	public List<Object> getTableById(String tableId) throws SQLException {
		String sql="select * from "+tableId+";";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Object> subways=runner.query(sql, new BeanListHandler(Object.class));
		return subways;
	}
}
