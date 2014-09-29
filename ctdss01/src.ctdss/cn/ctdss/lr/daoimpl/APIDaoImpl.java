package cn.ctdss.lr.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.utils.JdbcUtil;

public class APIDaoImpl {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	// ����myapp
	public boolean add(String dtname, String username, String appkey, String appid) throws SQLException {
		boolean flag = false;
		Date endtime1 = new Date();
		String addtime=endtime1.toLocaleString();
		String sql = "insert into myapp(dtname,username,appkey,appid,addtime) values (?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, new Object[] { dtname, username, appkey, appid,addtime});
		if (i == 1) {
			flag = true;
		}
		return flag;
	}

	/**
	 * //��ԃָ���Ñ����е�API
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> queryAll(String username) throws SQLException {
		List<MyApp> myapps = new ArrayList<MyApp>();
		String sql = "select * from myapp where username=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		myapps = runner.query(sql, username, new BeanListHandler(MyApp.class));
		return myapps;
	}

	/**
	 * ����appkey����֤appkey�Ƿ���ȷ
	 * 
	 * @param username
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean validateKey(String appKey) throws SQLException {
		boolean flag = false;
		String sql = "select * from myapp where appkey=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		MyApp myapp = runner.query(sql, appKey, new BeanHandler(MyApp.class));
		if (myapp != null) {
			flag = true;
		}
		return flag;
	}

	/**
	 * ʹ���ʴ�����1
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean addTimes(String appKey) throws SQLException {
		boolean flag = false;
		String sql = "update myapp set times=times+1 where appkey=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, appKey) == 1) {
			flag = true;
		}
		return flag;
	}

	/**
	 * ����AppKey�õ�MyAppʵ��
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public MyApp getmyapp(String appKey) throws SQLException {
		String sql = "select * from myapp where appkey=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		MyApp myapp = runner.query(sql, appKey, new BeanHandler(MyApp.class));
		return myapp;
	}

	/**
	 * ����û���һ��ʹ�õ�ʱ��
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean addStartime(String appKey, String startime) throws SQLException {
		boolean flag = false;
		String sql = "update myapp set startime=? where appkey=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, new Object[] { startime, appKey }) == 1) {
			flag = true;
		}
		;
		return false;
	}

	/**
	 * ����û����һ��ʹ�õ�ʱ��
	 * 
	 * @param appKey
	 * @param endtime
	 * @return
	 * @throws SQLException
	 */
	public boolean addEndtime(String appKey, String endtime) throws SQLException {
		boolean flag = false;
		String sql = "update myapp set endtime=? where appkey=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, new Object[] { endtime, appKey }) == 1) {
			flag = true;
		}
		;
		return false;
	}

	/**
	 * ����appKey���û�ʹ�ô�����Ϊ0
	 * 
	 * @param appKey
	 * @return
	 * @throws SQLException
	 */
	public boolean updateTimes(String appKey) throws SQLException {
		boolean flag = false;
		String sql = "update myapp set times=0 where appkey=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, appKey) == 1) {
			flag = true;
		}
		;
		return false;
	}

	/**
	 * ����username��dtname��ѯmyapp
	 * 
	 * @param username
	 * @param dtname
	 * @return
	 * @throws SQLException
	 */
	public MyApp getmyapp(String username, String dtname) throws SQLException {
		String sql = "select * from myapp where username=? and dtname=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		MyApp myapp = runner.query(sql, new Object[] { username, dtname }, new BeanHandler(MyApp.class));
		return myapp;
	}

	/**
	 * ����Ա�鿴ÿ��APP�ĵ������
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> listapps() throws SQLException {
		List<MyApp> listapps = new ArrayList<MyApp>();
		String sql = "select * from myapp;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		listapps = runner.query(sql, new BeanListHandler(MyApp.class));
		return listapps;
	}

	/**
	 * ��myapp���еõ����е�appid
	 * 
	 * @return
	 */
	public List<String> listappids() {
		sql = "select distinct appid from myapp;";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				tables.add(rs.getString("appid"));
			}
			return tables;
		} catch (SQLException e) {
			e.printStackTrace();
			return new ArrayList<String>();
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	/**
	 * ��ԃAPPID�õ����е�APP����
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> queryAllByAppId(String appid) throws SQLException {
		List<MyApp> myapps = new ArrayList<MyApp>();
		String sql = "select * from myapp where appid=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		myapps = runner.query(sql, appid, new BeanListHandler(MyApp.class));
		return myapps;
	}

	/**
	 * �������ݷ�������id���õ���������������ݷ���
	 * 
	 * @param acgid
	 * @return
	 * @throws SQLException
	 */
	public List<MyApp> listappids(String acgid) throws SQLException {
		List<MyApp> myapps = new ArrayList<MyApp>();
		String sql = "SELECT a.* from myapp as a,apps as b,appcategory as c where a.appid=b.id and b.cid=c.id and c.id=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		myapps = runner.query(sql, acgid, new BeanListHandler(MyApp.class));
		return myapps;
	}

	/**
	 * ���¿�ʼʱ��ʹ���
	 * 
	 * @param appKey
	 * @param endtime1
	 * @throws SQLException 
	 */
	public void updateStartTimes(String appKey, String endtime1) throws SQLException {
		String sql = "update myapp set startime=?,times=? where appkey=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		runner.update(sql, new Object[] {endtime1,1,appKey});
	}

	public MyApp getmyappbyid(String id) throws SQLException {
		String sql = "select * from myapp where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		MyApp myapp = runner.query(sql, id, new BeanHandler(MyApp.class));
		return myapp;
	}

	public void updateState(int state,String myappid) throws SQLException {
		String sql = "update myapp set state=? where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		runner.update(sql, new Object[] {state,myappid});
	}

	public void upstatebymyappid(String myappid, int i) throws SQLException {
		String sql = "update myapp set state=? where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		runner.update(sql, new Object[] {i,myappid});
	}

	public void updateallTimes() throws SQLException {
		String sql = "update myapp set times=0";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		runner.update(sql);
	}

}
