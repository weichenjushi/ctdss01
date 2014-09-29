package cn.ctdss.lr.daoimpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.ctdss.lr.utils.JdbcUtil;

public class ExcelDaoImpl {
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	private static String sql = null;

	/**
	 * 将Excel，csv中的数据存入数据库
	 * 
	 * @param filepath
	 * @param txtname
	 * @return
	 */
	public String createtable(String filepath, String txtname) {
		if (filepath.endsWith(".csv")) {
			try {
				// File csv = new File(filename); // CSV文件
				// BufferedReader br = new BufferedReader(new FileReader(csv));
				InputStreamReader isr = new InputStreamReader(new FileInputStream(filepath), "GB2312");
				BufferedReader br = new BufferedReader(isr);
				// 读取直到最后一行
				String line = "";// line 序号,线路名称,线路里程
				if ((line = br.readLine()) != null) {
					// 把一行数据分割成多个字段
					List<String> titleList = new ArrayList<String>();// titleList [序号, 线路名称,线路里程]
					// 通过截取字符串的一个子串来返回标记,类似于 String.split 方法
					StringTokenizer st = new StringTokenizer(line, ",");
					while (st.hasMoreTokens()) {
						titleList.add(st.nextToken());
					}
					// 根据第一行表头创建数据库表
					String sql = "create table if not exists " + txtname + " (";
					for (String title : titleList) {
						sql += title + " varchar(255) not null,";
					}
					sql = sql.substring(0, sql.length() - 1) + ")";// create table if not exists t (序号 varchar(255) not null,线路名称 varchar(255) not null,线路里程 varchar(255) not null)
//					System.out.println(sql);
					Connection conn = JdbcUtil.getMysqlConnection();
					Statement statement = conn.createStatement();
					int result = statement.executeUpdate(sql);
					if (result == 0) {
						System.out.println("数据库表创建成功！");
					} else {
						System.out.println("数据库表创建失败！");
					}
					conn.close();
				}
				Connection conn = JdbcUtil.getMysqlConnection();
				Statement statement = conn.createStatement();
				while ((line = br.readLine()) != null) {
					String[] st = line.split(",");
					String sql = "insert into " + txtname + " values(";
					for (String content : st) {
						sql += "'" + content + "',";
					}
					sql = sql.substring(0, sql.length() - 1) + ")";// insert
																	// into t
																	// values('1
																	// ','八通线','19')
					statement.addBatch(sql);
				}
				statement.executeBatch();
				System.out.println("数据成功存入数据库！");
				br.close();
				return "数据成功存入数据库！";
			} catch (Exception e) {
				e.printStackTrace();
				return e.getMessage();
			}
		} else if (filepath.endsWith(".xls") || filepath.endsWith(".xlsx")) {
			Connection conn = null;
			Statement statement = null;
			try {
				FileInputStream fs = new FileInputStream(filepath);
				Workbook wb = null;
				if (filepath.endsWith(".xls")) {
					wb = new HSSFWorkbook(fs);
				} else {
					wb = new XSSFWorkbook(fs);
				}
				// 读取第一个工作表，宣告其为sheet
				org.apache.poi.ss.usermodel.Sheet sheet = wb.getSheetAt(0);
				fs.close();
				// 宣告一列
				Row row = null;
				// 宣告一个储存格
				Cell cell = null;

				if (sheet.getLastRowNum() >= 0) {
					row = sheet.getRow(0);
					conn = JdbcUtil.getMysqlConnection();
					statement = conn.createStatement();
					// 根据第一行表头创建数据库表
					String sql = "create table if not exists " + txtname + " (";
					for (int p = 0; p < row.getLastCellNum(); p++) {
						cell = row.getCell(p);
						System.out.println(cell.getStringCellValue());
						sql += cell.getStringCellValue() + " varchar(255) not null,";
					}
					sql = sql.substring(0, sql.length() - 1) + ")";
					int result = statement.executeUpdate(sql);
					if (result == 0) {
						System.out.println("数据库表创建成功！");
					} else {
						System.out.println("数据库表创建失败！");
					}
					conn.close();
				}
				conn = JdbcUtil.getMysqlConnection();
				statement = conn.createStatement();
				// 以巢状迴圈读取所有储存格资料
				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
					row = sheet.getRow(i);
					List<String> contentList = new ArrayList<String>();
					for (int j = 0; j < row.getLastCellNum(); j++) {
						cell = row.getCell(j);
						// 判断储存储的格式
						String content = "";
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_NUMERIC:
							content = String.valueOf((int) cell.getNumericCellValue());
							// getNumericCellValue()会回传double值，若不希望出现小数点，请自行转型为int
							break;
						case Cell.CELL_TYPE_STRING:
							content = String.valueOf(cell.getStringCellValue());
							break;
						case Cell.CELL_TYPE_FORMULA:
							content = String.valueOf(cell.getNumericCellValue());
							// 读出公式储存格计算後的值
							// 若要读出公式内容，可用cell.getCellFormula()
							break;
						default:
							System.out.println("不明的格式");
							break;
						}
						contentList.add(content);
					}
					String sql = "insert into " + txtname + " values(";
					for (String content : contentList) {
						sql += "'" + content + "',";
					}
					sql = sql.substring(0, sql.length() - 1) + ")";
					statement.addBatch(sql);
				}
				statement.executeBatch();
				System.out.println("数据成功存入数据库！");
				fs.close();
				return "";
			} catch (Exception e) {
				e.printStackTrace();
				return e.getMessage();
			}
		} else {
			return "The file format should be csv,xls,xlsx.";
		}
	}

	/**
	 * 验证表名是否存在 true表示存在，false表示不存在
	 * 
	 * @param filepath
	 * @return
	 */
	public boolean checktnameisexist(String txtname) {
		sql = "show tables";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				tables.add(rs.getString("Tables_in_ctdss01"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return true;
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
		if (tables.contains(txtname)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 判断本地文件是否存在
	 */
	public boolean fileExists(String filepath) {
		File file = new File(filepath);
		if (!file.exists()) {
			return false;
		} else {
			if (file.isDirectory()) {
				return false;
			} else {
				return true;
			}
		}
	}

	/**
	 * 判断表名是否符合数据库表命名规范
	 */
	public boolean tableNameIsRight(String tablename) {
		Pattern pattern = Pattern.compile("^[a-zA-Z0-9_]*$");
		Matcher matcher = pattern.matcher(tablename);
		if (matcher.find()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 查询可以封装成数据服务的数据表
	 * 
	 * @return
	 */
	public List<String> accessedtables() {
		List<String> usedtables = new AppsDaoImpl().getDtnames();
		sql = "show tables";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				String table = rs.getString("Tables_in_ctdss01");
				if (table.startsWith("t_") && !usedtables.contains(table)) {
					tables.add(table);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
		return tables;

	}
	public List<String> accessedtables1() {
		sql = "show tables";
		List<String> tables = new ArrayList<String>();
		try {
			conn = JdbcUtil.getMysqlConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				String table = rs.getString("Tables_in_ctdss01");
				if (table.startsWith("t_")) {
					tables.add(table);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
		return tables;

	}
}
