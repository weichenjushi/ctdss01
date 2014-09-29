package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.UserDaoImpl;
import cn.ctdss.lr.domain.ULevel;
import cn.ctdss.lr.domain.User;

public class UserService {
	UserDaoImpl userDaoImpl = new UserDaoImpl();

	/**
	 * 查询所有有效用户
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> listusers() throws SQLException {
		return userDaoImpl.listusers();
	}

	/**
	 * 根据用户id软删除用户
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public boolean delById(String uid) throws SQLException {
		return userDaoImpl.delById(uid);
	}

	/**
	 * 得到所有有效的用户名
	 * 
	 * @return
	 */
	public List<String> listunames() {
		return userDaoImpl.listunames();
	}

	/**
	 * 得到所有未激活用户
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> unactivatedusers() throws SQLException {
		return userDaoImpl.unactivatedusers();
	}

	/**
	 * 得到所有黑名单用户
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> blacklistusers() throws SQLException {
		return userDaoImpl.blacklistusers();
	}

	/**
	 * 恢复软删除用户
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public boolean regainById(String uid) throws SQLException {
		return userDaoImpl.regainById(uid);
	}

	/**
	 * 得到所有用户级别ids
	 * @return
	 */
	public List<String> getULevelId() {
		return userDaoImpl.getULevelId();
	}
/**
 * 根据用户id更新用户等级
 * @param uid
 * @param ulevelid
 * @return
 */
	public void updateuserlevelbyID(String uid, String ulevelid) {
		userDaoImpl.updateuserlevelbyID(uid, ulevelid);
	}

public List<ULevel> listulevels() throws SQLException {
	return userDaoImpl.listulevels();
}

public ULevel getULevelById(String id) throws SQLException {
	return userDaoImpl.getULevelById(id);
}

public void modifyulevelinfo(String id, String points, String times) {
	userDaoImpl.modifyulevelinfo(id, points, times);
	
}

public User getuinfobyname(String uname) throws SQLException {
	return userDaoImpl.getuinfobyname(uname);
}

}
