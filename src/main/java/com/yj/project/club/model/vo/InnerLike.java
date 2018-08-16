package com.yj.project.club.model.vo;

public class InnerLike {
	private String member_id;
	private int cb_no;
	private int cb_like;
		
	public InnerLike() {
	}

	public InnerLike(String member_id, int cb_no, int cb_like) {
		super();
		this.member_id = member_id;
		this.cb_no = cb_no;
		this.cb_like = cb_like;
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

	public int getCb_like() {
		return cb_like;
	}

	public void setCb_like(int cb_like) {
		this.cb_like = cb_like;
	}

	@Override
	public String toString() {
		return "InnerLike [member_id=" + member_id + ", cb_no=" + cb_no + ", cb_like=" + cb_like + "]";
	}
	
	
}
