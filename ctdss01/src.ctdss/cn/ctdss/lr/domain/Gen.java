package cn.ctdss.lr.domain;

public class Gen<T> {
	private T ob;   //���巺�ͳ�Ա����
    public Gen(T ob) {
        this.ob = ob;
    }
    public T getOb() {
        return ob;
    }
    public void setOb(T ob) {
        this.ob = ob;
    }
    public void showTyep() {
        System.out.println("T��ʵ��������: " + ob.getClass().getName());
    }
}
