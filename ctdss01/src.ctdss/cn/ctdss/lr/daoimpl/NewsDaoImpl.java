package cn.ctdss.lr.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.News;
import cn.ctdss.lr.utils.JdbcUtil;

public class NewsDaoImpl {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	public boolean addnews(News news) throws SQLException {
		boolean flag = false;
		String sql = "insert into news(title,type,content,sfrom,addtime) values(?,?,?,?,?)";
		String addtime = new Date().toLocaleString();
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, new Object[] { news.getTitle(), news.getType(), news.getContent(), news.getSfrom(), addtime });
		if (i == 1) {
			flag = true;
		}
		return flag;
	}

	public List<News> list(int i) throws SQLException {
		String sql = "select * from news where stage=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> list = runner.query(sql, i, new BeanListHandler(News.class));
		return list;
	}

	public List<News> importnews(int i) throws SQLException {
		String sql = "select * from news where stage=? and type='importances/2014' order by addtime desc limit 5";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> list = runner.query(sql, i, new BeanListHandler(News.class));
		return list;
	}

	public List<News> recentnews(int i) throws SQLException {
		String sql = "select * from news where stage=?  order by addtime desc limit 5";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> list = runner.query(sql, i, new BeanListHandler(News.class));
		return list;
	}

	public List<News> recent(int i) throws SQLException {
		String sql = "select * from news where stage=? and type='newsfiles/2014' order by addtime desc";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> list = runner.query(sql, i, new BeanListHandler(News.class));
		return list;
	}

	public List<News> importance(int i) throws SQLException {
		String sql = "select * from news where stage=? and type='importances/2014' order by addtime desc";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> list = runner.query(sql, i, new BeanListHandler(News.class));
		return list;
	}

	public List<News> getbypageadmin(String currNo, String pageSize) throws SQLException {
		int startIndex = (Integer.parseInt(currNo) - 1) * Integer.parseInt(pageSize);
		String sql = "SELECT * from news where stage=? LIMIT " + startIndex + "," + pageSize;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> apps = runner.query(sql, 0, new BeanListHandler(News.class));
		return apps;
	}

	public int getrowcount() {
		String sql = "SELECT count(*) rowcount from news where stage=0;";
		int i = 0;
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				i = rs.getInt("rowcount");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return i;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public int getrowcountuserr() {
		String sql = "SELECT count(*) rowcount from news where stage=0 and  type='newsfiles/2014';";
		int i = 0;
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				i = rs.getInt("rowcount");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return i;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public List<News> getbypageuserr(String currNo, String pageSize) throws SQLException {
		int startIndex = (Integer.parseInt(currNo) - 1) * Integer.parseInt(pageSize);
		String sql = "SELECT * from news where stage=? and type='newsfiles/2014' LIMIT " + startIndex + "," + pageSize;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> apps = runner.query(sql, 0, new BeanListHandler(News.class));
		return apps;
	}

	public int getrowcountuseri() {
		String sql = "SELECT count(*) rowcount from news where stage=0 and  type='importances/2014';";
		int i = 0;
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				i = rs.getInt("rowcount");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return i;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public List<News> getbypageuseri(String currNo, String pageSize) throws SQLException {
		int startIndex = (Integer.parseInt(currNo) - 1) * Integer.parseInt(pageSize);
		String sql = "SELECT * from news where stage=? and type='importances/2014' LIMIT " + startIndex + "," + pageSize;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<News> apps = runner.query(sql, 0, new BeanListHandler(News.class));
		return apps;
	}

	public News getbyId( String id) throws SQLException {
		String sql = "select * from news where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		News list = runner.query(sql, id, new BeanHandler(News.class));
		return list;

	}

	public boolean deletebyId(String id) throws SQLException {
		boolean flag=false;
		String sql = "delete from news where id=?";
		 QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i= runner.update(sql, id);
		if(i==1){
			flag=true;
		}
		return flag;
	}

	public boolean update(News news) throws SQLException {
		boolean flag=false;
		String sql = "update news set title=?,sfrom=?,content=?,type=? where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i= runner.update(sql, new Object[]{news.getTitle(),news.getSfrom(),news.getContent(),news.getType(),news.getId()});
		if(i==1){
			flag=true;
		}
		return flag;
	}

}
