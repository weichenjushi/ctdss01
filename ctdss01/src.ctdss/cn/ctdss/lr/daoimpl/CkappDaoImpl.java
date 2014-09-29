package cn.ctdss.lr.daoimpl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.ctdss.lr.domain.Appplat;
import cn.ctdss.lr.domain.Ckapp;
import cn.ctdss.lr.utils.JdbcUtil;

public class CkappDaoImpl {

	public String add(String appid, String appname, String url, String des, String type,String myappuname,String myappid) throws SQLException {
		String nowtime=new Date().toLocaleString();
		String sql="insert into checkingapp(appid,name,address,description,platid,myappuname,myappid,addtime) values(?,?,?,?,?,?,?,?)";
		String res="提交失败";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		int i= runner.update(sql, new Object[]{appid,appname,url,des,type,myappuname,myappid,nowtime});
		if(i==1)
		{
			res="提交成功";
		}
		return res;
	}

	public boolean add(String type, String appid,String myappuname) throws SQLException {
		boolean flag=false;
		String sql="select * from checkingapp where appid=? and platid=? and myappuname=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		Ckapp ckapp= runner.query(sql, new Object[]{appid,type,myappuname}, new BeanHandler(Ckapp.class));
		if(ckapp!=null)
		{
			flag=true;
		}
		return flag;
	}

	public List<Ckapp> listalltocheck() throws SQLException {
		String sql="SELECT * FROM checkingapp WHERE state=1";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Ckapp> list=runner.query(sql, new BeanListHandler(Ckapp.class));
		return list;
	}

	public void upstatebymyappid(String myappid, int i) throws SQLException {
		String sql="update checkingapp set state=? where myappid=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		runner.update(sql, new Object[]{i,myappid});
	}

	public List<Ckapp> listallchecked() throws SQLException {
		String sql="SELECT * FROM checkingapp WHERE state=2";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Ckapp> list=runner.query(sql, new BeanListHandler(Ckapp.class));
		return list;
	}

	public List<Appplat> listallplats() throws SQLException {
		String sql="SELECT * FROM appplat";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Appplat> list=runner.query(sql, new BeanListHandler(Appplat.class));
		return list;
	}

	public List<Ckapp> listallbyplatid(String platid) throws SQLException {
		String sql="SELECT * FROM checkingapp WHERE platid=? and state=2";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Ckapp> list=runner.query(sql,platid, new BeanListHandler(Ckapp.class));
		return list;
	}

	public Ckapp getbymyappid1(String id, int i) throws SQLException {
		String sql="SELECT * FROM checkingapp where myappid=? and state=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		Ckapp list=runner.query(sql,new Object[]{id,i}, new BeanHandler(Ckapp.class));
		return list;
	}
	public Ckapp getbymyappid2(String id, int i) throws SQLException {
		String sql="SELECT * FROM checkingapp where myappid=? and state=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		Ckapp list=runner.query(sql,new Object[]{id,i}, new BeanHandler(Ckapp.class));
		return list;
	}

	public List<Ckapp> listbyuanme(String uname) throws SQLException {
		String sql="select * from checkingapp where myappuname=?";
		QueryRunner runner=new QueryRunner(JdbcUtil.getDataSource());
		List<Ckapp> list=runner.query(sql, uname,new BeanListHandler(Ckapp.class));
		return list;
	}
}
