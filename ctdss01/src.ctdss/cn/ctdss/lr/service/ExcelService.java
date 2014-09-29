package cn.ctdss.lr.service;

import java.util.List;

import cn.ctdss.lr.daoimpl.ExcelDaoImpl;

public class ExcelService {
	
	ExcelDaoImpl excelDaoImpl = new ExcelDaoImpl();

	/**
	 * 导入数据表
	 * 
	 * @param filepath
	 * @param txtname
	 * @return
	 */
	public String createtable(String filepath, String txtname) {
		//首先检查该数据表是否存在
//		if(excelDaoImpl.checktnameisexist(txtname)){
//			return "该数据表已经存在，请更换数据表名称！";
//		}
		
		return excelDaoImpl.createtable(filepath, txtname);
	}

	/**
	 * 验证表名是否存在
	 * 
	 * @param filepath
	 * @return
	 */
	public boolean checktnameisexist(String filepath) {
		return excelDaoImpl.checktnameisexist(filepath);
	}
	/**
	 * 查询可以封装成数据服务的数据表
	 * 
	 * @return
	 */
	public List<String> accessedtables() {
		return excelDaoImpl.accessedtables();
	}
	public List<String> accessedtables1() {
		return excelDaoImpl.accessedtables1();
	}
}
