package cn.ctdss.test;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.APIDao;
import cn.ctdss.lr.daoimpl.SubwayDao;
import cn.ctdss.lr.domain.MyApp;
import cn.ctdss.lr.domain.Subway;

public class TestDemo1 {
	public static void main(String[] args) throws SQLException {
		SubwayDao subwayDao=new SubwayDao();
	 	List<Subway> subways= subwayDao.getTableById("subway");
	 	for(Subway sb:subways)
	 	{
	 		System.out.println(sb.getName());
	 	}
	 	
	 	APIDao apiDao=new APIDao();
	 	List<MyApp> myapps=apiDao.getTableById("myapp");
	 	for(MyApp app:myapps)
	 	{
	 		System.out.println(app.getAppkey());
	 	}
	}
	
}
