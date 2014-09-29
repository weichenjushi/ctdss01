package wlh.web.test;

import java.util.HashSet;
import java.util.Set;

public class Dept {
	// Fields
	private Integer depno;
	private String depname;
	private Set emps = new HashSet(0);//对应的员工实体类
	// Constructors
	public Dept() {
	}
	public Dept(Integer depno) {
	this.depno = depno;
	}
	public Dept(Integer depno, String depname, Set emps) {
	this.depno = depno;
	this.depname = depname;
	this.emps = emps;
	}
	public Integer getDepno() {
		return depno;
	}
	public void setDepno(Integer depno) {
		this.depno = depno;
	}
	public String getDepname() {
		return depname;
	}
	public void setDepname(String depname) {
		this.depname = depname;
	}
	public Set getEmps() {
		return emps;
	}
	public void setEmps(Set emps) {
		this.emps = emps;
	}
}
