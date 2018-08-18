package com.yj.project.club.model.vo;

public class InnerLike {
	private int cb_like_no;
	private String member_id;
	private int cb_no;
	private int cb_like_check;
		
	public InnerLike() {
	}

	public InnerLike(int cb_like_no, String member_id, int cb_no, int cb_like_check) {
		super();
		this.cb_like_no = cb_like_no;
		this.member_id = member_id;
		this.cb_no = cb_no;
		this.cb_like_check = cb_like_check;
	}

	public int getCb_like_no() {
		return cb_like_no;
	}

	public void setCb_like_no(int cb_like_no) {
		this.cb_like_no = cb_like_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getCb_no() {
		return cb_no;
	}

	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}

	public int getCb_like_check() {
		return cb_like_check;
	}

	public void setCb_like_check(int cb_like_check) {
		this.cb_like_check = cb_like_check;
	}

	@Override
	public String toString() {
		return "InnerLike [cb_like_no=" + cb_like_no + ", member_id=" + member_id + ", cb_no=" + cb_no
				+ ", cb_like_check=" + cb_like_check + "]";
	}
	
	
	
	
}
