package com.yj.project.search.model.vo;

public class Like {

	private String member_id;
	private int circle_num;
	private int circle_like;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCircle_num() {
		return circle_num;
	}
	public void setCircle_num(int circle_num) {
		this.circle_num = circle_num;
	}
	public int getCircle_like() {
		return circle_like;
	}
	public void setCircle_like(int circle_like) {
		this.circle_like = circle_like;
	}

	public Like(String member_id, int circle_num, int circle_like) {
		super();
		this.member_id = member_id;
		this.circle_num = circle_num;
		this.circle_like = circle_like;
	}

	@Override
	public String toString() {
		return "Like [member_id=" + member_id + ", circle_num=" + circle_num + ", circle_like=" + circle_like + "]";
	}
	
	
	
}
