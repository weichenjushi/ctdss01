package cn.ctdss.lr.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;


//JDBC������
public final class JdbcUtil {
	private static ComboPooledDataSource dataSource;
	//�õ�����Դ
	public static ComboPooledDataSource getDataSource() {
		return dataSource;
	}
	static {
		dataSource = new ComboPooledDataSource();
		
	}

	// ȡ�����Ӷ���
	public static Connection getMysqlConnection() throws SQLException {

		return dataSource.getConnection();

	}
	//�ر����Ӷ���
	public static void close(Connection conn) throws SQLException
	{
		if(conn!=null)
		{
			conn.close();
		}
	}
	public static void close(PreparedStatement pstmt) throws SQLException
	{
		if(pstmt!=null)
		{
			pstmt.close();
		}
	}
	public static void close(ResultSet rs) throws SQLException
	{
		if(rs!=null)
		{
			rs.close();
		}
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
}