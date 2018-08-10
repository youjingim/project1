package com.yj.project.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
    private int withus_num;
    private String withus_title;
    private String withus_content;
    private String member_id;
    private String register_circle_num;
    private String circle_name;
    private Date matching_date;
    private Date enroll_date;
    private String withus_place;
    private String withus_category;
    private String time1;
    private String time2;    
    private String status;

    
	public Calendar() {
		// TODO Auto-generated constructor stub
	}


	public int getWithus_num() {
		return withus_num;
	}


	public void setWithus_num(int withus_num) {
		this.withus_num = withus_num;
	}


	public String getWithus_title() {
		return withus_title;
	}


	public void setWithus_title(String withus_title) {
		this.withus_title = withus_title;
	}


	public String getWithus_content() {
		return withus_content;
	}


	public void setWithus_content(String withus_content) {
		this.withus_content = withus_content;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getRegister_circle_num() {
		return register_circle_num;
	}


	public void setRegister_circle_num(String register_circle_num) {
		this.register_circle_num = register_circle_num;
	}


	public String getCircle_name() {
		return circle_name;
	}


	public void setCircle_name(String circle_name) {
		this.circle_name = circle_name;
	}


	public Date getMatching_date() {
		return matching_date;
	}


	public void setMatching_date(Date matching_date) {
		this.matching_date = matching_date;
	}


	public Date getEnroll_date() {
		return enroll_date;
	}


	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}


	public String getWithus_place() {
		return withus_place;
	}


	public void setWithus_place(String withus_place) {
		this.withus_place = withus_place;
	}


	public String getWithus_category() {
		return withus_category;
	}


	public void setWithus_category(String withus_category) {
		this.withus_category = withus_category;
	}


	public String getTime1() {
		return time1;
	}


	public void setTime1(String time1) {
		this.time1 = time1;
	}


	public String getTime2() {
		return time2;
	}


	public void setTime2(String time2) {
		this.time2 = time2;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Calendar(int withus_num, String withus_title, String withus_content, String member_id,
			String register_circle_num, String circle_name, Date matching_date, Date enroll_date, String withus_place,
			String withus_category, String time1, String time2, String status) {
		super();
		this.withus_num = withus_num;
		this.withus_title = withus_title;
		this.withus_content = withus_content;
		this.member_id = member_id;
		this.register_circle_num = register_circle_num;
		this.circle_name = circle_name;
		this.matching_date = matching_date;
		this.enroll_date = enroll_date;
		this.withus_place = withus_place;
		this.withus_category = withus_category;
		this.time1 = time1;
		this.time2 = time2;
		this.status = status;
	}


	@Override
	public String toString() {
		return "Calendar [withus_num=" + withus_num + ", withus_title=" + withus_title + ", withus_content="
				+ withus_content + ", member_id=" + member_id + ", register_circle_num=" + register_circle_num
				+ ", circle_name=" + circle_name + ", matching_date=" + matching_date + ", enroll_date=" + enroll_date
				+ ", withus_place=" + withus_place + ", withus_category=" + withus_category + ", time1=" + time1
				+ ", time2=" + time2 + ", status=" + status + "]";
	}


	
}
