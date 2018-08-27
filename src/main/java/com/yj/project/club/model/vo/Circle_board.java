package com.yj.project.club.model.vo;

import java.util.Date;

public class Circle_board {
	private int cb_num;
	private String cb_title;
	private String cb_content;
	private String cb_attachment;
	private int cb_view;
	private String member_id;
	private int circle_num;
	private String cb_attachment2;
	private Date cb_date;
	private String cb_reattachment;
	private String cb_reattachment2;
	
	public Circle_board() {
		// TODO Auto-generated constructor stub
	}

	public Circle_board(int cb_num, String cb_title, String cb_content, String cb_attachment, int cb_view,
			String member_id, int circle_num, String cb_attachment2, Date cb_date, String cb_reattachment,
			String cb_reattachment2) {
		super();
		this.cb_num = cb_num;
		this.cb_title = cb_title;
		this.cb_content = cb_content;
		this.cb_attachment = cb_attachment;
		this.cb_view = cb_view;
		this.member_id = member_id;
		this.circle_num = circle_num;
		this.cb_attachment2 = cb_attachment2;
		this.cb_date = cb_date;
		this.cb_reattachment = cb_reattachment;
		this.cb_reattachment2 = cb_reattachment2;
	}

	public int getCb_num() {
		return cb_num;
	}

	public void setCb_num(int cb_num) {
		this.cb_num = cb_num;
	}

	public String getCb_title() {
		return cb_title;
	}

	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}

	public String getCb_content() {
		return cb_content;
	}

	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}

	public String getCb_attachment() {
		return cb_attachment;
	}

	public void setCb_attachment(String cb_attachment) {
		this.cb_attachment = cb_attachment;
	}

	public int getCb_view() {
		return cb_view;
	}

	public void setCb_view(int cb_view) {
		this.cb_view = cb_view;
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

	public String getCb_attachment2() {
		return cb_attachment2;
	}

	public void setCb_attachment2(String cb_attachment2) {
		this.cb_attachment2 = cb_attachment2;
	}

	public Date getCb_date() {
		return cb_date;
	}

	public void setCb_date(Date cb_date) {
		this.cb_date = cb_date;
	}

	public String getCb_reattachment() {
		return cb_reattachment;
	}

	public void setCb_reattachment(String cb_reattachment) {
		this.cb_reattachment = cb_reattachment;
	}

	public String getCb_reattachment2() {
		return cb_reattachment2;
	}

	public void setCb_reattachment2(String cb_reattachment2) {
		this.cb_reattachment2 = cb_reattachment2;
	}

	@Override
	public String toString() {
		return "Circle_board [cb_num=" + cb_num + ", cb_title=" + cb_title + ", cb_content=" + cb_content
				+ ", cb_attachment=" + cb_attachment + ", cb_view=" + cb_view + ", member_id=" + member_id
				+ ", circle_num=" + circle_num + ", cb_attachment2=" + cb_attachment2 + ", cb_date=" + cb_date
				+ ", cb_reattachment=" + cb_reattachment + ", cb_reattachment2=" + cb_reattachment2 + "]";
	}

	
	
}
