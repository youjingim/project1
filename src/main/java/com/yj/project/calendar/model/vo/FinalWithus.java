package com.yj.project.calendar.model.vo;

import java.sql.Date;

public class FinalWithus {
	private int withus_num;
	private String register_circle;
	private String req_circle;
	private String withus_title;
	private String req_withus_content;
	private Date req_matching_date;
	private String req_matching_time;
	private String req_withus_place;
	private String circle_name;
	
	public FinalWithus() {
		// TODO Auto-generated constructor stub
	}

	public int getWithus_num() {
		return withus_num;
	}

	public void setWithus_num(int withus_num) {
		this.withus_num = withus_num;
	}

	public String getRegister_circle() {
		return register_circle;
	}

	public void setRegister_circle(String register_circle) {
		this.register_circle = register_circle;
	}

	public String getReq_circle() {
		return req_circle;
	}

	public void setReq_circle(String req_circle) {
		this.req_circle = req_circle;
	}

	public String getWithus_title() {
		return withus_title;
	}

	public void setWithus_title(String withus_title) {
		this.withus_title = withus_title;
	}

	public String getReq_withus_content() {
		return req_withus_content;
	}

	public void setReq_withus_content(String req_withus_content) {
		this.req_withus_content = req_withus_content;
	}

	public Date getReq_matching_date() {
		return req_matching_date;
	}

	public void setReq_matching_date(Date req_matching_date) {
		this.req_matching_date = req_matching_date;
	}

	public String getReq_matching_time() {
		return req_matching_time;
	}

	public void setReq_matching_time(String req_matching_time) {
		this.req_matching_time = req_matching_time;
	}

	public String getReq_withus_place() {
		return req_withus_place;
	}

	public void setReq_withus_place(String req_withus_place) {
		this.req_withus_place = req_withus_place;
	}

	public String getCircle_name() {
		return circle_name;
	}

	public void setCircle_name(String circle_name) {
		this.circle_name = circle_name;
	}

	@Override
	public String toString() {
		return "FinalWithus [withus_num=" + withus_num + ", register_circle=" + register_circle + ", req_circle="
				+ req_circle + ", withus_title=" + withus_title + ", req_withus_content=" + req_withus_content
				+ ", req_matching_date=" + req_matching_date + ", req_matching_time=" + req_matching_time
				+ ", req_withus_place=" + req_withus_place + ", circle_name=" + circle_name + "]";
	}

	public FinalWithus(int withus_num, String register_circle, String req_circle, String withus_title,
			String req_withus_content, Date req_matching_date, String req_matching_time, String req_withus_place,
			String circle_name) {
		super();
		this.withus_num = withus_num;
		this.register_circle = register_circle;
		this.req_circle = req_circle;
		this.withus_title = withus_title;
		this.req_withus_content = req_withus_content;
		this.req_matching_date = req_matching_date;
		this.req_matching_time = req_matching_time;
		this.req_withus_place = req_withus_place;
		this.circle_name = circle_name;
	}



}
