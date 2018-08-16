package com.yj.project.calendar.model.vo;

public class ClubNotice {
	private int circle_num;
	private String content;
	
	public ClubNotice() {
		// TODO Auto-generated constructor stub
	}

	public int getCircle_num() {
		return circle_num;
	}

	public void setCircle_num(int circle_num) {
		this.circle_num = circle_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ClubNotice [circle_num=" + circle_num + ", content=" + content + "]";
	}

	public ClubNotice(int circle_num, String content) {
		super();
		this.circle_num = circle_num;
		this.content = content;
	}

	
	
}
