package cn.ctdss.lr.domain;
public class User {
	private int userid;
	private int ulevelid;
	private String username;
	private String password;
	private String emailAddress;
//	private String firstname;
//	private String lastname;
	private String companyName;
	private String name;
	private int isAdmin;//o��ͨ�û���1����Ա
	private int isActive;
	private String guid;
	private int isDel;
	private String oauthKey;//API��Կ
	private String oauthSecret;//API�ܳ�
	private String regdate;


	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public User() {
		super();
	}

	public User(int userid, String username, String password,
			String emailAddress, String name,
			String companyName, int isAdmin, int isActive, String guid,
			int isDel, String oauthKey, String oauthSecret) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.emailAddress = emailAddress;
		this.name=name;
		this.companyName = companyName;
		this.isAdmin = isAdmin;
		this.isActive = isActive;
		this.guid = guid;
		this.isDel = isDel;
		this.oauthKey = oauthKey;
		this.oauthSecret = oauthSecret;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public String getOauthKey() {
		return oauthKey;
	}

	public void setOauthKey(String oauthKey) {
		this.oauthKey = oauthKey;
	}

	public String getOauthSecret() {
		return oauthSecret;
	}

	public void setOauthSecret(String oauthSecret) {
		this.oauthSecret = oauthSecret;
	}

	public void setUlevelid(int ulevelid) {
		this.ulevelid = ulevelid;
	}

	public int getUlevelid() {
		return ulevelid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
