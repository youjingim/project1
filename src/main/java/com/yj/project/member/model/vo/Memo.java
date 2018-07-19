package com.yj.project.member.model.vo;

import java.util.Date;

public class Memo {
	private int memono;
	private String memo;
	private String password;
	private Date memodate;
	public int getMemono() {
		return memono;
	}
	public void setMemono(int memono) {
		this.memono = memono;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getMemodate() {
		return memodate;
	}
	public void setMemodate(Date memodate) {
		this.memodate = memodate;
	}
	public Memo(int memono, String memo, String password, Date memodate) {
		this.memono = memono;
		this.memo = memo;
		this.password = password;
		this.memodate = memodate;
	}
	public Memo() {
	}
	
	

}
