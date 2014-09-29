package cn.ctdss.lr.domain;

import java.sql.Date;

public class MyApp {
	private int id;
	private int appid;
	private String username;
	private String dtname;
	private String appkey;
	private String addtime;
	private Date startime;
	private Date endtime;
	private int times;
	private int state;
	
	private String appname;
	
	
	
	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAppkey() {
		return appkey;
	}

	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}

	public Date getStartime() {
		return startime;
	}

	public void setStartime(Date startime) {
		this.startime = startime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public void setDtname(String dtname) {
		this.dtname = dtname;
	}

	public String getDtname() {
		return dtname;
	}

	public void setAppid(int appid) {
		this.appid = appid;
	}

	public int getAppid() {
		return appid;
	}

	public void setAppname(String appname) {
		this.appname = appname;
	}

	public String getAppname() {
		return appname;
	}
	

}
