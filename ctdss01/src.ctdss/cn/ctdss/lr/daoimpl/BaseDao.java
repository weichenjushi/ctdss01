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
		//ȡ��BaseDao���ֽ������
		Class baseDaoClass = this.getClass();
		//ȡ��BaseDao�ķ�������
		Type type = (Type) baseDaoClass.getGenericSuperclass();
		//��Typeת��ParameterizedType����ȡ��BaseDao<Type>�Ĳ���������
		ParameterizedType pt = (ParameterizedType) type;
		//ȡ�ò����������е�ʵ���������ͣ���Type
		this.clazz = (Class) pt.getActualTypeArguments()[0];
		int index = this.clazz.getName().lastIndexOf(".");
		//����
		this.tableName = this.clazz.getName().substring(index+1).toLowerCase();
	}
	
	public List<T> getTableById(String tableId) throws SQLException {
		String sql="select * from "+tableId+";";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<T> ts=runner.query(sql, new BeanListHandler(clazz));
		return ts;
	}
}
