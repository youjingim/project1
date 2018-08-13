package com.yj.project.search.model.vo;

import java.util.Date;

public class Circle {

	private int circle_num;
	private String circle_name;
	private String university;
	private int dept_no;
	private String circle_adviser;
	private String member_id;
	private String circle_level;
	private String circle_phone;
	private Date circle_enrolldate;
	private String circle_photo;
	private String category;
	private String circle_comment;
	private int circle_like;
	
	public Circle() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCircle_num() {
		return circle_num;
	}
	public void setCircle_num(int circle_num) {
		this.circle_num = circle_num;
	}
	public String getCircle_name() {
		return circle_name;
	}
	public void setCircle_name(String circle_name) {
		this.circle_name = circle_name;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getCircle_adviser() {
		return circle_adviser;
	}
	public void setCircle_adviser(String circle_adviser) {
		this.circle_adviser = circle_adviser;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCircle_level() {
		return circle_level;
	}
	public void setCircle_level(String circle_level) {
		this.circle_level = circle_level;
	}
	public String getCircle_phone() {
		return circle_phone;
	}
	public void setCircle_phone(String circle_phone) {
		this.circle_phone = circle_phone;
	}
	public Date getCircle_enrolldate() {
		return circle_enrolldate;
	}
	public void setCircle_enrolldate(Date circle_enrolldate) {
		this.circle_enrolldate = circle_enrolldate;
	}
	public String getCircle_photo() {
		return circle_photo;
	}
	public void setCircle_photo(String circle_photo) {
		this.circle_photo = circle_photo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCircle_comment() {
		return circle_comment;
	}
	public void setCircle_comment(String circle_comment) {
		this.circle_comment = circle_comment;
	}
	public int getCircle_like() {
		return circle_like;
	}
	public void setCircle_like(int circle_like) {
		this.circle_like = circle_like;
	}

	public Circle(int circle_num, String circle_name, String university, int dept_no, String circle_adviser,
			String member_id, String circle_level, String circle_phone, Date circle_enrolldate, String circle_photo,
			String category, String circle_comment, int circle_like) {
		super();
		this.circle_num = circle_num;
		this.circle_name = circle_name;
		this.university = university;
		this.dept_no = dept_no;
		this.circle_adviser = circle_adviser;
		this.member_id = member_id;
		this.circle_level = circle_level;
		this.circle_phone = circle_phone;
		this.circle_enrolldate = circle_enrolldate;
		this.circle_photo = circle_photo;
		this.category = category;
		this.circle_comment = circle_comment;
		this.circle_like = circle_like;
	}

	@Override
	public String toString() {
		return "Circle [circle_num=" + circle_num + ", circle_name=" + circle_name + ", university=" + university
				+ ", dept_no=" + dept_no + ", circle_adviser=" + circle_adviser + ", member_id=" + member_id
				+ ", circle_level=" + circle_level + ", circle_phone=" + circle_phone + ", circle_enrolldate="
				+ circle_enrolldate + ", circle_photo=" + circle_photo + ", category=" + category + ", circle_comment="
				+ circle_comment + ", circle_like=" + circle_like + "]";
	}
	
	
	
	
	
}
