package cn.ctdss.lr.service;

import java.util.List;

import cn.ctdss.lr.daoimpl.ExcelDaoImpl;

public class ExcelService {
	
	ExcelDaoImpl excelDaoImpl = new ExcelDaoImpl();

	/**
	 * �������ݱ�
	 * 
	 * @param filepath
	 * @param txtname
	 * @return
	 */
	public String createtable(String filepath, String txtname) {
		//���ȼ������ݱ��Ƿ����
//		if(excelDaoImpl.checktnameisexist(txtname)){
//			return "�����ݱ��Ѿ����ڣ���������ݱ����ƣ�";
//		}
		
		return excelDaoImpl.createtable(filepath, txtname);
	}

	/**
	 * ��֤�����Ƿ����
	 * 
	 * @param filepath
	 * @return
	 */
	public boolean checktnameisexist(String filepath) {
		return excelDaoImpl.checktnameisexist(filepath);
	}
	/**
	 * ��ѯ���Է�װ�����ݷ�������ݱ�
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
