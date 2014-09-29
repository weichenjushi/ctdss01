package cn.ctdss.lr.service;

import java.sql.SQLException;

import org.dom4j.DocumentException;

import cn.ctdss.lr.daoimpl.AppsDaoImpl;
import cn.ctdss.lr.daoimpl.CreatedataDaoImpl;
import cn.ctdss.lr.domain.Apps;

public class CreatedataService {

	CreatedataDaoImpl createdataDaoImpl = new CreatedataDaoImpl();

	/**
	 * 创建XML文件
	 * 
	 * @param tname
	 * @param filePath
	 * @return
	 * @throws SQLException 
	 * @throws DocumentException 
	 */
	public boolean createXML(String tname, String filePath) throws SQLException, DocumentException {
//		System.out.println();
		//System.out.println("CreatedataService.createXML()"+tname);
		return createdataDaoImpl.createXML(tname, filePath);
	}

	public boolean updateretxml(String tname, String filePath) throws SQLException {
		return createdataDaoImpl.updateretxml(tname, filePath);
	}

	public String createJson(String dtname) throws SQLException {
		return createdataDaoImpl.createJson(dtname);
	}

	public boolean updateretjson(String dtname) throws SQLException {
		String str= createdataDaoImpl.updateretjson(dtname);
		AppsDaoImpl appDaoImpl=new AppsDaoImpl();
		Apps app=appDaoImpl.getByTname(dtname);
		
		app.setRetexampjson(str);
		return appDaoImpl.updateapp(app);
	}

	public boolean updateretjsonchild() {
		return createdataDaoImpl.updateretjsonchild();
	}

	public boolean createxmlbytsp(String route, String filePath) throws SQLException {
		return createdataDaoImpl.createxmlbytsp(route,  filePath);
	}

	public String createjsonbytsp(String route) {
		return createdataDaoImpl.createxmlbytsp(route);
	}

}
