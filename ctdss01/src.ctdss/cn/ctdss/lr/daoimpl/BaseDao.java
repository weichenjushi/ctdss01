package cn.ctdss.lr.daoimpl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.utils.JdbcUtil;

public class BaseDao<T> {
	
	private Class clazz;
	private String tableName;
	public BaseDao(){
		//取得BaseDao的字节码对象
		Class baseDaoClass = this.getClass();
		//取得BaseDao的泛型类型
		Type type = (Type) baseDaoClass.getGenericSuperclass();
		//将Type转发ParameterizedType，即取得BaseDao<Type>的参数化类型
		ParameterizedType pt = (ParameterizedType) type;
		//取得参数化类型中的实例参数类型，即Type
		this.clazz = (Class) pt.getActualTypeArguments()[0];
		int index = this.clazz.getName().lastIndexOf(".");
		//表名
		this.tableName = this.clazz.getName().substring(index+1).toLowerCase();
	}
	
	public List<T> getTableById(String tableId) throws SQLException {
		String sql="select * from "+tableId+";";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<T> ts=runner.query(sql, new BeanListHandler(clazz));
		return ts;
	}
}
