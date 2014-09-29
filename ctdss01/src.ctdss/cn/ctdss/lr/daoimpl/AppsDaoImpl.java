package cn.ctdss.lr.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.AppsChild;
import cn.ctdss.lr.utils.DBUtils;
import cn.ctdss.lr.utils.JdbcUtil;

public class AppsDaoImpl {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	/**
	 * ���app��id�õ�doc��Ϣ
	 * 
	 * @param aId
	 * @return
	 * @throws SQLException
	 */
	public Apps getById(String aId) throws SQLException {
		String sql = "select * from apps where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		Apps app = runner.query(sql, aId, new BeanHandler(Apps.class));
		
		//statr���ڲ���İ�
		
		app.setAddressMap(getparmsvaluesByDtname(app.getTname()));
		
		
		//end
		
		return app;
	}

	private Map<String, String> getparmsvaluesByDtname(String tname) {
		sql = "SELECT key1,value1 FROM  app_retparms where dtname=?";
		Map<String, String> maplist = new HashMap<String,String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, tname);
			rs = ps.executeQuery();
			while (rs.next()) {
				String key=rs.getString("key1").trim();
				String value=rs.getString("value1").trim();
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

	/**
	 * ���app��id�õ�name��������װ��һ��map������
	 * 
	 * @throws SQLException
	 */
	public Map<String, String> getNamesById(List<String> ids) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		for (String id : ids) {
			try {
				sql = "select name from apps where id=?";
				String result = null;
				conn = JdbcUtil.getMysqlConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				while (rs.next()) {
					result = rs.getString("name");
				}
				map.put(id, result);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.free(rs, ps, conn);
			}
		}
		return map;
	}

	/**
	 * �õ�app�����е���ݱ���
	 * 
	 * @return
	 */
	public List<String> getDtnames() {
		sql = "SELECT DISTINCT tname from apps;";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				tables.add(rs.getString("tname"));
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
	 * ����µ�app
	 * 
	 * @param app
	 * @return
	 * @throws SQLException
	 */
	public boolean addnewapp(Apps app) throws SQLException {
		// cid,name,tname,num,state,description,apiaddress,apiexample,retexampxml,retexampjson,addtime
		boolean flag = false;
		sql = "INSERT INTO apps(cid,ctid,name,tname,num,state,description,apiaddress,apiexample,retexampxml,retexampjson,addtime) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, new Object[] { app.getCid(),app.getCtid(), app.getName(), app.getTname(), app.getNum(), 1, app.getDescription(), app.getApiaddress(), app.getApiexample(), app.getRetexampxml(), app.getRetexampjson(), app.getAddtime() });
		if (i == 1) {
			flag = true;
		}
		return flag;
	}

	/**
	 * �õ�������ĵ�APP
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Apps> listallnormal() throws SQLException {
		String sql = "SELECT * from apps where state=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<Apps> apps = runner.query(sql, 1, new BeanListHandler(Apps.class));
		return apps;
	}

	/**
	 * �õ����з���ĵ�APP
	 * 
	 * @return
	 * @throws SQLException 
	 */
	public List<Apps> listallbad() throws SQLException {
		String sql = "SELECT * from apps where state=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<Apps> apps = runner.query(sql, 0, new BeanListHandler(Apps.class));
		return apps;
	}

	public boolean setbad(String id) throws SQLException {
		boolean flag=false;
		String sql="update apps set state=? where id=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		if(runner.update(sql,new Object[]{0,id})==1)
		{
			flag=true;
		}
		return flag;
	}

	public boolean setnormal(String id) throws SQLException {
		boolean flag=false;
		String sql="update apps set state=? where id=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		if(runner.update(sql,new Object[]{1,id})==1)
		{
			flag=true;
		}
		return flag;
	}

	public boolean updateapp(Apps app) throws SQLException {
		boolean flag = false;
		sql = "update apps set cid=?,ctid=?,name=?,tname=?,num=?,state=?,description=?,apiaddress=?,apiexample=?,retexampxml=?,retexampjson=? where id=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, new Object[] { app.getCid(),app.getCtid(), app.getName(), app.getTname(), app.getNum(), app.getState(), app.getDescription(), app.getApiaddress(), app.getApiexample(), app.getRetexampxml(), app.getRetexampjson(), app.getId()});
		if (i == 1) {
			flag = true;
		}
		return flag;
	}

	public boolean deleteById(String id) throws SQLException {
		boolean flag=false;
		String sql="delete from apps where id=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		if(runner.update(sql,id)==1)
		{
			flag=true;
		}
		return flag;
	}

	public Apps getByTname(String tname) throws SQLException {
		String sql = "select * from apps where tname=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		Apps app = runner.query(sql, tname, new BeanHandler(Apps.class));
		app.getAddressMap().put("id", "int/序号");
		app.getAddressMap().put("name", "string/地铁名称");
		app.getAddressMap().put("distance", "string/地铁里程");
		return app;
	}
	/**
	 * �õ�������ȷ��ʾ��APP
	 * @param id
	 * @return
	 */
	public List<Apps> getByTname(int id) {
		sql = "select id,name from apps where cid=? and state=1;";
		List<Apps> tables = new ArrayList<Apps>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,Integer.toString(id));
			rs = ps.executeQuery();
			while (rs.next()) {
				Apps app=new Apps();
				app.setId(rs.getInt("id"));
				app.setName(rs.getString("name"));
				tables.add(app);
			}
			return tables;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}
	/**
	 * ��ȡ������ӵ�5����ݷ���
	 * @return
	 */
	public List<Apps> recentaddapps() {
		sql = "SELECT id,name FROM apps where state=1 ORDER BY ADDTIME DESC LIMIT 5;";
		List<Apps> tables = new ArrayList<Apps>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Apps app=new Apps();
				app.setId(rs.getInt("id"));
				app.setName(rs.getString("name"));
				tables.add(app);
			}
			return tables;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public List<Apps> listallnormalbypage(String currNo,String pageSize) throws SQLException {
		int startIndex=(Integer.parseInt(currNo)-1)*Integer.parseInt(pageSize);
		String sql = "SELECT * from apps where state=? LIMIT "+startIndex+","+pageSize;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<Apps> apps = runner.query(sql,1, new BeanListHandler(Apps.class));
		return apps;
	}

