package cn.ctdss.lr.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;



@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="a")

/**
 * 地图显示实体的集合
 */
public class A {
	private List<O> o;

	public List<O> getO() {
		return o;
	}

	public void setO(List<O> o) {
		this.o = o;
	}

	public A(List<O> o) {
		super();
		this.o = o;
	}

	public A() {
		super();
	}
}