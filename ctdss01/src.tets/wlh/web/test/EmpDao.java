package wlh.web.test;

import java.util.List;

public interface EmpDao {
	public void addEmp(Emp emp);//添加数据的方法

	public List<Emp> queryAllEmp();
}
