package wlh.web.test;


public class Emp {
	// Fields
	private Integer empno;
	private Dept dept;//部门实体类对象
	private String empname;
	// Constructors
	public Emp() {
	}
	public Emp(Integer empno) {
	this.empno = empno;
	}
	public Emp(Integer empno, Dept dept, String empname) {
	this.empno = empno;
	this.dept = dept;
	this.empname = empname;
	}
	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
}
