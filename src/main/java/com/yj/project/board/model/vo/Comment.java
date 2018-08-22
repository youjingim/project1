package com.yj.project.board.model.vo;

import java.sql.Date;

public class Comment {
	private int comment_no;
	private int board_num;
	private String member_id;
	private String comment_content;
	private Date comment_date;
	private int comment_level;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}

	public Comment(int comment_no, int board_num, String member_id, String comment_content, Date comment_date,
			int comment_level) {
		super();
		this.comment_no = comment_no;
		this.board_num = board_num;
		this.member_id = member_id;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.comment_level = comment_level;
	}

	@Override
	public String toString() {
		return "Comment [comment_no=" + comment_no + ", board_num=" + board_num + ", member_id=" + member_id
				+ ", comment_content=" + comment_content + ", comment_date=" + comment_date + ", comment_level="
				+ comment_level + "]";
	}
	
	

}
