package cn.ctdss.lr.domain;

public class Ckapp {
	private int id;
	private int platid;
	private int state;
	private String appid;
	private String name;
	private String address;
	private String description;
	private String myappuname;
	private String myappid;
	private String addtime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPlatid() {
		return platid;
	}
	public void setPlatid(int platid) {
		this.platid = platid;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setMyappuname(String myappuname) {
		this.myappuname = myappuname;
	}
	public String getMyappuname() {
		return myappuname;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return address;
	}
	public void setMyappid(String myappid) {
		this.myappid = myappid;
	}
	public String getMyappid() {
		return myappid;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getState() {
		return state;
	}
}
