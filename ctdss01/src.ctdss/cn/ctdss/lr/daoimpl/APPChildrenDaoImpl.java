package cn.ctdss.lr.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.ctdss.lr.domain.AppsChild;
import cn.ctdss.lr.utils.JdbcUtil;

public class APPChildrenDaoImpl {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	/**
	 * ����ӷ���Ĳ�����õ��ӷ���
	 * @param param
	 * @return
	 * @throws SQLException 
	 */
	public AppsChild getbycpname(String param) throws SQLException {
		String sql="select * from appschildren where param=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		AppsChild appsChild= runner.query(sql, param, new BeanHandler(AppsChild.class));
		appsChild.setParamsMap(getparmsMap(param));
		return appsChild;
	}
	private Map<String,String> getparmsMap(String param){
		sql="select * from appschildren_retparms where appchildid=?";
		Map<String, String> maplist = new HashMap<String,String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, param);
			rs = ps.executeQuery();
			while (rs.next()) {
				String key=rs.getString("pname").trim();
				String value=rs.getString("pvalue").trim();
				maplist.put(key, value);
			}
			return maplist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}
	public String getbyroutename(String paramvalue) {
		sql="select route from t_subway where name=?";
		String key="";
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, paramvalue);
			rs = ps.executeQuery();
			while (rs.next()) {
				key=rs.getString("route").trim();
			}
			return key;
		} catch (SQLException e) {
			e.printStackTrace();
			return key;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}
	public AppsChild getbypname(String param) throws SQLException {
		String sql="select * from appschildren where param=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		AppsChild appsChild= runner.query(sql, param,new BeanHandler(AppsChild.class));
		appsChild.setAddressMap(getparmsMap(param));
		return appsChild;
	}
}
