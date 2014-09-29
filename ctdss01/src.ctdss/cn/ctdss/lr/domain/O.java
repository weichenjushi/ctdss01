package cn.ctdss.lr.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="o")
/**
 * 地图显示的信息
 */
public class O {
	
	private String name;
	
	private String price;
	
	private String content;
	
	private String address;
	
	private String lat;

	private String lng;
	
	private String english_menu;
	
	private String comments;

	public O() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getEnglish_menu() {
		return english_menu;
	}

	public void setEnglish_menu(String english_menu) {
		this.english_menu = english_menu;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public O(String name, String price, String content, String address,
			String lat, String lng, String english_menu, String comments) {
		super();
		this.name = name;
		this.price = price;
		this.content = content;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
		this.english_menu = english_menu;
		this.comments = comments;
	}

	public O(String name, String price, String content, String address,
			String lat, String lng) {
		super();
		this.name = name;
		this.price = price;
		this.content = content;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}
	}