	public int getrowcount() {
		sql = "SELECT count(*) rowcount from apps where state=1;";
		int i=0;
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				i=rs.getInt("rowcount");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return i;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public void setnumadd(String dtname) throws SQLException {
		sql = "update apps set num=num+1 where tname=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, dtname);
	
	}

	public void setnumsub(String dtname) throws SQLException {	
		sql = "update apps set num=num-1 where tname=?;";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, dtname);
	}

	public List<Apps> mostapps() {
		sql = "select * from apps where state=1 order by num DESC limit 3";
		List<Apps> tables = new ArrayList<Apps>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Apps app=new Apps();
				app.setId(rs.getInt("id"));
				app.setName(rs.getString("name"));
				tables.add(app);
			}
			return tables;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public void droptable(String tname) throws SQLException {
		sql = "DROP TABLE ";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, tname);
		}

	public Apps appad() {
		sql = "SELECT id,name FROM apps where state=1 ORDER BY ADDTIME DESC LIMIT 1;";
		Apps tables = new Apps();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				tables.setId(rs.getInt("id"));
				tables.setName(rs.getString("name"));
			}
			return tables;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public boolean addnewappchild(AppsChild child) throws SQLException {
		boolean flag = false;
		sql = "INSERT INTO appschildren(cid,name,tname,num,state,description,apiaddress,apiexample,retexampxml,retexampjson,addtime,parentname,param) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int i = runner.update(sql, new Object[] { child.getCid(), child.getName(), child.getTname(), child.getNum(), 1, child.getDescription(), child.getApiaddress(), child.getApiexample(), child.getRetexampxml(), child.getRetexampjson(), child.getAddtime(),child.getParentname(),child.getParam() });
		if (i == 1) {
			flag = true;
		}
		return flag;
	}

	public List<AppsChild> listallchildren(String aId) throws SQLException {
		
		sql = "SELECT * FROM appschildren where parentid=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		return runner.query(sql, aId, new BeanListHandler(AppsChild.class));
	}

	public Map<String, String> getparmsByDtname(String dtname) {
		sql = "select column_name,data_type from information_schema.columns where table_name=?";
		Map<String, String> maplist = new HashMap<String,String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dtname);
			rs = ps.executeQuery();
			while (rs.next()) {
				String key=rs.getString("column_name").trim();
				String value=rs.getString("data_type").trim();
				if("id".equals(key)){
					maplist.put(key, "int/");
				}
				else{
					if(("varchar").equals(value)){
						value="string/";
						maplist.put(key, value);
					}
				}
			}
			return maplist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}

	public void addnewappparm(String dtname, String key, String paramvalue) {
		sql = "insert into app_retparms(dtname,key1,value1) values(?,?,?)";
		conn = DBUtils.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dtname);
			ps.setString(2, key);
			ps.setString(3, paramvalue);
			if (ps.executeUpdate() == 1) {
				
			} else {
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
	}

	public List<Apps> listall2showbyctid(int id, String ctid) {
		sql = "select id,name from apps where cid=? and state=1 and ctid=?;";
		List<Apps> tables = new ArrayList<Apps>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,Integer.toString(id));
			ps.setString(2, ctid);
			rs = ps.executeQuery();
			while (rs.next()) {
				Apps app=new Apps();
				app.setId(rs.getInt("id"));
				app.setName(rs.getString("name"));
				tables.add(app);
			}
			return tables;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}
}
