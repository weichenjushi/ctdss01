package cn.ctdss.test;

public class Demo1 {
public static void main(String[] args) {
	
	CallHtml.callOnePage("info.jsf?file_id=aaa","news","", "");//将在news目录下生成一个aaa.htm的静态文件
	//CallHtml.callOnePage("newsList.jsf","news","", "");//将在news目录下生成一个newsList.htm的静态文件,显示最新的新闻。 
	//CallHtml.callOnePage("index.jsf","","", "");//生成主页。 

}
}
