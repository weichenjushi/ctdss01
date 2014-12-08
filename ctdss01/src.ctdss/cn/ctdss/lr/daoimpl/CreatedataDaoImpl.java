package cn.ctdss.lr.daoimpl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.junit.Test;

import com.test.test4xml;

import cn.ctdss.lr.utils.DBUtils;
import cn.ctdss.lr.utils.JdbcUtil;

public class CreatedataDaoImpl {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	/**
	 * ����XML�ļ�
	 * 
	 * @param tname
	 * @param filePath
	 *            // Ҫ������ļ���
	 * @return
	 * @throws SQLException 
	 * @throws DocumentException 
	 */
	public boolean createXML(String tname, String filePath) throws SQLException, DocumentException {
		// String xmlName = "D:/" + rootElementName + ".xml";
		boolean flag=false;
		sql="select * from "+tname;
		Document doc = DocumentHelper.createDocument();
		doc.setXMLEncoding("utf-8");
		Element eleroot = doc.addElement("root"); // ��Ӹ�Ԫ��
		Element element = eleroot.addElement("resultcode");
		element.setText("200");
		element = eleroot.addElement("reason");
		element.setText("Return Successd!");
		element = eleroot.addElement("result");
		conn = JdbcUtil.getMysqlConnection();
		ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();	// �������ѯ����ݼ�
		try {
			if (rs != null) {

				ResultSetMetaData rsmd = rs.getMetaData();
				int colshu = rsmd.getColumnCount(); // ȡ������
				while (rs.next()) { // ������Ϊ��Ԫ�����Ԫ�غ�����
					Element element1 = element.addElement(tname); // Ϊ��Ԫ�������Ԫ��(�ж������¼���ж�����Ԫ��)
					for (int i = 1; i <= colshu; i++) {
						// String colName=rsmd.getColumnName(i); //ȡ�õ�ǰ����
						// ����Ԫ�������Ԫ��(����)��Ԫ�ص��ı�(��ֵ) ������Ϊ��Ԫ�����Ԫ��
						Element ele = element1.addElement(rsmd.getColumnName(i)).addText(rs.getString(i));
					}
				}
				writeXML(doc, filePath); // ���ô���XML�ĵ��ķ���
				
				flag=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			rs.close();
			ps.close();
			conn.close();
		}
		return flag;
	}

	private static void writeXML(Document doc, String xmlName) { // ����XML�ĵ�
		try {
		
			OutputFormat output = OutputFormat.createPrettyPrint();
			output.setEncoding("utf-8");
			XMLWriter xmlw = new XMLWriter(new FileOutputStream(xmlName), output);
			xmlw.write(doc);
			xmlw.close();
			System.out.println("创建成功....");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ResultSet Query(String str) throws SQLException { // �������ѯ����ݼ�
		conn = JdbcUtil.getMysqlConnection();
		ps = conn.prepareStatement(str);
		ResultSet rs = ps.executeQuery();
		return rs;
	}

	public boolean updateretxml(String tname, String filePath) throws SQLException {
		// String xmlName = "D:/" + rootElementName + ".xml";
		boolean flag=false;
		sql="select * from "+tname+" where id=1";
		Document doc = DocumentHelper.createDocument();
		doc.setXMLEncoding("utf-8");
		Element eleroot = doc.addElement("root"); // ��Ӹ�Ԫ��
		Element element = eleroot.addElement("resultcode");
		element.setText("200");
		element = eleroot.addElement("reason");
		element.setText("Return Successd!");
		element = eleroot.addElement("result");
		ResultSet rs = Query(sql); // �������ѯ����ݼ�
		try {
			if (rs != null) {

				ResultSetMetaData rsmd = rs.getMetaData();
				int colshu = rsmd.getColumnCount(); // ȡ������
				while (rs.next()) { // ������Ϊ��Ԫ�����Ԫ�غ�����
					Element element1 = element.addElement(tname); // Ϊ��Ԫ�������Ԫ��(�ж������¼���ж�����Ԫ��)
					for (int i = 1; i <= colshu; i++) {
						// String colName=rsmd.getColumnName(i); //ȡ�õ�ǰ����
						// ����Ԫ�������Ԫ��(����)��Ԫ�ص��ı�(��ֵ) ������Ϊ��Ԫ�����Ԫ��
						Element ele = element1.addElement(rsmd.getColumnName(i)).addText(rs.getString(i));
					}
				}
				System.out.println(doc.asXML());
				writeXML(doc, filePath); // ���ô���XML�ĵ��ķ���
				flag=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			DBUtils.free(rs, ps, conn);
		}
		return flag;
	}

	public String createJson(String dtname) throws SQLException {
		return createJsonFile("select * from "+dtname);
	}
	@Test
	public void testjson() throws Exception {
		createRetJsonData();
		//createRetXmlData();
	}
	public void createRetJsonData(){
		StringBuilder sb=new StringBuilder();
		try {
			updateretxml("t_subway","D:\\1.xml");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sb);
	}
	public void createRetXmlData(){
		StringBuilder sb=new StringBuilder();
		sb.append(createJsonFile("select * from t_subway where id=1")) ;
		System.out.println(sb);
	}
	private String createJsonFile(String sql){
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("{\n\"resultcode\":\"200\",\n\"reason\":\"Return Successd!\",\n\"result\":[\n");

			ResultSet rs = Query(sql); // �������ѯ����ݼ�

			if (rs != null) {
				ResultSetMetaData rsmd = rs.getMetaData();
				int colshu = rsmd.getColumnCount(); // ȡ������
				while (rs.next()) { // ������Ϊ��Ԫ�����Ԫ�غ�����
					// Element element1 = element.addElement(eleElement); // Ϊ��Ԫ�������Ԫ��(�ж������¼���ж�����Ԫ��)
					sb.append("{");
					for (int i = 1; i <= colshu; i++) {
						// String colName=rsmd.getColumnName(i); //ȡ�õ�ǰ����
						// ����Ԫ�������Ԫ��(����)��Ԫ�ص��ı�(��ֵ) ������Ϊ��Ԫ�����Ԫ��
						sb.append("\"").append("" + rsmd.getColumnName(i) + "").append("\"").append(":\"").append("" + rs.getString(i) + "").append("\"").append(",\n");
					}
					//将最后的“，”去掉
					sb.deleteCharAt(sb.lastIndexOf(","));
					sb.append("}\n");
				}
				sb.append("]\n}");
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		finally{
			DBUtils.free(rs, ps, conn);
		}
	}

	public String updateretjson(String dtname) throws SQLException {
		return createJsonFile("select * from "+dtname+" where id=1");
	}

	public boolean updateretjsonchild() {
		return false;
	}

	public boolean createxmlbytsp(String route, String filePath) throws SQLException {
		boolean flag=false;
		sql="select * from t_substation where id in("+route+") order by field(id,"+route+")";
		Document doc = DocumentHelper.createDocument();
		doc.setXMLEncoding("utf-8");
		Element eleroot = doc.addElement("root"); // ��Ӹ�Ԫ��
		Element element = eleroot.addElement("resultcode");
		element.setText("200");
		element = eleroot.addElement("reason");
		element.setText("Return Successd!");
		element = eleroot.addElement("result");
		ResultSet rs = Query(sql); // �������ѯ����ݼ�
		try {
			if (rs != null) {
				ResultSetMetaData rsmd = rs.getMetaData();
				int colshu = rsmd.getColumnCount(); // ȡ������
				while (rs.next()) { // ������Ϊ��Ԫ�����Ԫ�غ�����
					Element element1 = element.addElement("t_substation"); // Ϊ��Ԫ�������Ԫ��(�ж������¼���ж�����Ԫ��)
					for (int i = 1; i <= colshu; i++) {
						// String colName=rsmd.getColumnName(i); //ȡ�õ�ǰ����
						// ����Ԫ�������Ԫ��(����)��Ԫ�ص��ı�(��ֵ) ������Ϊ��Ԫ�����Ԫ��
						Element ele = element1.addElement(rsmd.getColumnName(i)).addText(rs.getString(i));
					}
				}
				writeXML(doc, filePath); // ���ô���XML�ĵ��ķ���
				flag=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			DBUtils.free(rs, ps, conn);
		}
		return flag;
	}

	public String createxmlbytsp(String route) {
		return createJsonFile("select * from t_substation where id in("+route+") order by field(id,"+route+")");
	}
}
