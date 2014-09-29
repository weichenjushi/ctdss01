package cn.ctdss.lr.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class DBUtils {
	private static Connection conn = null;
	private static DataSource ds;
	
	static {
		/*ClassPathResource resource = new ClassPathResource("applicationContext.xml");
		XmlBeanFactory factory = new XmlBeanFactory(resource);
		ds = (DataSource) factory.getBean("dataSource");*/
		
		/*ds=JdbcUtil.getDataSource();
		System.out.println(ds);*/
		
	}

	public static Connection getConnection(){
		try {
			conn = JdbcUtil.getMysqlConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void free(ResultSet rs, PreparedStatement ps, Connection conn) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	public static void main(String[] args) throws SQLException {
		Connection conn = getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user");
		if(rs.next())
		System.out.println(rs.getString("USERNAME"));
	}
}
