package com.yj.project.member.model.vo;


import java.sql.Date;
import java.util.Arrays;

public class Member {

	
   private String member_id;
   private String member_pw;
   private String member_name;
   private String member_email;
   private String member_phone;
   private String member_addr;
   private String[] enroll_category;
   private Date enroll_date;
   private Date member_birth;
   private String member_level;
   private String university;
   private int circle1_num;
   private String circle_name;
   private int member_notice;

   
   public Member() {}


public String getMember_id() {
	return member_id;
}


public void setMember_id(String member_id) {
	this.member_id = member_id;
}


public String getMember_pw() {
	return member_pw;
}


public void setMember_pw(String member_pw) {
	this.member_pw = member_pw;
}


public String getMember_name() {
	return member_name;
}


public void setMember_name(String member_name) {
	this.member_name = member_name;
}


public String getMember_email() {
	return member_email;
}


public void setMember_email(String member_email) {
	this.member_email = member_email;
}


public String getMember_phone() {
	return member_phone;
}


public void setMember_phone(String member_phone) {
	this.member_phone = member_phone;
}


public String getMember_addr() {
	return member_addr;
}


public void setMember_addr(String member_addr) {
	this.member_addr = member_addr;
}


public String[] getEnroll_category() {
	return enroll_category;
}


public void setEnroll_category(String[] enroll_category) {
	this.enroll_category = enroll_category;
}


public Date getEnroll_date() {
	return enroll_date;
}


public void setEnroll_date(Date enroll_date) {
	this.enroll_date = enroll_date;
}


public Date getMember_birth() {
	return member_birth;
}


public void setMember_birth(Date member_birth) {
	this.member_birth = member_birth;
}


public String getMember_level() {
	return member_level;
}


public void setMember_level(String member_level) {
	this.member_level = member_level;
}


public String getUniversity() {
	return university;
}


public void setUniversity(String university) {
	this.university = university;
}


public int getCircle1_num() {
	return circle1_num;
}


public void setCircle1_num(int circle1_num) {
	this.circle1_num = circle1_num;
}


public String getCircle_name() {
	return circle_name;
}


public void setCircle_name(String circle_name) {
	this.circle_name = circle_name;
}


public int getMember_notice() {
	return member_notice;
}


public void setMember_notice(int member_notice) {
	this.member_notice = member_notice;
}


@Override
public String toString() {
	return "Member [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
			+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_addr=" + member_addr
			+ ", enroll_category=" + Arrays.toString(enroll_category) + ", enroll_date=" + enroll_date
			+ ", member_birth=" + member_birth + ", member_level=" + member_level + ", university=" + university
			+ ", circle1_num=" + circle1_num + ", circle_name=" + circle_name + ", member_notice=" + member_notice
			+ "]";
}


public Member(String member_id, String member_pw, String member_name, String member_email, String member_phone,
		String member_addr, String[] enroll_category, Date enroll_date, Date member_birth, String member_level,
		String university, int circle1_num, String circle_name, int member_notice) {
	super();
	this.member_id = member_id;
	this.member_pw = member_pw;
	this.member_name = member_name;
	this.member_email = member_email;
	this.member_phone = member_phone;
	this.member_addr = member_addr;
	this.enroll_category = enroll_category;
	this.enroll_date = enroll_date;
	this.member_birth = member_birth;
	this.member_level = member_level;
	this.university = university;
	this.circle1_num = circle1_num;
	this.circle_name = circle_name;
	this.member_notice = member_notice;
}




}
