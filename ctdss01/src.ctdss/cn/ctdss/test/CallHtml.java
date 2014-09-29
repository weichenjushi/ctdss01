package cn.ctdss.test;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class CallHtml {
	public static void callOnePage(String fileName, String path, 
            String realName, String realPath) { 
           try { 
            String str = "http://localhost:8080/ctdss01/toHtmlPath?file_name=" 
              + fileName + "&&path=" + path + "&&realName=" + realName 
              + "&&realPath=" + realPath; 
            System.out.println(str);
            int httpResult; 
            URL url = new URL(str); 
            URLConnection connection = url.openConnection(); 
            connection.connect(); 
            HttpURLConnection httpURLConnection = (HttpURLConnection) connection; 
            httpResult = httpURLConnection.getResponseCode(); 
            if (httpResult != HttpURLConnection.HTTP_OK) { 
             System.out.println("没有连接成功"); 
            } else { 
             System.out.println("连接成功了　"); 
            } 
           } catch (Exception e) { 
            // TODO: handle exception 
           } 
          } 

         //这个方法适当重载，就可以省去一些参数传递。 

         
}
