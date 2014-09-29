package cn.ctdss.lr.daoimpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.AppCategory;
import cn.ctdss.lr.utils.JdbcUtil;

public class AppCateDaoImpl {

	/**
	 * 添加数据服务种类
	 * 
	 * @param appCategoryname
	 * @return
	 * @throws SQLException
	 */
	public String create(String appCategoryname) throws SQLException {
		String sql = "insert into appcategory(name) values(?)";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, appCategoryname) == 1) {
			return "添加成功";
		} else {
			return "添加失败";
		}
	}

	/**
	 * 验证数据服务种类是否存在 true表示存在，false表示不存在
	 * 
	 * @param appCategoryname
	 * @return
	 * @throws SQLException
	 */
	public boolean checkIsExist(String appCategoryname) throws SQLException {
		boolean flag = false;
		String sql = "select * from appcategory where name=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		AppCategory appCate = runner.query(sql, appCategoryname, new BeanHandler(AppCategory.class));
		if (appCate == null) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 列出所有的数据服务种类
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<AppCategory> listall() throws SQLException {
		String sql = "select * from appcategory";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<AppCategory> lists = runner.query(sql, new BeanListHandler(AppCategory.class));
		return lists;
	}

	public AppCategory getById(String id) throws SQLException {
		String sql = "select * from appcategory where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		AppCategory acg = runner.query(sql, id,new BeanHandler(AppCategory.class));
		return acg;
	}

	public String delById(String id) throws SQLException {
		String sql = "delete from appcategory where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if ((runner.update(sql,id))==1){
			return "删除成功";
		}
		else{
			return "删除失败";
		}
		
	}

	public String update(String name,String id) throws SQLException {
		System.out.println("name:"+name+"id:"+id);
		String sql = "update appcategory set name=? where id=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i=runner.update(sql, new Object[]{name,id});
		if(i==1)
		{
			return "更新成功";
		}
//		if(runner.update(sql, new Object[]{name,id})==1){
//			return "更新成功";
//		}
		else{
			return "更新失败";
		}
	}

}
