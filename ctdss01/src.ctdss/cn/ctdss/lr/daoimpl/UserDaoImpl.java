package cn.ctdss.lr.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.ULevel;
import cn.ctdss.lr.domain.User;
import cn.ctdss.lr.utils.DBUtils;
import cn.ctdss.lr.utils.JdbcUtil;

public class UserDaoImpl {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	/**
	 * ��֤�û���¼
	 * 
	 * @param user
	 *            �û�
	 * @return int -2:�˺�δ���� -1:�û������ 0:�û�������� 1:��ͨ�û��ɹ���½ 2:����Ա�ɹ���½
	 * @exception �����쳣���½ʧ��
	 */
	public int login(User user) {
		int login_result = 0;
		try {
			if (userExists(user.getUsername()) == 0) {// ��֤�û��Ƿ����
				login_result = -1;// ��
			} else {// ��
				sql = "SELECT USERNAME,ISADMIN,ISACTIVE FROM USER WHERE USERNAME=? and PASSWORD=? and ISDEL=0";
				conn = DBUtils.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				rs = ps.executeQuery();
				if (rs.next()) {
					if (rs.getInt("ISACTIVE") == 0) {
						login_result = -2;
					} else {
						if (rs.getInt("ISADMIN") == 0) {
							login_result = 1;
						} else {
							login_result = 2;
						}
					}
				} else {
					login_result = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return login_result;
	}

	/**
	 * ��֤�û����Ƿ����
	 * 
	 * @param username
	 *            �û���
	 * @return int 1:�û������, 0:�û������
	 */
	public int userExists(String username) {
		sql = "SELECT USERID FROM USER WHERE USERNAME=?";
		conn = DBUtils.getConnection();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return result;
	}

	/**
	 * ��֤���������Ƿ���ע��
	 * 
	 * @param email
	 *            ��������
	 * @return int 1:�����Ѵ���, 0:���䲻����
	 */
	public int emailExists(String email) {
		sql = "SELECT USERID FROM USER WHERE EMAILADDRESS=?";
		conn = DBUtils.getConnection();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return result;
	}

	/**
	 * �û�ע��
	 * 
	 * @param user
	 *            �û�
	 * @return int 0:ע��ʧ�� 1:ע��ɹ�
	 */
	public String register(User user) {
		UUID uuid = UUID.randomUUID();
		sql = "INSERT INTO USER(USERNAME,PASSWORD,EMAILADDRESS,name,COMPANYNAME,GUID,REGDATE) VALUES(?,?,?,?,?,?,?)";
		conn = DBUtils.getConnection();
		String regresult = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmailAddress());
			ps.setString(4, user.getName());
			ps.setString(5, user.getCompanyName());
			ps.setString(6, uuid.toString());
			ps.setString(7, user.getRegdate());
			if (ps.executeUpdate() == 1) {
				regresult = uuid.toString();
			} else {
				regresult = "failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return regresult;
	}

	/**
	 * �һ�����
	 * 
	 * @param email
	 *            ��������
	 * @return User
	 */
	public User findPwd(String email) {
		sql = "SELECT USERNAME,NAME,GUID FROM USER WHERE EMAILADDRESS=?";
		conn = DBUtils.getConnection();
		User user = new User();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				user.setUsername(rs.getString("USERNAME"));
				user.setName(rs.getString("NAME"));
				user.setGuid(rs.getString("GUID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return user;
	}

	/**
	 * �޸�����
	 * 
	 * @param password
	 *            ����
	 * @param guid
	 *            ������
	 */
	public void updatePwd(String password, String guid) {
		sql = "UPDATE USER SET PASSWORD=? WHERE GUID=?";
		conn = DBUtils.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, guid);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
	}

	/**
	 * �޸ĸ�����Ϣ
	 * 
	 * @param user
	 *            �û�����
	 */
	public void updateUserInfo(User user) {
		sql = "UPDATE USER SET NAME=?,EMAILADDRESS=?,USERNAME=?,COMPANYNAME=? WHERE GUID=?";
		conn = DBUtils.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmailAddress());
			ps.setString(3, user.getUsername());
			ps.setString(4, user.getCompanyName());
			ps.setString(5, user.getGuid());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
	}

	/**
	 * ��ȡ������Ϣ
	 * 
	 * @param user
	 *            �û�����
	 */
	public User getUserInfo(String guid) {
		sql = "SELECT * FROM USER WHERE GUID=?";
		conn = DBUtils.getConnection();
		User user = new User();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, guid);
			rs = ps.executeQuery();
			if (rs.next()) {
				user.setUserid(rs.getInt("USERID"));
				user.setUsername(rs.getString("USERNAME"));
				user.setEmailAddress(rs.getString("EMAILADDRESS"));
				user.setName(rs.getString("NAME"));
				user.setCompanyName(rs.getString("COMPANYNAME"));
				user.setPassword(rs.getString("PASSWORD"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return user;
	}

	/**
	 * �����˻�
	 * 
	 * @param guid
	 *            ������
	 * @return int 1���˻��Ѽ��� 0���˻�δ���� -1:�˻��ظ�����
	 */
	public int isActive(String guid) {
		sql = "SELECT ISACTIVE FROM USER WHERE GUID=?";
		conn = DBUtils.getConnection();
		int isactive = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, guid);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getInt("ISACTIVE") == 0) {
					sql = "UPDATE USER SET ISACTIVE=1 WHERE GUID='" + guid + "'";
					ps = conn.prepareStatement(sql);
					ps.executeUpdate();
					isactive = 1;
				} else {
					isactive = -1;
				}
			} else {
				isactive = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return isactive;
	}

	/**
	 * ����û�GUID
	 * 
	 * @param username
	 *            �û���
	 */
	public String getGUID(String username) {
		sql = "SELECT GUID FROM USER WHERE USERNAME=?";
		conn = DBUtils.getConnection();
		String guid = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				guid = rs.getString("GUID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return guid;
	}

	/**
	 * ����û��Ƿ����?�������ֶ�
	 * 
	 * @param username
	 *            �û���
	 * @return 0:������ 1:����
	 */
	public int getIsAllowed(String username) {
		sql = "SELECT ISALLOWED FROM USER WHERE USERNAME=?";
		conn = DBUtils.getConnection();
		int isallowed = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				isallowed = rs.getInt("ISALLOWED");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return isallowed;
	}

	public String ID_exists(String serviceID) {
		sql = "SELECT NAME_ FROM DATASERVICETYPE WHERE ID=?";
		conn = DBUtils.getConnection();
		String result = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, serviceID);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getString("NAME_");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return result;
	}

	public List<String> getName_ID(String name) {
		sql = "SELECT ID ,NAME_ FROM DATASERVICETYPE where CREATOR=?";
		conn = DBUtils.getConnection();
		List<String> list = new ArrayList<String>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("NAME_"));
				list.add(rs.getString("ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
		return list;
	}

	/**
	 * ��ѯ������Ч�û�
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> listusers() throws SQLException {
		String sql = "select * from user where ISADMIN=? and ISACTIVE=? and ISDEL=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<User> listusers = runner.query(sql, new Object[] { 0, 1, 0 }, new BeanListHandler(User.class));
		return listusers;
	}

	/**
	 * ����û�id��ɾ���û�
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public boolean delById(String uid) throws SQLException {
		boolean flag = false;
		String sql = "UPDATE USER SET ISDEL=1 WHERE userid=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, uid) == 1) {
			flag = true;
		}
		return flag;
	}

	/**
	 * �õ�������Ч���û���
	 * 
	 * @return
	 */
	public List<String> listunames() {
		// sql = "select username from user where IS_ADMIN=? and IS_ACTIVE=? and IS_DEL=?";
		sql = "select distinct username from myapp;";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			// ps.setString(1, "0");
			// ps.setString(2, "1");
			// ps.setString(3, "0");
			rs = ps.executeQuery();
			while (rs.next()) {
				tables.add(rs.getString("username"));
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
	 * �õ�����δ�����û�
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> unactivatedusers() throws SQLException {
		String sql = "SELECT * from user where ISADMIN=? and ISACTIVE=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<User> listusers = runner.query(sql, new Object[] { 0, 0 }, new BeanListHandler(User.class));
		return listusers;
	}

	/**
	 * �õ����к����û�
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> blacklistusers() throws SQLException {
		String sql = "SELECT * from user where ISADMIN=? and ISDEL=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<User> listusers = runner.query(sql, new Object[] { 0, 1 }, new BeanListHandler(User.class));
		return listusers;
	}

	/**
	 * �ָ���ɾ���û�
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public boolean regainById(String uid) throws SQLException {
		boolean flag = false;
		String sql = "UPDATE USER SET ISDEL=0 WHERE userid=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		if (runner.update(sql, uid) == 1) {
			flag = true;
		}
		return flag;
	}
	/**
	 * �õ������û�����ids
	 * @return
	 */
	public List<String> getULevelId() {
		sql = "select id from ulevel";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				tables.add(rs.getString("id"));
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
	 * ����û�id�����û��ȼ�
	 * @param uid
	 * @param ulevelid
	 * @return
	 */
	public void updateuserlevelbyID(String uid, String ulevelid) {
		sql = "UPDATE USER SET ulevelid=? WHERE userid=?";
		conn = DBUtils.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ulevelid);
			ps.setString(2, uid);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
	}

	public List<ULevel> listulevels() throws SQLException {
		String sql = "SELECT * from ulevel";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		List<ULevel> listusers = runner.query(sql, new BeanListHandler(ULevel.class));
		return listusers;
	}

	public ULevel getULevelById(String id) throws SQLException {
		String sql = "SELECT * from ulevel where id=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		ULevel listusers = runner.query(sql, id,new BeanHandler(ULevel.class));
		return listusers;
	}

	public void modifyulevelinfo(String id, String points, String times) {
		sql = "UPDATE ulevel SET points=?,times=? WHERE id=?";
		conn = DBUtils.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, points);
			ps.setString(2, times);
			ps.setString(3, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.free(rs, ps, conn);
		}
	}

	public User getuinfobyname(String uname) throws SQLException {
		String sql = "SELECT * FROM USER WHERE username=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		User user= runner.query(sql, uname,new BeanHandler(User.class));
		return user;
	}

	
}
