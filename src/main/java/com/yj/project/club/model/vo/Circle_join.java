package com.yj.project.club.model.vo;

import java.sql.Date;

public class Circle_join {
	private int joinNum;
	private int circle_num;
	private String join_sender;
	private String join_receiver;
	private String join_title;
	private String join_content;
	private Date join_date;
	
	public Circle_join() {
		// TODO Auto-generated constructor stub
	}

	public Circle_join(int joinNum, int circle_num, String join_sender, String join_receiver, String join_title,
			String join_content, Date join_date) {
		super();
		this.joinNum = joinNum;
		this.circle_num = circle_num;
		this.join_sender = join_sender;
		this.join_receiver = join_receiver;
		this.join_title = join_title;
		this.join_content = join_content;
		this.join_date = join_date;
	}

	public int getJoinNum() {
		return joinNum;
	}

	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
	}

	public int getCircle_num() {
		return circle_num;
	}

	public void setCircle_num(int circle_num) {
		this.circle_num = circle_num;
	}

	public String getJoin_sender() {
		return join_sender;
	}

	public void setJoin_sender(String join_sender) {
		this.join_sender = join_sender;
	}

	public String getJoin_receiver() {
		return join_receiver;
	}

	public void setJoin_receiver(String join_receiver) {
		this.join_receiver = join_receiver;
	}

	public String getJoin_title() {
		return join_title;
	}

	public void setJoin_title(String join_title) {
		this.join_title = join_title;
	}

	public String getJoin_content() {
		return join_content;
	}

	public void setJoin_content(String join_content) {
		this.join_content = join_content;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public String toString() {
		return "Circle_join [joinNum=" + joinNum + ", circle_num=" + circle_num + ", join_sender=" + join_sender
				+ ", join_receiver=" + join_receiver + ", join_title=" + join_title + ", join_content=" + join_content
				+ ", join_date=" + join_date + "]";
	}

	
	
}
