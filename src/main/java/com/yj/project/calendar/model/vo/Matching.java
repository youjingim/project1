package com.yj.project.calendar.model.vo;

import java.sql.Date;

public class Matching {
	
    private int withus_num;
    private String withus_title;
    private String withus_content;
    private String member_id;
    private String register_circle;
    private Date matching_date;
    private String time1;
    private String time2;
    private String withus_place;
	
    private String req_circle;
    private String req_id;
    private String req_withus_content;
    private Date req_matching_date;
    private String re_time1;
    private String re_time2;
    private String req_withus_place; 
    private String status;
	
    public Matching() {
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

	public String getRegister_circle() {
		return register_circle;
	}

	public void setRegister_circle(String register_circle) {
		this.register_circle = register_circle;
	}

	public Date getMatching_date() {
		return matching_date;
	}

	public void setMatching_date(Date matching_date) {
		this.matching_date = matching_date;
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

	public String getWithus_place() {
		return withus_place;
	}

	public void setWithus_place(String withus_place) {
		this.withus_place = withus_place;
	}

	public String getReq_circle() {
		return req_circle;
	}

	public void setReq_circle(String req_circle) {
		this.req_circle = req_circle;
	}

	public String getReq_id() {
		return req_id;
	}

	public void setReq_id(String req_id) {
		this.req_id = req_id;
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

	public String getRe_time1() {
		return re_time1;
	}

	public void setRe_time1(String re_time1) {
		this.re_time1 = re_time1;
	}

	public String getRe_time2() {
		return re_time2;
	}

	public void setRe_time2(String re_time2) {
		this.re_time2 = re_time2;
	}

	public String getReq_withus_place() {
		return req_withus_place;
	}

	public void setReq_withus_place(String req_withus_place) {
		this.req_withus_place = req_withus_place;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Matching(int withus_num, String withus_title, String withus_content, String member_id,
			String register_circle, Date matching_date, String time1, String time2, String withus_place,
			String req_circle, String req_id, String req_withus_content, Date req_matching_date, String re_time1,
			String re_time2, String req_withus_place, String status) {
		super();
		this.withus_num = withus_num;
		this.withus_title = withus_title;
		this.withus_content = withus_content;
		this.member_id = member_id;
		this.register_circle = register_circle;
		this.matching_date = matching_date;
		this.time1 = time1;
		this.time2 = time2;
		this.withus_place = withus_place;
		this.req_circle = req_circle;
		this.req_id = req_id;
		this.req_withus_content = req_withus_content;
		this.req_matching_date = req_matching_date;
		this.re_time1 = re_time1;
		this.re_time2 = re_time2;
		this.req_withus_place = req_withus_place;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Matching [withus_num=" + withus_num + ", withus_title=" + withus_title + ", withus_content="
				+ withus_content + ", member_id=" + member_id + ", register_circle=" + register_circle
				+ ", matching_date=" + matching_date + ", time1=" + time1 + ", time2=" + time2 + ", withus_place="
				+ withus_place + ", req_circle=" + req_circle + ", req_id=" + req_id + ", req_withus_content="
				+ req_withus_content + ", req_matching_date=" + req_matching_date + ", re_time1=" + re_time1
				+ ", re_time2=" + re_time2 + ", req_withus_place=" + req_withus_place + ", status=" + status + "]";
	}
    

}
