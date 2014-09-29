package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.APIDaoImpl;
import cn.ctdss.lr.daoimpl.CkappDaoImpl;
import cn.ctdss.lr.domain.Appplat;
import cn.ctdss.lr.domain.Ckapp;

public class CkappService {

	CkappDaoImpl ckappDaoImpl=new CkappDaoImpl();
	public String add(String appid, String appname, String url, String des, String type,String myappid,String myappuname) throws SQLException {
		//将myapp表中的state状态更新为1审核中
		new APIDaoImpl().updateState(1,myappid);
		return ckappDaoImpl.add(appid,  appname, url, des,  type,myappuname,myappid);
	}
	public boolean checkisExist(String type, String appid,String myappuname) throws SQLException {
		return ckappDaoImpl.add(type,appid,myappuname);
	}
	public List<Ckapp> listalltocheck() throws SQLException {
		return ckappDaoImpl.listalltocheck();
	}
	public void upstatebymyappid(String myappid, int i) throws SQLException {
		ckappDaoImpl.upstatebymyappid(myappid,i);
	}
	public List<Ckapp> listallchecked() throws SQLException {
		return ckappDaoImpl.listallchecked();
	}
	public List<Appplat> listallplats() throws SQLException {
		return ckappDaoImpl.listallplats();
	}
	public List<Ckapp> listallbyplatid(String platid) throws SQLException {
		return ckappDaoImpl.listallbyplatid(platid);
	}
	public Ckapp getbymyappid1(String id, int i) throws SQLException {
		return ckappDaoImpl.getbymyappid1(id,  i);
	}
	public Ckapp getbymyappid2(String id, int i) throws SQLException {
		return ckappDaoImpl.getbymyappid2(id,  i);
	}
	public List<Ckapp> listbyuanme(String uname) throws SQLException {
		return ckappDaoImpl.listbyuanme(uname);
	}

}
