package cn.ctdss.lr.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * AppChild表数据
 * 
 * @author WangLuHui
 * 
 */
public class AppsChild {

	private int id;// NOT NULL AUTO_INCREMENT,
	private int cid;//种类id
	private String name;// NOT NULL COMMENT 'APP名称',
	private String tname;// NOT NULL COMMENT 'APP对应表名',
	private int num;// DEFAULT '0' COMMENT '连接APP数量',
	private int state;// DEFAULT '1' COMMENT '1表示正常，0表示不正常',
	private String description;// DEFAULT NULL COMMENT 'APP描述',
	private String apiaddress;// NOT NULL DEFAULT '' COMMENT 'API接口地址',
	private String apiexample;
	private String retexampxml;
	private String retexampjson;
	private String addtime;
	private String appcategory;//app种类
	
	private int parentid;
	private String parentname;
	private String param;
	private String appkey;
	
	
	private Map<String, String> paramsMap = new HashMap<String, String>();
	
	public void setAppcategory(String appcategory) {
		this.appcategory = appcategory;
	}

	public String getAppcategory() {
		return appcategory;
	}
	private Map<String, String> addressMap = new HashMap<String, String>();

	public String getRetexampjson() {
		return retexampjson;
	}

	public void setRetexampjson(String retexampjson) {
		this.retexampjson = retexampjson;
	}

	public String getApiexample() {
		return apiexample;
	}

	public void setApiexample(String apiexample) {
		this.apiexample = apiexample;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getApiaddress() {
		return apiaddress;
	}

	public void setApiaddress(String apiaddress) {
		this.apiaddress = apiaddress;
	}

	public void setRetexampxml(String retexampxml) {
		this.retexampxml = retexampxml;
	}

	public String getRetexampxml() {
		return retexampxml;
	}

	public void setAddressMap(Map<String, String> addressMap) {
		this.addressMap = addressMap;
	}

	public Map<String, String> getAddressMap() {
		return addressMap;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getCid() {
		return cid;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
	}

	public String getParentname() {
		return parentname;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getParam() {
		return param;
	}

	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}

	public String getAppkey() {
		return appkey;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParamsMap(Map<String, String> paramsMap) {
		this.paramsMap = paramsMap;
	}

	public Map<String, String> getParamsMap() {
		return paramsMap;
	}

}
