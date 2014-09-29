package wlh.web.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class TestURL {
	public static void main(String[] args) throws UnsupportedEncodingException, IOException {
		String weatherUrl = "http://127.0.0.8:8080/ctdss01/ExcelRestServlet/dbtables/t_publicparklist?key=a6fde7003da846d3961f5e60d26717b6&dtype=xml";
		URL url = new URL(weatherUrl);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		SAXReader  reader = new SAXReader();
		try {
			Document doc = reader.read(in);
			List list = doc.selectNodes("t_publicparklist");
			if(list.size()<1){
				System.out.println("对不起，没有您需要的信息");
			}else{
				Iterator iter = list.iterator();
				StringBuffer sb = new StringBuffer();
				while (iter.hasNext()) {
					Element element = (Element) iter.next();
					Iterator iterator = element.elementIterator("id");
					Element ele = (Element) iterator.next();
					sb.append(ele.getText()+": ");
					iterator = element.elementIterator("license");
					ele = (Element) iterator.next();
					sb.append(ele.getText()+": ");
				}
				System.out.println(sb);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
