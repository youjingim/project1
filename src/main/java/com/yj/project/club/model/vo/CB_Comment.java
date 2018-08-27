package com.yj.project.club.model.vo;

import java.util.Date;

public class CB_Comment {
	private int cb_commentno;
	private int cb_num;
	private String member_id;
	private String cb_comment_content;
	private Date cb_comment_date;
	
	public CB_Comment() {
		// TODO Auto-generated constructor stub
	}

	public CB_Comment(int cb_commentno, int cb_num, String member_id, String cb_comment_content, Date cb_comment_date) {
		super();
		this.cb_commentno = cb_commentno;
		this.cb_num = cb_num;
		this.member_id = member_id;
		this.cb_comment_content = cb_comment_content;
		this.cb_comment_date = cb_comment_date;
	}

	public int getCb_commentno() {
		return cb_commentno;
	}

	public void setCb_commentno(int cb_commentno) {
		this.cb_commentno = cb_commentno;
	}

	public int getCb_num() {
		return cb_num;
	}

	public void setCb_num(int cb_num) {
		this.cb_num = cb_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCb_comment_content() {
		return cb_comment_content;
	}

	public void setCb_comment_content(String cb_comment_content) {
		this.cb_comment_content = cb_comment_content;
	}

	public Date getCb_comment_date() {
		return cb_comment_date;
	}

	public void setCb_comment_date(Date cb_comment_date) {
		this.cb_comment_date = cb_comment_date;
	}

	@Override
	public String toString() {
		return "CB_Comment [cb_commentno=" + cb_commentno + ", cb_num=" + cb_num + ", member_id=" + member_id
				+ ", cb_comment_content=" + cb_comment_content + ", cb_comment_date=" + cb_comment_date + "]";
	}
	
}
