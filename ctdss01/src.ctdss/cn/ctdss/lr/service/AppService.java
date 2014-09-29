package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.ctdss.lr.daoimpl.AppsDaoImpl;
import cn.ctdss.lr.domain.Apps;
import cn.ctdss.lr.domain.AppsChild;

public class AppService {

	AppsDaoImpl appDaoImpl=new AppsDaoImpl();
	/**
	 * 根据app的id得到doc信息
	 * @param aId
	 * @return
	 * @throws SQLException 
	 */
	public Apps getById(String aId) throws SQLException {
		return appDaoImpl.getById(aId);
	}
	/**
	 * 根据app的id得到name，并将其装到一个map集合中
	 * 
	 * @throws SQLException
	 */
	public Map<String, String> getNamesById(List<String> ids) throws SQLException {
		return appDaoImpl.getNamesById(ids);
	}
	/**
	 * 添加新的app
	 * @param app
	 * @return
	 * @throws SQLException 
	 */
	public boolean addnewapp(Apps app) throws SQLException {
		return appDaoImpl.addnewapp(app);
	}
	/**
	 * 得到所有正常的的APP
	 * @return
	 * @throws SQLException 
	 */
	public List<Apps> listallnormal() throws SQLException {
		return appDaoImpl.listallnormal();
	}
	/**
	 * 得到所有非正常的的APP
	 * @return
	 * @throws SQLException 
	 */
	public List<Apps> listallbad() throws SQLException {
		return appDaoImpl.listallbad();
	}
	
	public boolean setbad(String id) throws SQLException {
		return appDaoImpl.setbad(id);
	}
	public boolean setnormal(String id) throws SQLException {
		return appDaoImpl.setnormal(id);
	}
	public boolean updateapp(Apps app) throws SQLException {
		return appDaoImpl.updateapp(app);
	}
	public boolean deleteById(String id) throws SQLException {
		return appDaoImpl.deleteById(id);
	}
	/**
	 * 得到app中所有的数据表名
	 * 
	 * @return
	 */
	public List<String> getDtnames() {
		return appDaoImpl.getDtnames();
	}
	public Apps getByTname(String tname) throws SQLException {
		return appDaoImpl.getByTname(tname);
	}
	/**
	 * 得到所有正确显示的APP
	 * @param id
	 * @return
	 */
	public List<Apps> listall2show(int id) {
		return appDaoImpl.getByTname(id);
	}
	/**
	 * 获取最新添加的5条数据服务
	 * @return
	 */
	public List<Apps> recentaddapps() {
		return appDaoImpl.recentaddapps();
	}
	public List<Apps> listallnormalbypage(String currNo,String pageSize) throws SQLException {
		return appDaoImpl.listallnormalbypage(currNo,pageSize);
	}
	public int getrowcount() {
		return appDaoImpl.getrowcount();
	}
	public void setnumadd(String dtname) throws SQLException {
		appDaoImpl.setnumadd(dtname);
		
	}
	public void setnumsub(String dtname) throws SQLException {
		appDaoImpl.setnumsub(dtname);
		
	}
	public List<Apps> mostapps() {
		return appDaoImpl.mostapps();
	}
	public void droptable(String tname) throws SQLException {
		appDaoImpl.droptable(tname);
	}
	public Apps appad() {
		return appDaoImpl.appad();
	}
	public boolean addnewappchild(AppsChild child) throws SQLException {
		return appDaoImpl.addnewappchild(child);
	}
	public List<AppsChild> listallchildren(String aId) throws SQLException {
		return appDaoImpl.listallchildren(aId);
	}
	public Map<String, String> getparmsByDtname(String dtname) {
		return appDaoImpl.getparmsByDtname(dtname);
	}
	public void addnewappparm(String dtname, String key, String paramvalue) {
		appDaoImpl.addnewappparm(dtname,key,  paramvalue);
	}
	public List<Apps> listall2showbyctid(int id, String ctid) {
		return appDaoImpl.listall2showbyctid(id,  ctid);
	}
}
