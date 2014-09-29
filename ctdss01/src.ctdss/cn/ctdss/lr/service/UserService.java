package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.UserDaoImpl;
import cn.ctdss.lr.domain.ULevel;
import cn.ctdss.lr.domain.User;

public class UserService {
	UserDaoImpl userDaoImpl = new UserDaoImpl();

	/**
	 * ��ѯ������Ч�û�
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> listusers() throws SQLException {
		return userDaoImpl.listusers();
	}

	/**
	 * �����û�id��ɾ���û�
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public boolean delById(String uid) throws SQLException {
		return userDaoImpl.delById(uid);
	}

	/**
	 * �õ�������Ч���û���
	 * 
	 * @return
	 */
	public List<String> listunames() {
		return userDaoImpl.listunames();
	}

	/**
	 * �õ�����δ�����û�
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> unactivatedusers() throws SQLException {
		return userDaoImpl.unactivatedusers();
	}

	/**
	 * �õ����к������û�
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> blacklistusers() throws SQLException {
		return userDaoImpl.blacklistusers();
	}

	/**
	 * �ָ���ɾ���û�
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public boolean regainById(String uid) throws SQLException {
		return userDaoImpl.regainById(uid);
	}

	/**
	 * �õ������û�����ids
	 * @return
	 */
	public List<String> getULevelId() {
		return userDaoImpl.getULevelId();
	}
/**
 * �����û�id�����û��ȼ�
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
