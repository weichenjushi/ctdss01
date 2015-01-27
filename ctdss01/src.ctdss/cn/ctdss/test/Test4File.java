package cn.ctdss.test;

import java.io.File;
import java.util.Date;

public class Test4File {
	public static void main(String[] args) {
		File file=new File("src.ctdss/cn/ctdss/test/data1.txt");
		
		System.out.println(file.exists());
		System.out.println(file.getAbsolutePath());
		System.out.println(file.lastModified());
		Long time=new Date().getTime();
		
		System.out.println("2");	
		System.out.println(new Date());
		System.out.println(time);
	}
}
