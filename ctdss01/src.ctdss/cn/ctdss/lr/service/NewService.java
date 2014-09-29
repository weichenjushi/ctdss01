package cn.ctdss.lr.service;

import java.sql.SQLException;
import java.util.List;

import cn.ctdss.lr.daoimpl.NewsDaoImpl;
import cn.ctdss.lr.domain.News;

public class NewService {

	private NewsDaoImpl newsDaoImpl=new NewsDaoImpl();
	public boolean addnews(News news) throws SQLException {
		return newsDaoImpl.addnews(news);
	}
	public List<News> list(int i) throws SQLException {
		return newsDaoImpl.list(i);
	}
	public List<News> recentnews() throws SQLException {
		return newsDaoImpl.recentnews(0);
	}
	public List<News> importnews() throws SQLException {
		return newsDaoImpl.importnews(0);
	}
	public List<News> importance(int i) throws SQLException {
		return newsDaoImpl.importance(0);
	}
	public List<News> recent(int i) throws SQLException {
		return newsDaoImpl.recent(0);
	}
	public List<News> getbypageadmin(String currNo, String pageSize) throws SQLException {
		return newsDaoImpl.getbypageadmin(currNo,  pageSize);
	}
	public int getrowcount() {
		return newsDaoImpl.getrowcount();
	}
	public int getrowcountuserr() {
		return newsDaoImpl.getrowcountuserr();
	}
	public List<News> getbypageuserr(String currNo, String pageSize) throws SQLException {
		return newsDaoImpl.getbypageuserr(currNo, pageSize);
	}
	public int getrowcountuseri() {
		return newsDaoImpl.getrowcountuseri();
	}
	public List<News> getbypageuseri(String currNo, String pageSize) throws SQLException {
		return newsDaoImpl.getbypageuseri(currNo, pageSize);
	}
	public News getbyId(String id) throws SQLException {
		return newsDaoImpl.getbyId(id);
	}
	public boolean deletebyId(String id) throws SQLException {
		return newsDaoImpl.deletebyId(id);
	}
	public boolean update(News news) throws SQLException {
		return newsDaoImpl.update(news);
	}

}
