package cn.ctdss.lr.domain;

public class GenDemo {
public static void main(String[] args) {
	 //���巺����Gen��һ��Integer�汾
    Gen<Integer> intOb=new Gen<Integer>(88);
    intOb.showTyep();
    int i= intOb.getOb();
    System.out.println("value= " + i);
    System.out.println("----------------------------------");
    //���巺����Gen��һ��String�汾
    Gen<String> strOb=new Gen<String>("Hello Gen!");
    strOb.showTyep();
    String s=strOb.getOb();
    System.out.println("value= " + s);
    
    Gen<Subway> strSub=new Gen<Subway>(new Subway());
    strSub.showTyep();
    Subway sub=strSub.getOb();
    System.out.println("value= " + sub);
}
}
