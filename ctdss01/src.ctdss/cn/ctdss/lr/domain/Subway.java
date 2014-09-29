package cn.ctdss.lr.domain;

public class Subway {
	private String id;
	private String name;
	private String distance;
	
	public Subway() {
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public Subway(String id, String name, String distance) {
		this.id = id;
		this.name = name;
		this.distance = distance;
	}
	
}
