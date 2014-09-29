package cn.ctdss.lr.domain;

public class News {
private int id;
private String title;
private String type;
private String pagename;
private String sfrom;
private String addtime;
private int stage;
private String content;

public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}

public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getPagename() {
	return pagename;
}
public void setPagename(String pagename) {
	this.pagename = pagename;
}

public String getAddtime() {
	return addtime;
}
public void setAddtime(String addtime) {
	this.addtime = addtime;
}
public int getStage() {
	return stage;
}
public void setStage(int stage) {
	this.stage = stage;
}
public void setSfrom(String sfrom) {
	this.sfrom = sfrom;
}
public String getSfrom() {
	return sfrom;
}

}
