package cn.ctdss.lr.daoimpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.utils.JdbcUtil;

public class AppCategoryImpl {
	/**
	 * ����id�õ�ʵ��
	 * 
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public AppCategory getById(int cid) throws SQLException {
		String sql = "select * from appcategory where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		AppCategory appCategory = runner.query(sql, cid, new BeanHandler(AppCategory.class));
		return appCategory;
	}

	/**
	 * ����MyApp���еķ���õ����еķ�������
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> getAllForCount() throws SQLException {
		String sql="SELECT distinct a.id,a.name from appcategory as a,apps as b where a.id=b.cid and b.cid in(SELECT appid from myapp)";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<AppCategory> list=runner.query(sql, new BeanListHandler(AppCategory.class));
		return list;
	}
	/**
	 * ��ʾ���е�APP����
	 * @return
	 * @throws SQLException 
	 */
	public List<AppCategory> listallappcate2show() throws SQLException {
		String sql="select * from appcategory";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<AppCategory> list=runner.query(sql, new BeanListHandler(AppCategory.class));
		return list;
	}

}
