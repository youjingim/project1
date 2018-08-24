package com.yj.project.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	   private int notice_no;
	   private String notice_title;
	   private String notice_content;
	   private String member_id;
	   private int notice_view;
	   private Date notice_date;

	   public Notice() {
	      
	   }

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getNotice_view() {
		return notice_view;
	}

	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public Notice(int notice_no, String notice_title, String notice_content, String member_id, int notice_view,
			Date notice_date) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.member_id = member_id;
		this.notice_view = notice_view;
		this.notice_date = notice_date;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", member_id=" + member_id + ", notice_view=" + notice_view + ", notice_date="
				+ notice_date + "]";
	}
	   

}
